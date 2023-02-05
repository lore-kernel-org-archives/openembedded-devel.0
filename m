Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D07C636CD
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 18:53:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.35181.1675623184791952660
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Feb 2023 10:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=eMDMo08v;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 71DB9240007;
	Sun,  5 Feb 2023 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1675623182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CmJLrleu7/Vw0K0FX3awSZ7Y4CHEBXjO/H+9aNG6+c=;
	b=eMDMo08v+oyJJTdO76DYQtFOyPj+gseE3X1SfpWKRr9kV+TjwypJ/0J1jZiJ8cfJ5RrNSJ
	jp1Nl1dyreMCWpl1PmdRl+xOdFPeocKCchoZ6Ku4hu7XPXD3YLy4U4feFkGJlpR+qbRR63
	MA1Wxnyvzmce1PKnXjyYGq4EodEaQbhHYNnHTa2vBDdlDxmDnoU8ofCHC+yfZcX1Q3YMaW
	thAF9Igg9WNI8kXAIGLeYomgReBGv4ape88amQqvinIVNoIGdfzcdjB5atcPVO2AIvckRB
	RfSr3mbu3Zf4YIXG9LkHiJFEkVZwN+RQp0J0oKr9fJviYGU1ReXWc2/gpeYjDA==
Date: Sun, 5 Feb 2023 10:52:59 -0800
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Cc: "=?utf-8?Q?dev=40g0hl1n.net?=" <dev@g0hl1n.net>
Message-ID: <487E72B2-8D6B-4B81-AE4A-F72DE1E4C4AB@getmailspring.com>
In-Reply-To: <1740FE2141407D2F.20960@lists.openembedded.org>
References: <1740FE2141407D2F.20960@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH]
 temurin-jdk-17-bin/temurin-jre-17-bin: Add recipes
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 18:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100936

Sorry, forgot to add Richard L to CC when sending the patch!

Robert

On Feb 5 2023, at 9:34 am, Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:

> Add recipes for the Adoptium Temurin JDK/JRE binaries. These recipes
> support arm, aarch64, ppc64le, and x86-64.
> 
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
> .../temurin/temurin-jdk-17-bin_17.0.6+10.bb   | 25 ++++++++
> .../temurin/temurin-jre-17-bin_17.0.6+10.bb   | 23 +++++++
> recipes-core/temurin/temurin.inc              | 62 +++++++++++++++++++
> 3 files changed, 110 insertions(+)
> create mode 100644 recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb
> create mode 100644 recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb
> create mode 100644 recipes-core/temurin/temurin.inc
> 
> diff --git a/recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb b/recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb
> new file mode 100644
> index 0000000..fe83df5
> --- /dev/null
> +++ b/recipes-core/temurin/temurin-jdk-17-bin_17.0.6+10.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Temurin JDK Binaries"
> +
> +JAVA_TYPE = "jdk"
> +JAVA_SHA256:aarch64 = "9e0e88bbd9fa662567d0c1e22d469268c68ac078e9e5fe5a7244f56fec71f55f"
> +JAVA_SHA256:arm = "fe4d0c6d5bb8cf7f59f7ff82c0c1fd988bbe5cccf3bc7377dc8ae50740b46c82"
> +JAVA_SHA256:powerpc64le = "cb772c3fdf3f9fed56f23a37472acf2b80de20a7113fe09933891c6ef0ecde95"
> +JAVA_SHA256:x86-64 = "a0b1b9dd809d51a438f5fa08918f9aca7b2135721097f0858cf29f77a35d4289"
> +
> +require temurin.inc
> +
> +S = "${WORKDIR}/jdk-${PV}"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE:${PN} = "java javac keytool"
> +
> +ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
> +ALTERNATIVE_TARGET[java] = "${JAVA_HOME}/bin/java"
> +
> +ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
> +ALTERNATIVE_TARGET[javac] = "${JAVA_HOME}/bin/javac"
> +
> +ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
> +ALTERNATIVE_TARGET[keytool] = "${JAVA_HOME}/bin/keytool"
> diff --git a/recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb b/recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb
> new file mode 100644
> index 0000000..2527437
> --- /dev/null
> +++ b/recipes-core/temurin/temurin-jre-17-bin_17.0.6+10.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Temurin JRE Binaries"
> +
> +JAVA_TYPE = "jre"
> +JAVA_SHA256:arm = "bf7ef7ba477dc278f913e64174e76be9ae7f014c767352eae83b3f9581494fce"
> +JAVA_SHA256:aarch64 = "3797815cb853616b6415e1b8875cda4eaa004887561ea4ea2090d726b8d8582f"
> +JAVA_SHA256:powerpc64le = "f11b86bfd7fa4d7a0d05040ea235102296f03eaf064253f76d7ab94baa0352e3"
> +JAVA_SHA256:x86-64 = "fe669935609086e76cb0b829e92808766cbf8cb7bda57a76b47813b08584bfd2"
> +
> +require temurin.inc
> +
> +S = "${WORKDIR}/jdk-${PV}-jre"
> +
> +inherit update-alternatives
> +
> +# Lower than corresponding JDK
> +ALTERNATIVE_PRIORITY = "90"
> +
> +ALTERNATIVE:${PN} = "java keytool"
> +ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
> +ALTERNATIVE_TARGET[java] = "${JAVA_HOME}/bin/java"
> +
> +ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
> +ALTERNATIVE_TARGET[keytool] = "${JAVA_HOME}/bin/keytool"
> diff --git a/recipes-core/temurin/temurin.inc b/recipes-core/temurin/temurin.inc
> new file mode 100644
> index 0000000..a026598
> --- /dev/null
> +++ b/recipes-core/temurin/temurin.inc
> @@ -0,0 +1,62 @@
> +HOMEPAGE = "https://adoptium.net"
> +LICENSE = "GPL-2.0-with-classpath-exception"
> +LIC_FILES_CHKSUM = "file://NOTICE;md5=8fa9e85281110769de025562c085b3a4"
> +
> +COMPATIBLE_HOST = "(aarch64|arm|powerpc64le|x86_64).*-linux"
> +# Binaries are linked with glibc
> +COMPATIBLE_HOST:libc-musl = "null"
> +
> +JAVA_ARCH:aarch64 = "aarch64"
> +JAVA_ARCH:arm = "arm"
> +JAVA_ARCH:powerpc64le = "ppc64le"
> +JAVA_ARCH:x86-64 = "x64"
> +
> +# Convert PV to forms needed to download the tarball
> +PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
> +PV_UNDER = "${@d.getVar('PV').replace('+', '_')}"
> +
> +SRC_URI = "https://github.com/adoptium/temurin${PV_MAJOR}-binaries/releases/download/jdk-${PV}/OpenJDK${PV_MAJOR}U-${JAVA_TYPE}_${JAVA_ARCH}_linux_hotspot_${PV_UNDER}.tar.gz"
> +SRC_URI[sha256sum] = "${JAVA_SHA256}"
> +
> +# Disable stuff not needed for packaging binaries
> +INHIBIT_DEFAULT_DEPS = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +EXCLUDE_FROM_SHLIBS = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +JAVA_HOME = "${libdir}/jvm/${BPN}"
> +
> +do_install() {
> +    install -d ${D}${JAVA_HOME}
> +    cp -r ${S}/* ${D}${JAVA_HOME}
> +}
> +
> +# The x86-64 binaries assume libraries are in /lib64, but a typical
> pure 64-bit
> +# Yocto image puts them in /lib. If not building a multilib image,
> add a
> +# symlink from /lib64 to /lib.
> +do_install:append:x86-64() {
> +    if [ -z "${MULTILIBS}" ]; then
> +        ln -s /lib ${D}/lib64
> +    fi
> +}
> +
> +FILES:${PN} = "${JAVA_HOME}"
> +FILES:${PN}:append:x86-64 = " /lib64"
> +
> +RDEPENDS:${PN} = " \
> +    alsa-lib \
> +    freetype \
> +    glibc \
> +    libx11 \
> +    libxext \
> +    libxi \
> +    libxrender \
> +    libxtst \
> +    zlib \
> +"
> +
> +# Ignore "doesn't have GNU_HASH (didn't pass LDFLAGS?)" errors
> +INSANE_SKIP:${PN} += "ldflags"
> -- 
> 2.39.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100934): https://lists.openembedded.org/g/openembedded-devel/message/100934
> Mute This Topic: https://lists.openembedded.org/mt/96765795/1348415
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [robert.joslyn@redrectangle.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

