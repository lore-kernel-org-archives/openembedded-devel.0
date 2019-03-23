Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBF76BD57
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2019 16:39:05 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i2so3553516pgj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Mar 2019 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HGB2cx/TkZWWbTeRAyOKUSwpqF9jt4d3gxMMxldZLMI=;
	b=bo7GMBPdSakTYTTdI/uOdQy9nB6s+gILXRFYq6BEi5ReuCe3vXxbrDQdalUn7dtP7f
	LJ4ba4yrLVSaXruQ8ZdxxksyNeWZ7YkzrfW/ZxW9SurguS030La40GkyLpLCldvqiehP
	NehTfqAuXySGeqba9emEh1sI/Dwb/pvY4aDfgCNOcxKKhECx2FndFQ7lR+xFoSPem2/z
	SBohIGPhq5+5xfvSyvkCZJlwIWJ+fipvt40ilxv6XxCIdUU5fQli0jcfMb4Y07v90HiH
	l1d3rE7ds/BA/6fSQI07PSfIEFc2titiSBL+QKQ00KxPDaoiGXvwCGteRImFoUhN3Bds
	HSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=HGB2cx/TkZWWbTeRAyOKUSwpqF9jt4d3gxMMxldZLMI=;
	b=lqqBcdy3XbpbxoEN5Ah9/bXrgJLwnVPcNZTULazEw0LJmFn+dfn1uQ+zg6e6XuQI53
	3jEk4RQum3EDDNObvzJDr9S0sT/tRyk2uwNl94SDdgWJbkIwWBjA+v8BwmTFgmbicCiW
	FA9EkIJHVaHl7KTd4vAWIvCQHXaPWdNo6UnWwk6W9CafWFz3qL9+LiXXEDWs0o++rfJq
	kyftX9gg3qXic4HdOFskTZQ+BmYJy6mfdqz5wBDPgNOV2kZrzCJckWK5pSiAx1IR9qh6
	saV347xZsyXNrwb/KKehZ2qD1Q/56uACPfyvK6KwczWTQw+bxE/jMybNQ1KmGHjx5gkw
	o/MQ==
X-Gm-Message-State: APjAAAWdN74dUuvVjtf56kwBZF4svD0z03bRsIyF3KjzDvZrdjNzoFLb
	oWGmzhsvwEiNv3M3EYIGyLY=
X-Google-Smtp-Source: APXvYqy0JCMxdRgLNhtD4C3yycHincpf4R0ou/yNuUj4tvFP0CEIlQpz0hN6cZK0nUJKu9C+ngSMGQ==
X-Received: by 2002:a62:70c9:: with SMTP id
	l192mr15333269pfc.207.1553359146738; 
	Sat, 23 Mar 2019 09:39:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9ce3:bbbb:72cd:d5f9?
	([2601:202:4180:c33:9ce3:bbbb:72cd:d5f9])
	by smtp.gmail.com with ESMTPSA id
	p86sm21135662pfa.104.2019.03.23.09.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 09:39:05 -0700 (PDT)
To: Damien Riegel <damien.riegel@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190307211112.30386-1-damien.riegel@gmail.com>
	<CAL4iiOexopa=xYiKTWojG-=8n7-UdeCEujbFhSsJ=Z7wrJFk3Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dfbd7a54-1f7a-596e-7994-c296dd8b9269@gmail.com>
Date: Sat, 23 Mar 2019 09:39:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAL4iiOexopa=xYiKTWojG-=8n7-UdeCEujbFhSsJ=Z7wrJFk3Q@mail.gmail.com>
Cc: =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@jci.com>
Subject: Re: [meta-networking][thud][PATCH 1/2] mosquitto: fix build in systemd environments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2019 16:39:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/22/19 12:55 PM, Damien Riegel wrote:
> On Thu, 7 Mar 2019 at 16:11, Damien Riegel <damien.riegel@gmail.com> wrote:
>> From: André Draszik <andre.draszik@jci.com>
>>
>> The mosquitto systemd service file instructs systemd to wait
>> for mosquitto to notify systemd that mosquitto has started
>> correctly. This isn't working as mosquitto is not *compiled*
>> with systemd support enabled. As such, systemd restarts
>> mosquitto every few seconds.
>>
>> For reference, this was introduced in commit a483d344d9fb
>> ("mosquitto: Make enabling systemd also enable build dep on systemd")
>>
>> Because we build mosquitto using the provided Makefile
>> infrastructure, the solution is to add PACKAGECONFIG_CONFARGS
>> to EXTRA_OEMAKE, so that the required make flags are added
>> to the make command line.
>>
>> Signed-off-by: André Draszik <andre.draszik@jci.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
>> [Damien Riegel: backport from master]
> Armin, did you get a chance to take a look at these backport patches?
Yes, i did.
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/thud-nmut

should be moving them to thud-next shortly

- armin
>
> Thank you,


