Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqs3-0003d8-BS
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:36 +0200
Received: by mail-ea0-f176.google.com with SMTP id h14so579650eak.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=2deha1DMG9617Cf6ryh0xcSBkYRf/LGFAZyrIM0/Ehc=;
	b=gqxy3lIf79/y6yadI768xKWj6DD8B7hHRkLxfYG6J54uvUW/vh5oJGwYaz39PQPTwb
	z6XUX0bqposctv7oVWI8I0LdGXYc95EfeL0GQlAUdGmE42IaBUjyyhEPN8UoRWnt/25H
	v6rM8wo2+VCXWyTKhMupHyI/o3lmASdp2FADDkDsC5TgcjJe94WHJi9vSYAprhLJW6Jn
	sVCT4/8LZVrMwM71N/jO+6q4rJFfGwdmPmGDEG28sTFwJlCNBsJ/CG8vl6JDobZlQG2Z
	Wu3Yjrik9bezaZjpbSX9NzoRfdAqEHG4UKtabJeiZrNpsnk8/nG68E8NfQNVbSLJvutl
	U6aQ==
X-Received: by 10.14.214.3 with SMTP id b3mr10137954eep.24.1367966550200;
	Tue, 07 May 2013 15:42:30 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:53 +0200
Message-Id: <1367966513-12566-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 15/15] rp-pppoe: move chmod form postinst to offline do_install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 23:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb     |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
index d4cc664..56246bc 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
            file://top-autoconf.patch \
@@ -29,6 +29,7 @@ do_install() {
     install -m 0755 ${WORKDIR}/pppoe-server.init ${D}${sysconfdir}/init.d/pppoe-server
     # Install
     oe_runmake -C ${S} RPM_INSTALL_ROOT=${D} docdir=${docdir} install
+    chmod 4755 ${D}${sbindir}/pppoe
 }
 
 # Insert server package before main package
@@ -41,13 +42,6 @@ FILES_${PN}-server = "${sysconfdir}/default/pppoe-server \
 FILES_${PN}-relay = "${sbindir}/pppoe-relay"
 FILES_${PN}-sniff = "${sbindir}/pppoe-sniff"
 
-pkg_postinst_${PN} () {
-    if [ x"$D" != "x" ]; then
-        exit 1
-    fi
-    chmod 4755 ${sbindir}/pppoe
-}
-
 CONFFILES_${PN} = "${sysconfdir}/ppp/pppoe.conf \
                    ${sysconfdir}/ppp/firewall-standalone \
                    ${sysconfdir}/ppp/firewall-masq"
-- 
1.7.4.4



