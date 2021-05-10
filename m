Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
 by mx.groups.io with SMTP id smtpd.web11.33013.1620659370071962950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 08:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=gsBcPAuT;
 spf=pass (domain: pr.hu, ip: 87.242.0.7, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1lg7XD-0004sP-8n; Mon, 10 May 2021 17:09:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/Wj/BwVp18w0etZreW02b7czZvYgjNYnGLPYrU1NozQ=; b=gsBcPAuT3vhEjJjN/8nHwW0UQn
	8ZMouy5ba7/M2/zVtj08ezYwgJaGLOyvJBdevO6lQ6PvAY3mzYFASRC5Vl+Rbqd+v5Ju0bcFCCwaG
	VMpYfzAVDap1PEQG1jXvafNZOBiSH8AZZkQdU66HUsfvoQPJh3+SJsauipJCczq9JX+cifsJ59AuV
	0k5YoCSpbv8yfPWVv7aaZiFppp5C9ADv6fhF8ydVrqg+HkkokSL+Nbk6WaEhqroy+8uF6nNHtB+vA
	pYSb1hAG8TShRoC2XkYZpausR4MJEjHt3dDeXARIPhZiKU5Xdj/kw18raxxb5BnY1LLI1wJjw7I+Q
	nzoOXMXg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1lg7X9-0006Kj-3h; Mon, 10 May 2021 17:09:25 +0200
Subject: Re: [oe] mariadb-native fails to build on Fedora 34
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <59e17e43-74f3-76f4-69e1-150f152c1831@pr.hu>
 <CALbNGRS6ML4LCrU-AmeSukS1PoZeqhvOJ7hB1D-dN88Ju5ZaBQ@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <b0464301-6580-0334-0932-e4f81fde444f@pr.hu>
Date: Mon, 10 May 2021 17:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRS6ML4LCrU-AmeSukS1PoZeqhvOJ7hB1D-dN88Ju5ZaBQ@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 02d3abc61471e6dd9f9388029c518d83
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210510150925Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 05. 10. 15:59 keltezéssel, Andreas Müller írta:
> On Mon, May 10, 2021 at 3:51 PM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>
>> Hi,
>>
>> mariadb-native 10.5.9 on Hardknott fails to build on
>> Fedora 34 host with a lot of "undefined reference" linker errors.
>> It's likely related to GCC 11 on the host OS.
>>
>> BTW the same MariaDB version is shipped by Fedora 34. ¯\_(ツ)_/¯
>>
>> Best regards,
>> Zoltán Böszörményi
>>
> Hi Zoltan,
> 
> There are two patches around for this: Khem sent an upgrade to 10.5.10
> which is in master-next (haven't tested that yet). Have missed that so
> I sent a fix for 10.5.9

Strange. After "bitbake -c clean mariadb-native mariadb"
the build have succeeded.

Best regards,
Zoltán Böszörményi

> 
> HTH
> 
> Andreras
> 
> 
> 
> 
> 

