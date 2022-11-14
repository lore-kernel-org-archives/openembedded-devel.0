Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA0CC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:36:29 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web10.5485.1668432984829015012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=pfaIJ/dx;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4N9r1b2VtNz9sTt
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 14:36:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1668432979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WGNHEuyg3dzcFLPzdJc2dJ4CVLyxP1eQQcUGX6pgQcU=;
	b=pfaIJ/dxoqygmbzAeV8tncrOl6ca2h2l6EowPqfw9qYeRl3fpp28lesuLW7+gIR21L/ZQb
	lEqW0QzfsthDwyKzFoAgvoZ57x/Kyf+ZLt2FApYYCN60Mw0tdIm6IE+aVey20XgX6hWzKS
	twgUfJHuLzFqaGO4+cmrpbWwz98FYYWMe/h/uNPS9aGESn7B88Apm/mGTn6sC6JjqqR84L
	xvyk7f5a7remRbFWX75RKAXP93NxTI63DtaRM+PetZgytPV2rhNXDX7AVfvVO2xMihe5eB
	n0p1BTIaR+bq/t3fmWZkM7iLihhblh/cZ/UkROG79AztG9nUztkwgeOAFYv2ig==
Content-Type: multipart/alternative;
 boundary="------------UmMiwLgr4Q0zMEyZ5o2vg4dD"
Message-ID: <ef125b71-594a-c235-bf16-097c292d38f0@mailbox.org>
Date: Mon, 14 Nov 2022 14:36:18 +0100
MIME-Version: 1.0
Subject: Re: [oe] [meta-multimedia][PATCHv12] pipewire: update to v0.3.56
To: openembedded-devel@lists.openembedded.org
References: <20220822171940.4736-1-f_l_k@t-online.de>
 <8c1dd697-ddee-d297-fc92-fe59391ff7a3@mailbox.org>
 <17268605DB982F0F.19634@lists.openembedded.org>
 <PU17LR.6HATELSCM57B@t-online.de>
Content-Language: en-US
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <PU17LR.6HATELSCM57B@t-online.de>
X-MBO-RS-META: oywtmhsztw8bgtkf7wy1ogejxk5g6563
X-MBO-RS-ID: 7980d1457b432a627c5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 13:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99586

This is a multi-part message in MIME format.
--------------UmMiwLgr4Q0zMEyZ5o2vg4dD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm upgrading the recipe right now, and I am skeptical about the 
media-session and wireplumber packageconfigs. Sure, they make sure that 
these two can't be in the same image, but this creates circular 
dependencies, because pipewire now depends on wireplumber, which depends 
on pipewire. And the same thing applies to media-session.

I am instead in favor of removing those packageconfigs and document that 
only one session manager should exist at the same time.

It would perhaps also be a good idea to establish a virtual package like 
"virtual/pipewire-session-manager" and add this as an RPROVIDES variable 
to the wireplumber and media-session recipes.

Finally, I asked the main wireplumber developed whether media-session 
shouldn't really be used anymore, and he agreed. But media-session 
removal can be done in a separate commit if we want to.


On 11.11.22 18:28, Markus Volk wrote:
> Am Fr, 11. Nov 2022 um 13:00:59 +0100 schrieb Markus Volk 
> <f_l_k@t-online.de>:
>> As to why wireplumber is not the default
>
> I would suggest that you create a patch that changes the default to 
> wireplumber and send it to the mailing list.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99557):https://lists.openembedded.org/g/openembedded-devel/message/99557
> Mute This Topic:https://lists.openembedded.org/mt/93186419/3617253
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [crg7475@mailbox.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------UmMiwLgr4Q0zMEyZ5o2vg4dD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Helvetica, Arial, sans-serif">I'm upgrading the
        recipe right now, and I am skeptical about the media-session and
        wireplumber packageconfigs. Sure, they make sure that these two
        can't be in the same image, but this creates circular
        dependencies, because pipewire now depends on wireplumber, which
        depends on pipewire. And the same thing applies to
        media-session.</font></p>
    <p><font face="Helvetica, Arial, sans-serif">I am instead in favor
        of removing those packageconfigs and document that only one
        session manager should exist at the same time.</font></p>
    <p><font face="Helvetica, Arial, sans-serif">It would perhaps also
        be a good idea to establish a virtual package like
        "virtual/pipewire-session-manager" and add this as an RPROVIDES
        variable to the wireplumber and media-session recipes.</font></p>
    <p><font face="Helvetica, Arial, sans-serif">Finally, I asked the
        main wireplumber developed whether media-session shouldn't
        really be used anymore, and he agreed. But media-session removal
        can be done in a separate commit if we want to.</font></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11.11.22 18:28, Markus Volk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PU17LR.6HATELSCM57B@t-online.de">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div id="geary-body" dir="auto">Am Fr, 11. Nov 2022 um 13:00:59
        +0100 schrieb Markus Volk <a class="moz-txt-link-rfc2396E" href="mailto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>:<br>
        <blockquote type="cite">As to why wireplumber is not the default</blockquote>
        <div><br>
        </div>
        <div>I would suggest that you create a patch that changes the
          default to wireplumber and send it to the mailing list.</div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99557): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/99557">https://lists.openembedded.org/g/openembedded-devel/message/99557</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/93186419/3617253">https://lists.openembedded.org/mt/93186419/3617253</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------UmMiwLgr4Q0zMEyZ5o2vg4dD--

