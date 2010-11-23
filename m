Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKwKh-00075V-27
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 18:07:07 +0100
Received: by gwaa11 with SMTP id a11so5244945gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9sz4QY3gXVhu3xt1reUKpBcNwLhOMBuBZU18FYmfdnE=;
	b=aEUR3s5vB3diClUZEgvcwWON12W0tnb/FhyAwfDfi/J1cV1IbYMz+F7bwJ5AL25k66
	6JVRajAOlCzrR3+UcTMZo5QVawrQS9+hf+7wdM11og5sTaA3PDNvr1oi6PUtN01QSK+Y
	5Ms1iL3v5R85hJUgiyDsNMM6zcuQHSaUdFYgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=chZ32fZNYQjvim62QhR8cdpPtQwrj+TL/pdtUvG3n94aCgBidAgebiM/wPfNATYfrq
	Qq3j0i78TGuf2rAK87nxCEDbMe6Kqv/5VT8x4tPiBOyPmz/emPrs0b2Vt+A/p0xXv1VC
	4tIXKTvuj/P/G/NhwqZo7wHUgNSr1qE0eEaYU=
Received: by 10.91.51.19 with SMTP id d19mr8932506agk.183.1290531952756; Tue,
	23 Nov 2010 09:05:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 09:05:32 -0800 (PST)
In-Reply-To: <1290531620-8708-1-git-send-email-eric@eukrea.com>
References: <AANLkTinok7air3DLq16+i0gnScJesq8qe3X0bi9O41iM@mail.gmail.com>
	<1290531620-8708-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 09:05:32 -0800
Message-ID: <AANLkTikVkUE5znWvOvM-hJJhOCyH0Gh4KceeHKGN5eMn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] micro: update prefered binutils
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
X-List-Received-Date: Tue, 23 Nov 2010 17:07:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 9:00 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> * without this builds for arm fail with :
> http://tinderbox.openembedded.net/public/logs/task/10927261.txt
> * with this, the build works fine
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0conf/distro/micro.conf | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 19b5e62..b3f099a 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -61,7 +61,7 @@ MACHINE_KERNEL_VERSION =3D "2.6"
> =C2=A0# TOOLCHAIN
> =C2=A0###################################################################=
##########
> =C2=A0LIBC ?=3D "eglibc"
> -PREFERRED_BINUTILS =3D "2.19.51"
> +PREFERRED_BINUTILS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D "2.20.1"
> =C2=A0PREFERRED_VERSION_glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=
=3D "2.10.1"
> =C2=A0PREFERRED_VERSION_glibc-initial =C2=A0 =C2=A0 ?=3D "2.10.1"
> =C2=A0PREFERRED_ARM_INSTRUCTION_SET ?=3D "thumb"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


