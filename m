Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF503D41156
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:01:22 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32249.1768471279344472910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 6D382E97E
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 11:01:17 +0100 (CET)
Received: from [192.168.178.36] ([84.163.47.171]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgKAE-0SRjgu0; Thu, 15 Jan 2026 11:01:14 +0100
Date: Thu, 15 Jan 2026 11:01:09 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [RFC][meta-oe][PATCH] libtoml11: build with
 CMAKE_CXX_STANDARD 20
To: openembedded-devel@lists.openembedded.org
Message-Id: <X5HW8T.AHLKZAK448352@t-online.de>
In-Reply-To: <188ADEF99F4A855B.2595076@lists.openembedded.org>
References: <188ADEF99F4A855B.2595076@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1FFd0FsmYWQQ7WLYiM9h"
X-TOI-EXPURGATEID: 150726::1768471274-6DFF8973-643E72B0/0/0 CLEAN NORMAL
X-TOI-MSGID: 8cb00b40-a846-408e-ac3a-ed1cb3824100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 10:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123499

--=-1FFd0FsmYWQQ7WLYiM9h
Content-Type: text/plain; charset=us-ascii; format=flowed

By default, libtoml11 uses the C++11 standard. However, when building 
budgie-desktop-services, I get 'undefined reference to `std::enable_if' 
without having c++20 enabled. I flagged this RFC because I don't know 
if anyone relies on C++11.

On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb 
> b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> index 38786b79ed..973a39fc21 100644
> --- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> +++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -28,6 +28,7 @@ inherit cmake ptest
> 
>  EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
>                    -DTOML11_BUILD_TESTS=${@bb.utils.contains 
> <mailto:-DTOML11_BUILD_TESTS=${@bb.utils.contains>("DISTRO_FEATURES", 
> "ptest", "ON", "OFF", d)} \
> +                  -DCMAKE_CXX_STANDARD=20 \
>  "
> 
>  ALLOW_EMPTY:${PN} = "1"
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123498): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123498>
> Mute This Topic: <https://lists.openembedded.org/mt/117276714/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-1FFd0FsmYWQQ7WLYiM9h
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>By default, libtoml11 uses the C++11 standard. However, when building budgie-desktop-services, I get 'undefined reference to `std::enable_if' without having c++20 enabled. I flagged this RFC because I don't know if anyone relies on C++11.</div></div><div id="geary-quote" dir="auto"><br>On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 38786b79ed..973a39fc21 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -28,6 +28,7 @@ inherit cmake ptest
 
 EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
                   <a href="mailto:-DTOML11_BUILD_TESTS=${@bb.utils.contains">-DTOML11_BUILD_TESTS=${@bb.utils.contains</a>("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
+                  -DCMAKE_CXX_STANDARD=20 \
 "
 
 ALLOW_EMPTY:${PN} = "1"
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123498): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123498">https://lists.openembedded.org/g/openembedded-devel/message/123498</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117276714/3618223">https://lists.openembedded.org/mt/117276714/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-1FFd0FsmYWQQ7WLYiM9h--


