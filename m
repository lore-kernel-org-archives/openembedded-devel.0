Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1Pcy2e-0006Yv-1t
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 11:35:00 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	p0CARL9e002599 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 11:27:22 +0100
Received: from DEMCHP99ET2MSX.ww902.siemens.net
	(demchp99et2msx.ww902.siemens.net [139.25.131.241])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p0CARLT8024806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 11:27:21 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.34]) by
	DEMCHP99ET2MSX.ww902.siemens.net ([139.25.131.241]) with mapi;
	Wed, 12 Jan 2011 11:27:21 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jan 2011 11:27:20 +0100
Thread-Topic: [oe] Bitbake task logging
Thread-Index: AcuqTcDQV+ncVIysTJ6XgXF/rC5WjgH9IEFg
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED6681865@DEMCHP99E35MSX.ww902.siemens.net>
References: <1293905677.17519.16909.camel@rex> <1293952586.18787.373.camel@eha>
In-Reply-To: <1293952586.18787.373.camel@eha>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: Bitbake task logging
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
X-List-Received-Date: Wed, 12 Jan 2011 10:35:00 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > e) I'm not 100% on this yet but I'm wondering if we should scrap
> > stdout/stderr output to the UI console in debug mode, just=20
> make it clear
> > where the output went on the console? If you ever have two=20
> tasks running
> > the output is unreadable anyway.
>=20
> Yes, stdout/stderr from two (or more) concurrent tasks are pretty
> unreadable at best.  But it could make sense to have a debug mode which
> does output stdout/stderr to console, while disabling concurrent task
> execution.
>=20
> /Esben

For now, oe_note() outputs in the logfile, which is quite far away from whe=
re bitbake is invoked - moreover, in a directory which gets deleted at ever=
y 'bitbake -c clean'

It would be really nice to make it possible (which is very frequent when de=
bugging a recipe) to just write debug output to the console.=20

Fabrice Aeschbacher=


