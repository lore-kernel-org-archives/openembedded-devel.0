Received: from david.siemens.de ([192.35.17.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1Povv4-0002AU-5e
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 11:44:38 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id p1EAhVfI027451
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 11:43:31 +0100
Received: from DEMCHP99ET2MSX.ww902.siemens.net
	(demchp99et2msx.ww902.siemens.net [139.25.131.241])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p1EAhVPY030224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 11:43:31 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.227]) by
	DEMCHP99ET2MSX.ww902.siemens.net ([139.25.131.241]) with mapi;
	Mon, 14 Feb 2011 11:43:31 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Feb 2011 11:43:30 +0100
Thread-Topic: [oe] libpcre not compiling
Thread-Index: Acu+VVkM/+aBUgC7RzqwU8O5aZlNzQAa20cQA1yCDBA=
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E011A8B5ACA@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
	<AANLkTimzYvPnN7tt54jcQVYUmBQFpQsO0LYFoRVh5Q8x@mail.gmail.com>
	<09D9BE2AC4AA764DABAA8C91E48D819ED682ECBB@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED682ECBB@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: libpcre not compiling
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
X-List-Received-Date: Mon, 14 Feb 2011 10:44:38 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I already reported that libpcre (7.6-r8) does not compile in released versi=
on 2010.12 :

| /bin/grep: /usr/lib/libstdc++.la: No such file or directory
| /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin/sed: can't=
 read /usr/lib/libstdc++.la: No such file or directory
| arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libstdc++.la' is not =
a valid libtool archive

Now I just figured out that neither does gnutls-2.10.2-r10.1 :

| /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin/sed: can't=
 read /usr/lib/libstdc++.la: No such file or directory
| arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libstdc++.la' is not =
a valid libtool archive

This seems to be pretty much the same issue.
Any idea?

With kind regards,
Fabrice Aeschbacher



