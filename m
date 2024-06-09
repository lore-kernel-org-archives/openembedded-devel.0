Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E693EC41513
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 20:36:36 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.4992.1717965393898116374
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 13:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 9968326EC8;
	Sun,  9 Jun 2024 22:36:31 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.44.230]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGPHD-1uBjHc0; Sun, 9 Jun 2024 22:36:31 +0200
Date: Sun, 09 Jun 2024 22:37:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] libdbd-mysql-perl: update 4.050 -> 5.006
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <VLYTES.7NIXESOTM76A1@t-online.de>
In-Reply-To: <17D76E28F149D8AB.15678@lists.openembedded.org>
References: <17D76E28F149D8AB.15678@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-99ADU1seay8XhUPNiU19"
X-TOI-EXPURGATEID: 150726::1717965391-72713D2B-D1250E97/0/0 CLEAN NORMAL
X-TOI-MSGID: 10539436-b568-4520-8c3c-ee013d2dd2e4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110787

--=-99ADU1seay8XhUPNiU19
Content-Type: text/plain; charset=us-ascii; format=flowed

Upstream will not support mariadb. So the right solution would be to 
provide a mysql recipe. I may look into that, as I suspect Kodi would 
also benefit from it.
But to keep the whole thing at least buildable (there are also some 
other issues with mariadb that are currently treated as warnings), this 
workaround will be the way to go?

On Sun, Jun 9 2024 at 09:55:37 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add workaround for incompatible-pointer-types
>   [<https://github.com/perl5-dbi/DBD-mysql/issues/430>]
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../{libdbd-mysql-perl_4.050.bb => libdbd-mysql-perl_5.006.bb}  | 2 
> ++
>  1 file changed, 2 insertions(+)
>  rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.050.bb => 
> libdbd-mysql-perl_5.006.bb} (95%)
> 
> diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb 
> b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
> rename to meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
> index fc505fe1e..7e215847d 100644
> --- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
> +++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
> @@ -19,4 +19,6 @@ SRC_URI = 
> "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https;branch=master
> 
>  S = "${WORKDIR}/git"
> 
> +CFLAGS += "-Wno-incompatible-pointer-types"
> +
>  inherit cpan
> --
> 2.45.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110786): 
> <https://lists.openembedded.org/g/openembedded-devel/message/110786>
> Mute This Topic: <https://lists.openembedded.org/mt/106581103/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-99ADU1seay8XhUPNiU19
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Upstream will not support mariadb. So the right solution would be to provide a mysql recipe. I may look into that, as I suspect Kodi would also benefit from it.</div><div>But to keep the whole thing at least buildable (there are also some other issues with mariadb that are currently treated as warnings), this workaround will be the way to go?</div></div><div id="geary-quote" dir="auto"><br>On Sun, Jun 9 2024 at 09:55:37 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add workaround for incompatible-pointer-types
  [<a href="https://github.com/perl5-dbi/DBD-mysql/issues/430">https://github.com/perl5-dbi/DBD-mysql/issues/430</a>]

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../{libdbd-mysql-perl_4.050.bb =&gt; libdbd-mysql-perl_5.006.bb}  | 2 ++
 1 file changed, 2 insertions(+)
 rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.050.bb =&gt; libdbd-mysql-perl_5.006.bb} (95%)

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
similarity index 95%
rename from meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
rename to meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
index fc505fe1e..7e215847d 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
@@ -19,4 +19,6 @@ SRC_URI = "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https;branch=master
 
 S = "${WORKDIR}/git"
 
+CFLAGS += "-Wno-incompatible-pointer-types"
+
 inherit cpan
<div>-- 
</div>2.45.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110786): <a href="https://lists.openembedded.org/g/openembedded-devel/message/110786">https://lists.openembedded.org/g/openembedded-devel/message/110786</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/106581103/3618223">https://lists.openembedded.org/mt/106581103/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-99ADU1seay8XhUPNiU19--


