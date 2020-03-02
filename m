Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0B6560FF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 18:25:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so104935plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wY3OXfrtWzQvOp0RB2wN5ybwgGhVw62cCUpeTDH+WvI=;
	b=Q3K2yLEns6vma0qU2ka8REq291nBZlebagnYlpyLCpH9kq3RcMJlIBiVjoD3g6iayA
	wY2c2sWhYL3HIfeyHkXothrrzejklEmIxMkAUrOpugeNZF46mHpLU4RPg3EvFQ/11o4h
	zHTnuJKBKY/m2etFZExF28k/fod6hxNqhlBW9cwdg7kbSLL2h/lqtGAWLBfQrIxXImDa
	BVbCil6DqyDKEDKZhyn797sTZuf/3FXsxdDsjtBYWWtiUx/oH6It266a55HmQ8W63DaN
	fvNUNC6lu6PppT/Ug7VDXlLOZ7MtEzkkcBi+/D0zb9KOVfoGUdpQYpIaKbnOBpuhd/PO
	Wjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wY3OXfrtWzQvOp0RB2wN5ybwgGhVw62cCUpeTDH+WvI=;
	b=IA9vIXoycVcj8BpQGLIRTYtm7Quow5WqaN4BhXG10k4HOOZG794T4a9HHddjHKK4wH
	wC/9z32ew1zCLcLawBuvxBBnRSpZmGEAk5IeLPlecsqOU14+HT5pq0i8FeVecuRXB0n7
	6UTtnCRn32lYWnnvKEPCJQ+89kmBZtIBEIc4tXfuYFDWrm7mDlDcCmaypoHHrc3JpF0g
	6yzN4ar8LL/qIk9RJMH4Pw+8nvEI9wefnocL7noU5yuz2s5mpIb57iHI1V+x4BDPk0xh
	uHKHgfTi0nYeUnFpq7zBN6+R5YMMXC7WCsq9RMo93cG7tw/jcEOjU+nzxy077tcn1NU0
	38nw==
X-Gm-Message-State: ANhLgQ1n1rpoZpMW20z5fQUFTRbnsH66KPyXY9rvvAGQg+yTDJj6tiRp
	Xnmq4k+NaGIszCTRm+sH0Ns=
X-Google-Smtp-Source: ADFU+vu7icri4Cn05cfkWpEM/OKM/qd6GDw1w+bHW2USoc4iRa/DLZaB7uZmFggXqBwP4CrFfMz/hg==
X-Received: by 2002:a17:90a:5801:: with SMTP id
	h1mr193460pji.121.1583173550103; 
	Mon, 02 Mar 2020 10:25:50 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id 69sm3074481pfz.97.2020.03.02.10.25.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 10:25:49 -0800 (PST)
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
Date: Mon, 2 Mar 2020 10:25:48 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Mon, 02 Mar 2020 18:25:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/2/20 9:39 AM, Bartosz Golaszewski wrote:
> pon., 2 mar 2020 o 12:25 Otavio Salvador
> <otavio.salvador@ossystems.com.br> napisał(a):
>>
>> On Mon, Mar 2, 2020 at 4:37 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>> niedz., 1 mar 2020 o 14:43 Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> napisał(a):
>>> This single class surely doesn't justify a new layer but I have a
>>> bunch of other stuff lined up for upstreaming if this is accepted.
>>> This is thematically separate from most of the recipes in meta-oe too.
>>
>> So please give us an idea of what are your plans, so we can understand
>> it better.
>>
> 
> Sure. Next steps would be:
> 
> - Adding a class for generating provisioning partition images.
> Basically allowing to split parts of the rootfs into separate ext4 (or
> other) image similar to what meta-mender does in its mender-dataimg
> class for /data but generalized for configurable directories.
> 
> - Adding an image recipe for a factory reset system, where we would
> store the provisioning rootfs on a read-only partition together with
> an initramfs the role of which would be to reflash the A/B partitions
> to bring the device to a known state, this is something we do a lot in
> our consulting work.
> 
> - Adding standardized target-side scripts for applying binary-delta
> images. This uses the fact that many OTA frameworks support extensions
> to their client programs. For instance the same script could be used
> for applying the vcdiff and rsync patches both as a mender update
> module and a rauc handler (with a thin compatibility layer in their
> respective OE layers).
> 
> It still doesn't exhaust the subject but I think this really makes
> sense in a separate layer than being sprinkled all-over meta-oe.
> 
> Khem, Armin: any thoughts?

there are many ota layers on OE, most of them are self-contained, so a 
question arises, how is this different, somethings here say it could be 
a base layer for all OTAs, which actually seems quite valuable, but it 
has to be such that the existing OTA layers start using pieces from this 
layer, Other part seems to be that its yet another OTA using binary 
delta update techniques, so in such a case, it should be thought of as 
another OTA and perhaps maintained independendently, if there are 
features which are common across all OTAs we can host them in core or 
meta-oe,

> 
> Bart
> 

