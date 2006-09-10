Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GMOe8-0000yU-Ur
	for openembedded-devel@openembedded.org; Sun, 10 Sep 2006 14:42:49 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8ACdVkO031639 for <openembedded-devel@openembedded.org>;
	Sun, 10 Sep 2006 14:39:32 +0200
Message-ID: <45040783.7080103@dominion.kabel.utwente.nl>
Date: Sun, 10 Sep 2006 14:39:31 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	k8ACdVkO031639
Subject: mtn: fatal: St11logic_error: database.cc:845: invariant 'I(cancel_size < pending_writes_size)' violated
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Sep 2006 12:42:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[11:02] koen: mtn: fatal: St11logic_error: database.cc:845: invariant 'I(=
cancel_size <
pending_writes_size)' violated
[11:02] =E2=80=A2 koen wonders
[11:05] njs: what version are you using?
[11:05] koen: monotone 0.29 (base revision: 796bc8596d6c5c68828fbfb6a620a=
09a3af15ded)
[11:06] koen: I'm suddenly getting 131 revs in
[11:06] njs: oh, dude, 0.29 has that bug?
[11:06] koen: and the invariant trips on 35/131
[11:06] njs: huh, I guess it does, just events conspire to make it really=
 hard to hit
[11:06] njs: it's a very stupid bug, that "<" should be "<=3D"
[11:07] njs: but I didn't realize it was possible to trigger it in 0.29 (=
I ran into it
while doing the roster cache stuff, because it changed the data flow patt=
erns so the bug
got hit every time)

So, these are your options:

* downgrade to 0.28
* upgrade to head
* rebuild with 'I(cancel_size <=3D pending_writes_size)' instead of 'I(ca=
ncel_size <
pending_writes_size)'
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFBAeDMkyGM64RGpERAlBfAJ92FLBJyyq8WzuHdo6MqXc1Qxy1QgCfWCsB
VOl2KmZt3Za2meZzJUEeo8A=3D
=3DXFbh
-----END PGP SIGNATURE-----


