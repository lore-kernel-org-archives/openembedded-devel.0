Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFE9F013F5
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:11:05 +0000 (UTC)
Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46689.1773652261064430307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=I4UQ8p8U;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=HY7y8Nyy;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1773652259; x=1774257059;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=eawYmcalhKkYphZ5LF5QFyiwHfaRG7nY5M4cIFmF9BU=;
	b=I4UQ8p8UaKoZd8s8vs/RTZlqR7rIbfkeK6mlY768v+QGH9olH9P0tOXP0gwo4upOi+h64Cx1Itj2J
	 4vVDXZ/8lH0GnKDU9gl3zgQKWG+IiubcGuPkQ4GafdRQYHZ3f0c+pPshZ2WLVGbE0hX+oPtLmfNkIw
	 0fOL31NB+T3WafvGjJlgjMsf3B6uK0YJD7Z3wjfkW+9f4RRSBr5nP5ett0bULgkx+rrOfw9GbvsPTi
	 gi0bU4AcEHzEKgamCxguJ7Tz13F8jJbm4K0wAPCHB1k8MbyHWREEgzti/JpF6PU1ezpJDbmiDAnGH6
	 b9MM7Yq2oIEs524j71w6OFn7CfvOdEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1773652259; x=1774257059;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=eawYmcalhKkYphZ5LF5QFyiwHfaRG7nY5M4cIFmF9BU=;
	b=HY7y8NyyDDjVFWLYC9q3DUgJosXNpBwcI7Wtm63zt0tA2BnHtQ5cYweKsHm5VkWYUfZNgGUp6pmM7
	 NgvbtaSAw==
X-HalOne-ID: 0b7d57fc-2118-11f1-9935-fb5fec76084d
Received: from [192.168.100.34] (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 0b7d57fc-2118-11f1-9935-fb5fec76084d;
	Mon, 16 Mar 2026 09:10:58 +0000 (UTC)
Message-ID: <57c7fd65-3738-4c44-ae76-dc1350304d17@berginkonsult.se>
Date: Mon, 16 Mar 2026 10:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] rtla: add recipe for real-time linux
 analysis tool
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20260306113922.3319380-1-peter@berginkonsult.se>
 <20260306113922.3319380-2-peter@berginkonsult.se>
 <5936c190-5ec4-478f-8cf1-e27c209b0979@gmail.com>
Content-Language: en-US, sv-SE
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <5936c190-5ec4-478f-8cf1-e27c209b0979@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125268

Thank you for feedback!

On 3/15/26 08:49, Gyorgy Sarvari wrote:
> When built against musl, this fails with the following error:
> https://gist.github.com/OldManYellsAtCloud/3a96bf193bad86c8cd67ab30faa38d3a

Sent v2 here: 
https://lists.openembedded.org/g/openembedded-devel/message/125267

(I also sent "[PATCH 1/2] cpupower..." as v2 by mistake but no changes 
there)

/Peter



