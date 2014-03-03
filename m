Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26BB06B5B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 03:40:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s233eRuS015460
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Mar 2014 19:40:28 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.128]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Sun, 2 Mar 2014 19:40:27 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <joe@deserted.net>
Thread-Topic: [oe] [meta-networking][PATCH] strongswan: update verion to 5.1.1
Thread-Index: Ac8yI8lB2aVJdUjhQwmShOJ6uXIf2gAvImEAAOx0uUA=
Date: Mon, 3 Mar 2014 03:40:27 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAA3441571@ALA-MBA.corp.ad.wrs.com>
References: <1B858668EC6A94408DCA5225FDFA85AAA33E98A1@ALA-MBA.corp.ad.wrs.com>
	<20140226024843.GB7489@deserted.net>
In-Reply-To: <20140226024843.GB7489@deserted.net>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.212]
MIME-Version: 1.0
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Mon, 03 Mar 2014 03:40:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:joe@deserted.net]
> Sent: Wednesday, February 26, 2014 10:49 AM
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel@lists.openembedded.org; paul.eggleton@linux.intel.=
com
> Subject: Re: [oe] [meta-networking][PATCH] strongswan: update verion to 5=
.1.1
>=20
> [Re: [oe] [meta-networking][PATCH] strongswan: update verion to 5.1.1] On=
 14.02.25 (Tue 12:19)
> Huang, Jie (Jackie) wrote:
>=20
> >
> >
> > >
> > >
> > > -------- Original Message --------
> > > Subject: 	Re: [oe] [meta-networking][PATCH] strongswan: update verion=
 to 5.1.1
> > > Date: 	Wed, 12 Feb 2014 20:02:22 -0500
> > > From: 	Joe MacDonald <joe@deserted.net>
> > > Reply-To: 	<openembedded-devel@lists.openembedded.org>
> > > To: 	<jackie.huang@windriver.com>
> > > CC: 	Paul Eggleton <paul.eggleton@linux.intel.com>, <openembedded-
> > > devel@lists.openembedded.org>
> > >
> > >
> > > [Re: [oe] [meta-networking][PATCH] strongswan: update verion to
> > > 5.1.1] On 14.01.22 (Wed 12:29) Otavio Salvador wrote:
> > >
> > > > On Tue, Jan 21, 2014 at 12:50 AM, jhuang0 <jackie.huang@windriver.c=
om> wrote:
> > > > >
> > > > >
> > > > > On 1/20/2014 10:56 PM, Paul Eggleton wrote:
> > > > >>
> > > > >> On Friday 17 January 2014 14:40:48 jackie.huang@windriver.com wr=
ote:
> > > > >>>
> > > > >>> * Add rdepends on strongswan-plugins.
> > > > >>
> > > > >>
> > > > >> Is this really correct? Does strongswan not work without the plu=
gins?
> > > > >
> > > > >
> > > > > Yes, without the plugins, the ipsec_starter fails to start:
> > > > >
> > > > > root@qemu0:~# ipsec start
> > > > > Starting strongSwan 5.1.1 IPsec [starter]...
> > > > > root@qemu0:~# tail /var/log/auth.log -n 4
> > > > > 2014-01-21T02:46:57.175940+00:00 qemu0 ipsec_starter[926]:
> > > > > Starting strongSwan 5.1.1 IPsec [starter]...
> > > > > 2014-01-21T02:46:57.653396+00:00 qemu0 ipsec_starter[935]: charon=
 has quit:
> > > > > initialization failed
> > > > > 2014-01-21T02:46:57.656916+00:00 qemu0 ipsec_starter[935]:
> > > > > charon refused to be started
> > > > > 2014-01-21T02:46:57.661374+00:00 qemu0 ipsec_starter[935]: ipsec
> > > > > starter stopped
> > > >
> > > > So why to split it?
> >
> > Sorry for late response since I lost lots of Emails in my broken hard d=
isk.
> >
> > Actually I didn't know why it was split to plugins, the original
> > version 5.0.0 in meta-networking did that, I just kept what it was and =
did some necessary changes in
> the uprev.
>=20
> so, a bit of digging turns up that  it looks like this was done as part o=
f addressing a QA issue.  That's
> when FILES_${PN}-plugins appears to have been introduced.  That almost ce=
rtainly seemed like the
> cleanest approach at the time (in the absence of any other information, i=
t's certainly what I would've
> done) but knowing that strongswan is non-functional without the plugins, =
I think the right thing to do
> is remove the split rather than introduce an RDEPENDs.

I agree, I will remove the split.

Thanks,
Jackie

>=20
> -J.
>=20
> >
> > Thanks,
> > Jackie
> >
> > >
> > > ping
> > >
> > > --
> > > -Joe MacDonald.
> > > :wq
> > >
> > >
> >
>=20
> --
> -Joe MacDonald.
> :wq

