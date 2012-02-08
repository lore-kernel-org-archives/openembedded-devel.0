Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RvAYi-0002ZW-2C
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 17:39:52 +0100
Received: by werc1 with SMTP id c1so521720wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:31:48 -0800 (PST)
Received: by 10.216.139.132 with SMTP id c4mr1420536wej.12.1328718708687;
	Wed, 08 Feb 2012 08:31:48 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id da8sm917295wib.6.2012.02.08.08.31.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 08:31:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrAap_fWH_YRTn26ujwt-DwfO7enzprODPJk7iH=Z+AfA@mail.gmail.com>
Date: Wed, 8 Feb 2012 17:31:42 +0100
Message-Id: <E9FE936C-E077-4187-ACE4-5BCA6806A89C@dominion.thruhere.net>
References: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKrAap_fWH_YRTn26ujwt-DwfO7enzprODPJk7iH=Z+AfA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmI+1EYzDHFmANwnaDzHEfo0EcP5H8+i+8Vysz1fqWRVacMfh0oDq7cXRoIz8VEFofvMk/W
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Wed, 08 Feb 2012 16:39:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2012, om 17:24 heeft Otavio Salvador het volgende geschreven:

> On Wed, Feb 8, 2012 at 10:50, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> ...=20
> @@ -93,6 +98,11 @@ FILES_${PN} +=3D " ${base_bindir}/* \
>                 ${bindir}/systemd* \
>                 ${libdir}/tmpfiles.d/*.conf \
>                 ${libdir}/systemd \
> +                ${libdir}/binfmt.d \
> +                ${libdir}/modules-load.d \
> +                ${libdir}/sysctl.d \
> +                ${localstatedir} \
> +                ${libexecdir} \
>                "
>=20
> Those changes seems to be unrelated. Can you split it in two patches?

It's not unrelated, FILES_${PN} changed from +=3D to =3D, so we need to =
mop up the stray files.




