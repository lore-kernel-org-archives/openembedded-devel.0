Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UJ3RU-0008VN-UN
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 15:59:49 +0100
Received: by mail-pd0-f169.google.com with SMTP id 3so1646883pdj.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=pLEUlBa+S79NCydRnnPIi2+TxiuPzLr+ON99YvND5YM=;
	b=fghrQ67e6Ph77LjMiWRD9BtNj0nKsfqyBo6alrBg8rHCKH/YeBTwPOpOKNYONp+KNx
	pLk8/pi4+xoYIQiS6nInZG/Zq9K8r5oiacHkbs5MwfcFWFSbpnoMF6gj0CsEcuoJJW4o
	r3OTywXQ5ljXqF7bAxm4EmSr/ga7d+jVf533wyxsj/excvrIc4YOYSoRPWPQs+jufjHr
	HQKfxKYRG+JpAHJrKmWmPHOS8qVn+iGZ2dwjoo5lj+QQ5d3MGyGSImUrkIe9FCy+uk7Y
	GK3bFa73jFey0PJMJiYuebE7IGl3PUmkwTv7e6bnwVkLSznHekoX6nSoj4KTASVwcLbT
	jUNw==
MIME-Version: 1.0
X-Received: by 10.66.149.73 with SMTP id ty9mr3695461pab.66.1363963365853;
	Fri, 22 Mar 2013 07:42:45 -0700 (PDT)
Received: by 10.68.225.166 with HTTP; Fri, 22 Mar 2013 07:42:45 -0700 (PDT)
In-Reply-To: <514C6AFC.1050405@mlbassoc.com>
References: <CAHu+ux18fZzDuBjYj_d8r9P=y=khrCSjuRjKPKG9RzxEAO2vXw@mail.gmail.com>
	<514C6AFC.1050405@mlbassoc.com>
Date: Fri, 22 Mar 2013 10:42:45 -0400
Message-ID: <CAHu+ux0PVbRQh0vY9VOzv78Ey2kAKPBNsfU1v0ptT06zHYKabw@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Adding a recipe to oe bitbake
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
X-List-Received-Date: Fri, 22 Mar 2013 15:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK,
    Sorry for the carpet bombing! I added this to tisdk-rootfs-image
"task-arago-xyz \" to look for the new task file
I have included the task and pure-ftpd bb files also. I would love to
understand why this does not work.

==========================tisdk-rootfs-image.bb============================
# Arago TI SDK filesystem image
COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"

require arago-base-tisdk-image.bb

IMAGE_INSTALL += "\
    task-arago-test \
    task-arago-tisdk-graphics \
    task-arago-tisdk-qte \
    task-arago-tisdk-addons \
    task-arago-tisdk-connectivity \
    task-arago-tisdk-crypto \
    task-arago-tisdk-matrix \
    task-arago-tisdk-multimedia \
    task-arago-tisdk-amsdk \
    task-arago-xyz \
"

export IMAGE_BASENAME = "tisdk-rootfs-image"

=================task-arago.xyz.bb================

DESCRIPTION = "Extended task to get extras"
LICENSE = "MIT"
LIC_FILES_CHKSUM =
"file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
PR = "r0"

inherit task

ARAGO_XYZ = " \
    pure-ftpd \
    "

ARAGO_XYZ_INT = "\
    ${ARAGO_XYZ} \
    "
RDEPENDS_${PN} = "\
    ${ARAGO_XYZ_INT} \
    "
===============pure-ftpd_1.0.29.bb====================

DESCRIPTION = "Sample program"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7b47170f564f6a314b82b3ea67a40bd"
PR = "r0"
PV = "1.0.29"
DEPENDS = ""
RPROVIDES = "pure-ftpd"
PROVIDES = "pure-ftpd"
ARM_INSTRUCTION_SET = "arm"

PARALLEL_MAKE = ""

inherit autotools pkgconfig

EXTRA_OECONF = "--enable-cross-compile --host=arm-arago-linux-gnueabi"

SRC_URI = "
http://iweb.dl.sourceforge.net/project/pureftpd/Pure-FTPd/1.0.29/pure-ftpd-${PV}.tar.gz
"
SRC_URI[md5sum] = "e0132a51357d419f8b66e8997d9dc5fa"
SRC_URI[sha256sum] =
"55bfb84fa63a37e5b56906afb4444fda7285d0f8b5ed24798f59c978ddea2749"
S = "${WORKDIR}/pure-ftpd-${PV}"

EXTRA_OECONF_append_armv6 = " --enable-armv6"
EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"

FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
-frename-registers -O4 -ffast-math"
BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"

do_configure(){
  oe_runconf ${EXTRE_OECONF}
}

do_compile () {
  oe_runmake
}

do_install () {
  oe_runmake install DESTDIR=${D}
}


ARM_INSTRUCTION_SET = "arm"

BBCLASSEXTEND = "native"

============================ END===========================

On Fri, Mar 22, 2013 at 10:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2013-03-22 08:24, David Hirst wrote:
>
>> Hi,
>>      I have been struggling with a oe/bitbake issue. I wanted to add an
>> other .bb to the image file.
>> I have tried multiple ways but always end up at the same spot. I have
>> created a new task-XXX.bb file which includes my bb
>> I edited the XXXX-rootfs-image.bb to include the task-XXX.bb.
>> Once built I find that everything built fine and the new recipe was built
>> but was not loaded into the XXXX-rootfs-image.tar,gz.
>> If I look into the image directory for the bb file I see the compiled
>> application in usr/sbin.
>> I have tried this with my own .bb file and net-snmp bb file which comes
>> with the default oe-layersetup installation with the same result.
>> Did I not edit a file or miss some other required step?
>>
>>
> Wow, the same question on three mailing lists (that I read, there
> may be more...) and no cross-posting!
>
> This list is perhaps the most appropriate one for your question.
>
> More details will help.  Exactly what did you change in the
> "XXXX-rootfs-image.bb"
> recipe?
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>



-- 
David Hirst
hirst689@gmail.com

