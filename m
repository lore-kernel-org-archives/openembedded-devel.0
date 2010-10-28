Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBXGe-0007Pq-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 20:32:04 +0200
Received: by gyf3 with SMTP id 3so1539851gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=C18/9GYevArOwv7LK3K6hV63bJqVmNYSEgcmUb/m4RQ=;
	b=BqP2sr+RYWvQhcrNGxPJs+VFSGP5HzNEsNxQViyuVeNODsTcczz7WdlpEdpib1bsIS
	RZffCKKSZVsubJ+9M5tK1eJZgltw6wMMRUPoYAd1RD3T0CiomvO82Z5KJOjEwOYUOx5D
	rPAxhf3gIYhZycAb+MvjDFQmu02tVmFHthr64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=trfNE+VEgsWzyr/tW7v8/aXjidJNy4xqEmXEd+bIaIPz9EFMSdXZFei5d0hfOcHMBV
	7Ei2ZVLl5rzdC7YmyaRc5fExv/jBUOCLrGV1LnGC45QqyYYr5PlNRD6a4pCU5ZSioD0V
	Ihh7BxwqiclzsBhCzqVczk0zDLXzJAOwhpmIs=
Received: by 10.90.113.16 with SMTP id l16mr348949agc.18.1288290677139; Thu,
	28 Oct 2010 11:31:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Thu, 28 Oct 2010 11:30:56 -0700 (PDT)
In-Reply-To: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2010 11:30:56 -0700
Message-ID: <AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: make CURL_FEATURES configurable again
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
X-List-Received-Date: Thu, 28 Oct 2010 18:32:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2010 at 10:22 AM, Michael Smith <msmith@cbnco.com> wrote:
> Lock down CURL_FEATURES for virtclass-native, but make CURL_FEATURES
> for target a weak assignment.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
> =C2=A0recipes/curl/curl-common.inc | =C2=A0 =C2=A05 +++--
> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/curl/curl-common.inc b/recipes/curl/curl-common.inc
> index ddaebb8..8ffefeb 100644
> --- a/recipes/curl/curl-common.inc
> +++ b/recipes/curl/curl-common.inc
> @@ -6,9 +6,10 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar=
.bz2;name=3Dtarball \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pkgconfig_fix.patch"
> =C2=A0S =3D "${WORKDIR}/curl-${PV}"
>
> -INC_PR =3D "r4"
> +INC_PR =3D "r5"
>
> -CURL_FEATURES =3D ${@['zlib,cookies,crypto-auth,dict,file,ftp,http,telne=
t,tftp','zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp']["=
${BPN}" =3D=3D "${PN}"]}
> +CURL_FEATURES ?=3D "zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,t=
elnet,tftp"
> +CURL_FEATURES_virtclass-native =3D "zlib,cookies,crypto-auth,dict,file,f=
tp,http,telnet,tftp"

this change was done for a reason. this will not set correct override
for native recipes and
we dont want gnutls on native recipe but if you look closely the
output then it will enable gnutls
because CURL_FEATURES_virtclass-native is ineffective in this case as
you already have a
weak assignment.

This was the reason why I proposed my fix for having recipe type
OVERRIDE but unfortunately
that patch has different issue which prevents it from being applied.

> =C2=A0# other allowed features: ipv6, ares, openssl
>
> =C2=A0inherit autotools pkgconfig binconfig
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


