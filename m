Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nh96P-0007IF-Tf
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 23:07:41 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nh93q-0002nQ-7p from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 14:04:58 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 15 Feb 2010 14:04:58 -0800
Received: from 172.30.80.33 ([172.30.80.33]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 15 Feb 2010 22:04:37 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	15 Feb 2010 15:04:37 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hlc4jp$cfc$1@ger.gmane.org>
References: <20100214135613.GF5364@jama> <4B79673B.50108@balister.org>
	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
	<20100215171952.GA3233@jama>  <hlc4jp$cfc$1@ger.gmane.org>
Organization: Mentor Graphics Corporation
Date: Mon, 15 Feb 2010 15:04:37 -0700
Message-ID: <1266271477.31865.4.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 15 Feb 2010 22:04:58.0066 (UTC)
	FILETIME=[E98EF320:01CAAE8A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 22:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-02-15 at 19:43 +0100, Koen Kooi wrote:

[snip]
> On a recent intel/amd cpu VMs I can't measure much difference between VM
> and non-vm builds.
> My main buildmachine at work is an ubuntu 8.04LTS vm running under
> windows XP. The only major speedup I can get building in a native
> install would be using 64bit, since the VM is 32 bit, but it does expose
> both CPU cores :)

What are you (and everyone else saying it's fine) running the VM with?
I've got people reporting just unusable build times inside VMs on what
should be reasonable hardware.  That said, I've profiled some builds and
seen that IO is not a bottleneck (stuff like waiting for virtual/libc to
stage and gcc-cross to get populated is).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


