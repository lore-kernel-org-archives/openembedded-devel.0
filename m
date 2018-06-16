Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCAD75208
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 15:48:01 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f1-v6so6834183plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vLtkVfnNioSMm2sgYa/QNEtdg9iv6C4KVzkpVq8hOnU=;
	b=MMmTMiX3E5oEJyzSyLm6m6UYZ9XUR/jskbPke4cr3EtCkoupCwPZ/GH2uA9G+pHQKS
	rEE4+Z8FrSoMQoXkRz3LhEeegzyq6ro5hgDkZyKwdeyvxs4x8GJsClyUKtSmrfAF+xgQ
	TlkLljdKS6oo4TYcjuSSll1MqTbjBnKrjhkCDLwPuZfPdSK6bZbGQdY2SNyfe93b4wfn
	l1RJ4sQGquXS5RO1XRLYuTE67CVp4ACm6BstvjeCDBBFNQ5j9j6FOBBwgdyrkI6L/0RY
	VAeVAGInG3NSdpJwWsVXs5AKrj8m2QPCYhKe7hsmJuFsRfv7uYmvCcRhvxFyL2Weuixe
	ijfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=vLtkVfnNioSMm2sgYa/QNEtdg9iv6C4KVzkpVq8hOnU=;
	b=YJK9wLp1TCA3IScoMkZcfVlmvrvLClx3Jnva5xApjYL2Vi6a1R2jKwaVPLdIycEE5Q
	iRNUSiDA4XEWCB8MqpZfmlcoi6m5sSWf87svsMZ7oS+WJOyulevadOURUZIQ9ZBfrWxc
	HUa1WDHc883TBqNlcCfq2HyM328ZMgM965jk9U7BqlFQ14xchvMWgQU8YzXdpaP1KiZA
	Na1QE2yzbRtI1tfppxwUmPC4q50c2jPu15V7ditxjvr0Wao/qZsq9+1FbI9TYp3558Su
	JjjevbrCgJD1NcGRufwZVYAeGSYh03J9jUUPXSQu881rFZiDdnSV5ych6Ip5RBNyxA7N
	JtSw==
X-Gm-Message-State: APt69E1Zu0ZBSNh+o6JNkLj5KbcIw5HztUslODkfjN6gaKhL3O1HkNz5
	QnXwk/kf0Sgbr+WVur+t5lhYbpfd
X-Google-Smtp-Source: ADUXVKKGhwHsLMrJ9mD3MN8JJZ4LRLuS22DpGJdo1RN+UBkYMZALGJJJWmqxBYL3eYuAbwp1Nj9LOw==
X-Received: by 2002:a17:902:6acc:: with SMTP id
	i12-v6mr7052483plt.278.1529164082301; 
	Sat, 16 Jun 2018 08:48:02 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:9414:1129:bb93:e38c])
	by smtp.gmail.com with ESMTPSA id
	d6-v6sm18277721pgc.38.2018.06.16.08.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 08:48:01 -0700 (PDT)
To: Jason Wessel <jason.wessel@windriver.com>,
	"Jeremy A. Puhlman" <jpuhlman@mvista.com>, akuster808
	<akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <1528499179-8589-1-git-send-email-jpuhlman@mvista.com>
	<e0d37e88-7135-4bd8-2f0e-3b8faca30b79@gmail.com>
	<d1f1d05a-7bed-7bf2-9813-52c7f42e33ea@mvista.com>
	<1da9d7a8-fbcf-4fb8-71fa-f5a693dbe9a8@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <560a96e6-ddbf-07fb-6d0e-456666a2489b@gmail.com>
Date: Sat, 16 Jun 2018 08:47:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1da9d7a8-fbcf-4fb8-71fa-f5a693dbe9a8@windriver.com>
Subject: Re: [meta-networking][PATCH] spice: Update to git hash to pick up gcc8 fixes.
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
X-List-Received-Date: Sat, 16 Jun 2018 15:48:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/16/18 6:26 AM, Jason Wessel wrote:
> On 06/09/2018 10:52 AM, Jeremy A. Puhlman wrote:
>>
>> On 6/9/2018 7:39 AM, akuster808 wrote:
>>> On 06/08/2018 04:06 PM, Jeremy Puhlman wrote:
>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>> ---
>>>>    meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb 
>>>> b/meta-networking/recipes-support/spice/spice_git.bb
>>>> index 35482ca..508bb36 100644
>>>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>>>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>>>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = 
>>>> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>>>    PV = "0.14.0+git${SRCPV}"
>>> Is it still at version "0.14.0" ?
>> There does not appear to be another release branch. So its 0.14.0+git
>> additions.
>>
>>>> -SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
>>>> +SRCREV_spice = "33d9c38554b41dab1390914ef79594b57218b06b"
>>>>    SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
>>>>    SRCREV_FORMAT = "spice_spice-common"
> 
> It doesn't appear that this fix has been applied to the tree yet.  I 
> have a newer version, which also fixes the upstream changes for libopus, 
> which I just posted to the list "[oe] [meta-networking][PATCH] spice: 
> Uprev to fix compile errors from gcc 8.1.0".
> 

it is sitting in master-next so it is slated for master, however I am 
willing to take the version you posted, if the review comments are 
addressed in v2

> 
> Jason.
> 

