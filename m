Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3D452770B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 02:20:15 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so8021748igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Oql9TwAh8vITH7eG2BmVcmyUhOutkzdb2+0puNfRBiE=;
	b=LNowCLIJ+JICImIaqaMlflbIBdBRL9DJ241/LrhHMuDYQBbwRlXMBKtwY2IP8tFMe6
	n7kGQanb3W/TYaXsMdER/FHtcNh9TWRQ/zMpXk04wv5CC6uvvoeLOCNtATFh5w7Ao9Xr
	cRudluYUCJR6Atz1NrpcrlGVpseCTZ6z4kRl5FZe/rtH7M98f4uf+yPnSv0scXXzLosn
	ExgELWM0u0iqDMQ4+O6OdaHj4n4wNVcUy1BEVo0o1Rg10AeFaVK3ann5y0v4XYy3bCpE
	MPI0c4CQFmlXBw49FGvTV40z8KcDGCMZXB9XuUFyF/HqB73PdPe1B0f4Z0VlDBj3m6El
	YKVA==
X-Received: by 10.50.20.67 with SMTP id l3mr1769366ige.75.1443752416024; Thu,
	01 Oct 2015 19:20:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 19:19:46 -0700 (PDT)
In-Reply-To: <1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 19:19:46 -0700
Message-ID: <CAMKF1srLz3tEoFTzuNNy8w3PBV9jcMfHS=eQN-eopi1KU6WW3A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 1/4] mkvtoolnix: Blacklist, fails to build with gcc-5
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
X-List-Received-Date: Fri, 02 Oct 2015 02:20:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 8:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> index dd613b3..d647cec 100644
> --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> @@ -39,3 +39,9 @@ do_compile() {
>  do_install() {
>      ${S}/drake install DESTDIR=${D}
>  }
> +
> +# | In file included from src/common/utf8_codecvt_facet.cpp:22:0:
> +# | src/common/../../lib/boost/utf8_codecvt_facet/utf8_codecvt_facet.cpp:174:5: error: 'int mtx::utf8_codecvt_facet::do_length' is not a static data member of 'struct mtx::utf8_codecvt_facet'
> +# |      BOOST_CODECVT_DO_LENGTH_CONST std::mbstate_t &,
> +# |      ^
> +PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5"
> --


Does this patch help
https://github.com/mbunkus/mkvtoolnix/commit/df0df0f83b2dceb390945c9393621f1c11c466d0


> 2.6.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

