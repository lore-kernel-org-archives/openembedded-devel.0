Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GjeeQ-00010x-2n
	for openembedded-devel@openembedded.org; Mon, 13 Nov 2006 17:27:14 +0100
Received: (qmail 12577 invoked by uid 813007); 13 Nov 2006 16:25:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Nov 2006 16:25:14 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Nov 2006 17:25:11 +0100
User-Agent: KMail/1.9.5
References: <45566FBC.1030206@kernelconcepts.de>
	<45586AF5.8060800@kernelconcepts.de>
	<45589A63.9030808@kernelconcepts.de>
In-Reply-To: <45589A63.9030808@kernelconcepts.de>
MIME-Version: 1.0
Message-Id: <200611131725.11432.openembedded@hrw.one.pl>
Subject: Re: ARM EABI SDK build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2006 16:27:14 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 13 listopada 2006 17:16, Nils Faerber napisa=B3:

> I forgot to report: "file_4.16.bb" =A0and "file-native-4.16.bb" need to be
> updated since the server does not carry 4.16 anmore - only 4.17 and
> 4.18.

I suggest updating metadata:

Revision: fa302963f7d41e6cdf3efbde3458b3731e8ec5ae
Ancestor: 3d7e2cab9dc312dae9852afc664f3bbdb5d4c9e9
Author: xora@openembedded.org
Date: 2006-11-09T10:37:33
Branch: org.openembedded.dev

Added files:
        packages/file/file-native_4.18.bb packages/file/file_4.18.bb
        packages/file/files/dump packages/file/files/filesystems

ChangeLog:

file, file-native 4.18 : replaced the magic files for filesystems and dump
for the ones for 4.16. The stuff that doesnt compile in 4.18 is new so it
looks like a lack of QA on part of this release that they dont work.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 Shortcut, n.:
                 	the longest distance between two points.




