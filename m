Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA587739B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:36:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3adov006108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Mar 2015 20:36:39 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 9 Mar 2015 20:36:38 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Mar 2015 11:28:30 +0800
Message-ID: <1425958111-2143-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-networking][PATCH 1/2] postfix: add link file /usr/lib/sendmail
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2015 03:36:38 -0000
Content-Type: text/plain

Link file /usr/lib/sendmail points to /usr/sbin/sendmail is required by
LSB core test according to Linux FHS[Ref2]: "For historical reasons,
/usr/lib/sendmail must be a symbolic link to /usr/sbin/sendmail if the
latter exists."

The linke file was provided by package lsb before, but should be
provided by packages which provides command sendmail such as msmtp,
postfix and esmtp etc.

Refs:
1 http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/normativerefs.html#STD.
2 http://www.pathname.com/fhs/pub/fhs-2.3.html#SPECIFICOPTIONS13

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a6909e9..1136bd2 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -230,6 +230,11 @@ pkg_postinst_${PN} () {
         newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
         touch $D/etc/postfix/virtual_alias
         postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
+
+        if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') else 'false'}; then
+            # /usr/lib/sendmial is required by LSB core test
+            [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
+        fi
     fi
 }
 
-- 
1.9.1


