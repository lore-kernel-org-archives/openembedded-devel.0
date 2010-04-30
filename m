Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O7tWu-0005aU-TQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 18:57:34 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O7tTI-000549-W1 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 09:53:49 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 30 Apr 2010 09:53:48 -0700
Received: from 172.30.80.20 ([172.30.80.20]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 30 Apr 2010 16:53:17 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	30 Apr 2010 09:53:06 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
References: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Fri, 30 Apr 2010 09:53:06 -0700
Message-ID: <1272646386.21120.84.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 30 Apr 2010 16:53:48.0556 (UTC)
	FILETIME=[B43B4CC0:01CAE885]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Usage of meta recipe external-toolchain-csl
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
X-List-Received-Date: Fri, 30 Apr 2010 16:57:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-04-30 at 15:34 +0200, Jerry Jacobs wrote:
> Dear all,
>=20
> I'm very new to openembedded and already have a clear view how it is
> structured. My embedded board mini2440 is already in git and want to crea=
te
> my own distro.
> The problem where I bump against is how to use the Codesourcery external
> toolchain for my target. I know there is the file in recipes/meta/
> external-toolchain-csl.bb
> but it not clear how to use it.

There's 2 ways.  One way is, in local.conf:
### CSL public ARM does <arch>-none-<os>, so fill in the -none
TARGET_VENDOR =3D "-none"
### Bring in external-toolchain-csl.bb
TOOLCHAIN_BRAND =3D "csl"
### Where the CSL version is installed.
TOOLCHAIN_PATH =3D "/full/path/to/arm-2009q3"
### Where inside the CSL install the target libraries exist.
TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
### Add tools to the PATH automatically.
PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
require conf/distro/include/toolchain-external.inc

The other way has a few less variables in local.conf but assumes PATH is
already updated.  Denys will reply shortly with that, I imagine.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


