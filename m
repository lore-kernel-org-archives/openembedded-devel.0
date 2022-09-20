Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50378C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:52:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web08.12206.1663681954243125125
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout08.t-online.de (Postfix) with SMTP id 0F75A19FFA;
	Tue, 20 Sep 2022 15:52:32 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.161]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oadfp-1fqiAK0; Tue, 20 Sep 2022 15:52:29 +0200
Date: Tue, 20 Sep 2022 15:52:22 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] appstream-glib: fix manpage generation
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <A7HIIR.F3GMGRV1E1BM@t-online.de>
In-Reply-To: <c09422655df69cb886d0f0c8be483697181f3d16.camel@intel.com>
References: <20220920083157.660480-1-f_l_k@t-online.de>
	<c09422655df69cb886d0f0c8be483697181f3d16.camel@intel.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Cbz/jZ+mI56WPnW79etk"
X-TOI-EXPURGATEID: 150726::1663681949-C8C8BB6F-1E04BFB8/0/0 CLEAN NORMAL
X-TOI-MSGID: 64b89cc4-b94f-4840-9b98-fa5bece6d29e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 13:52:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98909

--=-Cbz/jZ+mI56WPnW79etk
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks for the suggestions. I've sent a v2

Am Di, 20. Sep 2022 um 13:43:34 +0000 schrieb Anuj Mittal 
<anuj.mittal@intel.com>:
> On Tue, 2022-09-20 at 10:31 +0200, Markus Volk wrote:
>>  Creating manpages is set by default but fails with:
>> 
>>  > I/O error : Attempt to load network entity
>>  > 
>> <http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl>
>>  > warning: failed to load external entity
>>  > 
>> "<http://docbook.sourceforge.net/release/xsl/current/manpages/docboo>
>>  > k.xsl"
>>  > cannot parse
>>  > 
>> <http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl>
>> 
>>  Disable manpage generation by default but fix the dependencies, so 
>> it
>>  wouldn't fail
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../recipes-support/appstream-glib/appstream-glib_0.7.18.bb    | 3
>>  +++
>>   1 file changed, 3 insertions(+)
>> 
>>  diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-
>>  glib_0.7.18.bb 
>> b/meta-gnome/recipes-support/appstream-glib/appstream-
>>  glib_0.7.18.bb
>>  index 45a28ed96..b5d60b13a 100644
>>  --- a/meta-gnome/recipes-support/appstream-glib/appstream-
>>  glib_0.7.18.bb
>>  +++ b/meta-gnome/recipes-support/appstream-glib/appstream-
>>  glib_0.7.18.bb
>>  @@ -26,6 +26,9 @@ EXTRA_OEMESON = " \
>>       -Drpm=false \
>>   "
>> 
>>  +PACKAGECONFIG ?= ""
>>  +PACKAGECONFIG[man] = 
>> "-Dman=true,-Dman=false,docbook-xml-dtd4-native
>>  docbook-xsl-stylesheets-native libxslt-native"
> 
> I think this should also inherit manpages bbclass for it to be enabled
> correctly. The PACKAGECONFIG will also have to be changed to manpages
> then.
> 
> Thanks,
> 
> Anuj
> 
>>  +
>>   FILES:${PN} += "${libdir}/asb-plugins-5"
>> 
>>   FILES:${PN}-dev += " \
>> 
>> 
>> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98907): 
> <https://lists.openembedded.org/g/openembedded-devel/message/98907>
> Mute This Topic: <https://lists.openembedded.org/mt/93799217/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Cbz/jZ+mI56WPnW79etk
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks for the suggestions. I've sent a v2</div></div><div id="geary-quote" dir="auto"><br>Am Di, 20. Sep 2022 um 13:43:34 +0000 schrieb Anuj Mittal &lt;anuj.mittal@intel.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Tue, 2022-09-20 at 10:31 +0200, Markus Volk wrote:
<blockquote> Creating manpages is set by default but fails with:
 
 &gt; I/O error : Attempt to load network entity
 &gt; <a href="http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl">http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl</a>
 &gt; warning: failed to load external entity
 &gt; "<a href="http://docbook.sourceforge.net/release/xsl/current/manpages/docboo">http://docbook.sourceforge.net/release/xsl/current/manpages/docboo</a>
 &gt; k.xsl"
 &gt; cannot parse
 &gt; <a href="http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl">http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl</a>
 
 Disable manpage generation by default but fix the dependencies, so it
 wouldn't fail
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
 &nbsp;.../recipes-support/appstream-glib/appstream-glib_0.7.18.bb&nbsp;&nbsp;&nbsp; | 3
 +++
 &nbsp;1 file changed, 3 insertions(+)
 
 diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-
 glib_0.7.18.bb b/meta-gnome/recipes-support/appstream-glib/appstream-
 glib_0.7.18.bb
 index 45a28ed96..b5d60b13a 100644
 --- a/meta-gnome/recipes-support/appstream-glib/appstream-
 glib_0.7.18.bb
 +++ b/meta-gnome/recipes-support/appstream-glib/appstream-
 glib_0.7.18.bb
 @@ -26,6 +26,9 @@ EXTRA_OEMESON = " \
 &nbsp;&nbsp;&nbsp;&nbsp; -Drpm=false \
 &nbsp;"
 &nbsp;
 +PACKAGECONFIG ?= ""
 +PACKAGECONFIG[man] = "-Dman=true,-Dman=false,docbook-xml-dtd4-native
 docbook-xsl-stylesheets-native libxslt-native"
</blockquote>
I think this should also inherit manpages bbclass for it to be enabled
correctly. The PACKAGECONFIG will also have to be changed to manpages
then.

Thanks,

Anuj

<blockquote> +
 &nbsp;FILES:${PN} += "${libdir}/asb-plugins-5"
 &nbsp;
 &nbsp;FILES:${PN}-dev += " \
 
 
 
</blockquote>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#98907): <a href="https://lists.openembedded.org/g/openembedded-devel/message/98907">https://lists.openembedded.org/g/openembedded-devel/message/98907</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/93799217/3618223">https://lists.openembedded.org/mt/93799217/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Cbz/jZ+mI56WPnW79etk--


