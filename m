Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ECBC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:09:17 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.1257.1661278156149237524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 924928B92;
	Tue, 23 Aug 2022 20:09:13 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.34.135]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQYKv-2Fky7U0; Tue, 23 Aug 2022 20:09:13 +0200
Date: Tue, 23 Aug 2022 20:09:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] iwd: update to v1.29
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <7FY2HR.4H45DZM8RBZ62@t-online.de>
In-Reply-To: 
	<CAMKF1srCBp7mWz7+b7AKUH-dZo1RjGdgNirykQ7NUkTWwcc9fQ@mail.gmail.com>
References: <20220823175108.18584-1-f_l_k@t-online.de>
	<CAMKF1srCBp7mWz7+b7AKUH-dZo1RjGdgNirykQ7NUkTWwcc9fQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dEl+Qv1ryNRvCnunUuC3"
X-TOI-EXPURGATEID: 150726::1661278153-0144CE29-A07DDF55/0/0 CLEAN NORMAL
X-TOI-MSGID: 3867e2c1-5fea-426b-8c2d-62baa295c6af
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 18:09:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98402

--=-dEl+Qv1ryNRvCnunUuC3
Content-Type: text/plain; charset=us-ascii; format=flowed

my meta-openembedded clone was too old, sorry

Am Di, 23. Aug 2022 um 11:06:24 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> there is a patch already for this in master
> <https://git.openembedded.org/meta-openembedded/commit/?id=4fa7d9ee9ad54f1f22a3a92410bbc474f0de8a10>
> 
> On Tue, Aug 23, 2022 at 10:51 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb => iwd_1.29.bb} | 2 
>> +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb => 
>> iwd_1.29.bb} (94%)
>> 
>>  diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb 
>> b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
>>  similarity index 94%
>>  rename from meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
>>  rename to meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
>>  index 40f35b15a..eada93b65 100644
>>  --- a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
>>  +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
>>  @@ -8,7 +8,7 @@ DEPENDS = "ell"
>>   SRC_URI = 
>> "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz 
>> <https://www.kernel.org/pub/linux/network/wireless/$%7BBP%7D.tar.xz> 
>> \
>>              
>> file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch 
>> <file://0001-build-use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch/> 
>> \
>>              "
>>  -SRC_URI[sha256sum] = 
>> "ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72a2e64d74c652f0b0"
>>  +SRC_URI[sha256sum] = 
>> "71533fe3b8f6381f24832198ba11d00f04a361454770c173b3b66bc3cdf272bd"
>> 
>>   inherit autotools manpages pkgconfig python3native systemd
>> 
>>  --
>>  2.34.1
>> 
>> 
>>  -=-=-=-=-=-=-=-=-=-=-=-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#98400): 
>> <https://lists.openembedded.org/g/openembedded-devel/message/98400>
>>  Mute This Topic: 
>> <https://lists.openembedded.org/mt/93210019/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org 
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=-=-=-=-=-=-=-=-=-=-=-
>> 


--=-dEl+Qv1ryNRvCnunUuC3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>my meta-openembedded clone was too old, sorry</div></div><div id="geary-quote" dir="auto"><br>Am Di, 23. Aug 2022 um 11:06:24 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">there is a patch already for this in master
<a href="https://git.openembedded.org/meta-openembedded/commit/?id=4fa7d9ee9ad54f1f22a3a92410bbc474f0de8a10">https://git.openembedded.org/meta-openembedded/commit/?id=4fa7d9ee9ad54f1f22a3a92410bbc474f0de8a10</a>

On Tue, Aug 23, 2022 at 10:51 AM Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb =&gt; iwd_1.29.bb} | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb =&gt; iwd_1.29.bb} (94%)

 diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
 similarity index 94%
 rename from meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
 rename to meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
 index 40f35b15a..eada93b65 100644
 --- a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
 +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
 @@ -8,7 +8,7 @@ DEPENDS = "ell"
  SRC_URI = "<a href="https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz">https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz</a> \
             <a href="file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch">file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch</a> \
             "
 -SRC_URI[sha256sum] = "ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72a2e64d74c652f0b0"
 +SRC_URI[sha256sum] = "71533fe3b8f6381f24832198ba11d00f04a361454770c173b3b66bc3cdf272bd"

  inherit autotools manpages pkgconfig python3native systemd

 --
 2.34.1


 -=-=-=-=-=-=-=-=-=-=-=-
 Links: You receive all messages sent to this group.
 View/Reply Online (#98400): <a href="https://lists.openembedded.org/g/openembedded-devel/message/98400">https://lists.openembedded.org/g/openembedded-devel/message/98400</a>
 Mute This Topic: <a href="https://lists.openembedded.org/mt/93210019/1997914">https://lists.openembedded.org/mt/93210019/1997914</a>
 Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=-=-=-=-=-=-=-=-=-=-=-

</blockquote></div></blockquote></div>
--=-dEl+Qv1ryNRvCnunUuC3--


