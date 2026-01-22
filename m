Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A78D6CFAA
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 22:11:22 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50780.1769119880174152014
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 14:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 9BE6EF0E5;
	Thu, 22 Jan 2026 23:11:11 +0100 (CET)
Received: from [192.168.178.36] ([79.219.239.157]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vj2tS-1mnbns0; Thu, 22 Jan 2026 23:11:10 +0100
Date: Thu, 22 Jan 2026 23:11:04 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 05/11] libnma:
To: peter.kjellerstedt@axis.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <GMDA9T.44KWM04O1U213@t-online.de>
In-Reply-To: <DB5PR02MB1021380FF1F91AAB473597659EF97A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
	<20260122154334.1872038-5-f_l_k@t-online.de>
	<DB5PR02MB1021380FF1F91AAB473597659EF97A@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sbh8nAWEnHYN2a1AUoS3"
X-TOI-EXPURGATEID: 150726::1769119870-E27FB939-65FA50AF/0/0 CLEAN NORMAL
X-TOI-MSGID: 4aa67436-4dbf-4080-a827-44ae72d918ff
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123754

--=-sbh8nAWEnHYN2a1AUoS3
Content-Type: text/plain; charset=us-ascii; format=flowed

most definitely :)
That's on my list. And I was also planning to add a PACKAGECONFIG for 
xauth in the libgtop recipe.

On Thu, Jan 22 2026 at 21:39:51 +00:00:00, Peter Kjellerstedt via 
lists.openembedded.org 
<peter.kjellerstedt=axis.com@lists.openembedded.org> wrote:
>>  -----Original Message-----
>>  From: openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org> 
>> <openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org>> On Behalf Of 
>> Markus Volk via lists.openembedded.org
>>  Sent: den 22 januari 2026 16:43
>>  To: openembedded-devel@lists.openembedded.org 
>> <mailto:openembedded-devel@lists.openembedded.org>
>>  Subject: [oe] [meta-gnome][PATCH 05/11] libnma:
> 
> That subject is a bit on the short side. ;)
> 
>> 
>>  ---
>>   meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git 
>> a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb 
>> b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
>>  index 9a4dad35d1..502dfb5ce2 100644
>>  --- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
>>  +++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
>>  @@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 gtk+3 gtk4 networkmanager"
>> 
>>   inherit gnomebase gobject-introspection gtk-doc gettext vala 
>> features_check
>> 
>>  -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG','gcr','x11','',d)} 
>> opengl"
>>  +REQUIRED_DISTRO_FEATURES = "opengl"
>>   ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>> 
>>   SRC_URI[archive.sha256sum] = 
>> "53a6fb2b190ad37c5986caed3e98bede7c3c602399ee4f93c8fc054303d76dab"
>>  --
>>  2.52.0
> 
> //Peter
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123753): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123753>
> Mute This Topic: <https://lists.openembedded.org/mt/117401788/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-sbh8nAWEnHYN2a1AUoS3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>most definitely :)</div><div>That's on my list. And I was also planning to add a PACKAGECONFIG for xauth in the libgtop recipe.</div></div></div><div id="geary-quote" dir="auto"><br>On Thu, Jan 22 2026 at 21:39:51 +00:00:00, Peter Kjellerstedt via lists.openembedded.org &lt;peter.kjellerstedt=axis.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"><blockquote> -----Original Message-----
 From: <a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> &lt;<a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Markus Volk via lists.openembedded.org
 Sent: den 22 januari 2026 16:43
 To: <a href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
 Subject: [oe] [meta-gnome][PATCH 05/11] libnma:
</blockquote>
That subject is a bit on the short side. ;)

<blockquote> 
 ---
  meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
 index 9a4dad35d1..502dfb5ce2 100644
 --- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
 +++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
 @@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 gtk+3 gtk4 networkmanager"
 
  inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 
 -REQUIRED_DISTRO_FEATURES = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG','gcr','x11','',d)} opengl"
 +REQUIRED_DISTRO_FEATURES = "opengl"
  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
  SRC_URI[archive.sha256sum] = "53a6fb2b190ad37c5986caed3e98bede7c3c602399ee4f93c8fc054303d76dab"
 --
 2.52.0
</blockquote>
//Peter

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123753): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123753">https://lists.openembedded.org/g/openembedded-devel/message/123753</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117401788/3618223">https://lists.openembedded.org/mt/117401788/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-sbh8nAWEnHYN2a1AUoS3--


