Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P8Hi9-0000bJ-3N
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:19:02 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9JJIRDt029965
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 14:18:27 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9JJIQR3005515
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 14:18:26 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9JJIQJR001607
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 14:18:26 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 19 Oct 2010 14:18:26 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Oct 2010 14:18:25 -0500
Thread-Topic: [oe] [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to
	OVERRIDES when it's empty
Thread-Index: ActvwVnC+BMSOzscS/C1O+/s9gAqhQAACEPg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
In-Reply-To: <AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to OVERRIDES when it's empty
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
X-List-Received-Date: Tue, 19 Oct 2010 19:19:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Chris Larson
> Sent: Tuesday, October 19, 2010 2:09 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to
> OVERRIDES when it's empty
>=20
> On Tue, Oct 19, 2010 at 12:05 PM, Maupin, Chase <chase.maupin@ti.com>
> wrote:
>=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> Of
> > > Martin Jansa
> > > Sent: Saturday, October 16, 2010 2:25 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: [oe] [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to
> > > OVERRIDES when it's empty
> > >
> > > * empty MACHINE_OVERRIDES adds :: to OVERRIDES (then in FILESPATH
> skips
> > >   every directory after this)
> > > * strip() is needed to remove space in case some distribution has ie
> > >   MACHINE_OVERRIDES ?=3D ""
> > >   and then
> > >   MACHINE_OVERRIDES +=3D ""
> > >   or
> > >   MACHINE_OVERRIDES ?=3D "${MACHINE_CLASS}", where MACHINE_CLASS is
> empty
> > > again
> >
> > I saw this issue in my overlay of having a "::" in my OVERRIDES which
> > caused my parsing to fail in angstrom.inc.  Applying this fix from
> Martin
> > resolves the parsing issue.  My OVERRIDES appear to be in the correct
> order
> > with this change:
>=20
>=20
> Can you explain this?  "caused my parsing to fail" is not very useful
> information.  What exactly failed?

Chris,

Sorry, I thought this was an understood issue.  I have put the error output=
 I got below.  Basically, when I got to line 509 of data.py the variables h=
ad the following values:

vars =3D set(['__functions_', '_', '__functions__'])

var =3D '__functions__'

overrides =3D ['pn-angstrom', 'fail-fast', 'build-linux', 'arm', 'INVALID',=
 'angstrom-2008.1', '', 'am37x-evm', 'local']
=20
o =3D ''

OVERRIDES =3D 'pn-angstrom:fail-fast:build-linux:arm:INVALID:angstrom-2008.=
1::am37x-evm:local'

The current override being evaluated was the '' one.

The line being evaluated in my overlay was USERDISTRO :=3D "${DISTRO}" in m=
y copy of angstrom.inc

The output from my build was:

a0271661@sdit-build01:~/projects/arago-multi-build$ bitbake helloworldTrace=
back (most recent call last):
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/bin/bitbake=
", line 143, in <module>
    main()
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/bin/bitbake=
", line 123, in main
    cooker.parseConfiguration()
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/cook=
er.py", line 68, in parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/cook=
er.py", line 390, in parseConfigurationFile
    self.configuration.data =3D bb.parse.handle( afile, self.configuration.=
data )
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/__init__.py", line 75, in handle
    return h['handle'](fn, data, include)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 167, in handle
    feeder(lineno, s, fn, data)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 215, in feeder
    include(fn, s, data, False)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 114, in include
    ret =3D handle(fn, data, True)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/__init__.py", line 75, in handle
    return h['handle'](fn, data, include)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 167, in handle
    feeder(lineno, s, fn, data)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 221, in feeder
    include(fn, s, data, "include required")
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 114, in include
    ret =3D handle(fn, data, True)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/__init__.py", line 75, in handle
    return h['handle'](fn, data, include)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/BBHandler.py", line 175, in handle
    feeder(lineno, s, fn, base_name, d)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/BBHandler.py", line 381, in feeder
    return ConfHandler.feeder(lineno, s, fn, d)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/pars=
e/parse_py/ConfHandler.py", line 192, in feeder
    bb.data.update_data(e)
  File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/data=
.py", line 509, in update_data
    for var in vars:
RuntimeError: Set changed size during iteration

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


