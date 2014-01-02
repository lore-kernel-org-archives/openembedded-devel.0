Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 673E76B8CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2014 13:38:48 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so12346176wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2014 05:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TnA6OcztcNFYQIHkNJUVcW6ngmJ8+D9Gb99/f5SER3w=;
	b=OYgNL6qf0G4JQeHBal2aJb+DxkqgUU0yF4X4s5kzdxZEKPIcoAqR+jQO0f2DW3qqa3
	rv043DheBGwUVTmzARGlBK/hpFFPBIXicNpdpVud7OgH33MX9a6FXS2E0RTMr/tlAZ/y
	eN9/0rWI4Lk14cetb7sZk+V8YFRvMURtydFirJcv4GOJOM1eBnF5hNcEFeIW27Urns3b
	H8l6CVjWFtl/HE7lM+kMF3r9fZmiCxJHWiri6t/PCPx2XgAce6ZLunGbwthkauzNMYs5
	BfNkaddVQJUbmcDtjzFaqWYUneSvdXVSvCuyrDSMOpLwbzSulWlueXY6RXchIYLz4OCI
	/trA==
MIME-Version: 1.0
X-Received: by 10.194.61.211 with SMTP id s19mr4811832wjr.73.1388669928952;
	Thu, 02 Jan 2014 05:38:48 -0800 (PST)
Received: by 10.194.60.4 with HTTP; Thu, 2 Jan 2014 05:38:48 -0800 (PST)
In-Reply-To: <la3njk$rh$1@ger.gmane.org>
References: <1388577530-4557-1-git-send-email-Martin.Jansa@gmail.com>
	<la3njk$rh$1@ger.gmane.org>
Date: Thu, 2 Jan 2014 14:38:48 +0100
Message-ID: <CA+chaQfWvRWPBN=rtSdC=G6dVAU0fyizFQY0CArXk+cdrMxSiQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] udisks: Don't enable acl PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 02 Jan 2014 13:38:48 -0000
Content-Type: text/plain; charset=UTF-8

Ah ok, so packageconfig needs to be fixed..

 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,libacl"


On Thu, Jan 2, 2014 at 1:56 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Martin Jansa schreef op 01-01-14 12:58:
> > * libacl isn't available in oe-core/meta-oe
>
> Yes it is:
>
> https://github.com/openembedded/oe-core/blob/master/meta/recipes-support/attr/acl_2.2.52.bb
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFSxWHwMkyGM64RGpERAvmGAKCzy6nSaxbWBhe9/VaXl439dfWRiwCfa3vp
> ez5rPMtceGixyAcVTm2XEUE=
> =rj77
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

