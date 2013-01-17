Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1TvmNo-0002dk-0P
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 11:07:40 +0100
Received: by mail-bk0-f54.google.com with SMTP id je9so1235743bkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 01:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=jQTECr0X9ugXfAA7l8NhqFGY6K544dzeY2Vd5JMXwY4=;
	b=MEw7uhgNWQN62X32jCt5tFLqHmdzR8FKL+Yrla5M/OJFIogZ5v0vUxNCEp9nfuyIJr
	yjYwGSkZsxTiVbeYbndnskY4I5OdxUOHe0f25iNu4p68TSF04/jEIwP/7V3LXrU7fN+j
	xOCBYbm6z7f4ZGYLnxy2KsRTzpmEYk7bwR93CXkXXj/L3JpSTXDWop7kviziwXGwagkp
	v4uwuLu1Y9Z1nLE7g7I47SuwYXynLEhtNOa/O8pI9Tn21DalNJDog8H38Uqnn80x7LSv
	AGv8XKa9co3BofqYmeOmpG8dbkBj4bwmTZXTkBQK1cjRNTrYNfJkfMr8HeweOokmbzW9
	WCPQ==
X-Received: by 10.204.4.145 with SMTP id 17mr1356870bkr.34.1358416337071; Thu,
	17 Jan 2013 01:52:17 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.205.102.72 with HTTP; Thu, 17 Jan 2013 01:51:56 -0800 (PST)
In-Reply-To: <004501cdf45e$f5c87270$e1595750$@slingshot.co.nz>
References: <004501cdf45e$f5c87270$e1595750$@slingshot.co.nz>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Thu, 17 Jan 2013 18:51:56 +0900
X-Google-Sender-Auth: TqFGwTGzKS9c40IG_ykoDYV5SQY
Message-ID: <CAPESJy6EW3NyWBba=hn7ino2jhnVcA7B-6rLT3NFTGjt3pvekA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Angstrom build failure
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
X-List-Received-Date: Thu, 17 Jan 2013 10:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Do you want systemd and udev to be build same time?
I'm not sure it is same problem or not,
I've read some thread about confliction between systemd and udev.
http://comments.gmane.org/gmane.comp.handhelds.openembedded/55775

adding a line
PREFERRED_PROVIDER_udev = "systemd"
in conf/local.conf helped me to go to next step.

Regards,
-- 
Takeshi Hamasaki

2013/1/17 R U Local <roystonvasey@slingshot.co.nz>:
> Dear All,
> I'm getting the following failure building an Angstrom image.
>
> | checking for UDEV... no
> | configure: error: Package requirements ( libudev >= 172 ) were not met:
> |
> | No package 'libudev' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables UDEV_CFLAGS
> | and UDEV_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | ERROR: oe_runconf failed
> NOTE: package systemd-git-r28: task do_configure: Failed
> ERROR: Task 518
> (/home/service/oe/sources/meta-openembedded/meta-oe/recipes-core/systemd/sys
> temd_git.bb, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2549 tasks of which 2548 didn't need to be
> rerun and 1 failed.
>
> My build environment is:
> OE Build Configuration:
> BB_VERSION        = "1.15.2"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "pandaboard"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2012.05"
> TUNE_FEATURES     = "armv7a vfp neon cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta-angstrom     =
> "angstrom-v2012.05-yocto1.2:6a2febed13f179c042c2371b2e86286c80c0df5e"
> meta-oe
> toolchain-layer
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce
> meta-initramfs    = "denzil:c0117f5ad7d1fe18d149bda426c7134ff24daae8"
> meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
> meta-java         = "master:3386ea6c96096f107f43f282f654e5afa456109e"
> meta-browser      = "master:c47f59df2e723495679c751cbdf6a8c6adec4b6a"
> meta-mono         = "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
> meta-kde          = "master:5b0882d951cfd71886d423c190faaa7c7f932333"
> meta-ti           = "denzil:95e9cf6299f5bae6965fe6fc4abe3eeb631df196"
> meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
> meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
> meta-htc
> meta-nokia
> meta-openmoko
> meta-palm         = "master:2b106be01228f64298d6cb338f93088806594344"
> meta-handheld     = "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
> meta-raspberrypi  = "denzil:34eef2ea4f5f24630dbb73b386861430167b8431"
> meta-intel
> meta-sugarbay
> meta-crownbay
> meta-emenlow
> meta-fishriver
> meta-fri2
> meta-jasperforest
> meta-n450         = "master:f75f9b6f68473eb0efac802409608f8389be0030"
> meta              = "denzil:0a9e8bf35afd5990c1b586bba5eb68f643458a4b"
>
>
> Any pointers would be appreciated.


