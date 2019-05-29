Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id E1D137E145
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 08:17:54 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id z23so884957wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fbWddBhDppr2QkeDXLDRHFbOtGMFk0PtOeKnuMkV5b0=;
	b=cTEL3W9FUKWA0WvpJPvix5m04RewMIkHEkRdqCuTjjwmqZu9mWqq3bqn20ohvvJgxb
	YSSjRfn4UipxF88ks8TdH2MMgFxV9eHg5RiREQ0ljcuE4RkYXrkNmvDTqhN9SEG5tibu
	kuJJ0zCNZhDQOoG1wZGNgQgKe7awP98KFzwSwifaXl6oIdUhPndjLdGEuhUOv5gLDebA
	I3J6bT3PTwx9u52Wovxlrku5TF5vuZvbmlx0LlS3NYzSY333wmQkvQuY7ORlO+Z7B11F
	zPuae+S5j4RWv8BbxtZVWQe7XYHB2j9RzSF9YdbfsLT1N+yG5e4x8t3sdO5FQZD8muM+
	AjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fbWddBhDppr2QkeDXLDRHFbOtGMFk0PtOeKnuMkV5b0=;
	b=bFJAkjDs87NagBOqVnMfXHdp8S5q9yI6V0cxSmYrxTC9WOHzJCrMtdX1IL+Gc05Tr/
	1c8TTVm+RLIka9M7Peluq2bw9Ke0Nzz2S7fgH5Rrq4x4YTZDfui69wuUQ+BrtAruK7B9
	R5cgoUKaUO/vm8eu7/qzO5tPFROpIg0S6xnXaTgU7k1o9GCiJe7pF2ZtQHx5rTtrjDds
	+m/d/AAMjLiTjbz5d3hA19lvdFgq/a5LeUvM2bcvFALYo69J6S255nUWF/LZdFvKFbe4
	pMyKp36iPFTbKhTQJt08LvQjPysHDs6Zs27irUaLYs+FjC2lr4uH00fJQaunBeTZ1Ryz
	J0Cw==
X-Gm-Message-State: APjAAAWaYZ4rRI9ABQ0ITkYGro4YsR6Z/z9bPL8G5lYzkacN5JTraQY7
	ZVQ/T3im8A2r0DhrqQkbwpPlBYPMLXgx2qVIKjQ=
X-Google-Smtp-Source: APXvYqzpDVujbcst6czy1dQnsOBx0KyePjWeE0mY3qZRl5VDXNVq72vfIbzV92NHnPYHMYgC0j+ReoRsNgZLA80Cg4s=
X-Received: by 2002:a1c:2c89:: with SMTP id s131mr6301835wms.142.1559117875444;
	Wed, 29 May 2019 01:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34HAOaAaO1cyiQbR8P6mQPp8p3gCT2jM=UyQDGfvV-fYw@mail.gmail.com>
	<CA+2YH7ud9TX=ohQSk8XY=GzpewzFsXo6Z2eBJ=bXacyAsojV9A@mail.gmail.com>
	<CAAfyv34jJ362tu3x_8J1+FuV3zFpchkB8Ft9w-WERrxCNPxbvg@mail.gmail.com>
	<CACKFPN1bgM_DPDRRDxkjekqZ9gQwV9S+1MkHF42z6MvczD81Jg@mail.gmail.com>
	<CAAfyv36-ykHu2Gfet1CeuR8tjNgernF4m01AjnQaOzcFb-BZaw@mail.gmail.com>
	<CACKFPN1q13OJfCcRCP6aLxGOC+cM+2zjwoTLNbkAn5dAS+J_DA@mail.gmail.com>
	<CAAfyv36hNk8CXYEfYASZJ-tOPEUwZ23i1zyDdLbVWk6r9ONkDA@mail.gmail.com>
	<CA+2YH7vhko+jG6UTKHJrXGnv7AsCJP=GT4=trUUgkQ8cNQ5-0Q@mail.gmail.com>
	<CACKFPN3XaUoY532vj1oxTd2Nd3QNsT1Lx6TVQTQEWY2ELXNRRw@mail.gmail.com>
	<CAAfyv35FO2+wBpWTB2muyXGUBG3pgCvcVXon1d0BNuzJ7g9uKA@mail.gmail.com>
	<CACKFPN2Zh9K4fymx+a-Ougw-H=CHKw=KxgimBpe40nOAgCESZg@mail.gmail.com>
	<CAAfyv35B773mjZtK4E7jDCLHrjkRW-JdhEqTPM1pUGbfNz7PcA@mail.gmail.com>
	<CACKFPN3dx0NMRrS35eYhDKqd7e7yMWDAOKKu_Ei9LJ3euqiVFQ@mail.gmail.com>
In-Reply-To: <CACKFPN3dx0NMRrS35eYhDKqd7e7yMWDAOKKu_Ei9LJ3euqiVFQ@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 29 May 2019 10:17:43 +0200
Message-ID: <CAAfyv37y8_ZDyocx46ZPvVEK_tTmHoAFDYcrwdA3bL-FW5X_3Q@mail.gmail.com>
To: Dimitris Tassopoulos <dimtass@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Sergey Lapin <slapin@ossfans.org>, Enrico <ebutera@users.sourceforge.net>,
	Nicolas Aguirre <aguirre.nicolas@gmail.com>,
	OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] meta-sunxi maintained?
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
X-List-Received-Date: Wed, 29 May 2019 08:17:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dimitris,

On Wed, May 29, 2019 at 10:03 AM Dimitris Tassopoulos <dimtass@gmail.com> w=
rote:
>
> Hi Marek,
>
> I see (and now remember) that there is a recipe for libgles for Mali400 a=
nd A10/20.
> Are you interested for this architecture or newer (like H2, H3, H5) ?
>
> I can only make a wild guess that maybe because the driver is a bit old, =
then if you
> try to build new recipes then there might be some issues.
>
> This also is the difference between the layers that I've mentioned before=
. The meta-sunxi
> is clean and raw layer. Meaning that you get more flexibility to add/remo=
ve things and
> also have a more generic layer. On the other hand, the other layer is not=
 really configurable
> and flexible in the same depth but it takes the full armbian distro and w=
raps it. So, if the
> distro works, then the layer should work only with those components (of c=
ourse you can
> do modifications). That's the difference in the approach I meant in the p=
revious mail.
>
> I don't have any A10/20 hardware to test, but I could spin a build and lo=
ok at the errors you get.
> If you send my your local conf file and your environment setup and build =
command I ca
> trigger a build and see if there's anything I can help with.
Thanks it will be really helpful. Basically I'm doing same as
described here:
https://github.com/linux-sunxi/meta-sunxi/issues/240#issuecomment-496410993
Looking at sunxi-mali more devices should be supported:
COMPATIBLE_MACHINE =3D "(sun4i|sun5i|sun7i|sun8i)"
>
> Regards,
> Dimitris

BR,

marek
>
> On Wed, May 29, 2019 at 9:39 AM Belisko Marek <marek.belisko@gmail.com> w=
rote:
>>
>> Hi Dimitris,
>>
>> On Wed, May 29, 2019 at 9:03 AM Dimitris Tassopoulos <dimtass@gmail.com>=
 wrote:
>> >
>> > Hi Marek,
>> >
>> > that's correct. I have a branch though which I've started to experimen=
t and add support for Mali. I didn't finished because I've tried to do this=
 by myself from the scratch and soon I've hit a wall. Nevertheless, I've do=
ne the same for the rk3399 for nanopi-neo4 and during this process I've lea=
rned a lot on how to do it with some help from other people from the open s=
ource scene. The graphics stack was too complicated for me in the beginning=
.
>> You can maybe look to meta-sunxi there is sunxi-mali driver +
>> libraries which will add support for that. When I've set that package
>> to PREFERRED_PROVIDER_virtual/gles2 I get issues with compilation
>> gtk3+ and others. I've spend 2 hours looking and trying yesterday but
>> without any success. Also pls look at this communication:
>> https://github.com/linux-sunxi/meta-sunxi/issues/144 (looks like we
>> can use opensource drivers + libs later). Thanks.
>> >
>> > Therefore now that I feel much more confident with it I'm going to re-=
try and finish with my branch. Armbian does have support, so I'll try to st=
ick to the Armbian backend for maintenance reasons.
>> >
>> > I hope that this will be rather easy, because the dri driver should al=
ready be there, so the only thing I believe is needed is the blobs and to c=
reate symlinks for the various so libs to that blob.
>> >
>> > Anyway, I'll try to do that also. In the meantime I will also wait a b=
it to see if that merge between those two layers is possible and doable, wh=
ich will help to short the time and effort to do that.
>> >
>> > Regards,
>> > Dimitris
>>
>> BR,
>>
>> marek
>> >
>> > Belisko Marek <marek.belisko@gmail.com> schrieb am Mi., 29. Mai 2019, =
08:37:
>> >>
>> >> Hi Dimitris,
>> >>
>> >> On Tue, May 28, 2019 at 1:07 PM Dimitris Tassopoulos <dimtass@gmail.c=
om> wrote:
>> >> >
>> >> > Hi Enrico,
>> >> >
>> >> > I'm totally positive to any possibility for such integration. Perso=
nally, that was the first thing I've tried to do before I start this layer,=
 but I've failed as it got really complex and the overhead was too much aft=
er some point (at least for me). If you have look it's actually a mix of me=
ta-sunxi and armbian, but I had to remove or change many stuff to fit the a=
rmbian in the layer.
>> >> >
>> >> > If you have time to have a look to my layer and you think that such=
 kind of integration is possible and can be done in a more easy way, then f=
rom my side I'm all in.
>> >> > I believe that re-using the armbian patches is easier as it makes m=
aintenance much easier, there are more supported SBCs and also there is muc=
h more testing involved in armbian and frequent updates fix those bugs.
>> >> I did check your layer and it seems that you're not using sunxi-mali
>> >> for opengl HW acceleration only mesa so SW rendering? Thanks.
>> >> >
>> >> > Please consider it and I can help as much as I can and my time allo=
ws for that integration.
>> >> >
>> >> > Regards,
>> >> > Dimitris
>> >> >
>> >> >
>> >> Marek
>> >> >
>> >> > On Tue, May 28, 2019 at 12:56 PM Enrico <ebutera@users.sourceforge.=
net> wrote:
>> >> >>
>> >> >> On Tue, May 28, 2019 at 12:06 PM Dimitris Tassopoulos <dimtass@gma=
il.com> wrote:
>> >> >> >
>> >> >> > >
>> >> >> > > I was thinking about this also, too. The only reason is that i=
n meta-sunxi they do a great job and they keep their layer clean, which is =
great I think. The other layers are just based on the armbian distro, which=
 is a lot different, but for me it was much easier to integrate their patch=
es, patching scripts and bootloader scripts to a Yocto layer. That way the =
only thing I do is that from time to time I just integrate their new patche=
s and that's it. There's no development in the layer is just re-use of the =
armbian work and a wrapper around it. Therefore, it's hard, even no doable =
to put those different architectures together. But definitely that decision=
 also bothered me a lot before I create the layer and I also don't like tim=
e to be spend on the same thing from different people. Nevertheless, from m=
y point of view I couldn't find a way to put those things together. I've tr=
ied but I couldn't do it.
>> >> >> > >
>> >> >> > > Therefore, it was easier for me to do it the way I've done it.=
 And after all, although it doesn't seem right, at the same time this is th=
e beauty of the open source. I think the layers are just incompatible in th=
e way that they are do things. Also it's not bad to have alternatives.
>> >> >> > >
>> >> >> > > Sunxi is a great community and I believe many of the armbian p=
atches are coming from there. Others not. Of course, having them all togeth=
er would be nice. But I don't think that it's possible because of the diffe=
rent approach.
>> >> >>
>> >> >> It would be great to integrate all those different layers in
>> >> >> meta-sunxi,the main problem is that usually they come with their o=
wn
>> >> >> bootloader/kernel/etc.... so you have to *maintain* all these
>> >> >> different configurations.
>> >> >> Infact in the past i refused to do such things because i didn't ha=
ve
>> >> >> the time to maintain all those different versions, it was just eas=
ier
>> >> >> to support what was already in mainline uboot/kernel.
>> >> >>
>> >> >> But of course if someone wants to do it then it's welcome, the wor=
st
>> >> >> thing that can happen is that once an arch gets unmaintained it wi=
ll
>> >> >> be removed.
>> >> >>
>> >> >> One thing that can be done anyway is to have those external layers
>> >> >> linked in the readme, so at least people will know they exist.
>> >> >>
>> >> >> Enrico

