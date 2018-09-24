Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 416BA600BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:56:33 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d8-v6so2751923pfo.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d+U3XhwBl0jmEA3cKm3ztDpnWxj+9t+S4YLPuX5IOgM=;
	b=q3aTpX1DZ+mhPzlNkTLcze1jHgsGSdCQM5BfoGRKQ9GFlBzOdfUhp1pEfwF+FlDF3i
	ciOKMStdNVAFosJJd6rOR73btHM+l4lgWBya5nY3Wb6jq0fx4bKXk0ApFGiN2PqNkLRk
	VKl62iv0O2mVW8pKuXqHN3FIhNgU7f56CLgjufGB3SkntacNOUmw9ZdyP4AuJdAJkTXR
	HorpE5MLLbNy65Ytiuj910PV5SHlk2v4368xcOgIYu9fQhWpRkZ0g/TKs2HvsGqUg2Q5
	2srey4fthAvJrCe00i3tKsbqej+ZZnOaX6GpV5If/wDLyl6F/OaQpOlrWed+2rnLS95e
	dnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=d+U3XhwBl0jmEA3cKm3ztDpnWxj+9t+S4YLPuX5IOgM=;
	b=lCK/P+hfEqWIyq6hrQeZ6Keq4rXWVHK6tKW4sHQJCncqw5ulGjjZKxZhA457o05ctw
	sn7b83i+BRudAv77wMfPIffEBmw6jYuI/h0jR76OiYKD0+Kn1olRJXAxeqOl8yaz7iO/
	Q3/QjTOYqV4kpMpiMD3+ozjoDDxu+X8nbmJSaYsUlmKXI04ahUc8wkCo+n5k/1PVa1oS
	lu1STA/feNyeaWXirDLP1p/dpmLjr+UMLTp/M1dQNOvgKxyUsZLfhh3wkPJEAfPYJHj7
	Mmx2x1PsKJRdyjL5UAKbzu4fG5S7x9ubmn3hyCb1YFC+nLktpPXyJWU7nZkynY8EO0mR
	hz/A==
X-Gm-Message-State: ABuFfohxlKF1CHKflV9uRZ4SqePuJQMukwCLOc+E4if9Qp6/LcwEtfFk
	XmLto3M1Y5vBziELUf+HKazZSrQj
X-Google-Smtp-Source: ACcGV63CNQinVdd3KX5Q2sbHBamm6pzq1EO3mjuq7WxPh300bg9Y9V/jWMqIGNbia2OPx4VlHD+dyg==
X-Received: by 2002:aa7:8613:: with SMTP id
	p19-v6mr587975pfn.247.1537826194264; 
	Mon, 24 Sep 2018 14:56:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:6924:aad7:81c1:2e32?
	([2601:202:4180:c33:6924:aad7:81c1:2e32])
	by smtp.gmail.com with ESMTPSA id
	v20-v6sm388124pfk.12.2018.09.24.14.56.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 14:56:33 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20180924201705.30209-1-nicolas.dechesne@linaro.org>
	<CAMKF1sqg6-DnQE7MGuxe4RnScu_uoXW6iker022pW6Q7FRS5dg@mail.gmail.com>
	<CAP71Wjw78UsD9opN1bEUCo3B_FZL0YY3HpvabQufdUhNT0JNzw@mail.gmail.com>
	<CAMKF1sqhabbZdhZb4zhJAGFS+4RiQ0MYdd71JSHPqzwFZiDTSw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <51c09965-9463-5220-549d-8a2472a8f165@gmail.com>
Date: Mon, 24 Sep 2018 14:56:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqhabbZdhZb4zhJAGFS+4RiQ0MYdd71JSHPqzwFZiDTSw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-multimedia: fixup LAYERDEPENDS
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
X-List-Received-Date: Mon, 24 Sep 2018 21:56:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/24/2018 01:53 PM, Khem Raj wrote:
> On Mon, Sep 24, 2018 at 1:45 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> On Mon, Sep 24, 2018 at 10:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>>> Dos2unix is in oe-core now please try with master
>> ouch. sorry, i missed that. I noticed the issue while running the YP
>> 2.0 compliance script against sumo branch... how do we get that fixed
>> in sumo then? can we apply something like the below patch on sumo
>> directly?
>>
> I think that will be fine as long as Armin is fine
> with it. Please retag the subject appropriately and resend.
At the tone, please leave a message beep....


>
>>> On Mon, Sep 24, 2018 at 1:19 PM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>>> libebml depends on dos2unix classe since 26dafa0f3542 (libebml: inherit
>>>> dos2unix), so LAYERDEPENDS needs to be updated accordingly, otherwise we are
>>>> getting a ParseError:
>>>>
>>>> ERROR: ParseError at
>>>> /srv/work/oe/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
>>>> Could not inherit file classes/dos2unix.bbclass
>>>>
>>>> It was initially found with yocto-check-layer script.
>>>>
>>>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>>>> ---
>>>>  meta-multimedia/conf/layer.conf | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
>>>> index cfedf2f6b..a1dfed4e9 100644
>>>> --- a/meta-multimedia/conf/layer.conf
>>>> +++ b/meta-multimedia/conf/layer.conf
>>>> @@ -27,6 +27,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>>>>  # cause compatibility issues with other layers
>>>>  LAYERVERSION_multimedia-layer = "1"
>>>>
>>>> -LAYERDEPENDS_multimedia-layer = "core"
>>>> +LAYERDEPENDS_multimedia-layer = "core openembedded-layer"
>>>>
>>>>  LAYERSERIES_COMPAT_multimedia-layer = "sumo"
>>>> --
>>>> 2.18.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


