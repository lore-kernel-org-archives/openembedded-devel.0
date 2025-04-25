Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A280C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 16:52:31 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.11179.1745599950547406932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 09:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id A0D29479;
	Fri, 25 Apr 2025 18:52:28 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.169.200]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u8MHq-1mbmhU0; Fri, 25 Apr 2025 18:52:26 +0200
Date: Fri, 25 Apr 2025 18:52:21 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libsdl3-ttf: make use of
 virtual/libsdl3
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <9J9AVS.14KZCG9KXDF63@t-online.de>
In-Reply-To: <62c3c5ed-878b-4498-bd18-6fc487051245@gmail.com>
References: <20250424210659.2282492-1-f_l_k@t-online.de>
	<62c3c5ed-878b-4498-bd18-6fc487051245@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i/Bd6zhKE8HxaEr5tS16"
X-TOI-EXPURGATEID: 150726::1745599946-D2FFAA54-E7F0C1F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 4292a80d-6e2f-4487-b39e-03422c06570b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 16:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117133

--=-i/Bd6zhKE8HxaEr5tS16
Content-Type: text/plain; charset=us-ascii; format=flowed

This is not necessary but since you added virtual/libsdl3 in 
libsdl3-image, I assumed you wanted it that way
<https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=4613cf385460f973d1fe3c75336ce44e141ae9f4>

On Fri, Apr 25 2025 at 09:43:15 -07:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> On 4/24/25 2:06 PM, Markus Volk via lists.openembedded.org wrote:
>> Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>> ---
>>   meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb 
>> b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
>> index f914d1dcff..4bc84ec6ee 100644
>> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
>> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
>> @@ -1,6 +1,6 @@
>>   SUMMARY = "Simple DirectMedia Layer truetype font library"
>>   SECTION = "libs"
>> -DEPENDS = "libsdl3 freetype"
>> +DEPENDS = "virtual/libsdl3 freetype"
> 
> I see that libsdl3 recipe does PROVIDE virtual/libsdl3 but is it
> required ? are there multiple providers for libsdl3 available to 
> choose
> from ?
> 
>>   LICENSE = "Zlib"
>>   LIC_FILES_CHKSUM = 
>> "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455" 
>> <file://license.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455/>
>> 
>> 
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117132): 
> <https://lists.openembedded.org/g/openembedded-devel/message/117132>
> Mute This Topic: <https://lists.openembedded.org/mt/112441095/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-i/Bd6zhKE8HxaEr5tS16
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This is not necessary but since you added virtual/libsdl3 in libsdl3-image, I assumed you wanted it that way</div><div><a href="https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=4613cf385460f973d1fe3c75336ce44e141ae9f4">https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=4613cf385460f973d1fe3c75336ce44e141ae9f4</a></div></div><div id="geary-quote" dir="auto"><br>On Fri, Apr 25 2025 at 09:43:15 -07:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 4/24/25 2:06 PM, Markus Volk via lists.openembedded.org wrote:
<blockquote>Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
  meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
index f914d1dcff..4bc84ec6ee 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
@@ -1,6 +1,6 @@
  SUMMARY = "Simple DirectMedia Layer truetype font library"
  SECTION = "libs"
-DEPENDS = "libsdl3 freetype"
+DEPENDS = "virtual/libsdl3 freetype"
</blockquote>
I see that libsdl3 recipe does PROVIDE virtual/libsdl3 but is it 
required ? are there multiple providers for libsdl3 available to choose 
from ?

<blockquote>  LICENSE = "Zlib"
  LIC_FILES_CHKSUM = "<a href="file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455" "="">file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"</a>
  





</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#117132): <a href="https://lists.openembedded.org/g/openembedded-devel/message/117132">https://lists.openembedded.org/g/openembedded-devel/message/117132</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/112441095/3618223">https://lists.openembedded.org/mt/112441095/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-i/Bd6zhKE8HxaEr5tS16--


