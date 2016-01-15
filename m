Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B789731A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 03:29:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F3TiTL019415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 19:29:44 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.91]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 14 Jan 2016 19:29:43 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-java Workflow
Thread-Index: AQHRTjG856W5vRWXskKSrl6pOq6fSZ775elg
Date: Fri, 15 Jan 2016 03:29:41 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C79124D@ALA-MBA.corp.ad.wrs.com>
References: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
	<CAP9ODKrKZABvZvEkmDdska_t9JgnWLCT8MM6kzov=HqsCc16Hw@mail.gmail.com>
In-Reply-To: <CAP9ODKrKZABvZvEkmDdska_t9JgnWLCT8MM6kzov=HqsCc16Hw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Subject: Re: meta-java Workflow
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
X-List-Received-Date: Fri, 15 Jan 2016 03:29:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
> Sent: Thursday, January 14, 2016 2:38 AM
> To: OpenEmbedded Devel List
> Subject: Re: [oe] meta-java Workflow
>=20
> Hello Jens,
>=20
> On Wed, Jan 13, 2016 at 4:03 PM, Jens Rehsack <rehsack@gmail.com> wrote:
> > to avoid such a problem as it occurred with ec7b984f, 04d5d0bf and dfb2=
1b44, I strongly suggest that
> meta-java follows the merge-workflow from other meta-layers:
> >
> > cherry-pick new stuff into master-next, when settled - merge to master
> > Branch releases as other layers do and same, push back-ported patches i=
nto ${rel_branch}-next and
> merge the behaving ones into ${rel_branch}.

I agree to improve this so it should be able to avoid some regression issue=
s.

> >
> > The current way - pushing to master and live only there result in the h=
appened revert - and to
> continue my work I would have to revert the reverts without any nice word=
 in the commit message as

I left the detail message in the following commit, if that didn't have nice=
 word, sorry about that, but I just
tried to explain the regression issue I found and how I fix it.

> I did in reverting 24b98ac3 with a88718b6.
>=20
> I understand your frustation but I think you are exagerating on this.
>=20

I have the same feeling, if there is no regression issue, I believe no one =
like to revert anything.

> The fix you provide (and was reverted by causing regression at that
> moment) is a great improvement and those should be brought back. To
> bring it back, as I explained on the Hangout, you can revert those and
> apply the fix for the sstate. Doing this, we can integrate those
> changes back and everyone is happy.

I agree, I will be happy if there is a better fix.

Thanks,
Jackie

>=20
> To make all this setup you are asking for, I need to reserve resources
> in our autobuilder to properly excercize it and provide useful
> feedback otherwise it is useless. To be honest, I am not being an
> active user of this and been acting as maintainer just due the lack of
> someone more active so I am willing to give the maintenance for
> someone more commited to Java use than me, if desired.
>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

