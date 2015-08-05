Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id A140660167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 04:51:37 +0000 (UTC)
Received: by lbbud7 with SMTP id ud7so17705592lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2015 21:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ch4P1F/gu2XKsCmf5coViu4pwU5JnTSZYb5e0irkeBs=;
	b=BVMRk3wZsiMpuhlNl1DVTCV8ZnWnTcg7gKgkMJ57k81nhjw41JjdfbuVwvEfYHAvPN
	AkkO5GuPIKK4TB8BCAWOKUh57DQjNHNbtvluy8qFl84VRIl/dmmyWtAdDotfAl95r2p9
	whG/RCLS6rWEg+3XQQE4/vJMRN1Pf34qX96Hpc26eTcM1NsppsNR35O97Tw0zheKIYd0
	1RJUH2ldinFz6ivINyIlL+fomiE3eoggnoIyN9+YYbU/Axi+15kfz3eGdfJV4RXT9Iti
	0+fstdXsaeQ1ikNgaFIHLrukbmDJlbCiPyoJ1waxiuz5IIoEXRZyln38AS3V12uM5Z4q
	feOw==
MIME-Version: 1.0
X-Received: by 10.112.135.131 with SMTP id ps3mr7607839lbb.84.1438750296299;
	Tue, 04 Aug 2015 21:51:36 -0700 (PDT)
Received: by 10.25.15.38 with HTTP; Tue, 4 Aug 2015 21:51:36 -0700 (PDT)
In-Reply-To: <1438741545-900-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438741545-900-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Tue, 4 Aug 2015 21:51:36 -0700
Message-ID: <CANx9H-B8xQbXPwL5TvxMx4Vv8Z-O0U64edhH2wt+Mh9D2P511Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2] python-requests: upgrade 2.5.1->2.7.0
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
X-List-Received-Date: Wed, 05 Aug 2015 04:51:40 -0000
Content-Type: text/plain; charset=UTF-8

.

On Tue, Aug 4, 2015 at 7:25 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../python/{python-requests_2.5.1.bb => python-requests_2.7.0.bb}  | 7
> +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-requests_2.5.1.bb =>
> python-requests_2.7.0.bb} (56%)
>
> diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> similarity index 56%
> rename from meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> rename to meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> index b719dca..1564d50 100644
> --- a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> @@ -2,15 +2,14 @@ DESCRIPTION = "Python HTTP for Humans."
>  HOMEPAGE = "http://python-requests.org"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
>
>
Again, since the LIC_FILES_CHKSUM has changed, it is a courtesy to indicate
why. As the committer, it is your responsibility to make sure the same
license still applies.

In this case the reason for the checksum change is a change in the
copyright year. Please include a comment about that in your commit message.

-PR = "r0"
>  SRCNAME = "requests"
>
>  SRC_URI = "
> http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
> "
>
> -SRC_URI[md5sum] = "c270eb5551a02e8ab7a4cbb83e22af2e"
> -SRC_URI[sha256sum] =
> "7b7735efd3b1e2323dc9fcef060b380d05f5f18bd0f247f5e9e74a628279de66"
> +SRC_URI[md5sum] = "29b173fd5fa572ec0764d1fd7b527260"
> +SRC_URI[sha256sum] =
> "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

