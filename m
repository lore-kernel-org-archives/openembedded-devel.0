Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxMxl-00085i-Gy
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:09:46 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxMua-0004NE-Cm from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 09:06:28 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 09:06:28 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 16:05:26 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 09:05:23 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1NxJrs-0006SS-LZ@melo.openembedded.org>
References: <E1NxJrs-0006SS-LZ@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 09:05:23 -0700
Message-ID: <1270137923.6277.101.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 16:06:28.0171 (UTC)
	FILETIME=[494031B0:01CAD1B5]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: post-process non-binary files to fix paths packages
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
X-List-Received-Date: Thu, 01 Apr 2010 16:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 12:51 +0000, git version control wrote:
> Module: openembedded.git
> Branch: rpurdie/work-in-progress
> Commit: 5df536641049c5af6413e410aa20bb97880fe897
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D5df536641049c5af6413e410aa20bb97880fe897
>=20
> Author: Joshua Lock <josh@linux.intel.com>
> Date:   Wed Mar 31 11:22:02 2010 +0100
>=20
> packaged-staging: post-process non-binary files to fix paths packages
>=20
> Add tooling from Poky to scan packages and fix up paths in libtool files,=
 we
> then build on this to further post-process native packages (native, cross=
, sdk)
> and fix up any references to the STAGING_DIR in non-binary files.
>=20
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

There's a lot more than just .la files that get these paths wrong.  If
you use the scan_cmd you set on native/etc for everything you can fix
them all up.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


