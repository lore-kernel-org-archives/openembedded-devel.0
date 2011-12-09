Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6j5-0008Sx-Rn
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 21:07:23 +0100
Received: by lahd3 with SMTP id d3so1255545lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=eLq6u1CXnorAbWa1pP8YVTHqAGSoI6hZAjznhG+vU2c=;
	b=rtEtCtPbjsWMnFxIxKeUIVKX+WiKHXEPodw9YdVNcnFZ7s6Jt4eqNwrixm47oypXy6
	+3xJA2Ts9WuOj+SRwiilNjB8W7L9C0ERJjPR+gDuHNCmtjx887hWtkPnNkOPV0ytUCj6
	rBXRWnItraxkGHqJ2tAMqTwmBJUON4ayqUowU=
Received: by 10.152.104.206 with SMTP id gg14mr5810230lab.41.1323460829354;
	Fri, 09 Dec 2011 12:00:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:59:58 -0800 (PST)
In-Reply-To: <1323450027-31964-1-git-send-email-sledz@dresearch-fe.de>
References: <1323450027-31964-1-git-send-email-sledz@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:59:58 -0800
Message-ID: <CAMKF1sqkmOx6wPHA9vZNPp_XMhZN+s8fLy74wDcCLt4OvUVGtQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Steffen Sledz <sledz@dresearch.de>
Subject: Re: [PATCH] icedtea6-native: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Fri, 09 Dec 2011 20:07:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 9:00 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote=
:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> +
> + =C2=A0 =C2=A0 =C2=A0 for F in openjdk/hotspot/make/linux/Makefile openj=
dk-ecj/hotspot/make/linux/Makefile ;
> + =C2=A0 =C2=A0 =C2=A0 do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e"s|SUPPORTED_OS_VERSION =3D 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSI=
ON =3D 2.4% 2.5% 2.6% 3%|" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $F
> + =C2=A0 =C2=A0 =C2=A0 done
> =C2=A0}

why drop the 'dot' may be using 3. is better ?


