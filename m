Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id CAA1062138
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 10:41:03 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so46660879qgd.10
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 02:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hKJ9hIawLv/lmLnG0jHzZS1JmBoENGW3a2gDSBu2DT4=;
	b=IcPNdypFzeyTjbXLhTxrz6MgN0AxNaU1nN9EsDb4xYwNkNQKyB3zbhPG/IQTyIVVHj
	ztcnhcS+AYj+2H/FZjLBaIek7CMfGxbrJnEEmLsjfHa8uUvDqD+sEnCupJ/GZZznpJA/
	qjb2Ea2riB13diV8PALlReLYAUUR6FRY/jFkYnosstF20eyN+yofGhgRiLdeK60hCFNm
	m0KFqdbxcmd5wYvz1vhpOqxW578+fAWzOXFXhKZWmJXM1qfB+9i+q9paNJRF+Akyti8l
	GsB9bRtfi+WxXSzBRI33uoN9nE72A3nG6tIG5mXa16K6cRlVdUu3GhZywKmsEGS/KOMd
	8uzw==
X-Gm-Message-State: ALoCoQkilLnlXBuJsRsdOw8jigYR5dWXwBNOInnGR2uUY/M2XuoknyHINwB81TkJPMBUOYWrMnCX
X-Received: by 10.224.103.129 with SMTP id k1mr39954411qao.93.1422873664553;
	Mon, 02 Feb 2015 02:41:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 02:40:44 -0800 (PST)
In-Reply-To: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 10:40:44 +0000
Message-ID: <CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 10:41:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 2 February 2015 at 10:02, Khem Raj <raj.khem@gmail.com> wrote:

> I have put together upgrade to gcc 4.9.2 as well as glibc 2.21 (
> upcoming ) on  a contrib branch ( top 2 patches) its has not got much
> testing besides x86 qemu thus far.
>

I'm seeing these failures when cherry-picking the top two commits to
current poky/master.

gcc-cross-initial:

| /data/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:
In function 'void expand_builtin_init_dwarf_reg_sizes(tree)':
|
/data/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:334:27:
error: 'struct gcc_target' has no member named 'dwarf_frame_reg_mode'

cross-localdef-native:

| In file included from glibc/locale/programs/locarchive.c:696:0:
| glibc/locale/programs/../../intl/l10nflist.c: In function
'_nl_normalize_codeset':
| glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing
binary operator before token "("
| glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
'_nl_C_locobj_ptr' undeclared (first use in this function)
| glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undeclared
identifier is reported only once for each function it appears in

Ross

