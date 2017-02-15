Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 155F471E15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:39:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so9585703wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w/Rs6S5lMRIOQYc+iO+OxbsNhpgrJbbczov26NBNeDA=;
	b=P4bY0UvXLrW2KoUiFs3Epn1rv7Ey9GFH/9FBzjkph0Gu9xuHXn8eazMZ0+5K/GQqLV
	dYScm4gcCFL/XHaQndhZXyOiUB9A8ptvN/VdubOxyZFwM4GZ5UXWKV/AX+mSoKVG0pEN
	yapp2mWLgYTnUKLbd74bk+AX3EWL7Y6Welx+wl9BZguL1i0dARY057Ar1H/gkQOES2xi
	CmhuvvU9LLNFPE62m3kosUBcuDam1mlObZEyxeYrmevKwdMcUY1DJj7m/rPxDzhLPcGH
	pnPB/QVbpbZ078ie2AuvQwBfQdg90DOyo8jJu0xPQqx0lmf/Ccgpq8vOtJVG1NLnrQJe
	3rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w/Rs6S5lMRIOQYc+iO+OxbsNhpgrJbbczov26NBNeDA=;
	b=l0cCrrz2siaq2+IuE3EsvrO1xhzYJWAezNcE5gnjnAQ/0S1lTckVlz4FV8hs1DDbw7
	+KIj8Uw9vK3N4b+h6EjlfpmmUIRjhP3+YBafdzJKC1VvctXPyYFVMhnBlM6z8cTvobEo
	qyDAMQw76jGgoxMbf1lkzicinmbrqgkLOf+3O3yp6keMIXclHV2UIXNcECUOVrl162Gp
	6Neun/AxLIfAwtlDdiHTfyJ/F6Ii4WgatQtdP8pEhHKSxvCJqoBBKEtpO8fMMxFVw/x1
	+cfhineyWENMLfuGWoHphcjyVdfbvLpuoHYz/J08DTpovs19hZStYv+G+GPkNq2HNBuX
	v/gw==
X-Gm-Message-State: AMke39nkfYZ3BTM/FWMKZujZnvtA10h91w3Dw7mjTFh/2CYf1icL4trMMWYGA3kdaeo48+yGSpBO7npn+iQ1ug==
X-Received: by 10.28.96.130 with SMTP id u124mr9685040wmb.81.1487183944777;
	Wed, 15 Feb 2017 10:39:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 15 Feb 2017 10:39:04 -0800 (PST)
In-Reply-To: <d8323c70-d699-8cea-9962-4becc79ead74@igalia.com>
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
	<417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
	<021701d27d52$70efce00$52cf6a00$@neuf.fr>
	<8a8cfdfa-a4bd-186d-cf2f-3c4b85e97444@igalia.com>
	<6D9FE7AD-421A-4989-AB98-68A80D401138@neuf.fr>
	<d8323c70-d699-8cea-9962-4becc79ead74@igalia.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2017 19:39:04 +0100
Message-ID: <CA+chaQdiXjSFu0VAv9RSQtuonbOv-sOb9HyWsucpLHR4YkN6rg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation problem on non-X11 builds
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
X-List-Received-Date: Wed, 15 Feb 2017 18:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It still fails for qemux86 as reported in:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/11=
1221.html

can someone please look into it?

On Wed, Feb 15, 2017 at 7:17 PM, Jacobo Aragunde P=C3=A9rez <jaragunde@igal=
ia.com
> wrote:

> Hi everyone!
>
> The patch in this thread has been recently merged. Thanks for your review=
!
>
> On 02/02/17 16:33, Herve Jourdain wrote:
> > Hi Jacobo,
> >
> > OK, I will send those extra patched to the meta-raspberry list tomorrow
> then.
> >
>
> Sorry to ping you again on this, Herve O:-) I haven't found your patches
> around in yocto ML and I would like to try them. May I be following the
> wrong ML?
>
> Thanks in advance,
> --
> Jacobo Aragunde
> Software Engineer at Igalia
>
>
> >> On 2 Feb 2017, at 21:28, Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.=
com>
> wrote:
> >>
> >>> On 02/02/17 13:46, Herve Jourdain wrote:
> >>> Hi Jacobo,
> >>>
> >>> I'm using "master", and I do have patches for enabling armv7ve. But
> since
> >>> they're needed only for raspberrypi, I planned to submit them only fo=
r
> >>> meta-raspberrypi.
> >>> If you think it could be useful in meta-browser, though, I can submit
> them there.
> >>>
> >>
> >> Oh, I think sending them to meta-rpi would be good enough, thank you!
> >> I'll keep an eye on it.
> >>
> >> Best regards,
> >> --
> >> Jacobo Aragunde
> >> Software Engineer at Igalia
> >>
> >>
> >>> -----Original Message-----
> >>> From: Jacobo Aragunde P=C3=A9rez [mailto:jaragunde@igalia.com]
> >>> Sent: jeudi 2 f=C3=A9vrier 2017 13:30
> >>> To: openembedded-devel@lists.openembedded.org
> >>> Cc: otavio@ossystems.com.br; Herve Jourdain <herve.jourdain@neuf.fr>
> >>> Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation
> problem on non-X11 builds
> >>>
> >>> Thank you all for your reviews. This should be the last patch, it
> addresses Herve's problem when building on a Raspberry Pi.
> >>>
> >>> Unfortunately, I haven't been able to reproduce his problem myself,
> but this patch is actually a backport of an upstream patch, so it makes n=
o
> harm in my opinion.
> >>>
> >>> Another question, are you using krogoth in you rpi build? I found
> problems with the declared architecture in releases newer than jethro, it
> is called "armv7ve" and chromium doesn't build because it expects "armv7a=
".
> We could use a patch if you have worked around this problem :)
> >>>
> >>> Thanks again,
> >>> --
> >>> Jacobo Aragunde
> >>> Software Engineer at Igalia
> >>>
> >>>
> >>>> On 02/02/17 13:17, Jacobo Aragunde P=C3=A9rez wrote:
> >>>> Certain build configurations enable a code path that includes
> >>>> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
> >>>> environments because of a missing patch that is present upstream.
> >>>>
> >>>> This commit adds the missing patch from
> >>>> https://codereview.chromium.org/2239833003
> >>>>
> >>>> There are two versions of the patch in the code review URL above.
> >>>> The first version fixes the problem both under the gyp and GN build
> >>>> systems. That patch was rejected because gyp is considered deprecate=
d
> >>>> upstream. The second version fixes the problem only on GN and it was
> >>>> merged upstream. We are picking the first version because our recipe=
s
> >>>> still use gyp to build.
> >>>>
> >>>> Signed-off-by: Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com>
> >>>> ---
> >>>> .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
> >>>> .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51
> ++++++++++++++++++++++
> >>>> 2 files changed, 52 insertions(+)
> >>>> create mode 100644 recipes-browser/chromium/
> chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> >>>>
> >>>> diff --git a/recipes-browser/chromium/chr
> omium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chr
> omium-wayland_53.0.2785.143.bb
> >>>> index a75918b..ef913a7 100644
> >>>> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> >>>> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> >>>> @@ -13,6 +13,7 @@ SRC_URI +=3D "\
> >>>>         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.=
patch
> \
> >>>>         file://chromium-wayland/remove-Werror.patch \
> >>>>         file://chromium-wayland/guard-x11_desktop_handler-inclusion.=
patch
> \
> >>>> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommo=
n-1.patch
> \
> >>>>         ${@bb.utils.contains('PACKAGECONFIG', 'component-build',
> 'file://component-build.gypi', '', d)} \
> >>>>         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context',
> 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '',
> d)} \
> >>>> "
> >>>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-
> non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/
> chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> >>>> new file mode 100644
> >>>> index 0000000..976ece9
> >>>> --- /dev/null
> >>>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-
> non-x11-build-when-use_xkbcommon-1.patch
> >>>> @@ -0,0 +1,51 @@
> >>>> +From: jbriance <jbriance@cisco.com>
> >>>> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=3D1
> >>>> +
> >>>> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even i=
f
> >>>> +use_xkbcommon=3D1 is set because USE_XKBCOMMON is not defined, lead=
ing
> >>>> +to the following compilation error in this case:
> >>>> +
> >>>> +  In file included from ../../ui/events/keycodes/
> keyboard_code_conversion_xkb.h:12:0,
> >>>> +                   from ../../ui/events/keycodes/
> keyboard_code_conversion_xkb.cc:5:
> >>>> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error:
> X11/X.h: No such file or directory
> >>>> +
> >>>> +BUG=3Dnone
> >>>> +
> >>>> +Review-Url: https://codereview.chromium.org/2239833003
> >>>> +--
> >>>> +
> >>>> +Index: ui/events/keycodes/BUILD.gn
> >>>> +diff --git a/ui/events/keycodes/BUILD.gn
> b/ui/events/keycodes/BUILD.gn
> >>>> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..
> 716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
> >>>> +--- a/ui/events/keycodes/BUILD.gn
> >>>> ++++ b/ui/events/keycodes/BUILD.gn
> >>>> +@@ -17,6 +17,10 @@ source_set("xkb") {
> >>>> +     "//base",
> >>>> +     "//ui/events:dom_keycode_converter",
> >>>> +   ]
> >>>> ++
> >>>> ++  if (use_xkbcommon) {
> >>>> ++    defines =3D [ "USE_XKBCOMMON" ]
> >>>> ++  }
> >>>> + }
> >>>> +
> >>>> + if (use_x11 || ozone_platform_x11) {
> >>>> +Index: ui/events/keycodes/events_keycodes.gyp
> >>>> +diff --git a/ui/events/keycodes/events_keycodes.gyp
> b/ui/events/keycodes/events_keycodes.gyp
> >>>> +index b0796b4e2ead8bffe88fb01ed136814be505d967..
> 248e961bad2ad3996ca99624b6c489c7835f6241 100644
> >>>> +--- a/ui/events/keycodes/events_keycodes.gyp
> >>>> ++++ b/ui/events/keycodes/events_keycodes.gyp
> >>>> +@@ -21,6 +21,13 @@
> >>>> +         'scoped_xkb.h',
> >>>> +         'xkb_keysym.h',
> >>>> +       ],
> >>>> ++      'conditions': [
> >>>> ++        ['use_xkbcommon=3D=3D1', {
> >>>> ++          'defines': [
> >>>> ++            'USE_XKBCOMMON',
> >>>> ++          ],
> >>>> ++        }],
> >>>> ++      ],
> >>>> +     },
> >>>> +   ],
> >>>> +   'conditions': [
> >>>>
> >>>
> >>>
> >
> >
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

