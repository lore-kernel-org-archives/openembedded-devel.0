Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ny6SO-0005jT-Ir
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 18:44:25 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ny6PA-0003If-2q from Tom_Rini@mentor.com ;
	Sat, 03 Apr 2010 09:41:04 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 3 Apr 2010 09:41:03 -0700
Received: from 172.30.80.165 ([172.30.80.165]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sat,  3 Apr 2010 16:40:59 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	03 Apr 2010 09:40:58 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4BB75E89.6030708@mlbassoc.com>
References: <4BB35552.9070508@mlbassoc.com>
	<v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>
	<4BB382AA.3040901@mlbassoc.com> <1270056997.6277.89.camel@trini-m4400>
	<4BB75E89.6030708@mlbassoc.com>
Organization: Mentor Graphics Corporation
Date: Sat, 03 Apr 2010 09:40:58 -0700
Message-ID: <1270312858.3653.44.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 Apr 2010 16:41:03.0661 (UTC)
	FILETIME=[732A55D0:01CAD34C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Sat, 03 Apr 2010 16:44:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-04-03 at 09:28 -0600, Gary Thomas wrote:

> That said, this seems to be a [Make] parallelism problem, not clear why/h=
ow.
> If I just rerun 'bitbake firefox' which restarts the compile step, it wil=
l
> run to completion.  I do normally use -j4, but disabling this did not see=
m
> to make any difference.
>=20
> Note: the previous version I built (3.5.2) did not exhibit this behaviour=
.

Well that's depressing since we just added the best we can tell correct
magic to build firefox with make -jN.  If you put PARALLEL_MAKE =3D "" in
the .bb, does it complete this time?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


