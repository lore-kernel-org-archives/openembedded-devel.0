Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1RHD8u-0004cQ-6L for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 13:20:04 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p9LBE9dQ015550
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 13:14:10 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 21 Oct 2011 13:14:06 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 21 Oct 2011 13:14:06 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5225@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Clean of qt4-embedded don't cleanup sysroot and deploy
Thread-Index: AcyP4ovn6EzPVhcDTmCKRTj3ZlV1+g==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 21 Oct 2011 11:14:06.0204 (UTC)
	FILETIME=[8C0E73C0:01CC8FE2]
Subject: Clean of qt4-embedded don't cleanup sysroot and deploy
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
X-List-Received-Date: Fri, 21 Oct 2011 11:20:04 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

if I do a bitbake -c clean for qt4-embedded or qt4-native all libraries
and binaries of QT are left in the sysroots and all created packages are
left in deploy. This is an result of splitting qt into several sub
packages and install them.

This behavior makes problems if I change the used QT Version of the
distro.
If qt recipe builds, it first searches for the libraries in sysroot
(standard library path of OE) and then it search in its working
directory. While the sysroots contain libraries of a different QT
version now, the build will fail.=20

Is there a way to clean all sub packages of qt if I clean the
qt4-embedded or qt4-native package ?

An other solution may be to switch the order of the library paths in the
linker command (-L) to search libraries in the package working path
first. But how to do this in a proper way?

Regards
Wolfgang Hauser


