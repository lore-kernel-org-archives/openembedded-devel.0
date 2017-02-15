Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 7B19C71E16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:18:11 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3Aq5NsShKer1gT557kndmcpTZWNBhigK39O0sv0rFi?=
	=?us-ascii?q?tYgXKvj4rarrMEGX3/hxlliBBdydsKMZzbKM+Pm4CCQp2tWoiDg6aptCVhsI24?=
	=?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
	=?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9GiTe5Yb5+Ngm6oRveusULnYdvLrs6xwfUrHdPZ+?=
	=?us-ascii?q?lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2465MvwtRne?=
	=?us-ascii?q?VgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVzmu87tnRRn1gy?=
	=?us-ascii?q?ocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSWZEWMtaSi5PDZ6m?=
	=?us-ascii?q?b4YXEuQPI+hYoYn+qVUAoxSxCgujC//gxDJTmn/73rc33/g9HQzIwAItGc8Fvn?=
	=?us-ascii?q?TOrNXyMacfSeS7w7PUwjXEdPxW3i/y5ZTSch87rvGMQLRwftfPxkY3DQ3ClE+Q?=
	=?us-ascii?q?ppLkPjiI0ekNsXKU7/B6WuKglm4nrRx+rSa0y8cthYnGnIYVylHe+ilj3Ik1It?=
	=?us-ascii?q?i4RVd9bNW5HpVQsCSaOJF3QsMkW2xnpCY6yqcBuZ6+fSgK1ZEnywTYa/ydfIiF?=
	=?us-ascii?q?5A/oWuWJITpggH9pZaiziwuv/UWi0OHxUs253ExXoidFktTArnIA2h7J5sSZRP?=
	=?us-ascii?q?Zx412t1SuL2gzN8O1JI144mKzGIJA72LEwjIAcsUHbEy/zn0X5kbGZe10/+uit?=
	=?us-ascii?q?9+TnerLmpoKAN4NsigHxLKAumsunDOQ2KAcOWWma+eW61LL950H5QbpKgecykq?=
	=?us-ascii?q?nYqp/WP9gUpqm8AwNN04Yj7QiwDyu+3dkcgHULNk9JdA+FgoTzP1zDJOr0Aeq/?=
	=?us-ascii?q?jlmsiDtrwurJPrzlApXDNHjDl7LhcK5/60FG0go8199f549SCr4cPv3+QU7xtN?=
	=?us-ascii?q?PCAR89Mgy72fzrB8l61oMbQW6PGLOWMLvOsV+U4eIiO+6MZJMPtzbjKvgl4OXj?=
	=?us-ascii?q?jXgimV8GfaipxocXZ269HvR9OUmWfX3sgtIbHWgRpAo0VPbqh0GaUT5Pe3ayWL?=
	=?us-ascii?q?ox5jYjCI24C4fMWIWtj6ef0yimA5JZeH1JBkmRHnj2aYWLRfMMZTmWIs9giTwE?=
	=?us-ascii?q?SaOhR5Um1RG2qgD6zaRoLu/P9SIGqJ3sycZ66PDJmRE17zx0ANyX03uRQGFsgm?=
	=?us-ascii?q?MIWzg20bh/oUNj0FeDz7Z3j+ZaFdxU+vNJSBo1OoTdz+x8EN3yXBzOfsqHSFq8?=
	=?us-ascii?q?TNWmG2J5ctVk49IUfUs1OdK/lBzK3iziV78YjaKGQp4z77jQ1nn3D8Bw1niA2r?=
	=?us-ascii?q?N33Hc8Rc4aF2StgaR4wCHJDoHUlUmUoJ4rb6kOlHrP/X2KwneIsExwUQF5VaTM?=
	=?us-ascii?q?G3sYYx2F/pzC+kreQur2WvwcOQxbxJvHc/MSZw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2C2DAD/mqRY/5tjdVteGwEBAQMBAQEJA?=
	=?us-ascii?q?QEBFgEBAQMBAQEJAQEBgydhA4EGg1mbeR+XOwcfC4JCgzYCghRDFAEBAQEBAQE?=
	=?us-ascii?q?BAQEBYSiCMyIBghoBAQEBAgEBMQFGDAQLEQEDAQEBBCMFAigeAwYIBg0GAgEBi?=
	=?us-ascii?q?V8MAQmSTZ1ICIIjizYBAQEBAQEBAQEBAQEBAQEBAQEBH4EHhUaCBQiCYocgNoJ?=
	=?us-ascii?q?jBYkeh2yES4Yihm+GC4Uagk6HcYZHkxc2IYEAUVKEe4FJdAEBik8BAQE?=
X-IPAS-Result: =?us-ascii?q?A2C2DAD/mqRY/5tjdVteGwEBAQMBAQEJAQEBFgEBAQMBAQE?=
	=?us-ascii?q?JAQEBgydhA4EGg1mbeR+XOwcfC4JCgzYCghRDFAEBAQEBAQEBAQEBYSiCMyIBg?=
	=?us-ascii?q?hoBAQEBAgEBMQFGDAQLEQEDAQEBBCMFAigeAwYIBg0GAgEBiV8MAQmSTZ1ICII?=
	=?us-ascii?q?jizYBAQEBAQEBAQEBAQEBAQEBAQEBH4EHhUaCBQiCYocgNoJjBYkeh2yES4Yih?=
	=?us-ascii?q?m+GC4Uagk6HcYZHkxc2IYEAUVKEe4FJdAEBik8BAQE?=
X-IronPort-AV: E=Sophos;i="5.35,166,1484002800"; d="scan'208";a="160930453"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Feb 2017 19:18:10 +0100
Received: from [77.231.192.72] (helo=[192.168.1.5])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1ce49Z-0001pM-RN; Wed, 15 Feb 2017 19:18:10 +0100
To: Herve Jourdain <herve.jourdain@neuf.fr>
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
	<417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
	<021701d27d52$70efce00$52cf6a00$@neuf.fr>
	<8a8cfdfa-a4bd-186d-cf2f-3c4b85e97444@igalia.com>
	<6D9FE7AD-421A-4989-AB98-68A80D401138@neuf.fr>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <d8323c70-d699-8cea-9962-4becc79ead74@igalia.com>
Date: Wed, 15 Feb 2017 19:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <6D9FE7AD-421A-4989-AB98-68A80D401138@neuf.fr>
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
X-List-Received-Date: Wed, 15 Feb 2017 18:18:14 -0000
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit

Hi everyone!

The patch in this thread has been recently merged. Thanks for your review!

On 02/02/17 16:33, Herve Jourdain wrote:
> Hi Jacobo,
> 
> OK, I will send those extra patched to the meta-raspberry list tomorrow then.
> 

Sorry to ping you again on this, Herve O:-) I haven't found your patches
around in yocto ML and I would like to try them. May I be following the
wrong ML?

Thanks in advance,
-- 
Jacobo Aragunde
Software Engineer at Igalia


>> On 2 Feb 2017, at 21:28, Jacobo Aragunde P¨¦rez <jaragunde@igalia.com> wrote:
>>
>>> On 02/02/17 13:46, Herve Jourdain wrote:
>>> Hi Jacobo,
>>>
>>> I'm using "master", and I do have patches for enabling armv7ve. But since
>>> they're needed only for raspberrypi, I planned to submit them only for
>>> meta-raspberrypi.
>>> If you think it could be useful in meta-browser, though, I can submit them there.
>>>
>>
>> Oh, I think sending them to meta-rpi would be good enough, thank you!
>> I'll keep an eye on it.
>>
>> Best regards,
>> -- 
>> Jacobo Aragunde
>> Software Engineer at Igalia
>>
>>
>>> -----Original Message-----
>>> From: Jacobo Aragunde P¨¦rez [mailto:jaragunde@igalia.com] 
>>> Sent: jeudi 2 f¨¦vrier 2017 13:30
>>> To: openembedded-devel@lists.openembedded.org
>>> Cc: otavio@ossystems.com.br; Herve Jourdain <herve.jourdain@neuf.fr>
>>> Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation problem on non-X11 builds
>>>
>>> Thank you all for your reviews. This should be the last patch, it addresses Herve's problem when building on a Raspberry Pi.
>>>
>>> Unfortunately, I haven't been able to reproduce his problem myself, but this patch is actually a backport of an upstream patch, so it makes no harm in my opinion.
>>>
>>> Another question, are you using krogoth in you rpi build? I found problems with the declared architecture in releases newer than jethro, it is called "armv7ve" and chromium doesn't build because it expects "armv7a". We could use a patch if you have worked around this problem :)
>>>
>>> Thanks again,
>>> --
>>> Jacobo Aragunde
>>> Software Engineer at Igalia
>>>
>>>
>>>> On 02/02/17 13:17, Jacobo Aragunde P¨¦rez wrote:
>>>> Certain build configurations enable a code path that includes
>>>> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
>>>> environments because of a missing patch that is present upstream.
>>>>
>>>> This commit adds the missing patch from
>>>> https://codereview.chromium.org/2239833003
>>>>
>>>> There are two versions of the patch in the code review URL above.
>>>> The first version fixes the problem both under the gyp and GN build
>>>> systems. That patch was rejected because gyp is considered deprecated
>>>> upstream. The second version fixes the problem only on GN and it was
>>>> merged upstream. We are picking the first version because our recipes
>>>> still use gyp to build.
>>>>
>>>> Signed-off-by: Jacobo Aragunde P¨¦rez <jaragunde@igalia.com>
>>>> ---
>>>> .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>>>> .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 ++++++++++++++++++++++
>>>> 2 files changed, 52 insertions(+)
>>>> create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>>>
>>>> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>>> index a75918b..ef913a7 100644
>>>> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>>> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
>>>> @@ -13,6 +13,7 @@ SRC_URI += "\
>>>>         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>>>>         file://chromium-wayland/remove-Werror.patch \
>>>>         file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
>>>> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch \
>>>>         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>>>>         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>>>> "
>>>> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>>> new file mode 100644
>>>> index 0000000..976ece9
>>>> --- /dev/null
>>>> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
>>>> @@ -0,0 +1,51 @@
>>>> +From: jbriance <jbriance@cisco.com>
>>>> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=1
>>>> +
>>>> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
>>>> +use_xkbcommon=1 is set because USE_XKBCOMMON is not defined, leading
>>>> +to the following compilation error in this case:
>>>> +
>>>> +  In file included from ../../ui/events/keycodes/keyboard_code_conversion_xkb.h:12:0,
>>>> +                   from ../../ui/events/keycodes/keyboard_code_conversion_xkb.cc:5:
>>>> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: No such file or directory
>>>> +
>>>> +BUG=none
>>>> +
>>>> +Review-Url: https://codereview.chromium.org/2239833003
>>>> +--
>>>> +
>>>> +Index: ui/events/keycodes/BUILD.gn
>>>> +diff --git a/ui/events/keycodes/BUILD.gn b/ui/events/keycodes/BUILD.gn
>>>> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
>>>> +--- a/ui/events/keycodes/BUILD.gn
>>>> ++++ b/ui/events/keycodes/BUILD.gn
>>>> +@@ -17,6 +17,10 @@ source_set("xkb") {
>>>> +     "//base",
>>>> +     "//ui/events:dom_keycode_converter",
>>>> +   ]
>>>> ++
>>>> ++  if (use_xkbcommon) {
>>>> ++    defines = [ "USE_XKBCOMMON" ]
>>>> ++  }
>>>> + }
>>>> + 
>>>> + if (use_x11 || ozone_platform_x11) {
>>>> +Index: ui/events/keycodes/events_keycodes.gyp
>>>> +diff --git a/ui/events/keycodes/events_keycodes.gyp b/ui/events/keycodes/events_keycodes.gyp
>>>> +index b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca99624b6c489c7835f6241 100644
>>>> +--- a/ui/events/keycodes/events_keycodes.gyp
>>>> ++++ b/ui/events/keycodes/events_keycodes.gyp
>>>> +@@ -21,6 +21,13 @@
>>>> +         'scoped_xkb.h',
>>>> +         'xkb_keysym.h',
>>>> +       ],
>>>> ++      'conditions': [
>>>> ++        ['use_xkbcommon==1', {
>>>> ++          'defines': [
>>>> ++            'USE_XKBCOMMON',
>>>> ++          ],
>>>> ++        }],
>>>> ++      ],
>>>> +     },
>>>> +   ],
>>>> +   'conditions': [
>>>>
>>>
>>>
> 
> 



