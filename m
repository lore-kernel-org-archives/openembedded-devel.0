Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF3F07709E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 07:52:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9U7qPOP022707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 00:52:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 30 Oct 2015 00:52:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Oct 2015 15:43:21 +0800
Message-ID: <1446191001-20908-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] lldpd: configure the systemd unit file dir
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
X-List-Received-Date: Fri, 30 Oct 2015 07:52:25 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

configure the systemd unit file dir, otherwise it will be auto-checked
by 'pkg-config --variable=systemdsystemunitdir systemd', but if systemd
is not built firstly, and the the unit file will not be installed, and
lead to below error:
    ERROR: Function failed: SYSTEMD_SERVICE_lldpd value lldpd.service does not exist
and disable sysusersdir, since sysuser is not used currently.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
index 47d3c38..ba7f09e 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
@@ -24,7 +24,10 @@ GROUPADD_PARAM_${PN} = "--system lldpd"
 EXTRA_OECONF += "--without-embedded-libevent \
                  --disable-oldies \
                  --with-privsep-user=lldpd \
-                 --with-privsep-group=lldpd"
+                 --with-privsep-group=lldpd \
+                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
+                 --without-sysusersdir \
+"
 
 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
 PACKAGECONFIG[json] = "--with-json,--without-json,jansson"
-- 
1.9.1


