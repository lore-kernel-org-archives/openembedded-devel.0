Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvFty-0006JR-Vz
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 22:45:24 +0200
Received: by iwn2 with SMTP id 2so5457279iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=1iILgZ53InHnroCK/7Zg8l/noPrQq+q2HUrJIvu5Y4Q=;
	b=O2VR1GRe6EFSmI8lkA1SgDc+ptpb4dPdHdeZ4JCmwvUAi5Rt3xk1c9aODjM2B6DEIf
	5JZ/ULrANf4jSgcBotDQDUs+WY2Z1Cam8k9ukxkVJMA8/gKrHjcyv1i1OfwV8teyeDEh
	u8ZGdW1vaDRK+oc0n+o6NwbtsdLXVDVbA1AS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hIinf47GoM2tFMygDtaqCeWIMrCz2EENh4vQoOmccjO+rc2ecAYUc/2QY+2vNdP2FH
	udeZeWPockqKXHi3G/uomY0fXgH//b5jIUTXdGNZTBVam9DLdeZIjIY/9AI5jft/FFjG
	T0tWPiXE72bSbsLQolQcKmWx0MOwBkyTZPm1o=
Received: by 10.231.19.3 with SMTP id y3mr6542548iba.156.1284410677166; Mon,
	13 Sep 2010 13:44:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 13 Sep 2010 13:44:17 -0700 (PDT)
In-Reply-To: <1284404613.4133.103.camel@mattotaupa>
References: <1284404613.4133.103.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Sep 2010 13:44:17 -0700
Message-ID: <AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc: Use Pixman 0.18.4.
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
X-List-Received-Date: Mon, 13 Sep 2010 20:45:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2010 at 12:03 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Date: Mon, 13 Sep 2010 20:53:48 +0200
>
> Cairo 1.10.0 was added in 1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d [1] an=
d requires Pixman 0.18.4. This fixes at least the distribution Minimal whic=
h does not set the version of cairo explicitly.
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1d4c6=
50b1d8dac6adee3d3d4208b81bc9b67bd3d
> [2] http://cgit.freedesktop.org/cairo/commit/?id=3D8127f1f5d52bb716dbd70e=
fe096894f2a542f4a9
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../preferred-xorg-versions-X11R7.5-latest.inc =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.i=
nc b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> index 3c9aac0..634265e 100644
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> +++ b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> @@ -108,7 +108,7 @@ PREFERRED_VERSION_libxxf86misc ?=3D "1.0.2"
> =C2=A0PREFERRED_VERSION_liblbxutil ?=3D "1.1.0"
> =C2=A0PREFERRED_VERSION_liboldx ?=3D "1.0.1"
> =C2=A0PREFERRED_VERSION_libxkbui ?=3D "1.0.2"
> -PREFERRED_VERSION_pixman ?=3D "0.16.2"
> +PREFERRED_VERSION_pixman ?=3D "0.18.4"
> =C2=A0#proto
> =C2=A0PREFERRED_VERSION_evieext ?=3D "1.1.0"
> =C2=A0PREFERRED_VERSION_fontcacheproto ?=3D "0.1.3"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
-Khem


