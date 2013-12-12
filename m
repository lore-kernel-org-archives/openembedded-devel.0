Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id B78FD6DD10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 01:15:56 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wo20so7741999obc.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=8yaBMIiXR2jHbzBPBAF+yxCmKxBxENk03ClK2w3IYzU=;
	b=j0FuFc4X1Bjemch8Y0x741ol92/A/Kn4Gu5xvXRcj3ob53OlBlJ9buNShN5cb7+d3C
	cDkjcRlaehzl0wkr/UcHJvxyluraWpc3KM9asX91NlqcvrVcL5tDr00NQzhv34RCxGuO
	bMOTWL0Z8YpAmSeZVKW/UtGny88jGEXaCF+7gBYzGmH7/6dYny9EY8m1tk1L3JFa3Z70
	KIUfhEnevKOuS7VpaCpu04y5YKgvk9NKOKpE3dO/bvQjLRQCkl4z0z99S4Cr95S07Vgd
	LqOXWBbmgHRGHtp4GnE9Z7f6qPPKd4/n2VkXHZHTUlshQKDqehNCImWJ+LdWw5Ibru/K
	ToUw==
X-Gm-Message-State: ALoCoQmOl44d/Woe396Z9kb4EzRk1VLusaVqj0Ndk3Jf9YJjaEXe3BJAElu4/qjaGVBaX4//wMof
X-Received: by 10.60.65.101 with SMTP id w5mr3583494oes.0.1386810955235;
	Wed, 11 Dec 2013 17:15:55 -0800 (PST)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162]) by mx.google.com with ESMTPSA id
	xs17sm40878067oeb.1.2013.12.11.17.15.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Dec 2013 17:15:53 -0800 (PST)
Message-ID: <52A90E47.9030202@felipetonello.com>
Date: Wed, 11 Dec 2013 17:15:51 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>	<14902072.IG3b8o4YqW@helios>	<l77732$ggi$1@ger.gmane.org>	<1825979.KGUos5WM3r@helios>	<l777t2$pcq$1@ger.gmane.org>	<CAGrhNMxYxbA-dL0iQFB_mD-s94nrKupCx-vJaijp=sPy5herwQ@mail.gmail.com>	<l86mmo$28c$1@ger.gmane.org>	<52A74F65.3090202@felipetonello.com>
	<l898do$4h1$1@ger.gmane.org>
In-Reply-To: <l898do$4h1$1@ger.gmane.org>
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Dec 2013 01:15:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

On 12/11/2013 12:40 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Felipe Ferreri Tonello schreef op 10-12-13 18:29:
>> Hi Koen,
>>
>> On 12/10/2013 01:26 AM, Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>
>>> Felipe Tonello schreef op 10-12-13 02:17:
>>>
>>>> It does split into packages. I splited it up in packages just so if
>>>> the user wants to have different backend options, it can.
>>>>
>>>> The problem with this aproach, is that you will add the apt and opkg
>>>> dependency to the build even if the user doesn't care about it. I
>>>> don't like this option to be honest.
>>>
>>> It's only 2 small build time dependencies saving a lot of rebuilding
>>> and runtime headaches.
>>
>> So what's your suggestion for me to fix this patch?
>
> Go with option 2)

What do you suggest to do with regards the "--with-default-backend=" 
configure param?

Felipe

