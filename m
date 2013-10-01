Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1053060EA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 08:32:05 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so5568436lbd.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 01:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=bdIkgEY/Vq/YSpWnnucJtY3IcTDAP2KuYNY//bfk1EI=;
	b=j+PnFyh1Rt3Lc+V1TeZSl0tx6Vnb73z+PuKo0VmMLMxuzJs5robLgGONmRzG9QYy5+
	Qq/SuGUG3rSmVYNv3Q7Dz6+LCvFYJTny885JPM9z6BATVXOO9+7FPz6yt42cKHUs0ciJ
	Fz2YSZ7mLzL6794oVXjBvl2d7DaJ3HyhTvP27wv1+tF6DRxxxRgRvwm9EBtO4fwagBBX
	OglAkNaVUghqRp0zSEBA16XbouI9dxF1tfwAHuKhLYoKix/qsSuFVkKwZZd8QA6iFQmp
	Mh/eei9Iu5VMZgBByLosA//oKCx4BWdmvV3pQjLqhtf6qfUYAS7t8zGZ+3HReKcQnei2
	XOoQ==
X-Gm-Message-State: ALoCoQkqg9F/T2Tusv32D0DeO3C5M32D6qhUrrZQfi8gOE6OAgXuH9WUVq77xCCLCggRxbmqEnb2
MIME-Version: 1.0
X-Received: by 10.152.37.41 with SMTP id v9mr24200972laj.9.1380616326968; Tue,
	01 Oct 2013 01:32:06 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Tue, 1 Oct 2013 01:32:06 -0700 (PDT)
Date: Tue, 1 Oct 2013 10:32:06 +0200
Message-ID: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: unable to compile eglibc_2.18
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
X-List-Received-Date: Tue, 01 Oct 2013 08:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am facing a weird error while trying to build core-image-minimal with OE

Build Configuration:
BB_VERSION            = "1.20.0"
BUILD_SYS               = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS            = "arm-oe-linux-gnueabi"
MACHINE                  = "zc702-zynq7"
DISTRO_VERSION     = "oe-core.0"
TUNE_FEATURES      = " armv7a vfp neon zynq"
TARGET_FPU            = "vfp-neon"
meta                          =
"master:3f5f9d2681d41e44dade5d3a5a4bff3fd38f5506"
meta-xilinx                  =
"master:6efe82fb07d98f190e9b078132526eeadd8cf9fc"

" bitbake -v core-image-minimal " gives me the following error:

/2.18-r0/eglibc-2.18/libc/pwd/../nss/getXXbyYY_r.c:308: undefined reference
to `__nss_database_custom'

/home/akini/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
/home/akini/openembedded-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/eglibc/2.18-r0/build-arm-oe-linux-gnueabi/libc.so:
hidden symbol `__nss_not_use_nscd_group' isn't defined

/home/akini/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status


PasteBin link to log.do_compile = http://pastebin.com/ujVwTrjg


Let me know if i am going wrong somewhere or missed some thing !!

-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

