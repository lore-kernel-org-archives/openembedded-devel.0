Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A092560115
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 01:43:52 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id w15so11460433iea.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 18:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ya6TYbLuMPY11ctCvqy5Nkz+JRcUP2XQNOkSv5mwZjA=;
	b=wWzDWLo6DvJVrn7jMTNX0ZK5ZOARtb+Sbe4gcv3C5FrcHgBWwQc7FF/GHj1wEJ8NV9
	SGn5+8ewsmfQV2MzMqVC71rN3VAcjTD0m+1rmQqi7pTGKZDJjFg6VGTTmnCbBNaxhhiI
	1QPFQa0oWjJdO2Tc+eosDwKaSLLwXbhtA9KITwvdOYu0MEdTfIrc1c0hRKF9rHz67DQ7
	GqOpmMda9iyQhFSQOgdbYYO1Ca636Kk5hjRHrq4clRb5m6csn/17kHDHVj7m8nhh2k2X
	qT66Ptz7UwTCPNBxYF3YTILsEb/FqqA2YgHZRSEyzbtqS2uP4g9wwSP62ooQx58bzoTn
	4Peg==
X-Received: by 10.50.92.74 with SMTP id ck10mr185712igb.3.1376444633067; Tue,
	13 Aug 2013 18:43:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Tue, 13 Aug 2013 18:43:22 -0700 (PDT)
In-Reply-To: <1375853946-4583-1-git-send-email-raj.khem@gmail.com>
References: <1375853946-4583-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2013 18:43:22 -0700
Message-ID: <CAMKF1sqEn0EOz7f-Vu4+W=PNHdZ60d8Dz_g5YUVgz=Qf4wj=2Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] proxy-libintl: rprovide the gettext packages
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
X-List-Received-Date: Wed, 14 Aug 2013 01:43:53 -0000
Content-Type: text/plain; charset=UTF-8

ignore this one please. I have a different one that fixes the problem
coming out shortly.


On Tue, Aug 6, 2013 at 10:39 PM, Khem Raj <raj.khem@gmail.com> wrote:

> This helps in stubbing out gettext when proxy-libintl is chosen
> usually on small/uclibc based images
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../proxy-libintl/proxy-libintl_20100902.bb        |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bbb/meta-oe/recipes-core/proxy-libintl/
> proxy-libintl_20100902.bb
> index e1531dd..0c652b6 100644
> --- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> +++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =
> "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a
>
>  PR = "r1"
>  PROVIDES = "virtual/libintl virtual/gettext"
> +RPROVIDES_${PN} += "gettext"
> +RPROVIDES_${PN}-dev += "gettext-dev"
>
>  SRC_URI = " \
>
> http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${PV}_win32.zip\
> --
> 1.7.9.5
>
>

