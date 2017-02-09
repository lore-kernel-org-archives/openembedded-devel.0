Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id EF68A71C14
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 18:53:06 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AP/thchcN5c3kizNopWZnl3lplGMj4u6mDksu8pMi?=
	=?us-ascii?q?zoh2WeGdxcW7Zx7h7PlgxGXEQZ/co6odzbGH7+awBCdRud6oizMrSNR0TRgLiM?=
	=?us-ascii?q?EbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVr?=
	=?us-ascii?q?O+/7BpDdj9it1+C15pbffxhEiCCzbL52Ixi6twbcu8kZjYZmNqo61wfErGZPd+?=
	=?us-ascii?q?lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2466svrtQLe?=
	=?us-ascii?q?TQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms86tnVBnlgz?=
	=?us-ascii?q?oBOjUk8m/Yl9ZwgbpGrhy/qRxxw43abo+bO/VxfKzSYdwUSHFdXstSTSFNHp+w?=
	=?us-ascii?q?YoUNAucHIO1Wr5P9p1wLrRamAQejHv/gyjhTiX/xxaI3z/4hHhvJ3Aw9GdIBrW?=
	=?us-ascii?q?rbo83vOqAIS+C60qjJxijEYvNUwzj98pLHch88ofGKQL1/b9HcyUggFwzfilWQ?=
	=?us-ascii?q?qJbqMymJ2eQKtmiW9uxtXv+hhW4grgF+uDmvxsE0h4bVhoIV0FfE9SB4wIYoIN?=
	=?us-ascii?q?20Ukl7YcSrEJZWqiqUNJN2T9smTm11oio216AKtJyhcCUOzJkr3QPTZvyHfoWO?=
	=?us-ascii?q?/xntTvyeIS1ii3JgYL+/ghGy/lW+xeDkTcm01UpKrjJCktnRqnABzxzT5daDSv?=
	=?us-ascii?q?t65kqh1yyA1wbS6+FFJ0A7i7DXK58uwrEqkpoTsF7MEjXql0Xxia+abkQk+u62?=
	=?us-ascii?q?5OT7erjrooKQO5Vphg3jMKkigMiyDOAiPgQTX2WW+fyw1Lj58k34RLVKgOc2kq?=
	=?us-ascii?q?7csJ3CJ8QUvLS5DBVa0oY+7RawEimp3c8ZnXkINl1FfBOHgJLzN17SJ/D4CO+z?=
	=?us-ascii?q?g06wnzdz2/DGIrrhD43KLnjfirjhY7d960lHxQo01tBf/JJVCqodIP3tX0/xr8?=
	=?us-ascii?q?bUAQM+Mwyx2eroE8993JsEWW2TGq+ZLL/SsViQ6+IoO+mDeokVtyj4K/c++fHh?=
	=?us-ascii?q?kGI2lkEAcqWwwJQYdm64EepiI0iCZXrsg8wBEXsRvgYkS+zqkEONUThNaHa3RK?=
	=?us-ascii?q?0z+Cw0B5+4AojeXIyth6aB3CjoVqFRM2deB1aBFH3le4mJV7IAZTyfJudlkycY?=
	=?us-ascii?q?Tv6mU4In2BSkuQP2xrYhKfDbqQMCspe29tF+4OfUojgo/DNpCciQ5FkMVWxm1j?=
	=?us-ascii?q?cKTiU/0715rUFVy1iK1alxxfdfEIoAtLtyTg4mOMuEnKRBANfoV1eZcw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CUFwCvuZxY/5tjdVtdRwEXAQYBgxphK?=
	=?us-ascii?q?l+DWYp6kReTJ4I3GYFMKoJCgzYCgmtDFAEBAQEBAQEBAQEBYSiCMxmCHQEBAQE?=
	=?us-ascii?q?DIw8BRhALFQIBAgImAgJPCBMGAgEBiXQBCbANgiWLVQEBAQEBAQQBAQEBAQEBI?=
	=?us-ascii?q?YELhUGCBYJqhyA6gl8FiR2HbIRLhh6Gb4slgk6ON5MVNiF+T4VLgUk/NQEBiXk?=
	=?us-ascii?q?BAQE?=
X-IPAS-Result: =?us-ascii?q?A2CUFwCvuZxY/5tjdVtdRwEXAQYBgxphKl+DWYp6kReTJ4I?=
	=?us-ascii?q?3GYFMKoJCgzYCgmtDFAEBAQEBAQEBAQEBYSiCMxmCHQEBAQEDIw8BRhALFQIBA?=
	=?us-ascii?q?gImAgJPCBMGAgEBiXQBCbANgiWLVQEBAQEBAQQBAQEBAQEBIYELhUGCBYJqhyA?=
	=?us-ascii?q?6gl8FiR2HbIRLhh6Gb4slgk6ON5MVNiF+T4VLgUk/NQEBiXkBAQE?=
X-IronPort-AV: E=Sophos;i="5.35,137,1484002800"; d="scan'208";a="159232643"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 09 Feb 2017 19:53:04 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cbtq4-000105-VS; Thu, 09 Feb 2017 19:53:05 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cbtq4-0001Nk-Sv; Thu, 09 Feb 2017 19:53:04 +0100
To: openembedded-devel@lists.openembedded.org
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <8c9a3487-7ec9-b389-6b7c-abdea7589210@igalia.com>
Date: Thu, 9 Feb 2017 19:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
Cc: otavio@ossystems.com.br
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
X-List-Received-Date: Thu, 09 Feb 2017 18:53:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi again!

I've finally been able to reproduce the problem and acknowledge the
patch fixes it.

It should affect any build that doesn't contain X11 libs, in my case it
was the GENIVI platform for a Minnowboard. I don't even know how I
didn't trigger it before.

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia


On 02/02/17 13:17, Jacobo Aragunde Pérez wrote:
> Certain build configurations enable a code path that includes
> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
> environments because of a missing patch that is present upstream.
> 
> This commit adds the missing patch from
> https://codereview.chromium.org/2239833003
> 
> There are two versions of the patch in the code review URL above.
> The first version fixes the problem both under the gyp and GN build
> systems. That patch was rejected because gyp is considered deprecated
> upstream. The second version fixes the problem only on GN and it was
> merged upstream. We are picking the first version because our recipes
> still use gyp to build.
> 
> Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
> ---
>  .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>  .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> 
> diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> index a75918b..ef913a7 100644
> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> @@ -13,6 +13,7 @@ SRC_URI += "\
>          file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>          file://chromium-wayland/remove-Werror.patch \
>          file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
> +        file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
>  "
> diff --git a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> new file mode 100644
> index 0000000..976ece9
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch
> @@ -0,0 +1,51 @@
> +From: jbriance <jbriance@cisco.com>
> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=1
> +
> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
> +use_xkbcommon=1 is set because USE_XKBCOMMON is not defined, leading
> +to the following compilation error in this case:
> +
> +  In file included from ../../ui/events/keycodes/keyboard_code_conversion_xkb.h:12:0,
> +                   from ../../ui/events/keycodes/keyboard_code_conversion_xkb.cc:5:
> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: No such file or directory
> +
> +BUG=none
> +
> +Review-Url: https://codereview.chromium.org/2239833003
> +--
> +
> +Index: ui/events/keycodes/BUILD.gn
> +diff --git a/ui/events/keycodes/BUILD.gn b/ui/events/keycodes/BUILD.gn
> +index 4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a5062e7c6e0adc6e48 100644
> +--- a/ui/events/keycodes/BUILD.gn
> ++++ b/ui/events/keycodes/BUILD.gn
> +@@ -17,6 +17,10 @@ source_set("xkb") {
> +     "//base",
> +     "//ui/events:dom_keycode_converter",
> +   ]
> ++
> ++  if (use_xkbcommon) {
> ++    defines = [ "USE_XKBCOMMON" ]
> ++  }
> + }
> + 
> + if (use_x11 || ozone_platform_x11) {
> +Index: ui/events/keycodes/events_keycodes.gyp
> +diff --git a/ui/events/keycodes/events_keycodes.gyp b/ui/events/keycodes/events_keycodes.gyp
> +index b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca99624b6c489c7835f6241 100644
> +--- a/ui/events/keycodes/events_keycodes.gyp
> ++++ b/ui/events/keycodes/events_keycodes.gyp
> +@@ -21,6 +21,13 @@
> +         'scoped_xkb.h',
> +         'xkb_keysym.h',
> +       ],
> ++      'conditions': [
> ++        ['use_xkbcommon==1', {
> ++          'defines': [
> ++            'USE_XKBCOMMON',
> ++          ],
> ++        }],
> ++      ],
> +     },
> +   ],
> +   'conditions': [
> 


