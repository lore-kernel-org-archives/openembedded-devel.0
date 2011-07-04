Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>)
	id 1Qdkh8-0007eY-Cl; Mon, 04 Jul 2011 17:04:18 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LNT00BJJAW3BS80@vms173011.mailsrvcs.net>; Mon,
	04 Jul 2011 09:00:03 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 36659B; Mon, 04 Jul 2011 08:59:56 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Mon,
	04 Jul 2011 08:59:55 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Mon, 04 Jul 2011 08:59:55 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-id: <1309787995311998500@rkmorris.us>
In-reply-to: <1309729276205539500@rkmorris.us>
References: <1307481663432021500@rkmorris.us> <4DEFBF58.1010903@mentor.com>
	<1308007647883960500@rkmorris.us> <4DF8119C.2000106@mentor.com>
	<1308515164700783500@rkmorris.us> <1309729276205539500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Builds Failing
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
X-List-Received-Date: Mon, 04 Jul 2011 15:04:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

FYI - I (locally) deleted the bash 3.2 recipe ...and the build works fine n=
ow! It seems that bash 3.0 is fine, but 3.2 has issues for some reason.

=20

Hopefully this saves someone else the same grief.

=20

... Russell

=20



On Sun, 07/03/2011 04:41 PM, Russell Morris <openembedded@rkmorris.us> wro=
te:


>=20
Has anyone had any luck with bash lately? I can't get it to build - so eve=
n console-image fails.
>=20
>=20
>=20
> Thanks!
>=20
>=20
>=20
> ... Russell
>=20
>=20
>=20
>=20
>=20
> On Sun, 06/19/2011 03:26 PM, Russell Morris <openembedded@rkmorris.us> w=
rote:
>=20
>=20
> >=20
>=20
>=20
> Hi,
>=20
> >=20
> Sorry for the delay - out of town for a few days, just got back to this.
>=20
> >=20
> I did what you mentioned below, modified the recipe for bash_3.2 ... but=
 now a new error ... :-). Here is what I get,
>=20
> >=20
>=20
> NOTE: Running task 3201 of 6177 (ID: 3047, /mnt/OpenEmbedded/openembedde=
d/recipes/bash/bash_3.2.bb, do_setscene)
> NOTE: package bash-3.2-r13: task do_setscene: Started
> NOTE: package bash-3.2-r13: task do_setscene: Succeeded
> NOTE: Running task 3202 of 6177 (ID: 3046, /mnt/OpenEmbedded/openembedde=
d/recipes/bash/bash_3.2.bb, do_fetch)
> NOTE: package bash-3.2-r13: task do_fetch: Started
> NOTE: package bash-3.2-r13: task do_fetch: Succeeded
> NOTE: Running task 3203 of 6177 (ID: 3039, /mnt/OpenEmbedded/openembedde=
d/recipes/bash/bash_3.2.bb, do_unpack)
> NOTE: package bash-3.2-r13: task do_unpack: Started
> NOTE: package bash-3.2-r13: task do_unpack: Succeeded
> NOTE: Running task 3637 of 6177 (ID: 3040, /mnt/OpenEmbedded/openembedde=
d/recipes/bash/bash_3.2.bb, do_patch)
> NOTE: package bash-3.2-r13: task do_patch: Started
> ERROR: Execution of 'git --git-dir=3D. apply -p0 /mnt/OpenEmbedded/sourc=
es/bash32-001' failed with exit code 1:
> error: No changes
>=20
> >=20
> NOTE: package bash-3.2-r13: task patch_do_patch: Failed
> ERROR: Function 'patch_do_patch' failed
> ERROR: Task 3040 (/mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.b=
b, do_patch) failed with exit code '1'
> ERROR: '/mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb' failed
>=20
> >=20
> Thoughts?
>=20
> >=20
> Thanks,
> ... Russell
>=20
> >=20
> > On Tue, 06/14/2011 08:57 PM, Tom Rini <tom_rini@mentor.com> wrote:
> >=20
> >=20
> On 06/13/2011 04:27 PM, Russell Morris wrote:
> > > Hi,
> > > Perhaps a dumb question, but ... do I need to do this? I can give it=
 a try (though I'm not quite sure I understand what needs to be changed). J=
ust trying to figure out how to get this working again.
> > > Thanks!
> >=20
> > Since you have a failing setup, yes, please :)
> >=20
> > To make git be used as the patch tool, add
> > PATCHTOOL =3D "git" to the recipe, increase the PR and add a comment a=
bout
> > why we do this.
> >=20
> > --
> > Tom Rini
> > Mentor Graphics Corporation
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From a.sappia@biotechware.com Mon Jul 04 20:39:55 2011
Received: from slow3-v.mail.gandi.net ([217.70.178.89])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1Qdo3n-0007uS-1n
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 20:39:55 +0200
X-WhiteListed: mail was accepted with no delay
X-WhiteListed: mail was accepted with no delay
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 9A38B86219
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2011 20:20:38 +0200 (CEST)
X-Originating-IP: 217.70.178.137
Received: from mfilter8-d.gandi.net (mfilter8-d.gandi.net [217.70.178.137]=
)
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 5BEAFA806E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2011 20:20:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter8-d.gandi.net
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by mfilter8-d.gandi.net (mfilter8-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id HBOqP+ppEQHl
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2011 20:20:32 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from [192.168.8.53] (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1EE72A8070
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2011 20:20:30 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
Organization: Biotechware srl
Date: Mon, 04 Jul 2011 20:20:29 +0200
Message-ID: <1309803629.20865.8.camel@BTW1>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2
Content-Type: text/plain; charset
