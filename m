Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDF96079F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Aug 2017 16:03:50 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id y129so18804455pgy.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Aug 2017 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=KiXG0/mmlRPeUB1mAR0PQ8SGH4gXLBPnaJanynLJjZk=;
	b=OR8na6TgJdtVB2BKO8e5ZjzRauimohlL0IyAUbWD7Yud5HYFrY3gveP4pNYNPKR28z
	vStBIZcFb9HexcHRdyjjfW+tSsKMvLhki3Nkx+AX15bNNOlczzPRILysJUbzFnkTjkPy
	xi6CkVvhvSkX4mUbPpUT4chg+3gB4VVKeO0Td5NyNJIb19qLgeksiqhheJv762yl8TRc
	GVoP7dZJdWnOKS2cow11dSvqk86qSoX6W8JIyBxi7ES6x4/Fb4Uumjpgwzkmpb2w1odY
	PJHjX0dEj5zXjlhVXa1zO8r3oofK/BmEEuXGXZmyzb00w+OP4oNWDtnwzJg7WCcAveob
	vJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=KiXG0/mmlRPeUB1mAR0PQ8SGH4gXLBPnaJanynLJjZk=;
	b=WYZgH/q2MTSXd0Ev7ALIGgq5unNpgwzZaWDJk7appkwr827P6+Cg/4k6ULaBukEs6o
	meolrzDBLitSMSjTs/01QaosuWZGWRYEgXjzETjJNb5BS7sJdVBRinF913ayxzscDdyR
	9enQJkZGSp5ZGvNR1u6yGIFG4PbTGj/7VC5YwayWnhx7mcskspwzPC30qVyYAPTLH5ZM
	siB6PrVgCLX7Ozxv/tfHw+lqUXUce/vMyZ2frs7p6siC7ury6vhSWyHULdCTCG5q0X1U
	IwWyEiG1fZI6I3ii9PHQ+UdwotV5iDsw3xJ5KhZ8VJccbwacEmgi3mrs+TR4sws6ki+F
	uuJg==
X-Gm-Message-State: AIVw111oLpZJrMmNEODl9Fz3t5w5axlpHgRLXhVEZs/4VO95Vw9zRBfW
	X+WefcfR4z2uHiE7
X-Received: by 10.101.85.1 with SMTP id f1mr6059610pgr.225.1501949032124;
	Sat, 05 Aug 2017 09:03:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:a184:9868:f119:54ba?
	([2601:202:4001:9ea0:a184:9868:f119:54ba])
	by smtp.gmail.com with ESMTPSA id
	d69sm8648949pfe.49.2017.08.05.09.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Aug 2017 09:03:51 -0700 (PDT)
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>,
	openembedded-devel@lists.openembedded.org
References: <1501183875-5296-1-git-send-email-jkrishnanjanappa@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <db8e786c-0814-769d-2748-5984592b2ba4@gmail.com>
Date: Sat, 5 Aug 2017 09:03:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501183875-5296-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: Re: [meta-networking][PATCH] drbd: Add recipe
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
X-List-Received-Date: Sat, 05 Aug 2017 16:03:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 07/27/2017 12:31 PM, Jagadeesh Krishnanjanappa wrote:
> DRBD is a block device which is designed to build high availability
> clusters. This is done by mirroring a whole block device via (a dedicated)
> network. You could see it as a "network RAID-1".
>
> This recipe provides DRBD9 kernel modules drbd.ko and
> drbd_transport_tcp.ko.

If this a kernel module, shouldn't it reside under recipes-kernel ?

- armin
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>   ...ck_existence_of_modules_before_installing.patch | 24 ++++++++++++++++++++++
>   .../recipes-support/drbd/drbd_9.0.8-1.bb           | 22 ++++++++++++++++++++
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
>   create mode 100644 meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
>
> diff --git a/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch b/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
> new file mode 100644
> index 0000000..6414f73
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
> @@ -0,0 +1,24 @@
> +If CONFIG_BLK_DEV_DRBD kernel config is enabled, then DRBD
> +does not build drbd.ko here. Under this circumstance do_install
> +task is going to fail with a below error:
> +-- snip --
> +| install: cannot stat ‘drbd.ko’: No such file or directory
> +| make[1]: *** [install] Error 1
> +-- snip --
> +
> +So, check for kernel module existence before installing.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> +--- drbd-9.0.1-1/drbd/Makefile	2016-07-03 06:54:19.421538690 -0700
> ++++ drbd-9.0.1-1/drbd/Makefile_mod	2016-07-03 06:53:18.938801628 -0700
> +@@ -158,7 +158,7 @@ else
> + 	fi
> + 	install -d $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR)
> + 	set -e ; for ko in $(MODOBJS); do \
> +-		install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
> ++		[ -e $$ko ] && install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
> + 	done
> +     ifeq ($(DESTDIR),/)
> +       ifeq ($(shell uname -r),$(KERNELRELEASE))
> diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
> new file mode 100644
> index 0000000..e943f24
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Distributed block device driver for Linux"
> +DESCRIPTION = "DRBD is a block device which is designed to build high \
> +               availability clusters. This is done by mirroring a whole \
> +               block device via (a dedicated) network. You could see \
> +               it as a network raid-1."
> +HOMEPAGE = "http://oss.linbit.com/drbd/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> +DEPENDS = "virtual/kernel"
> +
> +SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
> +           file://check_existence_of_modules_before_installing.patch"
> +
> +SRC_URI[md5sum] = "c1dd58043f46e9926b579aa65d4ea980"
> +SRC_URI[sha256sum] = "87f72d46db9bad926415b3ab9f5f1397de8c581d2e2ec1addbdd5ce2604e6123"
> +inherit module
> +
> +EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
> +
> +do_install () {
> +    oe_runmake install DESTDIR="${D}"
> +}


