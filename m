Return-Path: <prvs=697689aa8d=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 590DA607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 17:57:18 +0000 (UTC)
X-AuditID: 0a000213-f79116d0000013a5-78-576439fd5016
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	7B.83.05029.DF934675; Fri, 17 Jun 2016 12:57:17 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0235.001;
	Fri, 17 Jun 2016 12:57:17 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser] Browser blacklists
Thread-Index: AQHRx54BDcuXWgr4ykSYbf2mE2cP+p/sIeWAgABJsQCAAct1gIAAEOgA
Date: Fri, 17 Jun 2016 17:57:16 +0000
Message-ID: <2677503.mWG80oeSdS@localhost.localdomain>
References: <57625081.8000304@mlbassoc.com>
	<3500964.FV5XFluSRj@localhost.localdomain>
	<CADseiPnqtEB_m4jgoZtTJ-8AjM29X0nOiGa51phUpZg4_VN_Ww@mail.gmail.com>
In-Reply-To: <CADseiPnqtEB_m4jgoZtTJ-8AjM29X0nOiGa51phUpZg4_VN_Ww@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWyRiBPQ/evZUq4wdENJhZLDj1ntbh4eCmz
	A5PHw708Huc2rmAMYIritklKLCkLzkzP07dL4M7Y9PsaW0EDb8WvZ3+YGxj7uLoYOTkkBEwk
	Tk46yQphi0lcuLeerYuRi0NI4ASjRNeGC1DOLEaJR4s2s4NUsQkYSZy7vokRxBYRiJWYt2km
	E4jNLKAl8WnCaWYQW1jAWKKhYwdUjYnE6jMn2SFsN4nFtw+A1bMIqEqc3dnKBmLzCphJdF49
	wAKxbD6jxMQdrWANnAKBEkeP/wEbygh03vdTa6CWiUvcejKfCeJsAYkle84zQ9iiEi8f/wN6
	hwPIlpP4v8UDolxHYsHuT2wQtpXExL/P2CFsbYllC18zQ9wgKHFy5hOWCYzis5BsmIWkfRaS
	9llI2mchaV/AyLqKUTA3MTPHUC+1uLgsvyRVLzk/dxMjMNK4GJiEdzDOmWJ7iFGAg1GJh/dC
	c3K4EGtiWXFl7iFGaQ4WJXFeFSGlcCGB9MSS1OzU1ILUovii0pzU4kOMTBychxglOLikRIpT
	81JSixJLSzLiQdEbXwyMX6kGxitJO4KFhX49vxEmZSG+57fY/9oovbMONVKTNjwu2aHne//4
	o87NgfZ72Hblf81Zz2SZejZR3Ca4LDd1wsbPW1c3C3j3x9zk7Pyy+/Ss7TPXZ+/bn+bc5Hpo
	9zfNo4nsp9ycFd6kO4pwzJebZ/x77/pfzAq3jMR3P7y9Q29LDcOzUy7qghJb65VYijMSDbWY
	i4oTAY1UfCewAgAA
Subject: Re: [meta-browser] Browser blacklists
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
X-List-Received-Date: Fri, 17 Jun 2016 17:57:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D225E678F998346A0D020ADE9DD61DF@essvote.com>
Content-Transfer-Encoding: quoted-printable

Add the following to your distro's conf or local.conf=20

#Stop the blacklist due to broken gcc6
PNBLACKLIST[chromium] =3D ""

On Friday, June 17, 2016 09:56:45 AM Ian Coolidge wrote:
> >
> > I ran into this as well and had to spend some time figuring out how to =
get
> > around it.
>=20
>=20
> How'd you get around it?
>=20
> On Thu, Jun 16, 2016 at 6:32 AM, Davis, Michael <michael.davis@essvote.co=
m>
> wrote:
>=20
> > I ran into this as well and had to spend some time figuring out how to =
get
> > around it.
> > Some sort of note in the readme or even commit message about how to get
> > around it would have been nice.
> >
> > On a related side note it would be nice to get krogoth branch/tag befor=
e
> > this blacklist.
> > I saw there isn't one currently and it would give people a working tag
> > that isn't as old as jethro.
> >
> >
> > On Thursday, June 16, 2016 11:08:33 AM Martin Jansa wrote:
> > > On Thu, Jun 16, 2016 at 09:08:49AM +0200, Gary Thomas wrote:
> > > > I notice that both firefox and chromium are currently blacklisted
> > > > as "fails to build with gcc-6".  What about those of us that aren't
> > > > using gcc-6?  This seems an overly broad blacklisting :-(
> > >
> > > You can easily unblacklist them in your configuration where you also
> > > change the gcc version, but they are broken in default configuration,=
 so
> > > they are blacklisted.
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> =

