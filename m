Received: from fallback2.mail.ru ([94.100.176.87])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nyrl@mail.ru>) id 1PXC1p-0002kX-Jl
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 13:19:06 +0100
Received: from f68.mail.ru (f68.mail.ru [217.69.129.107])
	by fallback2.mail.ru (mPOP.Fallback_MX) with ESMTP id B1F3729DAF37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 15:03:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail; 
	h=Message-Id:Content-Type:Reply-To:Date:Mime-Version:Subject:To:From;
	bh=bZ3FyNXqQkNFT20Im8cY7zjHefVrRMO6lPg/fS+KhkA=; 
	b=pFTDDO9M82kEInvgMEdSSVPsVq2XMMwkeis3lBAcQZJiIGChcIMMovc33wV/aXfhhDZJvg57EW/May1fEM6xSEUiI0QFdJLCr4rNqcVh3SBQNlc+Y9kPUEK25Dc0LTYq;
Received: from mail by f68.mail.ru with local id 1PXBjV-00008M-00
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 14:59:21 +0300
Received: from [79.173.78.16] by win.mail.ru with HTTP;
	Mon, 27 Dec 2010 14:59:21 +0300
From: Denis Dydychkin <nyrl@mail.ru>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0
X-Mailer: mPOP Web-Mail 2.19
X-Originating-IP: [79.173.78.16]
Date: Mon, 27 Dec 2010 14:59:21 +0300
Message-Id: <E1PXBjV-00008M-00.nyrl-mail-ru@f68.mail.ru>
X-Spam: Not detected
X-Mras: Ok
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: qmake_base.bbclass patch to lookup for *.pro within ${S} instead of ${B}
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
X-List-Received-Date: Mon, 27 Dec 2010 12:19:06 -0000
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable


qmake_base.bbclass from release-2010.12 has ability to lookup for QMAKE_P=
ROFILES if none specified by recipe. Unfortunately it does that in ${B} d=
irectory instead of ${S}, thus it does not work if they differ.

Here is suggested patch:


--- a/classes/qmake_base.bbclass
+++ b/classes/qmake_base.bbclass
@@ -61,7 +61,7 @@ qmake_base_do_configure() {
 	oenote "using qmake spec in ${QMAKESPEC}, using profiles '${QMAKE_PROFI=
LES}'"
=20
 	if [ -z "${QMAKE_PROFILES}" ]; then=20
-		PROFILES=3D"`ls *.pro`"
+		PROFILES=3D"`ls ${S}/*.pro`"
 	else
 		PROFILES=3D"${QMAKE_PROFILES}"
 	fi




