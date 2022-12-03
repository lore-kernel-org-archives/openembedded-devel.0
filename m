Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75B2C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 08:01:47 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.99763.1670054506100593547
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 00:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id B2CDAC3B8;
	Sat,  3 Dec 2022 09:01:40 +0100 (CET)
Received: from [192.168.178.83] ([84.163.34.117]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p1NSt-2fv5cm0; Sat, 3 Dec 2022 09:01:39 +0100
Date: Sat, 03 Dec 2022 09:01:34 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] perfetto: update 27.1 -> 28.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <MA2BMR.AI7JB1WR3MVA2@t-online.de>
In-Reply-To: 
	<CAMKF1sqosArSoCM6uxVaPo3+mUz19jPux5r_AxDsr9mj8n=yfw@mail.gmail.com>
References: <20221201174129.1218999-1-f_l_k@t-online.de>
	<CAMKF1sqosArSoCM6uxVaPo3+mUz19jPux5r_AxDsr9mj8n=yfw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Xgg0jIDSyID6KSxq6i7P"
X-TOI-EXPURGATEID: 150726::1670054499-2508E98D-258026D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 12121080-a595-4779-b8ef-204f33e5f631
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 08:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99918

--=-Xgg0jIDSyID6KSxq6i7P
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Khem,
I tried to build Perfetto for Qemuarm and had an issue. The bad news 
is, it doesn't seem to be the right one. For glibc/gcc perfetto on 
qemuarm builds for me now, but in the clang/musl combination I am now 
at your error message.
I sent a patch for the problem I was having because I think it is an 
improvement.
I have yet to look at the other problem. But that's where the ice gets 
thin. I don't have much experience with musl or clang yet.

Am Fr, 2. Dez 2022 um 08:27:07 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> Hi Markus
> 
> Seeing build errors
> <https://errors.yoctoproject.org/Errors/Details/681762/>
> <https://errors.yoctoproject.org/Errors/Details/681809/>
> 
> On Thu, Dec 1, 2022 at 9:41 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../files/0001-meson-add-pc-file-for-lib_perfetto.patch       | 2 
>> +-
>>   meta-oe/recipes-devtools/perfetto/perfetto.inc                | 4 
>> ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>>  diff --git 
>> a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch 
>> b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
>>  index 70de44173..d6092afeb 100644
>>  --- 
>> a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
>>  +++ 
>> b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
>>  @@ -17,7 +17,7 @@ index 06015141c..752b4d928 100644
>>        ['c','cpp'],
>>   -    default_options: ['c_std=c99', 'cpp_std=c++11']
>>   +    default_options: ['c_std=c99', 'cpp_std=c++11'],
>>  -+    version: '27.1'
>>  ++    version: '28.0'
>>    )
>> 
>>   +soversion = meson.project_version()
>>  diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc 
>> b/meta-oe/recipes-devtools/perfetto/perfetto.inc
>>  index 5cb6f8bb3..a8e72af1a 100644
>>  --- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
>>  +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
>>  @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/perfetto"
>> 
>>   SRC_URI = 
>> "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
>> 
>>  -SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923"
>>  -PV = "27.1"
>>  +SRCREV_perfetto = "99ead408d98eaa25b7819c7e059734bea42fa148"
>>  +PV = "28.0"
>> 
>>   S = "${WORKDIR}/git"
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99915): 
> <https://lists.openembedded.org/g/openembedded-devel/message/99915>
> Mute This Topic: <https://lists.openembedded.org/mt/95388111/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Xgg0jIDSyID6KSxq6i7P
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>Hi Khem,</div><div>I tried to build Perfetto for Qemuarm and had an issue. The bad news is, it doesn't seem to be the right one. For glibc/gcc perfetto on qemuarm builds for me now, but in the clang/musl combination I am now at your error message.</div><div>I sent a patch for the problem I was having because I think it is an improvement.</div><div>I have yet to look at the other problem. But that's where the ice gets thin. I don't have much experience with musl or clang yet.</div></div></div><div id="geary-quote" dir="auto"><br>Am Fr, 2. Dez 2022 um 08:27:07 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hi Markus

Seeing build errors
<a href="https://errors.yoctoproject.org/Errors/Details/681762/">https://errors.yoctoproject.org/Errors/Details/681762/</a>
<a href="https://errors.yoctoproject.org/Errors/Details/681809/">https://errors.yoctoproject.org/Errors/Details/681809/</a>

On Thu, Dec 1, 2022 at 9:41 AM Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../files/0001-meson-add-pc-file-for-lib_perfetto.patch       | 2 +-
  meta-oe/recipes-devtools/perfetto/perfetto.inc                | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)

 diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
 index 70de44173..d6092afeb 100644
 --- a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
 +++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
 @@ -17,7 +17,7 @@ index 06015141c..752b4d928 100644
       ['c','cpp'],
  -    default_options: ['c_std=c99', 'cpp_std=c++11']
  +    default_options: ['c_std=c99', 'cpp_std=c++11'],
 -+    version: '27.1'
 ++    version: '28.0'
   )

  +soversion = meson.project_version()
 diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
 index 5cb6f8bb3..a8e72af1a 100644
 --- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
 +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
 @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/perfetto"

  SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"

 -SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923"
 -PV = "27.1"
 +SRCREV_perfetto = "99ead408d98eaa25b7819c7e059734bea42fa148"
 +PV = "28.0"

  S = "${WORKDIR}/git"
 --
 2.34.1


 

</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99915): <a href="https://lists.openembedded.org/g/openembedded-devel/message/99915">https://lists.openembedded.org/g/openembedded-devel/message/99915</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/95388111/3618223">https://lists.openembedded.org/mt/95388111/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Xgg0jIDSyID6KSxq6i7P--


