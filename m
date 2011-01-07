Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PbJh8-0001qB-Dh
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 22:17:58 +0100
Received: by wyb40 with SMTP id 40so18300964wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 13:17:28 -0800 (PST)
Received: by 10.227.132.143 with SMTP id b15mr20726wbt.9.1294435048523;
	Fri, 07 Jan 2011 13:17:28 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	j49sm11465998wer.14.2011.01.07.13.17.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 Jan 2011 13:17:26 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1294433696-2824-1-git-send-email-vjaquez@igalia.com>
Date: Fri, 7 Jan 2011 22:17:23 +0100
Message-Id: <7C157FC8-1FA9-47C4-B6AC-119A6DC7A3F7@dominion.thruhere.net>
References: <1294433696-2824-1-git-send-email-vjaquez@igalia.com>
To: =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez_Leal?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] scons: add EXTRA_OESCONS
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
X-List-Received-Date: Fri, 07 Jan 2011 21:17:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 7 jan 2011, om 21:54 heeft V=EDctor Manuel J=E1quez Leal het volgende =
geschreven:

> It's similar to EXTRA_OEMAKE, which appends arguments to the scons
> command
>=20
> Signed-off-by: V=EDctor Manuel J=E1quez Leal <vjaquez@igalia.com>
> ---
> classes/scons.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/scons.bbclass b/classes/scons.bbclass
> index 2a935e4..13243a0 100644
> --- a/classes/scons.bbclass
> +++ b/classes/scons.bbclass
> @@ -11,7 +11,7 @@ scons_do_compile() {
>         fi
>     fi
>=20
> -    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX=3D"${CXX}" =
PREFIX=3D${prefix} prefix=3D${prefix} || \
> +    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX=3D"${CXX}" =
PREFIX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} || \
>     oefatal "scons build execution failed."
>=20

It would be best to do

EXTRA_OESCONS ?=3D ""

right above that to avoid weird expansion problems.

regards,

Koen



