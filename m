Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 97A9278C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:21:18 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id y5-v6so1677609qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4vjyAt+TEPdqTNRaJBnjr/KBn6RWnhf2iyC0MdJSBWU=;
	b=sifxupFsizZhN1E5AMVUMWHEeMXmFZ78GTUGb/1CPofP8iVdqvXANam7I2+671iHZ4
	GVGx6hyHGiBQryPkJVrgjG/02P6vEaVfhnaR7DUvCQBhvSFqzYNgaCgGqBLRtCDbKyV5
	uU5JwkIuYoIsrAWqeOCz0G5IPQePM3pd8X9L9s5NAFBJmfhtS6r0aHF/b7e5aK9Y3tKr
	8gFeZbc42Nrdg2+DiiDSs2ipCJFxcmuTmQJh8YJvKFB+M7zf47V+Ud/QoYag9BvR/Vu3
	dVIhtF+/RrESGkM59fGr1VWd8/pXSZiVQwM20KuZDDXJILnn48hxzdxsOiRYob2YbbP9
	fHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4vjyAt+TEPdqTNRaJBnjr/KBn6RWnhf2iyC0MdJSBWU=;
	b=WHFm5tCYibby5w0tRH0G0H8jf1Up8iUGWYoIgrkchaLy/l8fVLBP1/Pm8hg9PZP0yz
	dfWx9eXoJTsKtndbQDJqKQT9/Qf1svoRA8UiL5A7+odsf41xdwJNTaYIFN579zCmf8eE
	pQOcfNIoHQ2UBm+SkGcBRtLZjzTLve5cntBm++noXnvv+mGO0tj3RPfm4nhX219L5h5Z
	txwdMGo6NIgV1S5K+UA8M4y4PVWSWIRV7UWSKvblNoWcJx/Oq5WBOsen1bUjzR0jRkde
	qCbt0qVsfMb+HCvn4Xg5PTRXhnzGiaHskgorTwl1O9Ja14XiLxdvh7rgfi3/5Uzo96GJ
	vBKQ==
X-Gm-Message-State: AOUpUlFnSkYs8KgWlBHx7PWo76p3GWKqOR3RUUGMg+DbfxrjOVr5lteN
	/ENEfZhef725z4jWRLJ0uaa+2rKZYlKTGF8ZcrdKdQ==
X-Google-Smtp-Source: AAOMgpdk46uzTFRatVLJwQNhtYWuvSxafGddSCbhyVH+O3092lgl18Ym6XZTNZ6Y0Vf0zCPs/yQzxMSJSY932IB0jMI=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr2011862qta.117.1532614879202; 
	Thu, 26 Jul 2018 07:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180601045815.15819-1-raj.khem@gmail.com>
	<20180601045815.15819-3-raj.khem@gmail.com>
	<CA+chaQe10kmj=fpbQ58brd1G8UfOjPB9dW8XKs1e+gYqOWCM9A@mail.gmail.com>
In-Reply-To: <CA+chaQe10kmj=fpbQ58brd1G8UfOjPB9dW8XKs1e+gYqOWCM9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 07:20:53 -0700
Message-ID: <CAMKF1sqhYpv2THHc9-oWDc-5mb0hnaVazN+Q5oDNfeqiQ7N=8Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] openocd: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 26 Jul 2018 14:21:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 4:21 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> It probably isn't caused by this upgrade, but openocd is using git submodules which are checked out during do_configure:
>
> http://repo.or.cz/openocd.git/blob/refs/heads/master:/bootstrap#l37
>
> Would it make sense to call bootstrap with nosubmodule?

I think so, we can explicily fetch the submodiule and place it where its needed.

>
> It seems to be used by internal_jimtcl
> http://repo.or.cz/openocd.git/blob/refs/heads/master:/configure.ac#l574
> and internal_libjaylink
> http://repo.or.cz/openocd.git/blob/refs/heads/master:/configure.ac#l679
>
> I don't use openocd, I've just noticed random build failure:
>
> Makefile.am:23: installing './texinfo.tex'
> Setting up submodules
> Submodule 'jimtcl' (http://repo.or.cz/r/jimtcl.git) registered for path 'jimtcl'
> Submodule 'src/jtag/drivers/libjaylink' (http://repo.or.cz/r/libjaylink.git) registered for path 'src/jtag/drivers/libjaylink'
> Submodule 'tools/git2cl' (http://repo.or.cz/r/git2cl.git) registered for path 'tools/git2cl'
> Cloning into 'jimtcl'...
> fatal: unable to access 'http://repo.or.cz/r/jimtcl.git/': Could not resolve host: repo.or.cz
> Clone of 'http://repo.or.cz/r/jimtcl.git' into submodule path 'jimtcl' failed
> WARNING: exit code 1 from a shell command.
>
> On Fri, Jun 1, 2018 at 6:58 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fix build with new libusb and gcc8
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...2-deprecated-libusb_set_debug-with-l.patch | 39 +++++++++++++++++++
>>  .../recipes-devtools/openocd/openocd_git.bb   |  5 ++-
>>  2 files changed, 42 insertions(+), 2 deletions(-)
>>  create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
>>
>> diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
>> new file mode 100644
>> index 0000000000..c5b9083dca
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch
>> @@ -0,0 +1,39 @@
>> +From b95a996bfb281104b68ec66f32ebb79db519a4a8 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 31 May 2018 21:06:46 -0700
>> +Subject: [PATCH] Fix libusb-1.0.22 deprecated libusb_set_debug with
>> + libusb_set_option
>> +
>> +libusb_set_debug is deprecated in libusb >= 1.0.22 therefore replace
>> +with equivalent libusb_set_option()  API
>> +
>> +see libusb commit for more details
>> +
>> +https://github.com/libusb/libusb/commit/539f22e2fd916558d11ab9a66f10f461c5593168
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Submitted [http://openocd.zylin.com/#/c/4540/]
>> + src/jtag/drivers/xds110.c | 5 ++++-
>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/jtag/drivers/xds110.c b/src/jtag/drivers/xds110.c
>> +index 90b699027..9bfe02ea8 100644
>> +--- a/src/jtag/drivers/xds110.c
>> ++++ b/src/jtag/drivers/xds110.c
>> +@@ -367,8 +367,11 @@ static bool usb_connect(void)
>> +
>> +               /* Set libusb to auto detach kernel and disable debug messages */
>> +               (void)libusb_set_auto_detach_kernel_driver(dev, 1);
>> ++#if LIBUSB_API_VERSION >= 0x01000106
>> ++              libusb_set_option(ctx, LIBUSB_OPTION_LOG_LEVEL, LIBUSB_LOG_LEVEL_NONE);
>> ++#else
>> +               libusb_set_debug(ctx, LIBUSB_LOG_LEVEL_NONE);
>> +-
>> ++#endif
>> +               /* Claim the debug interface on the XDS110 */
>> +               result = libusb_claim_interface(dev, INTERFACE_DEBUG);
>> +       } else {
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
>> index 67abeede93..84727bf970 100644
>> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
>> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
>> @@ -5,8 +5,9 @@ DEPENDS = "libusb-compat libftdi"
>>  RDEPENDS_${PN} = "libusb1"
>>
>>  SRC_URI = "git://repo.or.cz/openocd.git \
>> -"
>> -SRCREV = "3737dd69e73816d186ba418d7b833462a8041079"
>> +           file://0001-Fix-libusb-1.0.22-deprecated-libusb_set_debug-with-l.patch \
>> +          "
>> +SRCREV = "cdf1e826eb23c29de1019ce64125f644f01b0afe"
>>
>>  PV = "0.10+gitr${SRCPV}"
>>  S = "${WORKDIR}/git"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

