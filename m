Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5Oyi-0004On-Nw
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:00:28 +0200
Received: by fxm19 with SMTP id 19so2477180fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=N45TlVzd26Dfx1yfYGIdLxdvb8x8ylvw1V8bG5RJx7o=;
	b=V42QRRZmAUs4xUlZ0EAQjrwnA4tVjNm7dcDFFmXW6ezH5HylskHaXfMshMuhs8C+FM
	05GarW3ZG2Ctw1y1CiIppXDc3kKZ88xeE7uZ8zAJGPcXqjsMi9vZoy2TAy/qXWAUDuG5
	tkl7Mt1YTJ90wXMPcWKnDWDgJulOEzULRwfro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lOVY0RtN5rnQ+HBK8xUzkNjmW1jiLnSWupFvvy+J6dv2iImWXnUtz19VdO6HzzGGmu
	ZalQHozcudYRNcxaG7ed5hJrXFiH4Nkwg1Y05diyDtd8GZRb9dW1dWsJuTOewhCo10RT
	Afrcif36oQEHOxp7Fs30RRMMZnyu2A6N6Bw4g=
Received: by 10.223.29.4 with SMTP id o4mr1708884fac.27.1301605107080; Thu, 31
	Mar 2011 13:58:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:57:57 -0700 (PDT)
In-Reply-To: <1301494030-10554-2-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-2-git-send-email-v2g.udel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:57:57 -0700
Message-ID: <AANLkTiksOBcfi3U07-a1fMPz0U-ekgEY-q1f91SMYdBF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/6] Allows the use of the angstrom distribution with ARM cores that do not support THUMB_INTERWORK instructions
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
X-List-Received-Date: Thu, 31 Mar 2011 21:00:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2011 at 7:07 AM, UDel V2G Team <v2g.udel@gmail.com> wrote:
> * Setting THUMB_INTERWORK =3D "yes" precludes the building of
> =C2=A0any angstrom distribution for cores that do not support
> =C2=A0thumb and thumb_interwork since the distro definitions
> =C2=A0take precedence over any local settings.
>
> Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>
> ---
> =C2=A0conf/distro/include/angstrom.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angst=
rom.inc
> index 5a02723..9ec1dc7 100644
> --- a/conf/distro/include/angstrom.inc
> +++ b/conf/distro/include/angstrom.inc
> @@ -54,7 +54,7 @@ ARM_INSTRUCTION_SET =3D "${ANGSTROM_ARM_INSTRUCTION_SET=
}"
> =C2=A0# =C2=A0 =C2=A0but requires more instructions (140% for 70% smaller=
 code) so may be
> =C2=A0# =C2=A0 =C2=A0slower.
>
> -THUMB_INTERWORK =3D "yes"
> +THUMB_INTERWORK ?=3D "yes"

This change should not be needed since EABI mandates interworking and
gcc in OE generates a sequence which works on armv4
and it interworking safe on armv4t+

> =C2=A0# "yes" "no"
> =C2=A0# =C2=A0 =C2=A0Whether to compile with code to allow interworking b=
etween the two
> =C2=A0# =C2=A0 =C2=A0instruction sets. =C2=A0This allows thumb code to be=
 executed on a primarily
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


