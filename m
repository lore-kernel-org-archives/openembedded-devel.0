Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1Pp1um-0001Cn-5j
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:08:44 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p1EH5hwI022500
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 18:05:44 +0100
Received: from DEMCHP99ET2MSX.ww902.siemens.net
	(demchp99et2msx.ww902.siemens.net [139.25.131.241])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p1EH5hsw008478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 18:05:43 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.227]) by
	DEMCHP99ET2MSX.ww902.siemens.net ([139.25.131.241]) with mapi;
	Mon, 14 Feb 2011 18:05:43 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Feb 2011 18:05:42 +0100
Thread-Topic: [oe] libpcre not compiling
Thread-Index: AcvMYi4IHgGemttUQKCExe7k33+AogABwmEA
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E011A8B5C16@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
	<AANLkTimzYvPnN7tt54jcQVYUmBQFpQsO0LYFoRVh5Q8x@mail.gmail.com>
	<09D9BE2AC4AA764DABAA8C91E48D819ED682ECBB@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A8B5ACA@DEMCHP99E35MSX.ww902.siemens.net>
	<4D594F61.4010700@vollmann.ch>
In-Reply-To: <4D594F61.4010700@vollmann.ch>
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
X-List-Received-Date: Mon, 14 Feb 2011 17:08:44 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Solved.

Problem was: issue with packaged-staging

- For some (unknown) reason, something in my pstage dir was corrupt (and su=
rprisingly at the same time, for the 4 MACHINES for which I was building).

- As my pstage dir is outside from build dir, just deleting the latter was =
not enough.

- After deleting the pstage dir and rebuilding all from scratch, the proble=
m disappeared.

- After deleting all but pstage dir, libpcre and gnutls compiled fine too.

With kind regards,
Fabrice Aeschbacher


> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Detlef Vollmann
> Gesendet: Montag, 14. Februar 2011 16:51
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] libpcre not compiling
>=20
> On 02/14/11 11:43, Aeschbacher, Fabrice wrote:
> > I already reported that libpcre (7.6-r8) does not compile=20
> in released version 2010.12 :
> >
> > | /bin/grep: /usr/lib/libstdc++.la: No such file or directory
> > |=20
> /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin
/sed: can't read /usr/lib/libstdc++.la: No such file or directory
> > | arm-angstrom-linux-gnueabi-libtool: link:=20
> `/usr/lib/libstdc++.la' is not a valid libtool archive
> >
> > Now I just figured out that neither does gnutls-2.10.2-r10.1 :
> >
> > |=20
> /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin
/sed: can't read /usr/lib/libstdc++.la: No such file or directory
> > | arm-angstrom-linux-gnueabi-libtool: link:=20
> `/usr/lib/libstdc++.la' is not a valid libtool archive
> >
> > This seems to be pretty much the same issue.
> > Any idea?
> These are not -native packages, correct?
> Then libtool shouldn't look for /usr/lib/libstdc++.la.
> I have the feeling that something in the libtool setup is wrong.
>=20
> Regards,
>    Detlef


