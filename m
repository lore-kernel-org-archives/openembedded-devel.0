Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id E61F46FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:48:52 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id k18-v6so5385246ywm.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wI2v6uUrycJWhUv/bYBIcpcldXgn3cuEjgnh1T7+MH8=;
	b=hIDOFn78ynE4A/tp3K2cnxNf8W7TTBV4rZAtojt3X+BE5DGYkktr8o0kZJIkYJ+/85
	VzhupSrLifPCu2pejEZKDykoiC+eDXqXPCcGSbUW5RKGUUtt4BlmfgHUPyMPWcv0n1Wk
	mtaFoACmlLxJTwOe8x6oDTHCvv5GgKuSQAerXoo3Yobu38rT182tBvVRgqEV5TQxkhxG
	9Hn63P5d3aOFN3G+apXrDiUQmo7Lx2UNHBni/6uYIrR5PzePIAJk53k7gaUNpZlHke9v
	s7/JqDMk6nRnGGJE7MGMYqPQm+0v+TQU1aW6yfPXfkT2oaeVP+e23UkpNquHoxyyon5I
	LJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=wI2v6uUrycJWhUv/bYBIcpcldXgn3cuEjgnh1T7+MH8=;
	b=KNiEj+Fonv0NpLMc9/T7Ub9FB0OJWfGPBIbRyR383joK05RxCXyaym+Krub1OGPFF+
	Zwtp/CleWpeUx3d13gi7UruL01rhPTMVeaAbfvJsv4cTf/kTkyu2BRJgGmFgATp96DM2
	vvx9HLpJ6cz4duKvOSfiiawT9UouLTwLXIyw3zBsjBKQELkwdhhKVEA8ZN29BNOhYsz+
	7XikihiHhc7JZ3MoECwg/a2qkFP9Hx34jDkplq3V9ZSJqmW5rSRqPP8Rtgtngr0i0WBl
	5SbhA8wugMCREytJSrhKZtcOWIphXxNzi64IPZK33nAghbA4MTxewcBWqZa/EmkMoPlK
	vsjA==
X-Gm-Message-State: APt69E3G8nSPgCcUvQvsosmSf46w8fcllR7haoc358tUM+w+qKic6vib
	hugpPmCAF5ikq4eWA32xffIV4O+ymFTI17gD2XE=
X-Google-Smtp-Source: ADUXVKJO37hU2sXzucRtOmY4/8YATgYgdauoqrWYZ0LZjdE1+OWayRi0U5rdKz5KBabI86Jte07zhWe85V7p4Mdy//E=
X-Received: by 2002:a81:2e0e:: with SMTP id
	u14-v6mr6402273ywu.341.1529344133657; 
	Mon, 18 Jun 2018 10:48:53 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:bf83:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 10:48:53
	-0700 (PDT)
In-Reply-To: <CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Jun 2018 13:48:53 -0400
X-Google-Sender-Auth: cu28tpqBc5p8UOfoKMgyY3lB8-I
Message-ID: <CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 18 Jun 2018 17:48:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 1:15 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Mon, Jun 18, 2018 at 1:07 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>> On Monday, June 18, 2018 12:51:47 PM EDT Andreas M=C3=BCller wrote:
>>> On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
>>>
>>> <mark.asselstine@windriver.com> wrote:
>>> > Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] we
>>> >
>>> > are getting a QA Warnings/Erros for 'installed-vs-shipped':
>>> >     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
>>> >
>>> >     Files/directories were installed but not shipped in any package:
>>> >       /usr/lib64/xfce4/panel/plugins/liblauncher.la
>>> >       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
>>> >       ...
>>> >
>>> > From various OE documents the .la files should not be packaged in
>>> > either the main recipe package or the -dev package unless required. S=
o
>>> > inherit 'remove-libtool' to have all the .la files cleaned up as they
>>> > don't appear to be necessary.
>>> >
>>> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>> > ---
>>> >
>>> > This error is currently only seen on master-next since the xfce4-pane=
l
>>> > upgrade commit is yet to make it into master. As such this fix is onl=
y
>>> > applicable to master-next.
>>>
>>> I think it was not the upgrade -> 4.13.3 commit but later commit / same
>>> series
>>>
>>
>> Sure, I can update the commit log and send a V2 but first let's sort out=
 the
>> remainder.
>>
>>> various classes recipes: Remove FILES entries for dbg/dev packages
>>> ...
>>> --- a/meta-xfce/classes/xfce.bbclass
>>> +++ b/meta-xfce/classes/xfce.bbclass
>>> @@ -12,11 +12,3 @@ DEPENDS +=3D "intltool-native"
>>>
>>>  FILES_${PN} +=3D "${datadir}/icons/* ${datadir}/applications/*
>>> ${libdir}/xfce4/modules/*.so*"
>>>  FILES_${PN}-doc +=3D "${datadir}/xfce4/doc"
>>> -
>>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*.la"
>>> -FILES_${PN}-dev +=3D "${libdir}/xfce4/*/*/*.la"
>>> ...
>>>
>>> My builds have remove-libtool enabled so I did not see this QA
>>> warning/error.
>>>
>>> Isn't remove-libtool enabled by default since pyro/2.3 - so that this
>>> patch is obsolete (and all the other same kind coming later)?
>>
>> The documentation still indicates:
>> ---
>> <note>
>>             The <filename>remove-libtool</filename> class is not enabled=
 by
>>             default.
>> </note>
>> ---
>>
>> So as far as I know this still needs to be handled recipe to recipe by
>> inheriting the remove-libtool class in the affected recipes. I have done
>> builds without manipulating the generated local.conf which seem to confi=
rm
>> this but I could be wrong. Add RP who might have some guidance.
>>
>> MarkA
>
> Just hit another one
> ---
> ERROR: gtk-xfce-engine-3.2.0-r0 do_package: QA Issue: gtk-xfce-engine:
> Files/directories were installed but not shipped in any package:
>  /usr/lib64/gtk-3.0/3.0.0/theming-engines/libxfce.la
>  /usr/lib64/gtk-2.0/2.10.0/engines/libxfce.la
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> ---
> Andreas, seeing as you didn't hit the 'installed-vs-shipped' QA issue
> with thunar recipe I suspect the reason you didn't see this is not
> related to remove-libtool but rather that you have disabled the
> 'installed-vs-shipped' QA check itself.

And xfce4-session now too. I found a reference from a few years back
related to remove-libtool use on a per recipe basis
(http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/1063=
23.html),
so definitely some concerns being expressed using this on a per recipe
basis. On the other hand this just seems like we are setting traps for
ourselves. If we compare to another common class, rm_work, I can
pretty much toggle rm_work on or off and recipes are expected to just
work in either case. This is definitely not the case with
remove-libtool which gives the impression of being optional but if not
enabled and I do basic QA checks I will get failures, as is evident in
my current build.

MarkA

>
> MarkA
>
>
>>
>>>
>>> Andreas
>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

