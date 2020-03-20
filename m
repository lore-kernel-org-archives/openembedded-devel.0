Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 08B6B61B41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 15:53:11 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t3so2644932plz.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=9LrBXAlG1a/Rebw2KvPFXH1QRl+1DAFdotS8RTjSmDE=;
	b=uCzrN2jYVhgrM1B9pUqXTPCCXE+EcK5IsiEf8RLXIai8hCimYfUP3dHBve+gVdTN9v
	Kv/j2e9CybdH7XGRPViEzF09rRGy9BOqqHFAiTiW+8LzyNPcoAF3998BhnGBcAGLzDTa
	5Qi1hj9ZKIjERsHoJ4qA0XhLyZ6RRwhSkrX/KlVftvXCNU/BXJsGFs6tuXNP9sPYmGVA
	O7VztibXf6wO2LA4EDlzvXr1n0PCgaYKadx7Jq85NuKk78YWtnY0t+2fexR5sZGtCHJu
	XlIaOBmxM6jsJZwZfO+sfQMwvg1jLIlhJVtw/DiYC/nrO6D5r8e6EWdLWiX3P3N4duRz
	wuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=9LrBXAlG1a/Rebw2KvPFXH1QRl+1DAFdotS8RTjSmDE=;
	b=PZuNskx4hFmC5X46YvgqNrjQSoQpKLt4YsxeM7HYiJzUBtqpu9U7z6S59LvigZ8ueF
	4pBqmMvX7oVJO4QNoP7wV85KfcoodPoXiBdLCoOV/acv7z0WFAhRCRe1R5RLgNgeTR7O
	NmZGw1jWPJcqK86rwiIW0HMwwMFao/5VJi38h+AyDK3xfHIJveTq5Siqh/C1t9SpgBGB
	g0REVp3cc3F33jkCzB6VBNM/C0SusdNB8lunzR/cqs6U+AK6en5vqBinhNcipUNIzonU
	hEWAd42rv19kVejrvYwyvPgP22O/cLUfavxMDx+eyJUzSSVAyk+bnuBfyTD7uOIn++eR
	qGkg==
X-Gm-Message-State: ANhLgQ3juAWJI/FUVM/Aw+crx6pi9qhPUoD4e9+e5wf+IxTJqNXd3toi
	c53cs+CbwpK7nJqFJsyN+VRxfqL8
X-Google-Smtp-Source: ADFU+vtF8g6A1HNctUvqXwmM58wsGx1F9PG5ZrRUrmxqWC90GPlfKj6MlFejC/BiJdzgrbkUNvwQFg==
X-Received: by 2002:a17:90b:3645:: with SMTP id
	nh5mr10495802pjb.150.1584719592324; 
	Fri, 20 Mar 2020 08:53:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:7d4a:161a:ec93:c30e?
	([2601:202:4180:a5c0:7d4a:161a:ec93:c30e])
	by smtp.gmail.com with ESMTPSA id
	w15sm5951446pfj.28.2020.03.20.08.53.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Mar 2020 08:53:09 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20200320144553.2587659-1-raj.khem@gmail.com>
	<20200320144553.2587659-3-raj.khem@gmail.com>
	<CA+chaQczKRWOke9maR0n_4LRZ4KsUWYDuEjWtE7-Gawk8RoCRw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dd222844-2183-a23c-d445-ac90b3305043@gmail.com>
Date: Fri, 20 Mar 2020 08:53:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQczKRWOke9maR0n_4LRZ4KsUWYDuEjWtE7-Gawk8RoCRw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] layers: update LAYERSERIES_COMPAT to dunfell
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
X-List-Received-Date: Fri, 20 Mar 2020 15:53:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/20/20 8:27 AM, Martin Jansa wrote:
> Can we drop at least thud and warrior? without e.g. features_check or
> mime-xdg bbclasses from dunfell oe-core some of these layers don't even
> parse, so it might be worth keeping just dunfell (that's what I did for
> meta-qt5 now).
Not to mention the shifting of packages between core and meta-oe.

- armin
>
> On Fri, Mar 20, 2020 at 3:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-filesystems/conf/layer.conf | 2 +-
>>  meta-gnome/conf/layer.conf       | 2 +-
>>  meta-initramfs/conf/layer.conf   | 2 +-
>>  meta-multimedia/conf/layer.conf  | 2 +-
>>  meta-networking/conf/layer.conf  | 2 +-
>>  meta-oe/conf/layer.conf          | 2 +-
>>  meta-perl/conf/layer.conf        | 2 +-
>>  meta-python/conf/layer.conf      | 2 +-
>>  meta-webserver/conf/layer.conf   | 2 +-
>>  meta-xfce/conf/layer.conf        | 2 +-
>>  10 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta-filesystems/conf/layer.conf
>> b/meta-filesystems/conf/layer.conf
>> index e8bd3628f8..be1635deea 100644
>> --- a/meta-filesystems/conf/layer.conf
>> +++ b/meta-filesystems/conf/layer.conf
>> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>>
>>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>>
>> -LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell"
>> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
>> index d381fdf070..7aa9507eb5 100644
>> --- a/meta-gnome/conf/layer.conf
>> +++ b/meta-gnome/conf/layer.conf
>> @@ -17,4 +17,4 @@ LAYERVERSION_gnome-layer = "1"
>>
>>  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
>>
>> -LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
>> diff --git a/meta-initramfs/conf/layer.conf
>> b/meta-initramfs/conf/layer.conf
>> index 93220b1208..634e0883c6 100644
>> --- a/meta-initramfs/conf/layer.conf
>> +++ b/meta-initramfs/conf/layer.conf
>> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
>>  BBFILE_PRIORITY_meta-initramfs = "8"
>>  LAYERDEPENDS_meta-initramfs = "core"
>>
>> -LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell"
>>
>>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>    dracut->virtual/kernel \
>> diff --git a/meta-multimedia/conf/layer.conf
>> b/meta-multimedia/conf/layer.conf
>> index 74dd4a1b03..2d52fb938a 100644
>> --- a/meta-multimedia/conf/layer.conf
>> +++ b/meta-multimedia/conf/layer.conf
>> @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
>>
>>  LAYERDEPENDS_multimedia-layer = "core meta-python"
>>
>> -LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell"
>> diff --git a/meta-networking/conf/layer.conf
>> b/meta-networking/conf/layer.conf
>> index 866bda7558..7bc0702ba7 100644
>> --- a/meta-networking/conf/layer.conf
>> +++ b/meta-networking/conf/layer.conf
>> @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
>>  LAYERDEPENDS_networking-layer += "openembedded-layer"
>>  LAYERDEPENDS_networking-layer += "meta-python"
>>
>> -LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfell"
>>
>>  LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index 652a378f28..434537fd3a 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -34,7 +34,7 @@ LAYERVERSION_openembedded-layer = "1"
>>
>>  LAYERDEPENDS_openembedded-layer = "core"
>>
>> -LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
>>
>>  LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
>> index 2c730e4c75..1361fe0842 100644
>> --- a/meta-perl/conf/layer.conf
>> +++ b/meta-perl/conf/layer.conf
>> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
>>
>>  LAYERDEPENDS_perl-layer = "core openembedded-layer"
>>
>> -LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell"
>> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
>> index db65943f56..7cfeafe599 100644
>> --- a/meta-python/conf/layer.conf
>> +++ b/meta-python/conf/layer.conf
>> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
>>
>>  LAYERDEPENDS_meta-python = "core openembedded-layer"
>>
>> -LAYERSERIES_COMPAT_meta-python = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
>>
>>  LICENSE_PATH += "${LAYERDIR}/licenses"
>> diff --git a/meta-webserver/conf/layer.conf
>> b/meta-webserver/conf/layer.conf
>> index 2c6fad4ac6..24469115e4 100644
>> --- a/meta-webserver/conf/layer.conf
>> +++ b/meta-webserver/conf/layer.conf
>> @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
>>
>>  LAYERDEPENDS_webserver = "core openembedded-layer"
>>
>> -LAYERSERIES_COMPAT_webserver = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell"
>>
>>  LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
>> index 070ea6ac7d..199c69e7b2 100644
>> --- a/meta-xfce/conf/layer.conf
>> +++ b/meta-xfce/conf/layer.conf
>> @@ -19,4 +19,4 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
>>  LAYERDEPENDS_xfce-layer += "meta-python"
>>  LAYERDEPENDS_xfce-layer += "networking-layer"
>>
>> -LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus"
>> +LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
>> --
>> 2.25.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


