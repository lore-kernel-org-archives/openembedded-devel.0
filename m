Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp24.services.sfr.fr (smtp24.services.sfr.fr [93.17.128.82])
	by mail.openembedded.org (Postfix) with ESMTP id AC03F60111
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 10:44:07 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.196.5])
	by msfrf2411.sfr.fr (SMTP Server) with ESMTP id DDE3F70000A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:44:07 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-196-5.dynamic.hinet.net [111.250.196.5])	(using
	TLSv1 with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2411.sfr.fr (SMTP Server) with ESMTP id 2B2D37000085
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:44:06 +0100 (CET)
X-SFR-UUID: 20160307104407176.2B2D37000085@msfrf2411.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Mon, 07 Mar 2016 11:44:06 +0100
X-PGP-Universal: processed;	by nb-hjo on Mon, 07 Mar 2016 11:44:06 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
References: <001f01d17834$96b03d60$c410b820$@neuf.fr>
In-Reply-To: <001f01d17834$96b03d60$c410b820$@neuf.fr>
Date: Mon, 7 Mar 2016 11:44:02 +0100
Message-ID: <005f01d1785e$45a81f80$d0f85e80$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHHy/2g1zvGoVWgMaMYVpcIR4tVtp9hJGHQ
X-PGP-Encoding-Format: MIME
X-PGP-Encoding-Version: 2.0.2
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5][PATCH] Add armv7ve in the supported MACHINES for qtwebengine
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2016 10:44:08 -0000
X-Groupsio-MsgNum: 60360
Content-Type: multipart/signed;
	boundary=PGP_Universal_994F3F9C_BA3778D7_E9978791_4D366223;
	protocol="application/pgp-signature"; micalg=pgp-sha256

--PGP_Universal_994F3F9C_BA3778D7_E9978791_4D366223
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

ARM CortexA7 is now defined as armv7ve.

 

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr
<mailto:herve.jourdain@neuf.fr> >

---

--- a/recipes-qt/qt5/qtwebengine_git.bb

+++ b/recipes-qt/qt5/qtwebengine_git.bb

@@ -47,6 +47,7 @@ COMPATIBLE_MACHINE_x86 = "(.*)"

COMPATIBLE_MACHINE_x86-64 = "(.*)"

COMPATIBLE_MACHINE_armv6 = "(.*)"

COMPATIBLE_MACHINE_armv7a = "(.*)"

+COMPATIBLE_MACHINE_armv7ve = "(.*)"

 

 inherit qmake5

inherit gettext


--PGP_Universal_994F3F9C_BA3778D7_E9978791_4D366223
Content-Type: application/pgp-signature;
	x-mac-type=70674453;
	name=PGP.sig
Content-Disposition: attachment; filename=PGP.sig

-----BEGIN PGP SIGNATURE-----
Version: Encryption Desktop 10.3.0 (Build 8741)

iQEVAwUBVt1bdslDDy7t0KnsAQjYGAgAmWT8TyxW2lz5+eMiay27Nx58HAGK1Z5l
fxlKE6scLHrh2SL1pkeUVPPzY9U7sCNqvNQu7md/EnvL63uSaOQtCpoEDnmM4ndw
/C5vcN5xXLa6KJOqVpXLoKmzIgGpNBcDVlfwq4RIDpNqcTxPXzY8iGD9tbAgqElH
0T96+6+ljLCZEe5Uw079cHstIG/i4PYsKbvsgWqW23owwHqZqGamuaU4k20p504u
lw2z+KJj/Rb2oQCSE+ZRNv3Jv+Z1hG6MWkTxiPqHj/vxNQtaKcRMR3ZASoYgb+ff
N/HkkH8BcGOuF7wLFuK5IsTHs3r/A0+cFxDPkNt3NeT5u2rXzf82xQ==
=zy0k
-----END PGP SIGNATURE-----

--PGP_Universal_994F3F9C_BA3778D7_E9978791_4D366223--
