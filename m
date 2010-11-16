Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIV3Y-0003ZI-SX
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:35:21 +0100
Received: by gwaa11 with SMTP id a11so831409gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=C344jM3BPWEAXNxW8viwJ4AwxK2EEsTBVuCWhUEx9bU=;
	b=IB6cSYjhcK7fpiKaluMQ1hTp6Vvx5mf8+UtBG78okvBruQlXcLQPk9Mlg91hSYPlRg
	j7O//J/f2kucuxGRATgWm+PNJP77KEwA9sUWgOAsy6syQJUCqrzhENJy4xJIpGsvco6k
	D1wlzM/zDGNwpHnK3kDXEszBrQzxTNLFv+GeU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UVlYA2rR44u+uNn9O+C0SSrGJ90NCjiIR0o8XsjVXcBzH0Utg9lcx9sTMVFi35dHHL
	kw0D9RPdltN0xHa87QkMmRW12hfvuunkeGh8VQ9nKQx3GN1XiKc8txRqgeifz9GZ/taH
	wbuUyvi+r74W+1JMFb9EjyOibfzL7iGXXckYQ=
Received: by 10.90.99.8 with SMTP id w8mr10489653agb.0.1289950454863; Tue, 16
	Nov 2010 15:34:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:33:54 -0800 (PST)
In-Reply-To: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
References: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:33:54 -0800
Message-ID: <AANLkTimdHUNPec=AKNXJCbwbM9UeJ0yP+d5ZNDMwVmRC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] usbutils 0.70 & 0.73: don't set DEFAULT_PREFERENCE = "1"
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
X-List-Received-Date: Tue, 16 Nov 2010 23:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2010 at 5:37 AM, Michael Smith <msmith@cbnco.com> wrote:
> I think it may be leftover from earlier. =C2=A0Let 0.86 build by default.
> Most distros already prefer it.
>

does it work well with udev 141 ?
some uclibc based distros still use older udev

> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
> =C2=A0recipes/usbutils/usbutils_0.70.bb | =C2=A0 =C2=A01 -
> =C2=A0recipes/usbutils/usbutils_0.73.bb | =C2=A0 =C2=A01 -
> =C2=A02 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/usbutils/usbutils_0.70.bb b/recipes/usbutils/usbutil=
s_0.70.bb
> index 5ce15bd..d5b1933 100644
> --- a/recipes/usbutils/usbutils_0.70.bb
> +++ b/recipes/usbutils/usbutils_0.70.bb
> @@ -3,7 +3,6 @@ SECTION =3D "base"
> =C2=A0DEPENDS +=3D "virtual/libusb0"
> =C2=A0LICENSE =3D "GPLv2"
> =C2=A0PRIORITY =3D "optional"
> -DEFAULT_PREFERENCE =3D "1"
>
> =C2=A0PR =3D "r1"
>
> diff --git a/recipes/usbutils/usbutils_0.73.bb b/recipes/usbutils/usbutil=
s_0.73.bb
> index 271e89f..e90263c 100644
> --- a/recipes/usbutils/usbutils_0.73.bb
> +++ b/recipes/usbutils/usbutils_0.73.bb
> @@ -3,7 +3,6 @@ SECTION =3D "base"
> =C2=A0DEPENDS +=3D "virtual/libusb0"
> =C2=A0LICENSE =3D "GPLv2"
> =C2=A0PRIORITY =3D "optional"
> -DEFAULT_PREFERENCE =3D "1"
>
> =C2=A0PR =3D "r0"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


