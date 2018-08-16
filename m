Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 617A97907A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 05:52:21 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id t79-v6so2577292qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SBaJAmVkzV1fj0+BmP/0gR9Osgmeic+v7GHMcfvz9tM=;
	b=rO3DElmUfog4jEMEMzjYKsIERsWPEnSzbrOMgQwOd3vtL2Cb4HN4rfSqXabDbXh3W7
	tmlE8kK0tQKhdcxA9wkX/5fzGLk9XA78BMT39XMHE9IeUo3BMi4C93LOUd48rlY9jYc+
	PjpOPbhrwXB0NJe9J45evs205KCK9TQ/8kANwgGcDfCWC2L32dH5MaHt6tsToTannFfs
	7dw4NQpNUz1YNrjdTms679zzOL7LPd/sZbiIsWy9AIGlSFPyG+IZokxvFcnCX0Xrm77/
	D0quCLnfWErU+JmHgeq65bK/722mIWsm8It+Cr5yH2IUIJ/UYndieJHQm5r4Comqmv+S
	9jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SBaJAmVkzV1fj0+BmP/0gR9Osgmeic+v7GHMcfvz9tM=;
	b=GCI4UzSjqO+8ASukrrvE7CxIQZwKTG0NZU5i2VHtovvC1LFGTEF+rF6Ar73utnAsX+
	Pmr8vUI9EvDlDZfHGThmaXy0P/LHJi8vVUEfhrANfLAGN/GIZOciFHIpOXgrekiHrMW/
	RS9ammceCYbRhYpdvUS+ArEhGNI3iVflh1druTscPGoLRWPmPp5nN5Erookq6H3g9Wix
	7uFe2UkiRr/lO/3IT7PNAo3Nw2gI5qokjJo/sWgH5n4pGZs/1plAMV/CDvsRPfh2pkBm
	EUBiB7vyfY/WHvCs987FIaRde9M117K5y5qLi7nhSfsuPWPg+IRa8JnbML+UlABGnmPw
	84RQ==
X-Gm-Message-State: AOUpUlHpGiQeVhS3qdjWjMIlbap9RzSXnfowR8i5GqOHZQmy5gsweYkb
	eUvS8r0jyTnDZXuj0syTazbDwnFPN6VoGtIPwmptmA==
X-Google-Smtp-Source: AA+uWPwMjHnVN2o5SIHNBWNS9Lj5TdaQ03mjT33WkVuVNR+8stJ/Tet7AvAq/5pwusAhkYjGaPy5pfjU/hPINzhvxnA=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr25556792qke.406.1534398742059; 
	Wed, 15 Aug 2018 22:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180816051257.4465-1-ashie@clear-code.com>
In-Reply-To: <20180816051257.4465-1-ashie@clear-code.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Aug 2018 22:51:55 -0700
Message-ID: <CAMKF1sqOZFf5rjWqX0fSRQ+X1S3v5T39JvfZE2OUCo=Z-jVyoQ@mail.gmail.com>
To: ashie@clear-code.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] uim: Fix SRC_URI
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
X-List-Received-Date: Thu, 16 Aug 2018 05:52:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 15, 2018 at 10:21 PM Takuro Ashie <ashie@clear-code.com> wrote:
>
> The place of uim archives has been moved to
> https://github.com/uim/uim/releases
>
> Signed-off-by: Takuro Ashie <ashie@clear-code.com>
> ---
>  meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> index af28895ee..1c58d40b1 100644
> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause & LGPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
>  SECTION = "inputmethods"
>
> -SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2"
> +SRC_URI = "https://github.com/uim/uim/releases/download/uim-${PV}/uim-${PV}.tar.bz2"
>

can you convert this into a git fetch along with pointing the SRC_URI
to github, tarballs are not consistent
and can be regenerated on the fly

>  SRC_URI_append_class-target = " file://uim-module-manager.patch \
>      file://0001-fix-bug-for-cross-compile.patch \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

