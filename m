Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879B7C61CE8
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 17:29:12 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.22793.1749317347607827907
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jun 2025 10:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id D33451B2;
	Sat,  7 Jun 2025 19:28:43 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.174.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uNxLX-4Zi4VU0; Sat, 7 Jun 2025 19:28:43 +0200
Date: Sat, 07 Jun 2025 19:28:37 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libheif: update 1.19.5 -> 1.19.8
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <PVXHXS.GL7NXGQXNZRF3@t-online.de>
In-Reply-To: <15cf89e9-1230-406a-9bb1-f9189cdfc20c@gmail.com>
References: <20250607145824.3452805-1-f_l_k@t-online.de>
	<15cf89e9-1230-406a-9bb1-f9189cdfc20c@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dHV3YPSh0LZUnrMwzrqa"
X-TOI-EXPURGATEID: 150726::1749317323-2E7F15FF-B117A984/0/0 CLEAN NORMAL
X-TOI-MSGID: 772e8442-25f8-4e1b-9654-1dc31ac3ada4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 17:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117777

--=-dHV3YPSh0LZUnrMwzrqa
Content-Type: text/plain; charset=us-ascii; format=flowed

yes, thank you

On Sat, Jun 7 2025 at 17:05:20 +02:00:00, Gyorgy Sarvari 
<skandigraun@gmail.com> wrote:
> On 6/7/25 16:58, Markus Volk via lists.openembedded.org wrote:
>>  COPYING was changed
>>  
>> [<https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed>]
> I think you might have forgotten updating the license checksum in the
> recipe (unless it's a hash collision)
> 
>> 
>>  1.19.8
>> 
>>  Set essential flag for transformative properties as required by 
>> MIAF. This fixes the display of AVIF images with transformations 
>> encoded by libheif in Chrome, which checks whether this flag is set.
>>  If the environment variable LIBHEIF_SECURITY_LIMITS is set to OFF, 
>> libheif will not check any security limits. This can be used if a 
>> user wants to work with large images that were blocked by the 
>> security limits, but the application software does not allow to 
>> adjust the libheif security limits.
>>  Resolved processing 16-bit JPEG-2000
>> 
>>  1.19.7
>>  Fixes a build error with SVT-AV1 encoder plugin when using reduced 
>> symbol visibility (#1480).
>> 
>>  1.19.6
>>  Bugfix release.
>> 
>>  Additionally, there are the following changes:
>> 
>>  C++ and Go wrapper licenses have been changed to MIT
>>  supports SVT-AV1 v3.0.0 encoder
>>  support emscripten builds for ES6 modules
>> 
>>  Fixes
>> 
>>  CVE-2025-43966
>>  CVE-2025-43967
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../libheif/{libheif_1.19.5.bb => libheif_1.19.8.bb}            | 
>> 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename 
>> meta-multimedia/recipes-multimedia/libheif/{libheif_1.19.5.bb => 
>> libheif_1.19.8.bb} (96%)
>> 
>>  diff --git 
>> a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb 
>> b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
>>  similarity index 96%
>>  rename from 
>> meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
>>  rename to 
>> meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
>>  index e024ff0f60..6ecda99557 100644
>>  --- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
>>  +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
>>  @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
>>   SRC_URI = 
>> "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
>> 
>>   S = "${WORKDIR}/git"
>>  -SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
>>  +SRCREV = "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
>> 
>>   inherit cmake pkgconfig
>> 
>> 
>>  -=-=-=-=-=-=-=-=-=-=-=-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#117773): 
>> <https://lists.openembedded.org/g/openembedded-devel/message/117773>
>>  Mute This Topic: 
>> <https://lists.openembedded.org/mt/113520958/6084445>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org 
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
>> [skandigraun@gmail.com <mailto:skandigraun@gmail.com>]
>>  -=-=-=-=-=-=-=-=-=-=-=-
>> 
> 


--=-dHV3YPSh0LZUnrMwzrqa
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>yes, thank you</div></div><div id="geary-quote" dir="auto"><br>On Sat, Jun 7 2025 at 17:05:20 +02:00:00, Gyorgy Sarvari &lt;skandigraun@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 6/7/25 16:58, Markus Volk via lists.openembedded.org wrote:
<blockquote> COPYING was changed
 [<a href="https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed">https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed</a>]
</blockquote>I think you might have forgotten updating the license checksum in the
recipe (unless it's a hash collision)

<blockquote>
 1.19.8

 Set essential flag for transformative properties as required by MIAF. This fixes the display of AVIF images with transformations encoded by libheif in Chrome, which checks whether this flag is set.
 If the environment variable LIBHEIF_SECURITY_LIMITS is set to OFF, libheif will not check any security limits. This can be used if a user wants to work with large images that were blocked by the security limits, but the application software does not allow to adjust the libheif security limits.
 Resolved processing 16-bit JPEG-2000

 1.19.7
 Fixes a build error with SVT-AV1 encoder plugin when using reduced symbol visibility (#1480).

 1.19.6
 Bugfix release.

 Additionally, there are the following changes:

 C++ and Go wrapper licenses have been changed to MIT
 supports SVT-AV1 v3.0.0 encoder
 support emscripten builds for ES6 modules

 Fixes

 CVE-2025-43966
 CVE-2025-43967

 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../libheif/{libheif_1.19.5.bb =&gt; libheif_1.19.8.bb}            | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.19.5.bb =&gt; libheif_1.19.8.bb} (96%)

 diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
 similarity index 96%
 rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
 rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
 index e024ff0f60..6ecda99557 100644
 --- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
 +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
 @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
  SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
  
  S = "${WORKDIR}/git"
 -SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
 +SRCREV = "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
  
  inherit cmake pkgconfig
  

 -=-=-=-=-=-=-=-=-=-=-=-
 Links: You receive all messages sent to this group.
 View/Reply Online (#117773): <a href="https://lists.openembedded.org/g/openembedded-devel/message/117773">https://lists.openembedded.org/g/openembedded-devel/message/117773</a>
 Mute This Topic: <a href="https://lists.openembedded.org/mt/113520958/6084445">https://lists.openembedded.org/mt/113520958/6084445</a>
 Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
 -=-=-=-=-=-=-=-=-=-=-=-

</blockquote>
</div></blockquote></div>
--=-dHV3YPSh0LZUnrMwzrqa--


