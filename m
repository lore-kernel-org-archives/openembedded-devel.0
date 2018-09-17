Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id EAFE17455D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 16:02:17 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w11-v6so17902275wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o/AAXhNSALBqVMYZ+MHx70eXcQXzdBhRg/bWFqB52lo=;
	b=c88vUlMn8jSGQtMDGwDnM40K1awHMZ9fqYTm2f3AfmTK57trtn3JlTC08HMJtUMzCW
	UZlE2EqRGH0pYIVWJoPyObfKOxayiXsyvHUgLVKxrCqI9ocwnFFbJ4KF2Oz13oJGWjxK
	wMEX5vL5yw0xmcbMTfMv7MPP+9FtbuggG9zzU8LW+YsfPLhj4y/FXFRVUme+Wj2b72Sc
	xpM38x5M+fpWA+8JbO8hH/1O4yhsqZreziCw8AJm2yOjrmdeti1VUhNWE52YbfB0AtMB
	QTEdOtiJd32ZrKyLAOlp4JHn8T8OfgmBO1c78gYvmMFV2aSc27BHghtVrA2ZLG8n96De
	56Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o/AAXhNSALBqVMYZ+MHx70eXcQXzdBhRg/bWFqB52lo=;
	b=PmQTUCEmV+x46/FiMZmYh+v10phz8Q+Wm0PZIUY8iOSe7ex0jZI9sAbZ3dKYLfBLR5
	pGtjXWmXIWveoNyQp3yesELeB1KnwHa5k114ez9c7tECzAmRm54DzgTYZMSEQJfbdZ7S
	tkgKT+On65XYpf/mGjvRpGuS5Q4Su/PIHvJrSFBvNFW1b7rR9YNZ1ktvdl8N8oCzmJm4
	SwDQTRCXgo0JEP9pSRPhdhgjWCoj4nkQ/9/tx2S9Vy3kuW3B/Fu3AJlSKvSJuqWNBGP6
	Ncet4+4plq5DheGsNr494Nx6UZwnvp0qsIrl+mGVOx+VNNphaxAnQOZ1ZwfY075YE+Ap
	rPHg==
X-Gm-Message-State: APzg51Cwm7APwl8TgcWfb7wPh+4IcZUpX4s8ztzd95niPOYrAPdr57yC
	WcpO8ihV1izQtDm5iwhvs9B+cJRxS18Hs/jOK8c=
X-Google-Smtp-Source: ANB0VdYX+KyacTLI9cBf6ah1jaM9vtXJGCijrZ8SneG41jP4cLUiksYvvzuv1KEcIfN+7+qDfkjsOEROymXedDQSoX8=
X-Received: by 2002:a5d:574b:: with SMTP id
	q11-v6mr19773486wrw.272.1537200138515; 
	Mon, 17 Sep 2018 09:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537199591.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Sep 2018 18:02:07 +0200
Message-ID: <CA+chaQdzPyhGSR=2yr6y6OvC8yKMq80nOX=WWnqdgqZkeN4Pow@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/19] 19 recipes to split one dpg package only
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
X-List-Received-Date: Mon, 17 Sep 2018 16:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

Would it make sense to do the same for -dev packages while you're at it? I
guess that in most cases it will be used in the same recipes.

On Mon, Sep 17, 2018 at 5:55 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Hi Khem,
>
> As RP replied in previously oe-core mailing, one dbg package is
> recommended, so I tweak them in oe one by one.
>
> This pull request is one patch per recipe rather than merge them as
> a large one, it may add your merging burden, but it is helpful for
> reviewing
> and rework any of them without resend all.
>
> But if you prefer one patch, I could resend V2.
>
> //Hongxu
> The following changes since commit
> a06c29be2f5bc204f965ee07298c34232c5c39fc:
>
>   klibc: fix build with GCC and -pie for mips, mips64, aarch64 (2018-09-15
> 07:37:11 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib hongxu/dbg-split
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/dbg-split
>
> Hongxu Jia (19):
>   fuse: split one dpg package only
>   libtevent: split one dpg package
>   libtdb: split one dpg package
>   libtalloc: split one dpg package
>   isomd5sum: split one dpg package
>   gnuplot: split one dpg package
>   scsirastools: split one dpg package
>   konkretcmpi: split one dpg package
>   gpsd: split one dpg package
>   wvstreams: split one dpg package
>   fontforge: split one dpg package
>   xerces-c: split one dpg package
>   v4l-utils: split one dpg package
>   lmsensors: split one dpg package
>   dbench: split one dpg package
>   postgresql: split one dpg package
>   mariadb: split one dpg package
>   pidgin: split one dpg package
>   syslog-ng: split one dpg package
>
>  .../recipes-support/fuse/fuse_2.9.8.bb             |  8 +--
>  .../recipes-support/libtalloc/libtalloc_2.1.14.bb  |  6 +-
>  .../recipes-support/libtdb/libtdb_1.3.16.bb        |  5 +-
>  .../recipes-support/libtevent/libtevent_0.9.37.bb  |  5 +-
>  meta-oe/recipes-benchmark/dbench/dbench_4.0.bb     |  5 +-
>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb  | 15 ++---
>  .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 14 ++--
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |  9 ++-
>  meta-oe/recipes-dbs/postgresql/postgresql.inc      | 74
> ++++++----------------
>  .../recipes-devtools/xerces-c/xerces-c_3.1.4.bb    |  8 +--
>  meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb  |  6 +-
>  .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb  |  5 +-
>  .../konkretcmpi/konkretcmpi_0.9.2.bb               |  5 +-
>  .../scsirastools/scsirastools_1.6.6.bb             |  8 +--
>  .../fontforge/fontforge_20170731.bb                |  5 +-
>  .../v4l2apps/v4l-utils_1.12.3.bb                   |  5 +-
>  meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb       |  6 +-
>  meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb    |  9 +--
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  4 +-
>  19 files changed, 81 insertions(+), 121 deletions(-)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

