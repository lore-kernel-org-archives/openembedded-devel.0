Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A867260124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 01:36:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u241ahJn008002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 3 Mar 2016 17:36:43 -0800
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.21]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 3 Mar 2016 17:36:42 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [PATCH 2/2] iscsitarget: skip the arch test for kernel
	modules
Thread-Index: AQHRcQZTls3s0sD2Lky5YboT2JG0kZ9HKzIggAFJGgCAABXsoA==
Date: Fri, 4 Mar 2016 01:36:41 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C812A95@ALA-MBA.corp.ad.wrs.com>
References: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
	<1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
	<CANBf+V2nZwQ-UGi3wDnKyzHHU8wCoO6i74D5tYxjfwv+g1TAtQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C80D944@ALA-MBA.corp.ad.wrs.com>
	<20160303161701.GA4671@mentor.com>
In-Reply-To: <20160303161701.GA4671@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.205]
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] iscsitarget: skip the arch test for kernel modules
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
X-List-Received-Date: Fri, 04 Mar 2016 01:36:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> Sent: Friday, March 04, 2016 12:17 AM
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel
> Subject: Re: [oe] [PATCH 2/2] iscsitarget: skip the arch test for kernel =
modules
>=20
> Hi Jackie,
>=20
> [Re: [oe] [PATCH 2/2] iscsitarget: skip the arch test for kernel modules]=
 On 16.03.03 (Thu 04:41) Huang,
> Jie (Jackie) wrote:
>=20
> > > On Wed, Nov 25, 2015 at 3:27 AM, <jackie.huang@windriver.com> wrote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > Kernel modules may not have the same architecture as user space.
> > > So we tell INSANE_SKIP to skip checking the arch for the modules.
> > > This is consistent with other kernel modules and the kernel recipe.
> > >
> > > This one still hasn't been merged and since iscsitarget is currently =
unbuildable,
> > > I'm not in a rush to merge this one particularly since I'm not really=
 clear on the
> > > logic underlying the change.  I searched the archives and found your =
response to
> > > Martin was essentially "see my netmap-modules patch for an explanatio=
n" and in that
> > > one the explanation was basically "this is the way other kernel modul=
es do it".
> >
> > I think I meant to refer to this one which is not merged either:
> > commit 6727154c929f3dc8ed86bab29aa1de88620906e9
> > Author: Jackie Huang <jackie.huang@windriver.com>
> > Date:   Tue Nov 17 01:44:47 2015 -0800
> >
> >     netmap-modules: skip the arch check for kernel module
> >
> >     When building on a multilib capable BSP, it's possible for the
> >     kernel bit size to be different than the userspace. Avoid the
> >     QA test when building the kernel module.
> >
> >     Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >
> > sorry that if the explanation is not clear enough.
> >
> > > I merged that one but now I'm thinking I shouldn't have without more
> > > careful consideration.
> >
> > The one you merged is "netmap-modules: Modules may not have the same ar=
ch as userspace"
> > and Mark helped to split and re-word the commit message like what it is=
 now.
>=20
> Okay, so at least I am looking at what I think I'm looking at.
>=20
> > > Am I correct in thinking that this problem only shows up when you're
> > > building for multilib?
> >
> > We have BSPs with a 64 bit kernel + modules + 32 bit userspace by defau=
lt, the
> > problem always show up when we're building such BSP, and we have a bbcl=
ass to
> > add INSANE_SKIP for internal modules:
> >
> > # sanity updates. The do_package_qa_prepend and vmlinux sanity
> > # flags allow a 64 bit kernel + modules to be packaged against a
> > # 32 bit userspace. If external modules are built, they must supply
> > # their own INSANE_SKIP_<module> =3D "arch" if they want to be properly
> > # packaged.
> > python do_package_qa_prepend () {
>=20
> I guess in this case you mean it's a bbclass that's internal to Wind

Yes.

> River, I did a quick search and couldn't find the code you reference abov=
e
> anywhere in my poky tree.
>=20
> > > I've reverted "netmap-modules: Modules may not have the same arch as =
userspace" in my contrib
> > > tree at http://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Djoeythesaint/meta-
> networking-next
> > > and my initial test builds showed no QA issues related to netmap-modu=
les and the arch checks.
> > > So I started looking around for other kernel modules doing something =
similar and I don't actually
> > > see this "INSANE_SKIP_kernel-module-*" construct being used anywhere =
else in meta-oe or poky
> > > (and at the least I would expect something like cryptodev-module to n=
eed it, it looks like an
> > > analogue to me).  Can you fill me in on what's special with iscsitarg=
et and netmap, because
> > > even if it is a multilib issue, why wouldn't that be showing up for o=
ther kernel modules built
> > > in poky?
> >
> > That's because there is no such BSP like I mentioned above in poky, I
> > undersatand if this is not accpeted, we may add this in our own layer.
>=20
> I think that's best, since otherwise the you'll be submitting these
> changes for any external module to support a use-case that we don't have
> in Yocto and there's no obvious corresponding behaviour in poky.

Ok, I see, thanks!

Thanks,
Jackie

>=20
> Thanks.
>=20
> --
> -Joe MacDonald.
> :wq

