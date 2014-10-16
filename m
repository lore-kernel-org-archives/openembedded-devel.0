Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6D2713AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 03:27:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G3RmHC001052
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Oct 2014 20:27:48 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Wed, 15 Oct 2014 20:27:48 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Martin Jansa (martin.jansa@gmail.com)" <martin.jansa@gmail.com>,
	"paul@paulbarker.me.uk" <paul@paulbarker.me.uk>
Thread-Topic: [oe] [meta-oe][PATCH] vim: add recipe for vim-tiny
Thread-Index: AQHP6KAO0qgMZs0/JU6tmAoLIPTZaZwyBaNA
Date: Thu, 16 Oct 2014 03:27:47 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD522EEC@ALA-MBB.corp.ad.wrs.com>
References: <1413366811-1259-1-git-send-email-jackie.huang@windriver.com>
	<20141015103818.GP3000@jama>
	<CANyK_8e+OeoHRKN+nriKpQNRuekQBxH_7We9rtMrBQG=wqZ2=A@mail.gmail.com>
In-Reply-To: <CANyK_8e+OeoHRKN+nriKpQNRuekQBxH_7We9rtMrBQG=wqZ2=A@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vim: add recipe for vim-tiny
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
X-List-Received-Date: Thu, 16 Oct 2014 03:27:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Paul Barker
> Sent: Thursday, October 16, 2014 1:45 AM
> To: OE Devel
> Subject: Re: [oe] [meta-oe][PATCH] vim: add recipe for vim-tiny
>=20
> On 15 October 2014 11:38, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Wed, Oct 15, 2014 at 05:53:31AM -0400, jackie.huang@windriver.com wr=
ote:
> >> From: Jackie Huang <jackie.huang@windriver.com>
> >>
> >> Changes:
> >> - split the vim recipe to two files
> >> - add bb for vim-tiny based on PACKAGECONFIG defined in .inc file
> >> - use trim_version to get VIMDIR
> >
> > If you really want to revert following 2 patches, then you need to

Sorry that I didn't notice the 2 patches in the commit history.

> > provide more justifications for your patch and also confirm that the
> > recipes don't stage conflicting files in sysroot anymore (I don't see
> > any change in recipe preventing that).

In vim-tiny, there are only two files installed: the binary and the rc file=
,
and they are renamed to avoid the confliction:
$ find . -type f
./bin/vim-tiny (it's vim in vim package)
./usr/share/vim/virc (it's vimrc in vim package)

> >
>=20
> Agreed. There may be a use for having both vim and vim-tiny in a package =
feed, but I think we need a

We have been using like this for a long time and it works fine when both vi=
m and vim-tiny are installed.

> better way of handling it than this.

I don't insist on this way and will be happy if there is a better way to ha=
ndle this. We usually define what
need to be installed in different packagegroups and images, for smaller ima=
ge, we need vim-tiny, some
others need vim, I know we can change PACKAGECONFIG to get different vims, =
but it doesn't work in
packagegroup or image. And it seems more clear to user/customer if we use n=
ame like vim-tiny,=20
gvim/vim-gui, or user may complain that vim is not fully featured when they=
 see vim is installed but actually
it is the one with tiny feature.

>=20
> This patch is difficult to fully review as it mixes conceptually differen=
t changes together. If this or
> something similar does go in after further discussion, it needs to be spl=
it up.

Yeah, sorry for that, I will split it up if needed after further discussion=
 here.

Thanks,
Jackie

>=20
> Thanks
>=20
> --
> Paul Barker
>=20
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

