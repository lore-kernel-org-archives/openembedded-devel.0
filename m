Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3356972E9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:35:12 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j2so6778739pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tFC8rFdISDIzmGSKnPPFDRNYBSBF9sOuueeZv42wmAY=;
	b=Jlq1yKGBp0l+yJAsleH8tMYN8itT8xcnHy5I40FKBXsOpGg7JKzyd4APXanwHBXhSj
	VFRX8m3OgYwJF3IfBEXUCNv4fMFxLhBzpCaNIC6y4lXs08IJP1zWNO2njyYGXq0XNFj+
	1ZBpDvVjgVOR8rlEG/R8OJ62lQ1gcPUq8qmKGp6BLS3ERRR8RuzHPqbQoko9Poe2CCXO
	KHT4TdHWZOneVgkt2h5jx0KbheC6tPl6M5OXJ+NDX+LEK5bsiyl9TcVUoVhOtMa08AAN
	XHj1h0ja0NFUOSzYXQFTrkhQt0eo+tE8/b3pHjkoxyP+MHr3Wf9IBZTZFGr9AlP+f/T+
	VotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tFC8rFdISDIzmGSKnPPFDRNYBSBF9sOuueeZv42wmAY=;
	b=LvrzhEU+hqoOWaNyfXhVMRyM9Sruhaz9Ih/TERpWLMGIanOl+yGmi7hRXm/m+TYebw
	dUNYKTq04MJmjCUwFXTsdxU2KIye1T+08OIt3xXHXnhVWJqdG1+3pPEe4O3FlbxlgvHX
	jJlCs8VVhxUu27HkEyV68DT4gDPrZD28tr+K3hHhl+F8KsZXTWsFqQs+Zk5P1O62Q6XH
	1mTwQNV7NuT59s2R1fgiMF/FgrN94/hrkhk2jUqLcUsqpZWJsID/dDDvxajtHEF+AKvK
	9U4ZX1ZBoepQcaBRSVztWSR9jGqNPjLqWoZ1cPparZG+671TL4s5xgyWcZJqGfYnBgN2
	IlbA==
X-Gm-Message-State: ALQs6tCE7lifGeeNplyd0fxZU/G17A2JqyzViytYkoZZ/crF6VQgVZtS
	QpBd2WZsq47Y9dgQV9GjjdeGCA==
X-Google-Smtp-Source: AIpwx48qoYbYI99107NyADc9Orw2Pn7p8ltlYDvbSpJNoyvPfARB+68isw8QddvtEI+Sebfe16fsOA==
X-Received: by 10.98.87.150 with SMTP id i22mr854407pfj.119.1523320513414;
	Mon, 09 Apr 2018 17:35:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	w27sm2970389pge.20.2018.04.09.17.35.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 17:35:12 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
	<1523319756-8431-4-git-send-email-akuster808@gmail.com>
	<e944f201-cbc6-41e2-5efe-6c3e430bef92@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <154b0617-b0ad-cb0a-25a9-9908363d7c4a@gmail.com>
Date: Mon, 9 Apr 2018 17:35:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <e944f201-cbc6-41e2-5efe-6c3e430bef92@intel.com>
Subject: Re: [meta-oe][PATCH 04/10] libreport: add PACKCONFIG for gtk
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
X-List-Received-Date: Tue, 10 Apr 2018 00:35:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/09/2018 05:29 PM, Anuj Mittal wrote:
> On 04/10/2018 08:22 AM, Armin Kuster wrote:
>> needed when no X11 in DISTRO_FEATURES
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
>> index 525437b..e963014 100644
>> --- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
>> +++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
>> @@ -5,7 +5,7 @@ HOMEPAGE = "https://abrt.readthedocs.org/"
>>  LICENSE = "GPLv2+"
>>  DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
>>          json-c libtar libnewt libproxy rpm \
>> -        augeas satyr systemd gtk+3 \
>> +        augeas satyr systemd \
>>  "
>>  
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> @@ -26,6 +26,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>>  
>>  inherit gettext autotools python3native pkgconfig
>>  
>> +PACKAGECONFIGS ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
> Typo? Should be PACKAGECONFIG.
I would not be surprised. V2 shortly.

thanks for the feedback and review.
Armin


