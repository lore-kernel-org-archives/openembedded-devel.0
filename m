Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C203CC282D0
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 02:25:04 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.14813.1740747907038605684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Feb 2025 05:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=CR8+9JuJ;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5637B9C8A25;
	Fri, 28 Feb 2025 08:05:06 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id KxqVFHA3LVgR; Fri, 28 Feb 2025 08:05:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 099959C8A26;
	Fri, 28 Feb 2025 08:05:06 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 099959C8A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1740747906; bh=4UVHpWxMVUL8AlW044kOuDJ9QNiRLigT0k7Mk2VbVqw=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=CR8+9JuJVkr+Dbsje0wxekeych9ATjkqpvXNQaH3v/Q5Vkz4cEIfjRg4EsBEROVS8
	 69Ks0vwmYmQSAeiY8p9GMFoImP9bCns7pr9IepuJIUcheXQu7T1iKV1aBv0hMZvIyI
	 J3NPpF8NeIEGfBSER0007c3i3k3nC7MupePfGBYJ9cKY7/MSV+llCqv8/+BC/3127X
	 UQoGVl68aMgA4StBirtHaLoWqfLWsOJkYyYbZDF5eBap+xmy/jCpKWZeJTGcfcweOX
	 DAPZqcMaezfr+Pqj3uUKSWSIt/xbgd5nXIzQZaoGCOnpCP1kjFLwFZP8qhBcA8fwBb
	 9RqkncrQ2bqjA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id FXAbmt1A1ZbG; Fri, 28 Feb 2025 08:05:05 -0500 (EST)
Received: from [192.168.216.61] (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 99ED89C8A25;
	Fri, 28 Feb 2025 08:05:05 -0500 (EST)
Message-ID: <4073d1cc-d36d-4ab9-ae24-c29229a20de5@savoirfairelinux.com>
Date: Fri, 28 Feb 2025 14:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gnuplot: add x11 PACKAGECONFIG
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20250227153529.82380-1-paul.leguendekerneizon@savoirfairelinux.com>
 <d290aab6-a3cd-402d-a1dc-a6ab2278e377@gmail.com>
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
In-Reply-To: <d290aab6-a3cd-402d-a1dc-a6ab2278e377@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------RJBi5VDTltacualT4LdfUIVA"
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 02:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115714

--------------RJBi5VDTltacualT4LdfUIVA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your reply; I saw these args after, I did the needed 
modification in the v2 patch.

Thanks,

On 27/02/2025 18:15, Gyorgy Sarvari wrote:
> On 27.02.25 16:35, Paul Le Guen de Kerneizon via lists.openembedded.org
> wrote:
>> +PACKAGECONFIG[x11] = ",,virtual/libx11"
> You could also pass --with-x/--without-x to explicitly control the
> inclusion of x11-specific parts (though I'm writing this without trying
> the resulting package - if this config options not the wisest thing to
> do, then I won't push it any further...)
-- 
Logo Savoir-faire Linux inc.
Paul Le Guen de Kerneizon
Free software consultant | Rennes, France
Logo Jami pleguendekerneizon

--------------RJBi5VDTltacualT4LdfUIVA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thanks for your reply; I saw these args after, I did the needed
      modification in the v2 patch.</p>
    <p>Thanks,<br>
    </p>
    <div class="moz-cite-prefix">On 27/02/2025 18:15, Gyorgy Sarvari
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d290aab6-a3cd-402d-a1dc-a6ab2278e377@gmail.com">
      <pre class="moz-quote-pre" wrap="">On 27.02.25 16:35, Paul Le Guen de Kerneizon via lists.openembedded.org
wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+PACKAGECONFIG[x11] = ",,virtual/libx11"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">You could also pass --with-x/--without-x to explicitly control the
inclusion of x11-specific parts (though I'm writing this without trying
the resulting package - if this config options not the wisest thing to
do, then I won't push it any further...)
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <div class="wrapper"
style="font: 14px arial, sans-serif; font-weight: normal; max-width: 480px;">
        <div class="logo" style="margin-bottom: 10px; width: 100%;"><img
src="https://static.savoirfairelinux.com/img/signature-courriel/logo-signature-sfl.png"
            alt="Logo Savoir-faire Linux inc." width="138" height="39"></div>
        <div class="wrapper-name" style="margin-bottom: 20px;">
          <div
style="font: 18px arial, sans-serif; font-weight: bold; color: #2b2e30; margin-bottom: 5px;">Paul
            Le Guen de Kerneizon</div>
          <div style="color: #768089;">Free software consultant |
            Rennes, France</div>
        </div>
        <div class="phone-ring"><img
src="https://static.savoirfairelinux.com/img/signature-courriel/jami-picto.png"
            alt="Logo Jami" title="Jami" width="14" height="13"> <span
            style="color: #768089;">pleguendekerneizon</span></div>
      </div>
    </div>
  </body>
</html>

--------------RJBi5VDTltacualT4LdfUIVA--

