Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PcIk3-0001tP-Pi
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 15:29:03 +0100
Received: by wwi18 with SMTP id 18so1696177wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 06:28:33 -0800 (PST)
Received: by 10.227.167.8 with SMTP id o8mr2793338wby.166.1294669713538;
	Mon, 10 Jan 2011 06:28:33 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id f35sm20104356wbf.14.2011.01.10.06.28.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Jan 2011 06:28:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1294668735-25620-1-git-send-email-vjaquez@igalia.com>
Date: Mon, 10 Jan 2011 15:28:29 +0100
Message-Id: <2C4CA055-732C-4192-8E13-C85372B9950E@dominion.thruhere.net>
References: <1294668735-25620-1-git-send-email-vjaquez@igalia.com>
To: =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez_Leal?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] scons: add EXTRA_OESCONS
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
X-List-Received-Date: Mon, 10 Jan 2011 14:29:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 10 jan 2011, om 15:12 heeft V=EDctor Manuel J=E1quez Leal het =
volgende geschreven:

> It's similar to EXTRA_OEMAKE, which appends arguments to the scons
> command
>=20
> v2:
> * initialise the EXTRA_OECONS if it is not defined
>=20
> Signed-off-by: V=EDctor Manuel J=E1quez Leal <vjaquez@igalia.com>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
> classes/scons.bbclass |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/scons.bbclass b/classes/scons.bbclass
> index 2a935e4..c19f8d4 100644
> --- a/classes/scons.bbclass
> +++ b/classes/scons.bbclass
> @@ -1,5 +1,7 @@
> DEPENDS +=3D "python-scons-native"
>=20
> +EXTRA_OESCONS ?=3D ""
> +
> export TARGET_LINK_HASH_STYLE
>=20
> scons_do_compile() {
> @@ -11,7 +13,7 @@ scons_do_compile() {
>         fi
>     fi
>=20
> -    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX=3D"${CXX}" =
PREFIX=3D${prefix} prefix=3D${prefix} || \
> +    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX=3D"${CXX}" =
PREFIX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} || \
>     oefatal "scons build execution failed."
> }
>=20
> --=20
> 1.7.2.3
>=20



