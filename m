Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nrimq-0002qK-Re
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 03:15:09 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nrijr-0005un-Nu from Tom_Rini@mentor.com ;
	Tue, 16 Mar 2010 19:12:03 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 16 Mar 2010 19:12:03 -0700
Received: from 172.30.80.63 ([172.30.80.63]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Mar 2010 02:05:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	16 Mar 2010 19:05:38 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Organization: Mentor Graphics Corporation
Date: Tue, 16 Mar 2010 19:05:37 -0700
Message-ID: <1268791537.20395.6.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Mar 2010 02:12:03.0199 (UTC)
	FILETIME=[3C0178F0:01CAC577]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 17 Mar 2010 02:15:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-16 at 13:23 +0100, Enrico Scholz wrote:
> Doing a '-c clean' operation on a staged package with very much files
> (e.g. glibc) took several minutes because
>=20
> * every removed file was reported
> * an 'rm' instance was spawned for every file
>=20
> This patch uses the native 'os.unlink()' method for removing files and
> reports only the removed root directory instead of the single files.

We call os.unlink by itself in other places.  If we don't wrap it, could
we get an exception, really (that wouldn't otherwise be a bug to fix) ?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


