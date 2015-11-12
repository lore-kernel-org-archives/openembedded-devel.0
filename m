Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4442D7722B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 17:01:02 +0000 (UTC)
Received: by iofh3 with SMTP id h3so71232842iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vKGFE3cH3m+epAXZKMhu6paiXvGVLY26hQR8K96yrUc=;
	b=iTEB0KnHTQL2SPj7RdUaDwNxJCHm0ZXhM/kL2dGCfQEECeik+Ap1BIIrf4adcLqERH
	wArtGwOgMHMytgTONO8YIKf/lukec1TMxh+T67NwdBn5p+6k4PzCdf+coS2LSC+i2JUa
	B68Htr8imcJB+PnwBwoucetgDNF0U96mbFwmEr9N5Cv7btn0lxC1CioQLw40BS/9XqrU
	MjEQEIwXj+n2f8SzMwE0y6gXNH9mYvCn36AVRx6oion5QfaLRF4XT1vxXcMiNyxwsL3w
	QRKPxIvzYUAtHvqviJhe/hf9wuEBNw/WwULVSdGpcS55BF3Pn4vxrn624/Gjz+oCcO8X
	ByFQ==
MIME-Version: 1.0
X-Received: by 10.107.3.144 with SMTP id e16mr11888361ioi.99.1447347662651;
	Thu, 12 Nov 2015 09:01:02 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Thu, 12 Nov 2015 09:01:02 -0800 (PST)
In-Reply-To: <20151112164203.GI2574@jama>
References: <1447343800-21460-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRRrYKrn5jh-UnktCy9w8CCZ1hYrZApqOpDRbS+OW-9B_g@mail.gmail.com>
	<20151112164203.GI2574@jama>
Date: Thu, 12 Nov 2015 18:01:02 +0100
Message-ID: <CALbNGRSVvPgLhtY10t0sm=HVOCpEJC4VHODxqOtuKmLH_3bj9w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-xfce] xfce4-session: exclude machine-host dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 12 Nov 2015 17:01:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 5:42 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Nov 12, 2015 at 05:11:36PM +0100, Andreas M=C3=BCller wrote:
>> On Thu, Nov 12, 2015 at 4:56 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > * this whole machine-host is very bad idea, all changes from postinst
>> >   will be removed when netbase package is upgraded (it has CONFFILES
>> >   set but most users won't know that this entry was appended by
>> >   machine-host package)
>> > * see:
>> >   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Sept=
ember/103271.html
>> > * fixes:
>> > ERROR: xfce4-session different signature for task do_package_write_ipk=
.sigdata between qemux86copy and qemux86
>> > runtaskdeps changed from ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-u=
tilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.=
7.4.bb.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_pack=
agedata', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce=
4-session_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_p=
ackagedata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.=
4.bb.do_packagedata'] to ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilso=
pkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.b=
b.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packageda=
ta', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-ses=
sion_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packag=
edata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.=
do_packagedata']
>> > meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb=
.do_packagedata with hash 7b3f9a883729dfe908e17980476d10e2
>> >  changed to
>> > meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb=
.do_packagedata with hash f51309cb641c82a6d8e2dc5387bb6484
>> > Hash for dependent task xfce4-sessionmachine-host.bb.do_packagedata ch=
anged from 7b3f9a883729dfe908e17980476d10e2 to f51309cb641c82a6d8e2dc5387bb=
6484
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-xfce/conf/layer.conf | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
>> > index 55bcef6..64b1077 100644
>> > --- a/meta-xfce/conf/layer.conf
>> > +++ b/meta-xfce/conf/layer.conf
>> > @@ -17,3 +17,7 @@ LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
>> >  LAYERDEPENDS_xfce-layer +=3D "gnome-layer"
>> >  LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
>> >  LAYERDEPENDS_xfce-layer +=3D "meta-python"
>> > +
>> > +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>> > +  xfce4-session->machine-host \
>> > +"
>> > --
>> I missed that - there should be another way to go for this problem.
>> Two questions
>>
>> * What exactly does SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS do? I checked your
>> original patch in oe-core but do not understand what the result of
>> setting SIGGEN_EXCLUDE_.. is.
>
> http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SIGGE=
N_EXCLUDE_SAFE_RECIPE_DEPS
> http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SIGGE=
N_EXCLUDERECIPES_ABISAFE
>
> Does this help? In short it will prevent sstate signature handler in
> including the task signatures of recipes included in these variables.
>
> SIGGEN_EXCLUDERECIPES_ABISAFE excludes it from everywhere
> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS excludes it only when counting signature
> of given recipes.
>
>> * How much time do you give me to come around with a proper solution -
>> without machine-host quirk? I would like to avoid getting this into
>> jethro.
>
> machine-host recipe is already in jethro (released yesterday) or do you
> want to avoid this SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS addition?
The machine-host solution - introduced by me if I remember correct -
is crap (as you wrote more polite in commit message). I would like to
remove this recipe and find another solution. Because of I am not able
to tell when I can take care I suggest: Please continue as planned
before my email. As soon as I have a solution I will send patches for
master and pull-requests for jethro.

Andreas

