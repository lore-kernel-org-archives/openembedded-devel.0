Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QdVQ5-00049D-Ja
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 00:45:41 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LNS005KS1KYOP10@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	03 Jul 2011 16:41:22 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 15A968; Sun, 03 Jul 2011 16:41:17 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Sun,
	03 Jul 2011 16:41:16 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sun, 03 Jul 2011 16:41:16 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1309729276205539500@rkmorris.us>
In-reply-to: <1308515164700783500@rkmorris.us>
References: <1307481663432021500@rkmorris.us> <4DEFBF58.1010903@mentor.com>
	<1308007647883960500@rkmorris.us> <4DF8119C.2000106@mentor.com>
	<1308515164700783500@rkmorris.us>
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
X-List-Received-Date: Sun, 03 Jul 2011 22:45:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Has anyone had any luck with bash lately? I can't get it to build - so even=
 console-image fails.

=20

Thanks!

=20

... Russell

=20



On Sun, 06/19/2011 03:26 PM, Russell Morris <openembedded@rkmorris.us> wro=
te:


>=20


Hi,

>=20
Sorry for the delay - out of town for a few days, just got back to this.

>=20
I did what you mentioned below, modified the recipe for bash_3.2 ... but n=
ow a new error ... :-). Here is what I get,

>=20

NOTE: Running task 3201 of 6177 (ID: 3047, /mnt/OpenEmbedded/openembedded/=
recipes/bash/bash_3.2.bb, do_setscene)
NOTE: package bash-3.2-r13: task do_setscene: Started
NOTE: package bash-3.2-r13: task do_setscene: Succeeded
NOTE: Running task 3202 of 6177 (ID: 3046, /mnt/OpenEmbedded/openembedded/=
recipes/bash/bash_3.2.bb, do_fetch)
NOTE: package bash-3.2-r13: task do_fetch: Started
NOTE: package bash-3.2-r13: task do_fetch: Succeeded
NOTE: Running task 3203 of 6177 (ID: 3039, /mnt/OpenEmbedded/openembedded/=
recipes/bash/bash_3.2.bb, do_unpack)
NOTE: package bash-3.2-r13: task do_unpack: Started
NOTE: package bash-3.2-r13: task do_unpack: Succeeded
NOTE: Running task 3637 of 6177 (ID: 3040, /mnt/OpenEmbedded/openembedded/=
recipes/bash/bash_3.2.bb, do_patch)
NOTE: package bash-3.2-r13: task do_patch: Started
ERROR: Execution of 'git --git-dir=3D. apply -p0 /mnt/OpenEmbedded/sources=
/bash32-001' failed with exit code 1:
error: No changes

>=20
NOTE: package bash-3.2-r13: task patch_do_patch: Failed
ERROR: Function 'patch_do_patch' failed
ERROR: Task 3040 (/mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb,=
 do_patch) failed with exit code '1'
ERROR: '/mnt/OpenEmbedded/openembedded/recipes/bash/bash_3.2.bb' failed

>=20
Thoughts?

>=20
Thanks,
... Russell

>=20
> On Tue, 06/14/2011 08:57 PM, Tom Rini <tom_rini@mentor.com> wrote:
>=20
>=20
On 06/13/2011 04:27 PM, Russell Morris wrote:
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
From ozgungunay@gmail.com Mon Jul 04 08:12:19 2011
Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ozgungunay@gmail.com>) id 1QdcOJ-0007U5-6Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 08:12:19 +0200
Received: by gyd12 with SMTP id 12so1996337gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jul 2011 23:08:30 -0700 (PDT)
DKIM-Signature: v
