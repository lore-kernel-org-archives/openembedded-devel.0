Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1FF7D72F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 01:14:16 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b3so1855688plr.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2019 18:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IAg5XByb7Tb6c7sixxYr0i0uT4nt7iGUp1NQDS0PVf4=;
	b=Uq/+o9N0H8xCNWt1YsjCMp3FKSyv4Z9RjpzjlRimapwNVDnGSNBddLAEvalrlq8s7S
	II11Zz3rw2ihwdOVMvjE2AED65ZP5H3g829dHnmh2qfYQNrofRS8x6KSrpKNdUGke1ZP
	e56q4pIQXD1L2bs0kVTUQh+p9IDktN01+OGmbFOA5JE5nJ/VJn3fA/+f7eEiWu+QugO0
	IkG8lkmoyxvQ9IT8LZdsI2JsfF8XPZ/M8M372NQz7IvlmVZ+dlilmQJcxZlag3Hb+yAn
	QiztGHM3G/ppRQ8Z6gTAKCn9YfLxew5HbhZs3TK+vPa+Qql3J/64L4eYA3p52F1N8YQ6
	7VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IAg5XByb7Tb6c7sixxYr0i0uT4nt7iGUp1NQDS0PVf4=;
	b=hLiLWN13UpQEESMNQI0y4zbH4h3fsHyPAq5tlQV81u68nSofBZC9UGcMPGy5xCJ3/t
	67A+kHKnzJInZOffmVKrjfWWirgiwJfs+hDq1cwas6Lg3GKefdw3JtX+eIR73vftSYwB
	CDJ+bjMGUH0Yg7iPJjm45rx9IuK82DjaxNxeKnZ25rQO8hwd8DCIg+4sY63MYvxpzLlz
	UQhY7uHxZ8TZISMcY3PGOvjJF+UKOow/L1Fc/rm00wuIGLCwttF0gkUgeT/kfJ+Rac6L
	r1ew39ktkeZQhVg6bAOvDsY1RsGm2Hl6TnngYimP1QIcSud2rB+ya93l82cMDijz4C5z
	p/rg==
X-Gm-Message-State: APjAAAUg7Da/2P0bWrj558mlD95GknwZntOuIwsje/drwft81A6Qtzde
	0VhiDl9pN1WAIu++3nvSb6eOYH2t
X-Google-Smtp-Source: APXvYqxfk6ZR4XDiFDecMYjg3YN3XR1G8ZTVT0Y58eeECON9+MpZOdx/zu3s31Fc/KV0NbqpnpB/qg==
X-Received: by 2002:a17:902:364:: with SMTP id 91mr6915758pld.72.1556846058064;
	Thu, 02 May 2019 18:14:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7403:feaf:ea56:abf7?
	([2601:202:4180:c33:7403:feaf:ea56:abf7])
	by smtp.gmail.com with ESMTPSA id a6sm543944pgd.67.2019.05.02.18.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 18:14:16 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
	<20190501152748.GY31207@bill-the-cat>
	<044a379d-73f2-2f5d-3539-004becfebaa9@gmail.com>
	<CAMKF1soM4_R_WSxFbDTDMrMmuMAn64NS4Te6rFn9-PDvyiKt0g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7fd19117-a765-34c3-1c10-784170b68316@gmail.com>
Date: Thu, 2 May 2019 18:14:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soM4_R_WSxFbDTDMrMmuMAn64NS4Te6rFn9-PDvyiKt0g@mail.gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Fri, 03 May 2019 01:14:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/2/19 2:30 PM, Khem Raj wrote:
> can we also remove older layers from LAYERSERIES_COMPAT while here
Sure we can ; )  v4 shortly

- armin
>
> On Wed, May 1, 2019 at 8:56 AM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 5/1/19 8:27 AM, Tom Rini wrote:
>>> On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  README                      |  2 +-
>>>>  meta-filesystems/README     | 12 ++++++------
>>>>  meta-gnome/README           | 10 +++++-----
>>>>  meta-initramfs/README       |  8 ++++----
>>>>  meta-multimedia/README      | 10 +++++-----
>>>>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>>>>  meta-networking/README      |  6 +++---
>>>>  meta-oe/README              |  8 ++++----
>>>>  meta-perl/README            | 10 ++++------
>>>>  meta-python/README          | 12 +++++-------
>>>>  meta-webserver/README       |  8 ++++----
>>>>  meta-xfce/README            | 10 +++++-----
>>>>  12 files changed, 49 insertions(+), 79 deletions(-)
>>>>
>>>> diff --git a/README b/README
>>>> index 7318f09..881115e 100644
>>>> --- a/README
>>>> +++ b/README
>>>> @@ -1,6 +1,6 @@
>>>>  Collection of layers for the OE-core universe
>>>>
>>>> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
>>>> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
>>>>
>>>>  This repository is a collection of layers to suppliment OE-Core
>>>>  with additional packages, Each layer have designated maintainer
>>>> diff --git a/meta-filesystems/README b/meta-filesystems/README
>>>> index 87cb685..d9f07df 100644
>>>> --- a/meta-filesystems/README
>>>> +++ b/meta-filesystems/README
>>>> @@ -10,30 +10,30 @@ Dependencies
>>>>  This layer depends on:
>>>>
>>>>    URI: git://git.openembedded.org/bitbake
>>>> -  branch: master
>>>> +  branch: 1.40
>>> I may be starting off on the wrong patch here, but, did 1.40 or
>>> bitbake.conf ever get patched up such that rm_work doesn't cause
>>> world-rebuilds every time?  I recall when digging into this before there
>>> was a "maybe if we tweak $something it'll be happy again with this older
>>> bitbake".  Thanks!
>> V2 sent.  Thanks for the review.
>>
>> Thanks,
>> - armin
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


