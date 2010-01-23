Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYpZO-0003AA-Ay for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 00:39:13 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYpXB-0005jL-N2 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 23:36:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 00:36:52 +0100
Message-ID: <1264289812.3738.265.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Perfect(?) workflow for patches.
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
X-List-Received-Date: Sat, 23 Jan 2010 23:39:13 -0000
X-Groupsio-MsgNum: 16130
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zzojwY/m/7HB+93V/7xB"

--=-zzojwY/m/7HB+93V/7xB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE users,


I hope this is the my last message to this list for tonight.

In the last few days good discussion was going on this list about
patches, their review and committing them. That it will not be
forgotten, I try to outline the workflow and after discussion I would
like to put it into the Wiki. Any suggestion for the name for this page?
=C2=BBPatch workflow=C2=AB?

Git hooks [4] were not mentioned in the discussion on the list. I added
them anyways. ;-) It is important to note that every clone has its own
hooks. The hooks can be put under revision control but they have to be
manually included in the Git setup.

So here we go.

1. A makes a change to OE and wants to get it included.
  a) A should use Git.
  b) Adhere to commit policy [1], styleguide [2] (tool (`oe-stylize.py`)
available [3]), rebase against remote branch.
  c) Send the patch to the mailing list. Preferred way is `git
send-email`. Sending it as an attachment. Additionally Git tree can be
publishing on the net.

> b) could be automated using Git hooks checking for Signed-off-by-line
> (although that can be added later in `git format-patch`), running
> `oe-stylize.py`) and check for example for spelling mistakes [5].

2. Thinks done by OE infrastructure.
  a) Message sent to the list.
  b) Patchwork is picking the patch up.
  c) If this patch is an iteration (see 5 a)), Patchwork should detect
this and mark the old patch as =C2=BBSuperseded=C2=AB.

> I do not know if this is possible. I will ask the Patchwork hackers
> about it. If not this could be done using a Git hook at least when the
> final patch is pushed by someone with commit rights (see 4).

  d) If b) is possible it could be tried to commit the patch
automatically to a staging branch.
    + If the patch applies could be automatically tested.
      Failure: Automatically (`pwclient` [6]) change the state in
Patchwork to =C2=BBDoes not apply=C2=AB and sent message to list (including
author).
    - Security implications. Evil people could for example sent a patch
too big. ikiwiki offers something similar [7].

3. Review
  a) Reviewing without applying. Answering directly to the list and
change the state in Patchwork.

> A way is missing to easily retrieve the Patchwork ID.

  b) Reviewer get the patch either using saving the message sent with
`git send-email`, save the attachment, retrieve it from Patchwork
(`pwclient`, `pw-am.sh` [8]) and (if not happened already) apply it
using `git am file`. A pre-applypatch hook checks again for the things
in 1. b) and a post-applypatch hook sets the patchwork state to =C2=BBUnder
Review=C2=AB. After review a reply is sent back to the list and the Patchwo=
rk
state changed appropriately. A =C2=BBReviewed-by=C2=AB or =C2=BBAcked-by=C2=
=AB line can be
added. (Or just =C2=BBSigned-off-by=C2=AB?)

> I have not found out yet, if the hooks can be made dependent on a
> branch, so that applying the patch to a branch (i. e. accepted) can
> trigger a certain hook. If not it should be scriptable to set the
> appropriate state (=C2=BBAccepted=C2=AB, =C2=BBRejected=C2=AB) [9].

     If the reviewer has a question to the patch should the Patchwork
state be changed to =C2=BBDeferred=C2=AB?

4. Commit (if not go to 5.)
  a) If the reviewer has commit access and accepts the patch, s/he can
push it. A hook then changes the Patchwork state to =C2=BBApplied=C2=AB wit=
h the
appropriate commit id and archived(?).

     Furthermore should a message be send to the list that the patch has
been committed?

5. Reject.
  a) The original author (or someone) else incorporates the comments and
publishes a new patch with its iteration in the subject `[PATCH v4]`
(`git format-patch --subject-prefix=3D`PATCH v4`) and maybe a short
description of the changes of the iteration in the commit message.
  b) Go to 1..


Sorry for this long message. Maybe a schematic diagram should be made
out of this. I hope figuring this out will improve OE=E2=80=99s code qualit=
y a
bit and be a good reference to point new developers to.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Styleguide
[3] http://wiki.openembedded.net/index.php/Styleguide#Style_Checking_tools
[4] http://benjamin-meyer.blogspot.com/2008/10/git-hooks.html
[5] http://github.com/Arora/arora/tree/master/git_hooks/
[6] http://patchwork.openembedded.org/help/pwclient/
[7] http://ikiwiki.info/tips/untrusted_git_push/
[8] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/patchwo=
rk/pw-am.sh
[9] http://lists.ozlabs.org/pipermail/patchwork/attachments/20091006/13e234=
0a/attachment.asc

--=-zzojwY/m/7HB+93V/7xB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbiBQACgkQPX1aK2wOHVjmtACaA6PgrhWbi1Y8YlFzBFbTvvcC
gRIAnRCREliY1OAGy4fGa9HFWZ3aSn5P
=O8SJ
-----END PGP SIGNATURE-----

--=-zzojwY/m/7HB+93V/7xB--
