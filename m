Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QYPZy-000548-I8
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 23:30:50 +0200
Received: from server ([unknown] [71.164.183.134]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LN200J8E0RQK560@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	19 Jun 2011 15:26:14 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 3BED99; Sun, 19 Jun 2011 15:26:08 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Sun,
	19 Jun 2011 15:26:04 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sun, 19 Jun 2011 15:26:04 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.openembedded.org
Message-id: <1308515164700783500@rkmorris.us>
In-reply-to: <4DF8119C.2000106@mentor.com>
References: <1307481663432021500@rkmorris.us> <4DEFBF58.1010903@mentor.com>
	<1308007647883960500@rkmorris.us> <4DF8119C.2000106@mentor.com>
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
X-List-Received-Date: Sun, 19 Jun 2011 21:30:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
Sorry for the delay - out of town for a few days, just got back to this.
I did what you mentioned below, modified the recipe for bash_3.2 ... but n=
ow a new error ... :-). Here is what I get,
NOTE: Running task 3201 of 6177 (ID: 3047, /mnt/OpenEmbedded/openembedded/=
recipes/bash/bash_3.2.bb, do_setscene)NOTE: package bash-3.2-r13: task do_s=
etscene: StartedNOTE: package bash-3.2-r13: task do_setscene: SucceededNOTE=
: Running task 3202 of 6177 (ID: 3046, /mnt/OpenEmbedded/openembedded/recip=
es/bash/bash_3.2.bb, do_fetch)NOTE: package bash-3.2-r13: task do_fetch: St=
artedNOTE: package bash-3.2-r13: task do_fetch: SucceededNOTE: Running task=
 3203 of 6177 (ID: 3039, /mnt/OpenEmbedded/openembedded/recipes/bash/bash_3=
.2.bb, do_unpack)NOTE: package bash-3.2-r13: task do_unpack: StartedNOTE: p=
ackage bash-3.2-r13: task do_unpack: SucceededNOTE: Running task 3637 of 61=
77 (ID: 3040, /mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb, do_p=
atch)NOTE: package bash-3.2-r13: task do_patch: StartedERROR: Execution of =
'git --git-dir=3D. apply -p0 /mnt/OpenEmbedded/sources/bash32-001' failed w=
ith exit code 1:error: No changes
NOTE: package bash-3.2-r13: task patch_do_patch: FailedERROR: Function 'pa=
tch_do_patch' failedERROR: Task 3040 (/mnt/OpenEmbedded/openembedded/recipe=
s/bash/bash_3.2.bb, do_patch) failed with exit code '1'ERROR: '/mnt/OpenEmb=
edded/openembedded/recipes/bash/bash_3.2.bb' failed
Thoughts?
Thanks,... Russell

On Tue, 06/14/2011 08:57 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 06/13/2011 04:27 PM, Russell Morris wrote:
> > Hi,
> > Perhaps a dumb question, but ... do I need to do this? I can give it a=
 try (though I'm not quite sure I understand what needs to be changed). Jus=
t trying to figure out how to get this working again.
> > Thanks!
>=20
> Since you have a failing setup, yes, please :)
>=20
> To make git be used as the patch tool, add
> PATCHTOOL =3D "git" to the recipe, increase the PR and add a comment abo=
ut
> why we do this.
>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From paulepanter@users.sourceforge.net Mon Jun 20 13:23:29 2011
Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QYcZl-0007q6-Kp for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jun 2011 13:23:29 +0200
Received: from f053036010.adsl.alicedsl.de ([78.53.36.10]
	helo
