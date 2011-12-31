Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rgydw-0004mK-49
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 14:06:36 +0100
Received: by vbbfc21 with SMTP id fc21so11496970vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 04:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hsUUf5TIwZ2VXRqARwZSkB1b7sDMoPqKmoacaH50IBg=;
	b=YCnf0GLxBkImOM9XVuujI4W1/L2xEzY1kUOHjSjVi/B8qU5fDiWPjMUuKV3CzlnUg6
	jRzdwT2yrXnFKla+wcsMhH1xn91tvFAKaUXdbpyheoww3GCP1FeDUsJl6VBATSE5BxEd
	E8ZLa6FMqKjBeldoLmFkDGzt+D6IJq+nLKdLk=
MIME-Version: 1.0
Received: by 10.52.35.210 with SMTP id k18mr20579433vdj.37.1325336355475; Sat,
	31 Dec 2011 04:59:15 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Sat, 31 Dec 2011 04:59:15 -0800 (PST)
In-Reply-To: <1325331840-23575-1-git-send-email-adriano.pallavicino@gmail.com>
References: <1325331840-23575-1-git-send-email-adriano.pallavicino@gmail.com>
Date: Sat, 31 Dec 2011 13:59:15 +0100
Message-ID: <CACW_hTa+hpihvndWS-a7NZQme=+stZvUKxgtsxov3tdaqMj-xg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv2][2011.03-maintenance] binutils_2.20.1 fixed md5 and sha256 sum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Dec 2011 13:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/12/31 Adriano Pallavicino <adrianopallavicino@gmail.com>

> Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>
>
> Fixed md5sum and sha256sum
> ---
>  recipes/binutils/binutils_2.20.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/
> binutils_2.20.1.bb
> index 5154e2d..f40b676 100644
> --- a/recipes/binutils/binutils_2.20.1.bb
> +++ b/recipes/binutils/binutils_2.20.1.bb
> @@ -24,8 +24,8 @@ SRC_URI_append_nios2 =" \
>        file://binutils-nios2.patch \
>        "
>
> -SRC_URI[tarball.sha256sum] =
> "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
> -SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
> +SRC_URI[tarball.sha256sum] =
> "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
> +SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
>
>  # powerpc patches
>  SRC_URI += "\
> --
> 1.7.4.1
>

As told on IRC, I'd suggest to compare against the version in master.
THere the issue was fixed using this patch:
http://cgit.openembedded.org/openembedded/commit/recipes/binutils/binutils_2.20.1.bb?id=262f9eb0f046cd77d041a9dcb055700c5ab6601b

Note that this also patches SRC_URI.
Guess the patch above should also go into master.

Did you by any chance download your binutils tarball manually?

Best regards, Frans

