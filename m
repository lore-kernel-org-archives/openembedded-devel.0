Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22860D4661F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:58:18 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3733.1768507094668892385
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout06.t-online.de (Postfix) with SMTP id CEC4F6AB;
	Thu, 15 Jan 2026 20:58:11 +0100 (CET)
Received: from [192.168.178.36] ([84.163.33.217]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgTTn-29nwUC0; Thu, 15 Jan 2026 20:58:03 +0100
Date: Thu, 15 Jan 2026 20:57:58 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [RFC][meta-oe][PATCH] libtoml11: build with
 CMAKE_CXX_STANDARD 20
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org,
	adam.duskett@amarulasolutions.com
Message-Id: <MS8X8T.JSG4VV82MN7C1@t-online.de>
In-Reply-To: <c9820ac6-8383-4e03-8964-38e7e2fc3ac3@gmail.com>
References: <188ADEF99F4A855B.2595076@lists.openembedded.org>
	<X5HW8T.AHLKZAK448352@t-online.de>
	<c9820ac6-8383-4e03-8964-38e7e2fc3ac3@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HknlCiRYay8q3Oc2i5Hj"
X-TOI-EXPURGATEID: 150726::1768507083-ACFF6BB2-F5245DAB/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a707d73-0d55-4218-9b65-5e4a46ed46a3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 19:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123518

--=-HknlCiRYay8q3Oc2i5Hj
Content-Type: text/plain; charset=us-ascii; format=flowed

Maybe we should wait until the transition happend ... or dont do it 
like this at all? ;)

It hurts my brain that the lib is called libtoml11 but then requires 
c++20.
Maybe use an .inc file and then libtoml11.bb and libtoml20.bb? For now 
I'll add
a bbappend file to my layer

On Thu, Jan 15 2026 at 11:06:49 +01:00:00, Gyorgy Sarvari 
<skandigraun@gmail.com> wrote:
> On 1/15/26 11:01, Markus Volk via lists.openembedded.org wrote:
>>  By default, libtoml11 uses the C++11 standard. However, when 
>> building
>>  budgie-desktop-services, I get 'undefined reference to
>>  `std::enable_if' without having c++20 enabled. I flagged this RFC
>>  because I don't know if anyone relies on C++11.
> 
> I remember that this recipe was moved to oe-core[1], because I 
> reviewed
> some version of it... but apparently it didn't reach the actual repo 
> yet.
> I have nothing against the proposal, but if it is done, it should made
> somehow in a way that it won't be lost when the actual repo transition
> happen.
> I have added the transition-author on cc.
> 
> [1]: 
> <https://lists.openembedded.org/g/openembedded-core/message/227581>
> 
> 
>> 
>>  On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via
>>  lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org 
>> <mailto:f_l_k=t-online.de@lists.openembedded.org>> wrote:
>>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>>> <mailto:f_l_k@t-online.de>> ---
>>>  meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 + 1 file
>>>  changed, 1 insertion(+) diff --git
>>>  a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
>>>  b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb index
>>>  38786b79ed..973a39fc21 100644 ---
>>>  a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb +++
>>>  b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb @@ -28,6
>>>  +28,7 @@ inherit cmake ptest EXTRA_OECMAKE += 
>>> "-DTOML11_PRECOMPILE=ON
>>>  \ -DTOML11_BUILD_TESTS=${@bb.utils.contains 
>>> <mailto:-DTOML11_BUILD_TESTS=${@bb.utils.contains>("DISTRO_FEATURES",
>>>  "ptest", "ON", "OFF", d)} \ + -DCMAKE_CXX_STANDARD=20 \ "
>>>  ALLOW_EMPTY:${PN} = "1"
>>>  --
>>>  2.52.0
>> 
>>  -=-=-=-=-=-=-=-=-=-=-=-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#123499): 
>> <https://lists.openembedded.org/g/openembedded-devel/message/123499>
>>  Mute This Topic: 
>> <https://lists.openembedded.org/mt/117276714/6084445>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org 
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
>> [skandigraun@gmail.com <mailto:skandigraun@gmail.com>]
>>  -=-=-=-=-=-=-=-=-=-=-=-
>> 
> 


--=-HknlCiRYay8q3Oc2i5Hj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Maybe we should wait until the transition happend ... or dont do it like this at all? ;)</div><div><br></div><div>It hurts my brain that the lib is called libtoml11 but then requires c++20.</div><div>Maybe use an .inc file and then libtoml11.bb and libtoml20.bb? For now I'll add</div><div>a bbappend file to my layer&nbsp;</div></div><div id="geary-quote" dir="auto"><br>On Thu, Jan 15 2026 at 11:06:49 +01:00:00, Gyorgy Sarvari &lt;skandigraun@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 1/15/26 11:01, Markus Volk via lists.openembedded.org wrote:
<blockquote> By default, libtoml11 uses the C++11 standard. However, when building
 budgie-desktop-services, I get 'undefined reference to
 `std::enable_if' without having c++20 enabled. I flagged this RFC
 because I don't know if anyone relies on C++11.
</blockquote>
I remember that this recipe was moved to oe-core[1], because I reviewed
some version of it... but apparently it didn't reach the actual repo yet.
I have nothing against the proposal, but if it is done, it should made
somehow in a way that it won't be lost when the actual repo transition
happen.
I have added the transition-author on cc.

[1]: <a href="https://lists.openembedded.org/g/openembedded-core/message/227581">https://lists.openembedded.org/g/openembedded-core/message/227581</a>


<blockquote>
 On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via
 lists.openembedded.org &lt;<a href="mailto:f_l_k=t-online.de@lists.openembedded.org">f_l_k=t-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote> Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; ---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 + 1 file
 changed, 1 insertion(+) diff --git
 a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
 b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb index
 38786b79ed..973a39fc21 100644 ---
 a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb +++
 b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb @@ -28,6
 +28,7 @@ inherit cmake ptest EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON
 \ <a href="mailto:-DTOML11_BUILD_TESTS=${@bb.utils.contains">-DTOML11_BUILD_TESTS=${@bb.utils.contains</a>("DISTRO_FEATURES",
 "ptest", "ON", "OFF", d)} \ + -DCMAKE_CXX_STANDARD=20 \ "
 ALLOW_EMPTY:${PN} = "1"
 -- 
 2.52.0
</blockquote>
 -=-=-=-=-=-=-=-=-=-=-=-
 Links: You receive all messages sent to this group.
 View/Reply Online (#123499): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123499">https://lists.openembedded.org/g/openembedded-devel/message/123499</a>
 Mute This Topic: <a href="https://lists.openembedded.org/mt/117276714/6084445">https://lists.openembedded.org/mt/117276714/6084445</a>
 Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
 -=-=-=-=-=-=-=-=-=-=-=-

</blockquote>
</div></blockquote></div>
--=-HknlCiRYay8q3Oc2i5Hj--


