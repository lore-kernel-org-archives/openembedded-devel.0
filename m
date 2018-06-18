Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id BEFC9751F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:09:23 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id u11-v6so6303026ybi.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LUx+WR7+XBvcpjlNfb7NeNCc6HusibLoaSSOFnekLSk=;
	b=o1xi8+o9k8kJVcFSz5570dU1pE7HO4jkt7ztRdG8IyUcIs4WRdvP+6adyyqNu8u4k3
	N9qoPiW0dbhGwPKpq6fTtt5BkG1Q5ReDvCo6yKZWj/5Je7GBZ3UCfanYC1FCcaUtpsXg
	fXFze4FfieVmAEm3I463DNXPF5SxjJK4Wz+cO6/JBQ3LzP+ehMCrJjaK6MicFoZ/mFyk
	CEy4n5J5QodE572NUIuJoLl+JTfV+/dGb3kLQAn8VeXKi6/SaNpLPf2UP+o/zMV9sR8K
	8MW7PAH/9ZyPrQu/rE24/1xv96r0suYs1jSwXqDM28hq2YDbBMivDrQBeQi3+PjijJfq
	mWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=LUx+WR7+XBvcpjlNfb7NeNCc6HusibLoaSSOFnekLSk=;
	b=LjzMyDetZ34bMsyqsR5HRuV8hH8h7/bmlPaPq1PnVjJmDzkB3mDyLzKHcf9uvYcCTv
	T1Z5wN5kMX8hOoCk3qjj7cSix977sDfZk7WlCElDGu+7Pkem1N1GRWzIhfC/SQ4wuBVY
	ozkMS2Kho95TOcN5i/QA1qPssAyk2O9IEithr52fi+YzVqSUCh2WmwWnvvF4gKi+0+OS
	Jcu/uOtCk+yLzwHBqIsjgG8r541DLaU4poUS+uBWrtXAD/WDRhosUnSgVmnWoMGSR+nh
	4TxPqgFFj4a6beQSnFczdXAbIW2iH4Cv4g46vnh1MXor0iVgD2ZfxS4o+NbrytUO1nOq
	H6EQ==
X-Gm-Message-State: APt69E0TzHz1QaYyC/5QfhN3rzcH01WGKxdqSr6pCOBohV8hb6b2oIdo
	qoOPRnKJqymuYWnLef4A/YP5Fs0d4T/LSZ9CPjY=
X-Google-Smtp-Source: ADUXVKKcClcgoFpg/eajWmWyqGFg+vjm0J5kdxT6yqvG3JiniAE+NZGBO/Hs0mqVW7qgxBkDwtaeW4rjF+El+bYL3y0=
X-Received: by 2002:a25:c583:: with SMTP id
	v125-v6mr6907181ybe.308.1529345364507; 
	Mon, 18 Jun 2018 11:09:24 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:bf83:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 11:09:23
	-0700 (PDT)
In-Reply-To: <CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
	<c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
	<CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Jun 2018 14:09:23 -0400
X-Google-Sender-Auth: 1ldyG3IiWQZ4sjzBU3AhOhW-8m0
Message-ID: <CAPuovEJx-ghUsXH0NFR8Vc1DJL8AyHXJAbL38oqkrtqbQiAOTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 18:09:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>>
>> On 6/18/18 12:50 PM, Khem Raj wrote:
>> > Hi Mark
>> >
>> > It seems your distro is not inheriting it globally. Here I have
>> > INHERIT_DISTRO ?=3D  "debian devshell sstate license remove-libtool"
>>
>> So is remove-libtool a recipe or a distro option?
>>
>> I'm asking because doing this half-way is causing a lot of confusion.
>>
>> If it's a distro option, then the recipes should work without it being s=
et.  If
>> it's a recipe option, then the recipes that need it should use it.
>>
>> Right now it doesn't seem to be working with these recipes because they =
don't
>> package the .la files UNLESS it's enabled.  So the fix is either to pack=
age them
>> (by default) or inherit the remove-libtool.
>>
>
> since we make it as part of meta/conf/distro/defaultsetup.conf
> its a default policy,  its perfectly fine for a distro to disregard that
> however, then you fall into a non-default case. I am willing to accept
> per recipe patches but I would recommend to consider it as a distro
> feature for your distro.
>

Andreas,

Can you revert your "various classes recipes: Remove FILES entries for
dbg/dev packages" then? If this is a distro feature then these recipes
need to build without the QA issue and without the remove-libtool
distro feature being set.

MarkA

>> --Mark
>>
>> > On Mon, Jun 18, 2018 at 10:49 AM Mark Asselstine
>> > <mark.asselstine@windriver.com> wrote:
>> >>
>> >> On Mon, Jun 18, 2018 at 1:15 PM, Mark Asselstine
>> >> <mark.asselstine@windriver.com> wrote:
>> >>> On Mon, Jun 18, 2018 at 1:07 PM, Mark Asselstine
>> >>> <mark.asselstine@windriver.com> wrote:
>> >>>> On Monday, June 18, 2018 12:51:47 PM EDT Andreas M=C3=BCller wrote:
>> >>>>> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
>> >>>>>
>> >>>>> <mark.asselstine@windriver.com> wrote:
>> >>>>>> Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3]=
 we
>> >>>>>>
>> >>>>>> are getting a QA Warnings/Erros for 'installed-vs-shipped':
>> >>>>>>     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-pane=
l:
>> >>>>>>
>> >>>>>>     Files/directories were installed but not shipped in any packa=
ge:
>> >>>>>>       /usr/lib64/xfce4/panel/plugins/liblauncher.la
>> >>>>>>       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
>> >>>>>>       ...
>> >>>>>>
>> >>>>>> From various OE documents the .la files should not be packaged in
>> >>>>>> either the main recipe package or the -dev package unless require=
d. So
>> >>>>>> inherit 'remove-libtool' to have all the .la files cleaned up as =
they
>> >>>>>> don't appear to be necessary.
>> >>>>>>
>> >>>>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> >>>>>> ---
>> >>>>>>
>> >>>>>> This error is currently only seen on master-next since the xfce4-=
panel
>> >>>>>> upgrade commit is yet to make it into master. As such this fix is=
 only
>> >>>>>> applicable to master-next.
>> >>>>>
>> >>>>> I think it was not the upgrade -> 4.13.3 commit but later commit /=
 same
>> >>>>> series
>> >>>>>
>> >>>>
>> >>>> Sure, I can update the commit log and send a V2 but first let's sor=
t out the
>> >>>> remainder.
>> >>>>
>> >>>>> various classes recipes: Remove FILES entries for dbg/dev packages
>> >>>>> ...
>> >>>>> --- a/meta-xfce/classes/xfce.bbclass
>> >>>>> +++ b/meta-xfce/classes/xfce.bbclass
>> >>>>> @@ -12,11 +12,3 @@ DEPENDS +=3D "intltool-native"
>> >>>>>
>> >>>>>  FILES_${PN} +=3D "${datadir}/icons/* ${datadir}/applications/*
>> >>>>> ${libdir}/xfce4/modules/*.so*"
>> >>>>>  FILES_${PN}-doc +=3D "${datadir}/xfce4/doc"
>> >>>>> -
>> >>>>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*.la"
>> >>>>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.la"
>> >>>>> ...
>> >>>>>
>> >>>>> My builds have remove-libtool enabled so I did not see this QA
>> >>>>> warning/error.
>> >>>>>
>> >>>>> Isn't remove-libtool enabled by default since pyro/2.3 - so that t=
his
>> >>>>> patch is obsolete (and all the other same kind coming later)?
>> >>>>
>> >>>> The documentation still indicates:
>> >>>> ---
>> >>>> <note>
>> >>>>             The <filename>remove-libtool</filename> class is not en=
abled by
>> >>>>             default.
>> >>>> </note>
>> >>>> ---
>> >>>>
>> >>>> So as far as I know this still needs to be handled recipe to recipe=
 by
>> >>>> inheriting the remove-libtool class in the affected recipes. I have=
 done
>> >>>> builds without manipulating the generated local.conf which seem to =
confirm
>> >>>> this but I could be wrong. Add RP who might have some guidance.
>> >>>>
>> >>>> MarkA
>> >>>
>> >>> Just hit another one
>> >>> ---
>> >>> ERROR: gtk-xfce-engine-3.2.0-r0 do_package: QA Issue: gtk-xfce-engin=
e:
>> >>> Files/directories were installed but not shipped in any package:
>> >>>  /usr/lib64/gtk-3.0/3.0.0/theming-engines/libxfce.la
>> >>>  /usr/lib64/gtk-2.0/2.10.0/engines/libxfce.la
>> >>> Please set FILES such that these items are packaged. Alternatively i=
f
>> >>> they are unneeded, avoid installing them or delete them within
>> >>> do_install.
>> >>> ---
>> >>> Andreas, seeing as you didn't hit the 'installed-vs-shipped' QA issu=
e
>> >>> with thunar recipe I suspect the reason you didn't see this is not
>> >>> related to remove-libtool but rather that you have disabled the
>> >>> 'installed-vs-shipped' QA check itself.
>> >>
>> >> And xfce4-session now too. I found a reference from a few years back
>> >> related to remove-libtool use on a per recipe basis
>> >> (http://lists.openembedded.org/pipermail/openembedded-devel/2016-Marc=
h/106323.html),
>> >> so definitely some concerns being expressed using this on a per recip=
e
>> >> basis. On the other hand this just seems like we are setting traps fo=
r
>> >> ourselves. If we compare to another common class, rm_work, I can
>> >> pretty much toggle rm_work on or off and recipes are expected to just
>> >> work in either case. This is definitely not the case with
>> >> remove-libtool which gives the impression of being optional but if no=
t
>> >> enabled and I do basic QA checks I will get failures, as is evident i=
n
>> >> my current build.
>> >>
>> >> MarkA
>> >>
>> >>>
>> >>> MarkA
>> >>>
>> >>>
>> >>>>
>> >>>>>
>> >>>>> Andreas
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> --
>> >>>> _______________________________________________
>> >>>> Openembedded-devel mailing list
>> >>>> Openembedded-devel@lists.openembedded.org
>> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

