Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C28C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:25:57 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.154533.1692163548338159693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 22:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 8A276BC09;
	Wed, 16 Aug 2023 07:25:45 +0200 (CEST)
Received: from [192.168.178.58] ([84.163.44.168]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qW92O-2oVjMG0; Wed, 16 Aug 2023 07:25:44 +0200
Date: Wed, 16 Aug 2023 07:25:34 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe] [PATCH] fmt: upgrade 10.0.0 -> 10.1.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <MQXGZR.YTG3MCYKSB9U2@t-online.de>
In-Reply-To: <1692149636-4756-1-git-send-email-wangmy@fujitsu.com>
References: <1692149636-4756-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7bWjW078fdY6USAGhs4x"
X-TOI-EXPURGATEID: 150726::1692163544-2AFE3D37-D1501A8A/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c0339a7-a02d-4e55-a0cc-8654f2a9f851
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 05:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104408

--=-7bWjW078fdY6USAGhs4x
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi,
it looks like the fmt upgrade breaks mariadb build

On Wed, Aug 16 2023 at 09:33:56 AM +08:00:00, wangmy 
<wangmy@fujitsu.com> wrote:
> From: Wang Mingyu <wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>>
> 
> Changelog:
> =========
> * Optimized format string compilation resulting in up to 40% speed up 
> in
>   compiled "format_to" and ~4x speed up in compiled "format_to_n" on a
>   concatenation benchmark
> * Optimized storage of an empty allocator in "basic_memory_buffer"
> * Added formatters for proxy references to elements of 
> "std::vector<bool>" and
>   "std::bitset<N>"
> * Fixed an ambiguous formatter specialization for containers that 
> look like
>   container adaptors such as "boost::flat_set"
> * Fixed compilation when formatting durations not convertible from
>   "std::chrono::seconds"
> * Made the "formatter" specialization for "char*" const-correct
> * Made "{}" and "{:}" handled consistently during compile-time checks
> * Disallowed passing temporaries to "make_format_args" to improve API 
> safety
>   by preventing dangling references.
> * Improved the compile-time error for unformattable types
> * Improved the floating-point formatter
> * Fixed handling of precision for "long double" larger than 64 bits.
> * Made floating-point and chrono tests less platform-dependent
> * Removed the remnants of the Grisu floating-point formatter that has 
> been
>   replaced by Dragonbox in earlier versions.
> * Added "throw_format_error" to the public API
> * Made "FMT_THROW" assert even if assertions are disabled when 
> compiling with
>   exceptions disabled
> * Made "format_as" and "std::filesystem::path" formatter work with 
> exotic
>   code unit types.
> * Deprecated the wide stream overload of "printf".
> * Removed unused "basic_printf_parse_context".
> * Improved RTTI detection used when formatting exceptions
> * Improved compatibility with VxWorks7
> * Improved documentation
> * Improved build and CI configurations
> * Fixed various warnings and compilation issues
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com 
> <mailto:wangmy@fujitsu.com>>
> ---
>  meta-oe/recipes-support/fmt/{fmt_10.0.0.bb => fmt_10.1.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fmt/{fmt_10.0.0.bb => fmt_10.1.0.bb} 
> (90%)
> 
> diff --git a/meta-oe/recipes-support/fmt/fmt_10.0.0.bb 
> b/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
> similarity index 90%
> rename from meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> rename to meta-oe/recipes-support/fmt/fmt_10.1.0.bb
> index a8e6e563da..f8d7edcdfe 100644
> --- a/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
> @@ -5,7 +5,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729" 
> <file://license.rst;md5=b9257785fc4f3803a4b71b76c1412729/>
> 
>  SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
> -SRCREV = "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
> +SRCREV = "e57ca2e3685b160617d3d95fcd9e789c4e06ca88"
> 
>  S = "${WORKDIR}/git"
> 
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104369): 
> <https://lists.openembedded.org/g/openembedded-devel/message/104369>
> Mute This Topic: <https://lists.openembedded.org/mt/100771663/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-7bWjW078fdY6USAGhs4x
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hi,</div><div>it looks like the fmt upgrade breaks mariadb build</div></div><div id="geary-quote" dir="auto"><br>On Wed, Aug 16 2023 at 09:33:56 AM +08:00:00, wangmy &lt;wangmy@fujitsu.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">From: Wang Mingyu &lt;<a href="mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt;

Changelog:
=========
* Optimized format string compilation resulting in up to 40% speed up in
  compiled "format_to" and ~4x speed up in compiled "format_to_n" on a
  concatenation benchmark
* Optimized storage of an empty allocator in "basic_memory_buffer"
* Added formatters for proxy references to elements of "std::vector&lt;bool&gt;" and
  "std::bitset&lt;N&gt;"
* Fixed an ambiguous formatter specialization for containers that look like
  container adaptors such as "boost::flat_set"
* Fixed compilation when formatting durations not convertible from
  "std::chrono::seconds"
* Made the "formatter" specialization for "char*" const-correct
* Made "{}" and "{:}" handled consistently during compile-time checks
* Disallowed passing temporaries to "make_format_args" to improve API safety
  by preventing dangling references.
* Improved the compile-time error for unformattable types
* Improved the floating-point formatter
* Fixed handling of precision for "long double" larger than 64 bits.
* Made floating-point and chrono tests less platform-dependent
* Removed the remnants of the Grisu floating-point formatter that has been
  replaced by Dragonbox in earlier versions.
* Added "throw_format_error" to the public API
* Made "FMT_THROW" assert even if assertions are disabled when compiling with
  exceptions disabled
* Made "format_as" and "std::filesystem::path" formatter work with exotic
  code unit types.
* Deprecated the wide stream overload of "printf".
* Removed unused "basic_printf_parse_context".
* Improved RTTI detection used when formatting exceptions
* Improved compatibility with VxWorks7
* Improved documentation
* Improved build and CI configurations
* Fixed various warnings and compilation issues

Signed-off-by: Wang Mingyu &lt;<a href="mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt;
---
 meta-oe/recipes-support/fmt/{fmt_10.0.0.bb =&gt; fmt_10.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_10.0.0.bb =&gt; fmt_10.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_10.0.0.bb b/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_10.0.0.bb
rename to meta-oe/recipes-support/fmt/fmt_10.1.0.bb
index a8e6e563da..f8d7edcdfe 100644
--- a/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729" "="">file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729"</a>
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
+SRCREV = "e57ca2e3685b160617d3d95fcd9e789c4e06ca88"
 
 S = "${WORKDIR}/git"
 
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104369): <a href="https://lists.openembedded.org/g/openembedded-devel/message/104369">https://lists.openembedded.org/g/openembedded-devel/message/104369</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/100771663/3618223">https://lists.openembedded.org/mt/100771663/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-7bWjW078fdY6USAGhs4x--


