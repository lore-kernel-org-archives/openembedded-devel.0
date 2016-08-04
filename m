Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 811A276802
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 18:41:56 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so18748210pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=vm7YMlZMOBeoprImiteMWcDpUiEp5fm5IWeutcsyafU=;
	b=LZwluQrsUhM35+RsiGyrmoLshSDwhlMqDgEQZ2H/ZSmR91/n2RAOFUKfMpohx4YID4
	5f9eejI8aaeU5axzs1dMGmfIys2WsD4dw8ctDIiyIB/1gr0syFNK9kUsc1BcEr/Q1iwY
	1pRmpNmNsWbBtyO4LhQOueyati07F1pu03i0RpxPVwoR4pCI89YcktdU2ajDAcPLD2LK
	mkIo9VLZTifQ1J7Mcq8xjM7Nyg49fFJU3pHE1luxHt5EqnnIQTidUN3Q9PsQw6A5+jYk
	JBpWhw677Yn+WVc29xP2b+kzhBTyyJd7BJ7e8SqMYN5hmXw5HcTPFdPsOGVCcxRiFALj
	F0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=vm7YMlZMOBeoprImiteMWcDpUiEp5fm5IWeutcsyafU=;
	b=ZfqmhsqTZFiqK6jLQJ195NFORIFARdKjBWQB8OUPjQtxtlz/9Tgi1gwEQgk5Kvwya2
	RNKDe9t9Fbtu5oA4o9DnavTPMpIHVz4Sr5PCXQGJmt9BJQazXacDQ3eFXkXeE2V68XP6
	Hg3WP4IiokJ/eqpXG3rLtU3l3mXL93GdXCI4cNe7knwRCkiBfG6tpXmAjJADWAvvuKYe
	AXrOMaYkeHr5SFsaMAjOBGdj9U50l82gd/X1/UDNYKoMq/H4ZOqrcTfceqfeX6RqPWEc
	VYs7GF77z+7g/f+GRarwkwbMEQN0rmpqnf2MWheLb18oBcnp0Z/oNezzvxJzfMY7Fj/c
	1jww==
X-Gm-Message-State: AEkoouvGoZ2KsFv8lh0n7U/oXjS4iytQFyR+5gbiohnJ+QITueKiI8wMiWKrcm81AVPuEQ==
X-Received: by 10.98.152.129 with SMTP id d1mr129284991pfk.126.1470336116462; 
	Thu, 04 Aug 2016 11:41:56 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.156])
	by smtp.googlemail.com with ESMTPSA id
	9sm22057270pfo.74.2016.08.04.11.41.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Aug 2016 11:41:55 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1470146419.git.akuster808@gmail.com>
	<nnur0j$tp2$1@blaine.gmane.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57A38C72.6040601@gmail.com>
Date: Thu, 4 Aug 2016 11:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <nnur0j$tp2$1@blaine.gmane.org>
Subject: Re: [PATCH 00/64] Krogoth-next patches under consideration
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
X-List-Received-Date: Thu, 04 Aug 2016 18:41:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 08/04/2016 12:31 AM, Koen Kooi wrote:
> Op 02-08-16 om 16:07 schreef Armin Kuster:
>> Most GCC 6 fixed backported. A few packages where updated as they where mostly
>> bug fixes and I noted addition reasons within the commits.
>>
>> I am running builds now. please comment if there is any feedback or missed something.. I hope to have a formal request out by this weekend.
>>
>>
> 
>>   tvheadend: add CFLAG to ignore misleading indentations
>>   geis: add CFLAG to ignore misleading indentations
>>   fwts: add CFLAG to ignore misleading indentations
> 
> Won't this break building with gcc 4.x and 5.x?

Have not seen any issues with 5.x but let be double check. I would
assume that would have broken in master too since it has gcc 5.3. Have
not checked 4.x.

thanks for reviewing.

- armin
> 

