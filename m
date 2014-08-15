Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 005F660438
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 05:46:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F5kQPE003147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:46:26 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 22:46:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Aug 2014 13:46:29 +0800
Message-ID: <1408081589-29084-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] wireshark: add libsmi portaudio to PACKAGECONFIG
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
X-List-Received-Date: Fri, 15 Aug 2014 05:46:34 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
index 13b1f3f..39a24dc 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.wireshark.org"
 SECTION = "network"
 LICENSE = "GPL-2.0"
 
-DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libsmi libnl portaudio-v19 sbc"
+DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libnl sbc"
 
 inherit autotools pkgconfig
 
@@ -16,6 +16,8 @@ PACKAGECONFIG ??= "gnutls gcrypt"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${WHICH_GTK}  graphics", "", d)}"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 
+PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
+PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
 PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
 PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
 PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
-- 
1.7.10.4


