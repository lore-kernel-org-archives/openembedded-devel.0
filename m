Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 342 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Aug 2014 12:34:58 UTC
Received: from retry101.mer-nm.internl.net (vif1-retry101.mer-nm.internl.net
	[217.149.192.107])
	by mail.openembedded.org (Postfix) with ESMTP id A0D26609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 12:34:58 +0000 (UTC)
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 294B54039E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:29:19 +0200 (CEST)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id B4F363F55F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:29:16 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:29:16 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:29:15 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 7 Aug 2014 14:29:25 +0200
Message-ID: <53E3711A.7000002@topic.nl>
Date: Thu, 7 Aug 2014 14:29:14 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: bitcoin recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Aug 2014 12:35:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFJust out of curiousity, I tried to build bitcoin for an ARM target=
 using bitbake.

Googling a bit reveils tons of claims of people having compiled it for thei=
r
board (e.g. the raspberry pi), and very likely, some of them were using OE.

Somewhere, someone knows how to do this...

Strangely, i couldn't find a recipe online. So i did a quick try with this =
recipe:

SUMMARY =3D "Bitcoin miner"
LICENSE =3D "MIT"
LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9eef91148a9b14ec7f9df333daebc746=
"
# https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
DEPENDS +=3D "boost db"
SRCREV =3D "5e94d0036a76ea9d63e4ed17b12554caef7f55da"
SRC_URI =3D "git://github.com/bitcoin/bitcoin/"
S =3D "${WORKDIR}/git"
inherit pkgconfig autotools
# Workarounds...
EXTRA_OECONF +=3D "\
	--with-incompatible-bdb \
	--with-boost-libdir=3D${STAGING_LIBDIR} \
	"


This didn't get very far, apparently the bitcoin people aren't very aware o=
f=20
crosscompiling...

It fails to configure with a cryptic message like this:

checking whether the Boost::Thread library is available... yes
checking for exit in -lboost_thread... yes
checking whether the Boost::Chrono library is available... yes
configure: error: Could not find a version of the boost_chrono library!

A similar one about the boost_system library was fixed using the=20
"--with-boost-libdir=3D${STAGING_LIBDIR}" hack, but this one has me baffled=
.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt FPGA experts
http://topic.nl/vacatures/word-jij-onze-nieuwe-fpga-expert/


