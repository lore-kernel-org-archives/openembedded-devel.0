Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E3D6D6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:03:48 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so19332715pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7rQfJctlsg8cTtZsPoAo5JcRiUyeJKeOSi6knAd58qE=;
	b=V2v8jR5MIdnP+NrKkFLe8frwYmh+37gtF177cH8neY0WTWtlhkKrKcmNmDbGZq/H6/
	ECeYFbrI+Q49srghr6BuXaXKx4gjA2O28hAhc+s6CHoGcaqgNQ659Uo6NaYQJcnQLSqY
	t/hy1iQ6Vj7/uSiAlu9OvztP59bx8akFv65NKzq7gZn0/JUGdSTShzovf5SCaLKI9ohv
	0p9pZoppPNDAhHdcHUeRVW+9LtbNPbglnaYfomxtc551c+uPYa7l8bCtuXzcLKLN4l2t
	/3xFVO2RNi+sod6OwlOy+7FCp4qaUkSS/Umq0oX4DDTiHimsNDYWJGkAFwbFmrEh9tDK
	NS6Q==
MIME-Version: 1.0
X-Received: by 10.68.216.99 with SMTP id op3mr5607671pbc.69.1429797829868;
	Thu, 23 Apr 2015 07:03:49 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Thu, 23 Apr 2015 07:03:49 -0700 (PDT)
In-Reply-To: <1429791892-30865-1-git-send-email-ruisebastiao@gmail.com>
References: <1429791892-30865-1-git-send-email-ruisebastiao@gmail.com>
Date: Thu, 23 Apr 2015 16:03:49 +0200
Message-ID: <CALbNGRRaX7RQLm__tDFv4=Ms1GEg4BVwdKAiJp7qMwb+CQ84EQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH]] qtwebchannel md5 error
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
X-List-Received-Date: Thu, 23 Apr 2015 14:03:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 23, 2015 at 2:24 PM, Rui Sebastiao <ruisebastiao@gmail.com> wrote:
> ---
>  recipes-qt/qt5/qtwebchannel.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchannel.inc
> index 3cd22cf..3ed5808 100644
> --- a/recipes-qt/qt5/qtwebchannel.inc
> +++ b/recipes-qt/qt5/qtwebchannel.inc
> @@ -4,4 +4,7 @@ DEPENDS += "qtdeclarative qtwebsockets"
>
>  # There are no LGPLv3-only licensed files in this component.
>  # There are no GPLv2 licensed files in this component.
> -LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
> +LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
> +                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
> +                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
> +                   "
> --
> 1.9.1
>
> --
* Missing signed off
* subject contains ']]'

Andreas

