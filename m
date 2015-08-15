Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 574C472A78
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 15:40:14 +0000 (UTC)
Received: by igfj19 with SMTP id j19so30972941igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 08:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=h5LYRIw5LwbpTcZEHgNkvv0hNYA0cfO2ZXWz+u+lU4Y=;
	b=DkjSTAUTsTcyFr54sOO/4h5Y5nLnh9o38tCPONf8VM5dVRi1jgNa//HOJb5kIqWSXv
	nZn7aYZ1YRFN3dZyai/vWeuXSTWwysuOepiUSGN1lZQknyZo2O8gUF3J6xBw+r2rvIaB
	zUOTg1r6AEBnKlyU3BNA9PuIAddq909EOBF/zisyeY9lJkwdSU+A4xDsxY9jbzVG2I/S
	E81pNWd5X2qJClCtokb3cAjzQ5hDf3vpgVLEjtXRxMun9rcLFY+djP0IzrwiBHymrH00
	XPaWwu5vOPfyTQwFXnq//30jPTY0ykOeOapxGl1rq6YXE35PXNxFpD+5OhIltspeEImC
	HIjw==
X-Received: by 10.50.30.196 with SMTP id u4mr8869295igh.11.1439653214693; Sat,
	15 Aug 2015 08:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sat, 15 Aug 2015 08:39:45 -0700 (PDT)
In-Reply-To: <55CEEF76.5080207@gmail.com>
References: <55CEEF76.5080207@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Aug 2015 08:39:45 -0700
Message-ID: <CAMKF1soO00zmFxPKCOmFLV63-p-cqb_39XY=+ACsAXFYs7q65w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Where to place a new recipe for epeg
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
X-List-Received-Date: Sat, 15 Aug 2015 15:40:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 15, 2015 at 12:51 AM, Andreas Baak <andreas.baak@gmail.com> wrote:
> Subject: meta-openembedded/meta-efl/recipes-efl/efl/epeg_svn.bb
>
> Hi all,
>
> epeg is a fast jpeg scaling tool, originally developed in the efl project
> https://www.enlightenment.org/ . In the current version of efl, the source
> code of epeg is not present anymore since the tool is deprecated. Its
> functionality has become obsolete by Evas
> (https://en.wikipedia.org/wiki/Enlightenment_Foundation_Libraries#Defunct.2Fdeprecated_EFL_components).
> The source code of epeg is kept in a legacy repository
> https://svn.enlightenment.org/svn/e/OLD/ . The current epeg recipe downloads
> the sources from this legacy repository.
>
> The code for epeg has been adopted and improved by mattes
> (https://github.com/mattes/epeg).
> I would like to replace the recipe efl/epeg_svn.bb by a new recipe
> epeg_git.bb.
> However, I am not sure if will be accepted to delete the efl/epeg_svn.bb.
> Also, I don't know in which folder to put it.
> meta-openembedded/meta-efl/recipes-efl/efl would not be a good option since
> epeg does not belong to efl anymore.

you can submit a patch to replace/upgrade existing recipe, if that
source have moved out but it still is EFL component then let it remain
where it is, if not then move it to meta-oe/recipes-support/epeg
>
> Any thoughts?
> Cheers,
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

