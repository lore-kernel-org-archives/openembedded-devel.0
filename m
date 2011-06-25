Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QaShV-0000P9-It
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 15:15:05 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id C294B799015; Sat, 25 Jun 2011 15:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-183-236.pools.arcor-ip.net
	[88.71.183.236]) by gravedo.de (Postfix) with ESMTPSA id F3D55798DEA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jun 2011 15:11:28 +0200 (CEST)
Message-ID: <4E05DE80.4070507@gravedo.de>
Date: Sat, 25 Jun 2011 15:11:28 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110603 Thunderbird/5.0b1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309004845.4286.11.camel@mattotaupa>
In-Reply-To: <1309004845.4286.11.camel@mattotaupa>
Subject: =?UTF-8?B?UmU6IGF1cm9yYTogdGFzayBjb25maWd1cmUgZmFpbHMgd2l0aCAnY29uZmlndXJlOiBlcnJvcjogUGFja2FnZSByZXF1aXJlbWVudHMgKFF0Q29yZUUgPj0gNC43LjAg4oCmJw==?=
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
X-List-Received-Date: Sat, 25 Jun 2011 13:15:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.06.2011 14:27, Paul Menzel wrote:
> using `minimal` for `MACHINE =3D "beagleboard"` and doing `bitbake -k
> aurora-fb-image` task configure of `aurora` fails with the following
> error message.
>
>          [=85]
>          checking for FSOFRAMEWORK... yes
>            Qt base directory explicitly set to qtopia
>          checking for QT... no
>          configure: error: Package requirements (QtCoreE>=3D 4.7.0
>                  QtGuiE>=3D 4.7.0
>                  QtDeclarativeE>=3D 4.7.0) were not met:
>
>          No package 'QtCoreE' found
>          No package 'QtGuiE' found
>          No package 'QtDeclarativeE' found
>          [=85]
>
> `qt4-embedded-4.7.3-r33.1` is build as a dependency and I do not know
> what Qt packages contain the needed dependencies.

You are sure qt4-embedded is already successfully build and installed in=20
sysroots? As qt4-embedded is only pulled in with the runtime dependency=20
on pyside-embedded but with the latest version of aurora you need=20
qt4-embedded as build dependency. This needs to be fixed.

In the aurora/development branch [1] it is already fixed. This branch=20
includes a lot of work on the aurora distribution itself but I don't=20
have the time to bring it all upstream. After the 0.1 version of aurora=20
I want to switch to a meta-aurora and let the classic oe branch die. So=20
it's the question if we want to have all this in OE-classic.

regards,
Simon

[1]:=20
http://git.freesmartphone.org/?p=3Dopenembedded.git;a=3Dshortlog;h=3Drefs=
/heads/aurora/development




