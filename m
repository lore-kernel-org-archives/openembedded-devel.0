Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RoJKw-0006qN-Er
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 19:37:18 +0100
Received: by werb12 with SMTP id b12so717115wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 10:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=subject:references:from:content-type:x-mailer:in-reply-to
	:message-id:date:to:content-transfer-encoding:mime-version;
	bh=AzEY5E4tOJJsZ0uu3kxYTxPUxywqEn75MmYhHLPhgeQ=;
	b=UCYQNDOPITH9crJwXzBoeKGil7FS8Y84+7uD642RqMtOpQjJkK/jyDnq/dZ37wKFaZ
	3dNprw6r+4wBoVLfSjb3JiDiHY84rlY3dy222+W+0o9/Fx+mmvH9W4xDYOnr4Sayr5gq
	Tt+9fG6bK1CsII99g3rNX0J3YaJpdUgJ63KGI=
Received: by 10.216.133.29 with SMTP id p29mr13434825wei.49.1327084177637;
	Fri, 20 Jan 2012 10:29:37 -0800 (PST)
Received: from [10.17.35.114] ([62.205.105.163])
	by mx.google.com with ESMTPS id n3sm11607630wiz.9.2012.01.20.10.29.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 10:29:36 -0800 (PST)
References: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
	<1326930779-21885-3-git-send-email-andrea.adami@gmail.com>
	<1609496.uCUOLBb3p1@helios>
From: Andrea Adami <andrea.adami@gmail.com>
X-Mailer: iPhone Mail (9A405)
In-Reply-To: <1609496.uCUOLBb3p1@helios>
Message-Id: <FDF58EF2-8C04-4409-83B8-979469B84BB5@gmail.com>
Date: Fri, 20 Jan 2012 19:29:32 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-handheld] [PATCH 2/3] kexecboot-cfg: Inhibit toolchain dependencies and echo $DISTRO_VERSION
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
X-List-Received-Date: Fri, 20 Jan 2012 18:37:18 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Il giorno 20/gen/2012, alle ore 13:22, Paul Eggleton <paul.eggleton@linux.in=
tel.com> ha scritto:

> On Thursday 19 January 2012 00:52:58 Andrea Adami wrote:
>> * $DISTRO_VERSION is always set and is more detailed
>=20
> I just looked at Poky and Angstrom and neither of these have the distro na=
me=20
> in DISTRO_VERSION, so this patch would lose that; would there be sufficien=
t room=20
> to include both variables?
>=20

Hm...building distro-less I  get 'oe-core-0' or alike  as DISTRO_VERSION.=20=

I fear both could make the label too long.

Regards
Andrea

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


