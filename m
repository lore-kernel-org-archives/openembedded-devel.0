Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1CED578784
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 14:26:22 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id f6so9730791wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y+0z/UEzeN3+6VMbUZ7dXlaBTXWuV1S7kB9RpwyWcAw=;
	b=VU+tCk/jzl5f2f1kflbiw4oXz5iOk6q5JVBeuz70+zS57pXuInoo89d6bA3XN8Yv4R
	PKMYJuVOGFA+z4hOMaLv2GtH94sJ3oiVkyuMRvdyCEa5PipxzTOiJB5M5NK06YrPT0Lj
	3kOwse/cgsXhp8vtL9pqKffWkF8UUSX3laStibfg5fZJK6y+hGKjgGHeSqxvZvQlZiUm
	TjzEXY7nxMaeRtX8T9HDJDoyQoRqt2XtUdMvEE44hOZiVaDieJ5VEgqIEzaOkBiAikbO
	HE5tAczJthyaoKfKQBp0wEBtMiPg/XQu4rTZ/+ajG6CUhmDE2arxfljLCfU/v3+ZKb4C
	4F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y+0z/UEzeN3+6VMbUZ7dXlaBTXWuV1S7kB9RpwyWcAw=;
	b=NjrgqFI1XlPrckttyNuCVWB6ez/o3+zmEtjUZ2O3vxx/RcYMXNP1C3KPHLTK1FtOMV
	pY791rdAVb8CP9Uc8sGI+EklyJ0GZkQaTOjpaMhNDpcC4tB5EoPvbPJQ6puakPzaQILb
	v68gljhvp22kL+8Wenif4uai71SH9U2ltleZZRbXlUSEp6And4C9MjXvrBT8YH08TzhH
	zjCesdDDrpbe/+t9sGtamSCdUVE2QpJ7Hq+d176TakRW60BS8Ln5H6NO5ZWmzxaTfq/G
	X+lQRMKfi+Rrama5mX5yXEW2V4wK8iOcmbZTKLhRqv8sfYKYehigbi/m8wEOE4UTxvrn
	fFYA==
X-Gm-Message-State: AKwxytfI4bikfAA0AfBgRqmoRfNhkRLcdduBDwzqbbQrlqz/m3DjE11Z
	k1AxsuN0WiJwZHOhOgrjFubLe5hK4UUq7So51koTlQ==
X-Google-Smtp-Source: AH8x2265eK0yM+U3w+cVjv3sDG4AbDFRsQidPRI1TNWCRZYZXbuA/n1iWsfkj8DuDIuJReQ+dAgOjaz6Bx04vhYuHrE=
X-Received: by 10.223.189.136 with SMTP id l8mr5983127wrh.58.1517322383514;
	Tue, 30 Jan 2018 06:26:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 06:26:22 -0800 (PST)
In-Reply-To: <385dfd3c60bcebaf2b96ad65b75b1ce07f706be3.1504238509.git.paul.eggleton@linux.intel.com>
References: <cover.1504238509.git.paul.eggleton@linux.intel.com>
	<385dfd3c60bcebaf2b96ad65b75b1ce07f706be3.1504238509.git.paul.eggleton@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 15:26:22 +0100
Message-ID: <CA+chaQfxzxYcPB75P-vPkV++zTo2PxqNWVPgHp2cTcVqV+bjBg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
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
X-List-Received-Date: Tue, 30 Jan 2018 14:26:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

it's quite rare, but I got few build failures with this component like this:

DEBUG: Executing shell function do_compile
NOTE: make -j 24
mkdir -p build/output/samples
sed -e "s/@CLIENT_VERSION@/1.2.0/g" -e "s/@BUILD_TIMESTAMP@/Fri Jan 26
21:18:06 UTC 2018/g" src/VersionInfo.h.in > build/VersionInfo.h
/bin/sh: 1: cannot create build/VersionInfo.h: Directory nonexistent
make: *** [build/VersionInfo.h] Error 2
make: *** Waiting for unfinished jobs....
mkdir -p build/output/test
echo OSTYPE is Linux
OSTYPE is Linux
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.

anyone else seeing this issue?

On Fri, Sep 1, 2017 at 6:02 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> The following improvements have been made over the recipe that was in
> meta-intel-iot-middleware (a layer which is no longer actively
> maintained):
>
> * Upgrade to 1.2.0. The version number being used previously (3.1) was
>   bogus - I guess someone saw that it supported the MQTT *protocol*
>   version 3.1 and assumed that was the library version. Since we are
>   renaming it to paho-mqtt-c at the same time to distinguish it from
>   other Eclipse Paho MQTT library flavours, we don't need to bump PE.
> * Fix SRC_URI since the repository has been moved
> * Fix "No GNU_HASH in the elf binary" QA error
> * Add notice.html and about.html to LIC_FILES_CHKSUM since they cover
>   licensing
> * Add description, Signed-off-by and Upstream-Status to makefile.patch
> * Set short description in SUMMARY
> * Drop unnecessary custom do_compile - the default implementation
>   basically does the same thing
> * Drop RDEPENDS on openssl - linking already ensures runtime
>   dependencies get set correctly
> * Move DEPENDS further up
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../paho-mqtt-c/files/makefile.patch               | 25 ++++++++++++++++
>  .../paho-mqtt-c/paho-mqtt-c_1.2.0.bb               | 35
> ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/
> paho-mqtt-c/files/makefile.patch
>  create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/
> paho-mqtt-c_1.2.0.bb
>
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
> b/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
> new file mode 100644
> index 0000000..a31bfaa
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
> @@ -0,0 +1,25 @@
> +Disable building some things we don't need
> +
> +Upstream-Status: Inappropriate [config]
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +
> +---
> + Makefile |    3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 33bd2d0..84262bd 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -115,7 +115,8 @@ LDFLAGS_AS = -shared -Wl,-soname,lib${MQTTLIB_AS}.so.${MAJOR_VERSION}
> -lpthread
> +
> + all: build
> +
> +-build: | mkdir ${MQTTLIB_C_TARGET} ${MQTTLIB_CS_TARGET}
> ${MQTTLIB_A_TARGET} ${MQTTLIB_AS_TARGET} ${MQTTVERSION_TARGET}
> ${SYNC_SAMPLES} ${ASYNC_SAMPLES} ${SYNC_TESTS} ${SYNC_SSL_TESTS}
> ${ASYNC_TESTS} ${ASYNC_SSL_TESTS}
> ++build: | mkdir ${MQTTLIB_C_TARGET} ${MQTTLIB_CS_TARGET}
> ${MQTTLIB_A_TARGET} ${MQTTLIB_AS_TARGET}
> ++#${MQTTVERSION_TARGET} ${SYNC_SAMPLES} ${ASYNC_SAMPLES} ${SYNC_TESTS}
> ${SYNC_SSL_TESTS} ${ASYNC_TESTS} ${ASYNC_SSL_TESTS}
> +
> + clean:
> +       rm -rf ${blddir}/*
> +--
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
> b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
> new file mode 100644
> index 0000000..fec380c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Paho MQTT - C libraries for the MQTT and MQTT-SN protocols"
> +DESCRIPTION = "Client implementation of open and standard messaging
> protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
> +HOMEPAGE = "http://www.eclipse.org/paho/"
> +SECTION = "console/network"
> +LICENSE = "EPL-1.0 | EDL-1.0"
> +
> +LIC_FILES_CHKSUM = " \
> +        file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
> +        file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
> +        file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
> +        file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
> +"
> +
> +SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
> +
> +SRCREV = "e8d34da24ad807f5e698b327d67591fd4b4bfa7e"
> +
> +DEPENDS = "openssl"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_install() {
> +    install -d ${D}${libdir}
> +    oe_libinstall -C build/output -so libpaho-mqtt3a ${D}${libdir}
> +    oe_libinstall -C build/output -so libpaho-mqtt3as ${D}${libdir}
> +    oe_libinstall -C build/output -so libpaho-mqtt3c  ${D}${libdir}
> +    oe_libinstall -C build/output -so libpaho-mqtt3cs ${D}${libdir}
> +    install -d ${D}${includedir}
> +    install -m 644 src/MQTTAsync.h ${D}${includedir}
> +    install -m 644 src/MQTTClient.h ${D}${includedir}
> +    install -m 644 src/MQTTClientPersistence.h ${D}${includedir}
> +}
> +
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

