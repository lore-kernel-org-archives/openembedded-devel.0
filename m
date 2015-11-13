Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E01D772AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 03:43:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD3hWxC013428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:43:33 -0800
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 12 Nov 2015 19:43:32 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/5] talloc, libtevent,	libtdb: depend on
	attr
Thread-Index: AQHRHcJgR6z6YNZxiUem8PjIgaxidZ6ZToFw
Date: Fri, 13 Nov 2015 03:43:31 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C72440F@ALA-MBA.corp.ad.wrs.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
	<1447359445-27258-2-git-send-email-kergoth@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C724338@ALA-MBA.corp.ad.wrs.com>
	<CABcZANmkpaSxOJ9Gf=TH7Q1JKdLyVEk-WRSwHWhWhL-C1ATjMw@mail.gmail.com>
In-Reply-To: <CABcZANmkpaSxOJ9Gf=TH7Q1JKdLyVEk-WRSwHWhWhL-C1ATjMw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/5] talloc, libtevent, libtdb: depend on attr
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
X-List-Received-Date: Fri, 13 Nov 2015 03:43:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> Sent: Friday, November 13, 2015 11:20 AM
> To: Openembedded Discussion
> Subject: Re: [oe] [meta-oe][PATCH 2/5] talloc, libtevent, libtdb: depend =
on attr
>=20
> On Thu, Nov 12, 2015 at 7:48 PM, Huang, Jie (Jackie) <
> Jackie.Huang@windriver.com> wrote:
>=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> > openembedded-devel-
> > > bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> > > Sent: Friday, November 13, 2015 4:17 AM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Christopher Larson
> > > Subject: [oe] [meta-oe][PATCH 2/5] talloc,libtevent,libtdb: depend on
> > attr
> > >
> > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > These will depend on libattr if it's available, and we need determini=
stic
> > > builds. This fixes a build-deps failure which occurs when attr is bui=
lt
> > before
> > > them. There's currently no configuration option to explicitly control
> > this
> > > dependency, and I don't know enough about waf to add such an option, =
so
> > > unconditionally dep on it for now.
> >
> > I added depends on libcap  for libtevent for the same reason days ago, =
but
> > it really concern
> > me now, the 'libreplace' in these waf based packages check many package=
s(I
> > see
> > libbsd, libcap, libacl for now) existence then build with them if found=
,
> > and there
> > is no configure option to disable them, does anyone has a better idea h=
ow
> > to
> > make waf build in deterministic way? Maybe we should disable the built-=
in
> > libraries 'libreplace' or add a PACKAGECONFIG for it?
>=20
>=20
> I don't think PACKAGECONFIG will help unless we have a way to explicitly

You're right, a quick try show me that it doesn't help.

Thanks,
Jackie

> disable or enable the dependency with waf, otherwise it'd still be
> non-deterministic. But I think that would be ideal, that's how we handle
> these things in autoconf, add an argument to let us explicitly
> enable/disable it. Hopefully someone else on the list knows enough about
> waf to be able to do so.
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

