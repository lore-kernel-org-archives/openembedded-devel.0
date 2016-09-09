Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB5D273189
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 02:11:53 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pp5so3126717pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 19:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=72QXRFMYng3R7WmM3kX5pUaB/KfSJ4SXTA+X4M6pdFo=;
	b=oMfKpJjzi6LJHZUYqhXOMhPHKr4fhNfrJTbXygSI8YwfOxXPRp710yPdrdpgwZkxqd
	2sN3h8RaVqq0yUcBctdMMaH6tq+411f4vkG1R+gte4B1uOro4DrCSB5w9OJu0DaGdBbS
	pbL2JrhUthB38YDvWBLLAGq+ZuLB8MW31GdkxeZKXIA+A1HRP8dcECP34dyiWyUothyN
	Uuv1G/kvQEDTJP9RKpb3U+WqkPhLO6K/oqj+fOFQGaic1F1T/M76wdaosbCEx+UwkE0K
	mFGbTs/wNVlRWJt9tbJxSc5o54+wJC3KHyMxakKz1dNcdJ+XZZNt9hUIdT7q4Sp5/ULW
	P9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=72QXRFMYng3R7WmM3kX5pUaB/KfSJ4SXTA+X4M6pdFo=;
	b=lzPkqH7EHNheoSXyakt4FctGzWGUP8ITJDrhG6dv/vB83HxMe/VkbzpUNxzMfTvFdS
	/I6JZNerURUf7C5iiwR3jXMl+79gnel+5kcc0dJOAw1lGPTv/iPnny7S+VvP+Ehrn8RY
	hy1LKBo6QgIJjUt7sSWu6SGEqasNzpGTbADnUzc7bm2crZ8Lf6JYmJiAHuxXhL3GxP4M
	x3Epcv/UsLUkl15CxwMy8F5HfdHgyZMuZvh+Kun0SFuJ/fB/F68xv7wkCpd0em7lp0w9
	vZ7ZaWC7Oag29T6XlRpsAwTGo5YMb3EwNUr2OTu13Q4kNgnb/k9DZWmaGFqZRJqMksDi
	d/yA==
X-Gm-Message-State: AE9vXwNbNUKNqOuNcTeTWLmSbAUa5AxVUv5qrOEiT2dL8b/b8glE9v6lHyiEUAA7FOG/zA==
X-Received: by 10.66.1.8 with SMTP id 8mr1987216pai.109.1473387114064;
	Thu, 08 Sep 2016 19:11:54 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:2dc8:cbbe:221f:f498])
	by smtp.gmail.com with ESMTPSA id i3sm720746pao.4.2016.09.08.19.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Sep 2016 19:11:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com,
	akuster@mvista.com
Date: Thu,  8 Sep 2016 19:11:51 -0700
Message-Id: <1473387111-23110-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 02:11:54 -0000

remove unused config params.
Drop PE
Drop do_configure_prepend
update PACKAGECONFIG's for graphics

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{wireshark_2.0.5.bb => wireshark_2.2.0.bb}     | 24 ++++++----------------
 1 file changed, 6 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.5.bb => wireshark_2.2.0.bb} (69%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
similarity index 69%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
index 31ca4d2..dca3be6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
@@ -8,21 +8,16 @@ DEPENDS = "pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "627b5fc6cf0aeca196c75debd5e69b14"
-SRC_URI[sha256sum] = "0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
-
-PE = "1"
+SRC_URI[md5sum] = "c7de0997f74934f25b456846cf75cb81"
+SRC_URI[sha256sum] = "a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f80d4388ad2f3f1104"
 
 inherit autotools pkgconfig perlnative
 
 ARM_INSTRUCTION_SET = "arm"
 
-# Works with either gtk+ or gtk3.
-WHICH_GTK = "gtk+"
 
 PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
-PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 #PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
 
 PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
@@ -30,10 +25,9 @@ PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --wi
 PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
 PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
 PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
-PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
-PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
-PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
-PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
+PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
+PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
+PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
@@ -44,15 +38,9 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 
 # these next two options require addional layers
-PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
-EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --enable-rawshark"
-
-do_configure_prepend() {
-    # force to use fallback
-    sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
-}
+EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
 
 ALLOW_EMPTY_${PN} = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4


