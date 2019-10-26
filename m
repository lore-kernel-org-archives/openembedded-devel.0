Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 08E517FC2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:39:42 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id a194so4092586qkg.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RbzDSnmj21eJaoBAqR0TVDH53ElRschJV1Dy+423dgw=;
	b=gSptjc5PymOOPhUGci02lasIK4gkeVCU7FsAGMWQShLXYx4VkF989m+Jid8EphcxNA
	qJV8ql2FHpQBxUAwd80lJNscesT8rd2AQFn0emamXG1yv7uzcH6Fk7BgeVNDoaBbl8ak
	fSr/+Sh44e2Kytuqlj7vlmI6jvih89OUAeiNTX5J7GrMDcdJqIoz9UbwwU81GT++L9cH
	fTiXmwDUzkCbMtm61ASvmdCKey+ThGRoKUlh1zOfeauh69ik2uvAmfGUKMuHfwkFLc7B
	ENBZPSYkrmfcig0FAx4Jvsv1grPZnrTjHv71+kL6vPyyEwfl3svl3WGPvKjHfte3iL9Z
	EwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RbzDSnmj21eJaoBAqR0TVDH53ElRschJV1Dy+423dgw=;
	b=s3N+enWKMbp8RI/y0Fm1kZnIwmRmP2jKH/NVD4W0O9ecLabkHbqFpVqG0EWjRwg50U
	jD2V9CLw8Kwow2l/44nZhHmeQzzJ56gFY86tUA1CsamCbmDxIM3Lf5UVbHJGwf6LA7XK
	tWvMUUEPUNV6vawxoJiAGEJ665q5hITm5WeV3Er3Jqtdmbqad2oU+WCI1WJG/9me47nK
	fjX4U7Sk+Li26wAMetH7BolHoCymydirDaZf8RdH4MnPDQzVZkfQZcoCGuyxvf9gh/Tn
	KeBU+cjl+zPQAG75WarjbAyIN8RX9MgYuqWCOPfn6/UxHmrdVFMCLG+iw/PLcanrhg+j
	aHyQ==
X-Gm-Message-State: APjAAAUM4kBfbzdbgyT3SwQryi4joyVXapKIHehmn5fuYG1HsdzEi0iZ
	hVmxz7Rmnz601Q7eWUz2ZZFHLOnDvVoebcxcqzo=
X-Google-Smtp-Source: APXvYqxDH9Ho8J1onbgSKb4cBa7+zbPeJsr1YTglo5eFBDM2c1PV9KltkWZFzhsl1p9tgTSR9JHodCabmghcd44t/mg=
X-Received: by 2002:a37:b985:: with SMTP id j127mr6880731qkf.337.1572082783621;
	Sat, 26 Oct 2019 02:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <4dda49b3-8eb9-b89b-5a1a-a8a396cbd17f@gmail.com>
In-Reply-To: <4dda49b3-8eb9-b89b-5a1a-a8a396cbd17f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 10:39:16 +0100
Message-ID: <CAMKF1soMsXteAqgqdEj+=NNZ1iPY2qGBFr_t7JUYHg4pmq6bHA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: thud merge quest
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
X-List-Received-Date: Sat, 26 Oct 2019 09:39:43 -0000
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Sat, Oct 26, 2019 at 10:06 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 2d088d252624b19df384aecc434d23afb636178f:
>
>   postgres: update to 10.10 (2019-09-04 17:34:11 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded thud-next
>
> for you to fetch changes up to 446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93:
>
>   tcpdump: Fix CVE-2017-16808 (2019-10-05 09:01:00 -0700)
>
> ----------------------------------------------------------------
> Dan Tran (1):
>       polkit: Fix CVE-2018-19788
>
> Denys Dmytriyenko (1):
>       mariadb: update SRC_URI, as 5.5.64 has moved to archive
>
> Peiran Hong (1):
>       tcpdump: Fix CVE-2017-16808
>
>  ...2017-16808-AoE-Add-a-missing-bounds-check.patch |  61 +++++++
>  .../recipes-support/tcpdump/tcpdump_4.9.2.bb       |   1 +
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |   2 +-
>  .../polkit/polkit/CVE-2018-19788_p1.patch          | 194
> +++++++++++++++++++++
>  .../polkit/polkit/CVE-2018-19788_p2.patch          | 153 ++++++++++++++++
>  .../polkit/polkit/CVE-2018-19788_p3.patch          |  53 ++++++
>  meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   3 +
>  7 files changed, 466 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

