Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oms2U-0004s0-2m
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 19:39:30 +0200
Received: by iwn2 with SMTP id 2so1523060iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=U1qD/CVruyGtx1W9g510psPwLBlVoaBKn9yMp5IzlBI=;
	b=eJmkK7AwjpiIMxyRhvoloN8ZNFwWeVhHEU3UqTqzfHhExAGs33EwTgkudrAYkwzIlN
	Vkzgo+51O5gm1yHKk7/AAYt/QkTKzf5HVcgN4BQ0AMar46zz9Jx1xQADnxcosuQuxHgg
	vuy46qwBvpi2DMiCpx3M9q53LRi2Z1AR8Kj8U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=U6DOsgQbIZmBl484QuT2kve5JzvzmnfWB41vAm/JssHmxH8nJAOTeczbg0iFgg2rCv
	4KmjTE/mMlxbI8CgmAU6eJ7XsMFmHP9D0VkQIXKE3PrdczBeDgttibWwL2RKzemegTwM
	qaziDuetT9ZcSzRH3H5Jbb/GdsqkvMvhUJGoQ=
Received: by 10.231.12.136 with SMTP id x8mr3673295ibx.54.1282412348263; Sat,
	21 Aug 2010 10:39:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Sat, 21 Aug 2010 10:38:48 -0700 (PDT)
In-Reply-To: <1282406626-13837-1-git-send-email-khimov@altell.ru>
References: <1282406626-13837-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Aug 2010 10:38:48 -0700
Message-ID: <AANLkTimSd5v_KD7cz92JHTxp-sELd4ri9OLdpkNU4zO_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clamav: allow clamav-data installation
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
X-List-Received-Date: Sat, 21 Aug 2010 17:39:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2010 at 9:03 AM, Roman I Khimov <khimov@altell.ru> wrote:
> It wasn't possible to install prepackaged clamav-data with the way it's
> been packaged. And there are situations where you want to have at least
> prepackaged AV databases before you could do any sort of update. Also,
> logically freshclam doesn't substitute clamav-data, but rather complement=
s
> it.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Will there be any conflicts with prepackaged clamav-data
otherwise you have the ack.
> ---
> =A0recipes/clamav/clamav.inc | =A0 =A03 +--
> =A01 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/clamav/clamav.inc b/recipes/clamav/clamav.inc
> index ade8491..2cd9fa8 100644
> --- a/recipes/clamav/clamav.inc
> +++ b/recipes/clamav/clamav.inc
> @@ -16,9 +16,8 @@ RDEPENDS_${PN}-daemon =3D "${PN}-data ${PN}-conf"
> =A0RDEPENDS_${PN}-freshclam =3D "${PN}-conf"
> =A0RRECOMMENDS_${PN} =3D "${PN}-freshclam"
> =A0RRECOMMENDS_${PN}-daemon =3D "${PN}-freshclam"
> -RPROVIDES_${PN}-freshclam =3D "${PN}-data"
>
> -INC_PR =3D "r5"
> +INC_PR =3D "r6"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/clamav/clamav-${PV}.tar.gz;name=3Dc=
lamav-${PV} \
> =A0 =A0 =A0 =A0 =A0 file://clamav-daemon.init \
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


