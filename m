Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA03871D9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 15:33:24 +0000 (UTC)
Received: from [192.168.1.13] (114-44-143-118.dynamic.hinet.net
	[114.44.143.118])
	by msfrf2631.sfr.fr (SMTP Server) with ESMTP id E1D371C001C2A;
	Thu,  2 Feb 2017 16:33:24 +0100 (CET)
Received: from [192.168.1.13] (114-44-143-118.dynamic.hinet.net
	[114.44.143.118])	(using TLSv1
	with cipher ECDHE-RSA-AES256-SHA (256/256 bits))	(No client certificate
	requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2631.sfr.fr (SMTP Server) with ESMTPSA;
	Thu,  2 Feb 2017 16:33:23 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
Mime-Version: 1.0 (1.0)
From: Herve Jourdain <herve.jourdain@neuf.fr>
X-Mailer: iPhone Mail (14C92)
In-Reply-To: <8a8cfdfa-a4bd-186d-cf2f-3c4b85e97444@igalia.com>
Date: Thu, 2 Feb 2017 23:33:18 +0800
Message-Id: <6D9FE7AD-421A-4989-AB98-68A80D401138@neuf.fr>
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
	<417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
	<021701d27d52$70efce00$52cf6a00$@neuf.fr>
	<8a8cfdfa-a4bd-186d-cf2f-3c4b85e97444@igalia.com>
To: Jacobo Aragunde =?iso-8859-1?b?UOlyZXo=?= <jaragunde@igalia.com>
X-sfr-mailing: LEGIT
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
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
X-List-Received-Date: Thu, 02 Feb 2017 15:33:26 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: quoted-printable

Hi Jacobo,

OK, I will send those extra patched to the meta-raspberry list tomorrow then=
.

Cheers,
Herve

> On 2 Feb 2017, at 21:28, Jacobo Aragunde P=A8=A6rez <jaragunde@igalia.com>=
 wrote:
>=20
>> On 02/02/17 13:46, Herve Jourdain wrote:
>> Hi Jacobo,
>>=20
>> I'm using "master", and I do have patches for enabling armv7ve. But since=

>> they're needed only for raspberrypi, I planned to submit them only for
>> meta-raspberrypi.
>> If you think it could be useful in meta-browser, though, I can submit the=
m there.
>>=20
>=20
> Oh, I think sending them to meta-rpi would be good enough, thank you!
> I'll keep an eye on it.
>=20
> Best regards,
> --=20
> Jacobo Aragunde
> Software Engineer at Igalia
>=20
>=20
>> -----Original Message-----
>> From: Jacobo Aragunde P=A8=A6rez [mailto:jaragunde@igalia.com]=20
>> Sent: jeudi 2 f=A8=A6vrier 2017 13:30
>> To: openembedded-devel@lists.openembedded.org
>> Cc: otavio@ossystems.com.br; Herve Jourdain <herve.jourdain@neuf.fr>
>> Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation prob=
lem on non-X11 builds
>>=20
>> Thank you all for your reviews. This should be the last patch, it address=
es Herve's problem when building on a Raspberry Pi.
>>=20
>> Unfortunately, I haven't been able to reproduce his problem myself, but t=
his patch is actually a backport of an upstream patch, so it makes no harm i=
n my opinion.
>>=20
>> Another question, are you using krogoth in you rpi build? I found problem=
s with the declared architecture in releases newer than jethro, it is called=
 "armv7ve" and chromium doesn't build because it expects "armv7a". We could u=
se a patch if you have worked around this problem :)
>>=20
>> Thanks again,
>> --
>> Jacobo Aragunde
>> Software Engineer at Igalia
>>=20
>>=20
>>> On 02/02/17 13:17, Jacobo Aragunde P=A8=A6rez wrote:
>>> Certain build configurations enable a code path that includes
>>> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
>>> environments because of a missing patch that is present upstream.
>>>=20
>>> This commit adds the missing patch from
>>> https://codereview.chromium.org/2239833003
>>>=20
>>> There are two versions of the patch in the code review URL above.
>>> The first version fixes the problem both under the gyp and GN build
>>> systems. That patch was rejected because gyp is considered deprecated
>>> upstream. The second version fixes the problem only on GN and it was
>>> merged upstream. We are picking the first version because our recipes
>>> still use gyp to build.
>>>=20
>>> Signed-off-by: Jacobo Aragunde P=A8=A6rez <jaragunde@igalia.com>
>>> ---
>>> .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>>> .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 ++++++++++++++++=
++++++
>>> 2 files changed, 52 insertions(+)
>>> create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/fi=
x-non-x11-build-when-use_xkbcommon-1.patch
>>>=20
>>> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b=
/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>> index a75918b..ef913a7 100644
>>> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>> @@ -13,6 +13,7 @@ SRC_URI +=3D "\
>>>         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patc=
h \
>>>         file://chromium-wayland/remove-Werror.patch \
>>>         file://chromium-wayland/guard-x11_desktop_handler-inclusion.patc=
h \
>>> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.=
patch \
>>>         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file:/=
/component-build.gypi', '', d)} \
>>>         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'fi=
le://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \=

>>> "
>>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-=
x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/chromium/chr=
omium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>> new file mode 100644
>>> index 0000000..976ece9
>>> --- /dev/null
>>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-bui=
ld-when-use_xkbcommon-1.patch
>>> @@ -0,0 +1,51 @@
>>> +From: jbriance <jbriance@cisco.com>
>>> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=3D1
>>> +
>>> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
>>> +use_xkbcommon=3D1 is set because USE_XKBCOMMON is not defined, leading
>>> +to the following compilation error in this case:
>>> +
>>> +  In file included from ../../ui/events/keycodes/keyboard_code_conversi=
on_xkb.h:12:0,
>>> +                   from ../../ui/events/keycodes/keyboard_code_conversi=
on_xkb.cc:5:
>>> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: No=
 such file or directory
>>> +
>>> +BUG=3Dnone
>>> +
>>> +Review-Url: https://codereview.chromium.org/2239833003
>>> +--
>>> +
>>> +Index: ui/events/keycodes/BUILD.gn
>>> +diff --git a/ui/events/keycodes/BUILD.gn b/ui/events/keycodes/BUILD.gn
>>> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a=
5062e7c6e0adc6e48 100644
>>> +--- a/ui/events/keycodes/BUILD.gn
>>> ++++ b/ui/events/keycodes/BUILD.gn
>>> +@@ -17,6 +17,10 @@ source_set("xkb") {
>>> +     "//base",
>>> +     "//ui/events:dom_keycode_converter",
>>> +   ]
>>> ++
>>> ++  if (use_xkbcommon) {
>>> ++    defines =3D [ "USE_XKBCOMMON" ]
>>> ++  }
>>> + }
>>> +=20
>>> + if (use_x11 || ozone_platform_x11) {
>>> +Index: ui/events/keycodes/events_keycodes.gyp
>>> +diff --git a/ui/events/keycodes/events_keycodes.gyp b/ui/events/keycode=
s/events_keycodes.gyp
>>> +index b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca9962=
4b6c489c7835f6241 100644
>>> +--- a/ui/events/keycodes/events_keycodes.gyp
>>> ++++ b/ui/events/keycodes/events_keycodes.gyp
>>> +@@ -21,6 +21,13 @@
>>> +         'scoped_xkb.h',
>>> +         'xkb_keysym.h',
>>> +       ],
>>> ++      'conditions': [
>>> ++        ['use_xkbcommon=3D=3D1', {
>>> ++          'defines': [
>>> ++            'USE_XKBCOMMON',
>>> ++          ],
>>> ++        }],
>>> ++      ],
>>> +     },
>>> +   ],
>>> +   'conditions': [
>>>=20
>>=20
>>=20


