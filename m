Return-Path: <tim.jaacks@garz-fricke.com>
X-Greylist: delayed 859 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Apr 2017 14:35:49 UTC
Received: from mailout-afa69.mailout.artfiles.de
	(mailout-afa69.mailout.artfiles.de [212.72.176.69])
	by mail.openembedded.org (Postfix) with ESMTP id A0551779F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:35:49 +0000 (UTC)
Received: from [89.27.136.47] (helo=mail.garz-fricke.com)
	auth=mx@garz-fricke.com by mailout.artfiles.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80.1)
	id 1d2erp-0005Dw-Lb for openembedded-devel@lists.openembedded.org;
	Mon, 24 Apr 2017 16:21:29 +0200
Received: from SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188]) by
	SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188%12]) with mapi
	id 14.03.0319.002; Mon, 24 Apr 2017 16:21:26 +0200
From: Tim Jaacks <tim.jaacks@garz-fricke.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] Qt 5.8 examples are not built
Thread-Index: AdK9BboCXHR82hCsR7qalqtqTTLVIg==
Date: Mon, 24 Apr 2017 14:21:25 +0000
Message-ID: <32EA6B79577EEF4C84CB32305D45A05958E22AEA@SRV24.hamburg.garz-fricke.de>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.8.59]
MIME-Version: 1.0
Subject: [meta-qt5] Qt 5.8 examples are not built
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
X-List-Received-Date: Mon, 24 Apr 2017 14:35:50 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I recently updated my meta-qt5 layer to the current head version (https://g=
ithub.com/meta-qt5/meta-qt5/commit/9927aacfc3b341eb36764fbe7d5a929d4f05f327=
) resulting in an upgrade to Qt 5.8. Since this upgrade, the Qt examples ar=
e not built anymore, even though I added them to PACKAGECONFIG of qtbase. I=
s this a known issue?

In Qt 5.7 the examples were built correctly. As far as I understand, the li=
ne that used to make this work in versions before Qt 5.8 is in meta-qt5/rec=
ipes-qt/qt5/qt5.inc:

| EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'examples=
', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"=20

The qmake5_base_do_configure function in meta-qt5/classes/qmake5_base.bbcla=
ss evaluates this variable:

| if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
|     QMAKE_VARSUBST_PRE=3D"${EXTRA_QMAKEVARS_PRE}"=20
|     bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"=20
| fi

This leads to the following note in log.do_configure of qtbase:

| NOTE: qmake prevar substitution: ' QT_BUILD_PARTS+=3Dexamples'

However, this note is missing in Qt 5.8 because the call to qmake5_base_do_=
configure has been removed from the do_configure task of qtbase here:

https://github.com/meta-qt5/meta-qt5/commit/333949a8239dfa7788b35f105961473=
3e11a6a25#diff-1120c73503f9288cc8a8c2b984fe4038L202

There is no comment on why this has been removed. I tried re-adding it, whi=
ch resulted in a duplicate configure run. Obviously this is caused by this =
change in qtbase:

https://code.qt.io/cgit/qt/qtbase.git/commit/mkspecs/features/qt_parts.prf?=
id=3D60e5a1c8effd4099f7b1414107b5cbb67c266210

Does anybody know whether this change was the reason for removing the qmake=
5_base_do_configure call?

However, the removal breaks the mechanism via EXTRA_QMAKEVARS_PRE, because =
this variable is no longer evaluated. As far as I can see, there is no opti=
on of building the Qt examples at the moment. Or am I missing anything? Any=
 clue would be helpful.

=A0
Mit freundlichen Gr=FC=DFen / Best regards
i.A. Tim Jaacks

Software Engineering
Garz & Fricke GmbH
Tempowerkring 2, 21079 Hamburg - Germany
Amtsgericht Hamburg HRB 60514
Gesch=E4ftsf=FChrer: Manfred Garz, Matthias Fricke
Phone: +49 40 791899 - 55
Fax:=A0=A0=A0=A0 +49 40 791899 - 39
tim.jaacks@garz-fricke.com
www.garz-fricke.com



