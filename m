Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850C3C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 13:39:05 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web08.6369.1666445942785871725
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Oct 2022 06:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id CE557349F;
	Sat, 22 Oct 2022 15:38:59 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.116]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1omEiJ-0iXeAy0; Sat, 22 Oct 2022 15:38:59 +0200
Date: Sat, 22 Oct 2022 15:38:53 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: upgrade -> 0.0.1
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <TWP5KR.GDOFZVI879S3@t-online.de>
In-Reply-To: <81287e5fe61e432d98037f20316c1faa@axis.com>
References: <20221022091208.24098-1-f_l_k@t-online.de>
	<81287e5fe61e432d98037f20316c1faa@axis.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ZCcXnMyoMM72xwffCZj1"
X-TOI-EXPURGATEID: 150726::1666445939-EFFE97E2-F071F5AE/0/0 CLEAN NORMAL
X-TOI-MSGID: a18f599e-a5be-4569-955f-4f91f412392f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Oct 2022 13:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99259

--=-ZCcXnMyoMM72xwffCZj1
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks for the review

Am Sa, 22. Okt 2022 um 12:46:02 +0000 schrieb Peter Kjellerstedt 
<peter.kjellerstedt@axis.com>:
>>  -----Original Message-----
>>  From: openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org> 
>> <openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org>> On Behalf Of 
>> Markus Volk
>>  Sent: den 22 oktober 2022 11:12
>>  To: openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org>
>>  Cc: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
>>  Subject: [oe] [meta-multimedia][PATCH] libcamera: upgrade -> 0.0.1
>> 
>>  libcamera has recently received its first release.
>>  Note: meta-raspberrypi needs to adjust the name of 
>> libcamera.bbappend
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../{libcamera.bb => libcamera_0.0.1.bb}         | 16 
>> ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>   rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb 
>> => libcamera_0.0.1.bb} (84%)
>> 
>>  diff --git 
>> a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb 
>> b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
>>  similarity index 84%
>>  rename from 
>> meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>  rename to 
>> meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
>>  index 53cd94cbf..8329707b5 100644
>>  --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>  +++ 
>> b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
>>  @@ -12,9 +12,9 @@ SRC_URI = " \
>>           
>> git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master 
>> \
>>   "
>> 
>>  -SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
>>  +SRCREV = "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
>> 
>>  -PV = "202105+git${SRCPV}"
>>  +PV = "0.0.1"
> 
> Remove PV. There is no need to set it here as it is now set in the 
> filename.
> Instead, you should add:
> 
> PE = "1"
> 
> to avoid the following warning when upgrading from the current 
> version:
> 
> WARNING: libcamera-0.0.1-r0 do_packagedata: QA Issue: Package version 
> for
> package libcamera went backwards which would break package feeds (from
> 0:202105+git0+ed591e705c-r0.2 to 0:0.0.1-r0.0) 
> [version-going-backwards]
> 
>> 
>>   S = "${WORKDIR}/git"
>> 
>>  @@ -45,8 +45,8 @@ do_configure:prepend() {
>>   }
>> 
>>   do_install:append() {
>>  -    chrpath -d ${D}${libdir}/libcamera.so.0.0.0
>>  -    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.0
>>  +    chrpath -d ${D}${libdir}/libcamera.so.0.0.1
>>  +    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.1
> 
> Change to:
> 
>     chrpath -d ${D}${libdir}/libcamera.so
>     chrpath -d ${D}${libdir}/v4l2-compat.so
> 
> so that it does not have to be updated every new version.
> I dropped chrpath for libcamera-base.so because it has no rpath, so
> no need to remove something that isn't there.
> 
>>   }
>> 
>>   addtask do_recalculate_ipa_signatures_package after do_package 
>> before do_packagedata
>>  @@ -64,11 +64,11 @@ do_recalculate_ipa_signatures_package() {
>> 
>>   FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>   FILES:${PN}-dev += " ${libdir}/libcamera.so"
>>  -FILES:${PN} += " ${libdir}/libcamera.so.0"
>>  -FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
>>  +FILES:${PN} += " ${libdir}/libcamera.so"
>>  +FILES:${PN} += " ${libdir}/libcamera.so.0.0.1"
>>   FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
>>  -FILES:${PN} += " ${libdir}/libcamera-base.so.0"
>>  -FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
>>  +FILES:${PN} += " ${libdir}/libcamera-base.so"
>>  +FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.1"
>>   FILES:${PN} += " ${libdir}/v4l2-compat.so"
>>   FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
>>   FILES:${PN} += " ${bindir}/cam"
> 
> Remove all the FILES variables above and replace them with:
> 
> FILES:${PN} += " ${libdir}/v4l2-compat.so"
> FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
> 
>>  --
>>  2.34.1
> 
> //Peter
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99258): 
> <https://lists.openembedded.org/g/openembedded-devel/message/99258>
> Mute This Topic: <https://lists.openembedded.org/mt/94492803/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ZCcXnMyoMM72xwffCZj1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks for the review</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 22. Okt 2022 um 12:46:02 +0000 schrieb Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"><blockquote> -----Original Message-----
 From: <a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> &lt;<a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Markus Volk
 Sent: den 22 oktober 2022 11:12
 To: <a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
 Cc: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 Subject: [oe] [meta-multimedia][PATCH] libcamera: upgrade -&gt; 0.0.1
 
 libcamera has recently received its first release.
 Note: meta-raspberrypi needs to adjust the name of libcamera.bbappend
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../{libcamera.bb =&gt; libcamera_0.0.1.bb}         | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb =&gt; libcamera_0.0.1.bb} (84%)
 
 diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
 similarity index 84%
 rename from meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
 rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
 index 53cd94cbf..8329707b5 100644
 --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
 +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
 @@ -12,9 +12,9 @@ SRC_URI = " \
          git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
  "
 
 -SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
 +SRCREV = "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
 
 -PV = "202105+git${SRCPV}"
 +PV = "0.0.1"
</blockquote>
Remove PV. There is no need to set it here as it is now set in the filename.
Instead, you should add:

PE = "1"

to avoid the following warning when upgrading from the current version:

WARNING: libcamera-0.0.1-r0 do_packagedata: QA Issue: Package version for 
package libcamera went backwards which would break package feeds (from 
0:202105+git0+ed591e705c-r0.2 to 0:0.0.1-r0.0) [version-going-backwards]

<blockquote> 
  S = "${WORKDIR}/git"
 
 @@ -45,8 +45,8 @@ do_configure:prepend() {
  }
 
  do_install:append() {
 -    chrpath -d ${D}${libdir}/libcamera.so.0.0.0
 -    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.0
 +    chrpath -d ${D}${libdir}/libcamera.so.0.0.1
 +    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.1
</blockquote>
Change to:

    chrpath -d ${D}${libdir}/libcamera.so
    chrpath -d ${D}${libdir}/v4l2-compat.so

so that it does not have to be updated every new version.
I dropped chrpath for libcamera-base.so because it has no rpath, so 
no need to remove something that isn't there.

<blockquote>  }
 
  addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
 @@ -64,11 +64,11 @@ do_recalculate_ipa_signatures_package() {
 
  FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
  FILES:${PN}-dev += " ${libdir}/libcamera.so"
 -FILES:${PN} += " ${libdir}/libcamera.so.0"
 -FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
 +FILES:${PN} += " ${libdir}/libcamera.so"
 +FILES:${PN} += " ${libdir}/libcamera.so.0.0.1"
  FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
 -FILES:${PN} += " ${libdir}/libcamera-base.so.0"
 -FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
 +FILES:${PN} += " ${libdir}/libcamera-base.so"
 +FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.1"
  FILES:${PN} += " ${libdir}/v4l2-compat.so"
  FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
  FILES:${PN} += " ${bindir}/cam"
</blockquote>
Remove all the FILES variables above and replace them with:

FILES:${PN} += " ${libdir}/v4l2-compat.so"
FILES:${PN}-gst = "${libdir}/gstreamer-1.0"

<blockquote> --
 2.34.1
</blockquote>
//Peter

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99258): <a href="https://lists.openembedded.org/g/openembedded-devel/message/99258">https://lists.openembedded.org/g/openembedded-devel/message/99258</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/94492803/3618223">https://lists.openembedded.org/mt/94492803/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ZCcXnMyoMM72xwffCZj1--


