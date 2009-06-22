Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MIpMH-00014D-RZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 21:39:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 97F471422AA2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 21:29:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eFqK3shfdJK
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 21:29:38 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 5903E1417196
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 21:29:38 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 21:28:13 +0200
Message-Id: <1245698893.7001.18.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Is RDEPENDS = "foo" supported?
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
X-List-Received-Date: Mon, 22 Jun 2009 19:39:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Is RDEPENDS =3D "foo" allowed in recipes? If yes, then it does not work.

I have been searching for a reason, why my image does not set keymap.
Reason: console-tools were missing. Replacing RDEPENDS by RDEPENDS_${PN}
in the keymaps recipe fixed it.

Does it mean, that this and another 622 recipes use invalid syntax of
RDEPENDS or is it a bug in the toolchain?

Looking at the =EF=BB=BFstaging-pkg runtime data =EF=BB=BFwith just a pla=
in "RDEPENDS =3D"
into work/, mentioned dependencies are missing.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



