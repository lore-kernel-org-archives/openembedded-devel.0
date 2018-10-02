Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA0C074596
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 15:15:14 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 84-v6so1367592qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q1y2tcOCdD2wjyR8S5BJ/g3xXyszqKbQCMQ+fjE7vo4=;
	b=Mi/vg3SY/Xj0NqhEd0PqfRhJbnXw70c2wIh4oR6vBCVcT9LYyx1WtaYaTDn4eZcTT6
	YAFitpOVv2ccPZQL9Q1CAa38mdLLwecg4GEBixqs7O4Hwy1MgITLCZ39UY0ctL2I6th6
	7vVfS+a4FjmhJ503WqUV8R1DAGwQfwmXBakT2LMJC0Wnpt6byj3eLCnBRf9fNp2MRw9w
	4u9lHTQ7P4jH3XYWPmM45dop7efR5+/gT3E56qqeM0gVGE5wS6UoJgaHnFDp2m7oIMlo
	+5qrM35vOqIwMwqwZqHOpq/ShrpSCDOdX4nxY8MASxYR+48WsnWkQP/7fRAj5Fj9foNW
	rxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q1y2tcOCdD2wjyR8S5BJ/g3xXyszqKbQCMQ+fjE7vo4=;
	b=OGpwJrqYSKY1doRkOKJRcD439VnInvH//Vo8Cm4pvYPesmi+PqPbHFnONakryUb6hG
	WPchSrEe8zXBP/9sNkULRRWlhEiszN6hFloUZeeFpDpkjFPJL703cH9dDr/mFTBJIPSe
	ai+KkKOK7njq+fsZwh9giR8uCqVv6cH3GNyNUzFPG4WTCey/s61+LPkxSMx0JybQ/nU3
	lsonaMymqWlOuTxd9ydLnbfhxwf6R4AF7N9/fFE1S9iu+KjPVVjrIvgfGqoAe3OHwpUd
	PxDtIJ8lcOuyUa1JsmZjzgXyB+aC/uajj7FLoneK7mZbZ8is4wa1OlmAkW1p0s7Zq++Q
	hgYg==
X-Gm-Message-State: ABuFfohtUhSo3VB33w4prSm76iz8SgBrhgM+TaFJCIai35RMME9jx0ex
	uV4bhxlOZCEwFSTTr1VpEJaHJNUpPR5ZfHlH2e4=
X-Google-Smtp-Source: ACcGV63pvK4Awkex2HMil3wpzJqbj5q4N1rt1RAfSbk9EFW/VMj6QY/edXhYpgiqEdpAViX5gqElHeLt2MrGLIwDvA8=
X-Received: by 2002:a37:655:: with SMTP id
	82-v6mr12242080qkg.223.1538493315318; 
	Tue, 02 Oct 2018 08:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181002083238.74140-1-uvv.mail@gmail.com>
In-Reply-To: <20181002083238.74140-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Oct 2018 08:14:48 -0700
Message-ID: <CAMKF1srWp+SANX2zBC_H4tRZS_Jk7+2ZMXBgA4z==+h7KyjTsg@mail.gmail.com>
To: uvv.mail@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libeigen: allow empty packages
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
X-List-Received-Date: Tue, 02 Oct 2018 15:15:15 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Vyacheslav

On Tue, Oct 2, 2018 at 1:33 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> When libeigen is used as a dependency (e.g. in ceres library),
> the build is broken because empty packages are not constructed be default
>

can you explain a bit more on whats going on? it is a runtime failure
or build time failure.

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> index 31a42a9d6..a59320655 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> @@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Module
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>  RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> +ALLOW_EMPTY_${PN} = "1"
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

