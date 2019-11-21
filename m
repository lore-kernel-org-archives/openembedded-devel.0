Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 21AB97F987
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:56:45 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h15so3971147qka.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c2r6TH2iN2t2pESGYWjYjGzguMXF3ZJ8UnrRg+VaHyk=;
	b=m3ZarpTc8ZvSA+50lqxiVFChaMJhlHB2X1EK4HqnSJ/Oaw2F38Lar5j4VTDt3lVB5I
	hbhmG5QDB9pbc0RHknUNjmAe478ZmCd6UzhXwM5Rwx07GkvmTMvK86m+1F/35XszLlwp
	6UWoqRT1BqPV0P+3CluW9iyf56FKTvRC87JkF9vpegWpjCIC3CNPi6sf3Sj2SuD5y7cN
	oBtsTap+RBK3g3SEgMiIDrP6MDBOT69m0ZshoGRSTlnOujmTXjObyO+za/idLJhjzu/k
	WeKb0/nHcXOUHPZZsDFOX18aknhICUoKnM+OCzbTHpYCRr4Q6YvlqnDL83O+RRweOUCn
	rnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c2r6TH2iN2t2pESGYWjYjGzguMXF3ZJ8UnrRg+VaHyk=;
	b=S3V13Pg97aXsCPlclp9/HbY15z0OZ8ueWRFDei0sflmM9c2Qxt/CRhCSgpfo+27XEF
	rmzSvhnaGS+GkxpGlxeqLMpydRfX7YD/z6xEFqBzhJO/IYB4GIIDO8ZhTznsIJobHi6a
	WOKoZL9FowiW9ZuxPN6dYZbu73yIzUEesCsrcJUlRHMxN8Pp8NjzDL3R2Vz2Szn0yGdH
	+Zhtd2M5U/vHv4piHh3pXeWNwpfkxDLLowmU9w0uT1d8+KBqqjvt05fFIYlkJ3Iowub1
	Xjfu03+HT8wYO/ejVZePRKUJX2hS7qDs46dww8EdlYsFwY+g5kInLoZblQoOeCi74h68
	9pxQ==
X-Gm-Message-State: APjAAAWIq5wgdpMA4Wfy4otGW/6bXcEUAglrgRsuxsq+k9U1mAASGjvA
	YIMBiGoAx3SrCKhgvv8NcXBCj8iY4BM+w2INCDfMDHD1
X-Google-Smtp-Source: APXvYqwWUnUbx6zabFL41ZqJogHKr1eV4vV09orqVd9xYL5x8r3G0s32gWMq3c5n+//tYqJGCEeZORlyOzRPii5YrbA=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr9180796qkg.71.1574362605660; 
	Thu, 21 Nov 2019 10:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20191121051316.12844-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191121051316.12844-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 10:56:18 -0800
Message-ID: <CAMKF1soVbPt_CBrVaRRiOgS8r=XjBG5=77F6F--JFG=2cqBsUQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl] [PATCH] librole-tiny-perl: upgrade 2.000006 -> 2.001004
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
X-List-Received-Date: Thu, 21 Nov 2019 18:56:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 9:12 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...-tiny-perl_2.000006.bb => librole-tiny-perl_2.001004.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.000006.bb => librole-tiny-perl_2.001004.bb} (77%)
>
> diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
> similarity index 77%
> rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
> rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
> index c2755ea0f..41743d508 100644
> --- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
> +++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
> @@ -6,11 +6,11 @@ SECTION = "libs"
>  HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"
>
>  LICENSE = "Artistic-1.0 | GPL-1.0+"
> -LIC_FILES_CHKSUM = "file://README;beginline=177;endline=214;md5=26df7e7c20551fb1906e2286624f0b71"
> +LIC_FILES_CHKSUM = "file://README;beginline=182;endline=219;md5=26df7e7c20551fb1906e2286624f0b71"
>

what changed here ? please document that in commit msg

>  SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
> -SRC_URI[md5sum] = "7c277728a7e090f64b495857cadfed08"
> -SRC_URI[sha256sum] = "cc73418c904a0286ecd8915eac11f5be2a8d1e17ea9cb54c9116b0340cd3e382"
> +SRC_URI[md5sum] = "98446826608b1e943e65c1f6e35942fe"
> +SRC_URI[sha256sum] = "92ba5712850a74102c93c942eb6e7f62f7a4f8f483734ed289d08b324c281687"
>
>  S = "${WORKDIR}/Role-Tiny-${PV}"
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

