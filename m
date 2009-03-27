Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ln8Ho-0005IR-B8
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 10:23:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2R9LmZX029846
	for <openembedded-devel@openembedded.org>; Fri, 27 Mar 2009 09:21:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29809-01 for <openembedded-devel@openembedded.org>;
	Fri, 27 Mar 2009 09:21:44 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2R9LfGP029840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 27 Mar 2009 09:21:41 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <49CAC438.2020907@dls.net>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
	<49C94647.2040401@gmail.com>
	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org>	<49CA5638.1050000@dls.net>
	<gqdlka$cbd$1@ger.gmane.org>
	<ac9c93b10903251507u4e1edf78u4dbb1b2c7a318789@mail.gmail.com>
	<49CAAFDC.3070004@bolloretelecom.eu>  <49CAC438.2020907@dls.net>
Date: Fri, 27 Mar 2009 09:22:08 +0000
Message-Id: <1238145728.5342.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	n2R9LmZX029846
Subject: Re: Package Maintenance
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
X-List-Received-Date: Fri, 27 Mar 2009 09:23:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wed, 2009-03-25 at 18:54 -0500, Mike (mwester) wrote:
> Jeremy Lain=C3=A9 wrote:
> >>> Empty TMPDIR is only once case we should test for, I've seen many t=
imes that
> >>> a 'populated' TMPDIR creates bugs, e.g. midori picking up libhildon=
 to
> >>> mention a recent one. So 'always build from empty TMPDIR' will leav=
e serious
> >>> and harder to trackdown bugs unnoticed.
> >> Test with unpopulataed TMPDIR and test with maximal populated TMPDIR=
 ?
> >=20
> > Speaking of populated TMPDIR, is there a notion of conflicts for stag=
ing? If two packages
> > want to put the same file into staging, will we barf an error or sile=
ntly ignore it?
>=20
> It silently ignores it.
>=20
> As a current example, unless distros have taken special care with libus=
b
> and libusb1, they will suffer from exactly this problem, with the
> library that is staged determined by which recipe is built most recentl=
y.

One of the goals of packaged-staging was to detect this and error. Sadly
nobody has implemented it yet though...

Cheers,

Richard



