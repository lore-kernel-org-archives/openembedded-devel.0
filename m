Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7B671B32
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 14:00:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1486044033; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=5Wuxhl7b7Oay9VNRdxNvZib+xI7bEiThXpwzllJBhmA=;
	b=urWX/8Wptd1ECAJehJk5ObmVpSbU8uU6mp8+CDlpt8CfoNoKeZ+eX30qJq/cOKIAEqd7w+uN
	itufCIdywp/4Ou3Itf2BfHNum9DYrNOspDgLgzfNEoupauMOz3097WQCeYzhjloGOClcphC+
	nVSXwdig4jRwIKWQebRlFCJO6Lk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=e6AVfCdc8fsBmKCxtKqoX5J38MN3XwBY/VtqBC6CIFkkxu2AqpCLDGz8A/KCrpBtA7KoOe
	YsnA1uCSNhPKtdCyupGJc4X63X9AcaWvhd/KnhX5sRpdBGdu7xav/HibzjEn9WWrqdqggAvC
	NGFz+yx1JDcidVPVC5eCpy4ZvqM6A=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 58933b7e.7f30c4441cf0-smtp-out-n02;
	Thu, 02 Feb 2017 14:00:30 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c7so39728855itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 06:00:30 -0800 (PST)
X-Gm-Message-State: AIkVDXJ8BKgEEv1S8FYIMrfoHVUcabHjSZ6WWdXT44tlEUBmxlD/LNd4GhrvrDBvC4Aphc6DHJAC0wRoqZCMUA==
X-Received: by 10.36.36.142 with SMTP id f136mr10574104ita.0.1486044029542;
	Thu, 02 Feb 2017 06:00:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Thu, 2 Feb 2017 06:00:29 -0800 (PST)
In-Reply-To: <20170202134911.23234-2-andreas.kling@gmail.com>
References: <20170202134911.23234-1-andreas.kling@gmail.com>
	<20170202134911.23234-2-andreas.kling@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 2 Feb 2017 09:00:29 -0500
X-Gmail-Original-Message-ID: <CADNbA1pRhAGixv0xkf1+08f7FvFOdfhYwjeCmZ3B5mgQeHG+3g@mail.gmail.com>
Message-ID: <CADNbA1pRhAGixv0xkf1+08f7FvFOdfhYwjeCmZ3B5mgQeHG+3g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: Re: [meta-python][PATCH 2/2] m2crypto: depend on typing
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
X-List-Received-Date: Thu, 02 Feb 2017 14:00:35 -0000
Content-Type: text/plain; charset=UTF-8

Is this meant to be a build time dependency?  If it were required to build,
I would have expected to see a build failure.

-Derek

On Thu, Feb 2, 2017 at 8:49 AM, <andreas.kling@gmail.com> wrote:

> From: Andy Kling <andreas.kling@peiker-cee.de>
>
>   m2crypto requires typing since 0.24.0-38-g8bbd0ec
> ---
>  meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> index 5a9594f07..ca462229e 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> @@ -12,7 +12,7 @@ SRC_URI += "file://0001-setup.py-link-in-
> sysroot-not-in-host-directories.patch "
>  PYPI_PACKAGE = "M2Crypto"
>  inherit pypi setuptools siteinfo
>
> -DEPENDS += "openssl swig-native"
> +DEPENDS += "openssl swig-native python-typing"
>
>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
> -I${STAGING_INCDIR}"
>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

