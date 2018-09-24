Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id EACBF793B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:51:12 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id a23-v6so2023203pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QNncee08GOVLn33wyBo1JUuSKxIl9s63cNHphLm/wAs=;
	b=rPODyu5vvSfMEEZQPQXZgavcYT0rA5UaYHU60D0hrczHIGDlj2dh1sIchGF12ZjO3p
	Rky5WP76z4+hPlK/w2G30pBcq+T4t05lmr2GJZAuNL/7n+hzfuEwUL6JzzZ9EF8rSFxT
	+IHcaZX56nwIV3ClGClmy7udJOVi6A3LHeX0JMI7DUUfk2V7x8tiEjx/kVr9reaHt8iC
	mluoceqiICatfKmTL1IEB20sgj/F9dWgagPve5vM2mizVRL4nWxE+68PXLiMQ31ISyv/
	jRTvMTtQASOcCxNV2cMaW3x91TCo6l9QRFNI8wAuyImNn98Y9jriPUyNRV0NpgyrXJ8y
	yvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QNncee08GOVLn33wyBo1JUuSKxIl9s63cNHphLm/wAs=;
	b=jWNZP4pW4rRZsploZh03tpm96KTDfjGdPT9lpyi3IfOUzdm9ValtBdC/I0CTLRGzfE
	Lp4xqpsW+71r/9o2+InxJBC/FUqVHq9TQ0e7lZnt7RB3zOgZFLrRbGZnumGuWc7puFNS
	TJbR9SshjpJydy950DGcGBnP4WgVwcTKfhdjcinkexjqSVTbJnjX2w2abEcwHVLH0VeC
	ef7vZH2YWL0bhZvmDIE9LXL+7iUKF7EaN46my124IWvzOaMMdaEdbcaxhEKvNGhS4uIO
	9ur/gGYC0UKweSUpUGQoTfi+JF5sMc/1QUZ/SlXkw8zeO9e7UdzUiJ7VvzMrJMaralE3
	SRNg==
X-Gm-Message-State: ABuFfoi8M1uNh5Dl9xz3zrlJF+S/PiakAfjg9Um7lUyOBFM9zwydj26U
	/8OrIRDFrktzlQDlTBN7SMpX3GQ1
X-Google-Smtp-Source: ACcGV607+Yyfm4D0n8QTRgnGDR6J22QxqQRsdWfC8/KY4uZCRG2zd14G1Qn+ucOBEHVBZe40w7T48g==
X-Received: by 2002:a63:6781:: with SMTP id
	b123-v6mr550363pgc.151.1537825873652; 
	Mon, 24 Sep 2018 14:51:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:6924:aad7:81c1:2e32?
	([2601:202:4180:c33:6924:aad7:81c1:2e32])
	by smtp.gmail.com with ESMTPSA id
	p73-v6sm357595pfk.186.2018.09.24.14.51.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 14:51:12 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
Date: Mon, 24 Sep 2018 14:51:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2100274.NFsm02Mysr@localhost.localdomain>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe and yocto-check-layer
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
X-List-Received-Date: Mon, 24 Sep 2018 21:51:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> Hi Nicolas,
>
> On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
>> hi Armin, Paul, Richard,
>>
>> I was looking at getting the compliance report for meta-oe (sumo
>> branch), and I have found a few issues.
>>
>> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
>> depends on meta-networking (c-ares). It was fixes in master, with
>> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
>> this fix needs to be backported to sumo as well if we want the YP 2.0
>> compliance script to even work. If agreed, once merged, please let me
>> know so that I can try again to generate a compliance report.
> Is it appropriate to make such moves in a stable branch? I wouldn't have 
> thought so.
>  

We have to. Per my understanding and why I tried very hard to make
meta-openembedded clean ( appears I failed) is that if you want to be
Yocto Compliant and include any layer that does not pass this test, you
can not become Yocto Compliant.

Or relax your rules!!!.

- armin
>> * in order to run the compliance report, i locally added
>> networking-layer in meta-oe/conf/layer.conf, and it creates a
>> dependency loop since meta-oe <-> meta-networking. I found out that
>> yocto-check-layer doesn't like that too much, and brutally fails. The
>> following patch makes yocto-check-layer work again even with
>> dependency loop. I am going to do a few more tests and send that over
>> as a patch.
>>
>> diff --git a/scripts/lib/checklayer/__init__.py
>> b/scripts/lib/checklayer/__init__.py
>> index 2618416fab..0cc9bf3b6d 100644
>> --- a/scripts/lib/checklayer/__init__.py
>> +++ b/scripts/lib/checklayer/__init__.py
>> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf, layer,
>> layers, logger):
>>          logger.debug('Processing dependencies %s for layer %s.' % \
>>                      (depends, layer['name']))
>>
>> +        # To avoid never ending recursion, we keep track of layers while
>> +        # they are being processed in this 'static' attribute.
>> +        if not hasattr(recurse_dependencies, "layers"):
>> +            recurse_dependencies.layers = []
>> +
>>          for depend in depends.split():
>>              # core (oe-core) is suppose to be provided
>>              if depend == 'core':
>>                  continue
>>
>> +            if depend in recurse_dependencies.layers:
>> +                continue
>> +
>> +            recurse_dependencies.layers.append(depend)
>> +
>>              layer_depend = _find_layer_depends(depend, layers)
>>              if not layer_depend:
>>                  logger.error('Layer %s depends on %s and isn\'t found.' % \
> Patch looks reasonable to me FWIW.
>
> Cheers,
> Paul
>
>


