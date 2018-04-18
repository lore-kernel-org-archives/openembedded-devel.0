Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 602847454B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 07:53:22 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id b5so474242pgv.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 00:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gpw8T/iYijlcVRyQT703YaONi1hjMOhP0UcnOgnfiME=;
	b=fmO7UYtdNI3EqJ7HPwjeeFxnDVtjOUsuvdJu2SIk9GRqkt2UKnsGsQMKz1RWtUeZaY
	nRbgQHmH4mr2rgdz+/GYHmrr8tpxRZ7yhl3cKos/pszj0vtuld+rqtjRQlCq8W4qpKxJ
	eWf2vNq5OFTFSpdxxDtvfnQSRZnoFd8eLDzKA2ZTV/58kguWiZpmTc1Fu95wLTHUqxTS
	UPa85cdKUgGeK2LKFUvT0D9WWQLT3Elz75IXZ0Q7SWsQTelNyoCkuusqNcVPyVs0IMxi
	pNX4YVckO1mAJ8lFAnLCPVN54rRoXINEJ9hUa7QJpfoHuCRXut1LNCqadb+j7bWrmNPD
	sJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gpw8T/iYijlcVRyQT703YaONi1hjMOhP0UcnOgnfiME=;
	b=AHrYxPZMfui7460nFRUayTb9W2TNA6S3RnyA/Z33dxE24SxM86k8VRjboIv+eY0EeC
	dT8qODz65Jq/+6C111Qo8ILgvIAlAvPz5n27W6zxq918hnUyeUWO1qIk9cDfjY27eNrk
	pwR8UbRbAqWyzWVPNuSSVYYvFfsUL4g3wu08I1i/qH7s24e4JdDd9zI7ksWc8HjTUNR2
	WfS+MMgVldw3JNOmJkleWhCntCJ7l8gWLIsjr5e3sqk5lvv5hhFthEapsfXVuVIb50uR
	qiLHzxcQMVCqaYlLM4lkZQu/XigyMwyKo6tP6A/qTldNSV6jEH3kuZSyg9xgsxzb+AXl
	lSXg==
X-Gm-Message-State: ALQs6tARq3JJS0zLZb2BzVboqZXrc305MvL/n9LLtyB+zLYPe4JdQv6u
	YWCGPPCeQf1TVnLcUfxcz2sSjA6e
X-Google-Smtp-Source: AIpwx4/I+JL8JkA6pK2DqVwALuYxxCwUZ/gUTPsu/n9Jn/X+3R6EuL1bx86w7j2z6f+S61SXpS0h4A==
X-Received: by 10.101.97.72 with SMTP id o8mr938813pgv.120.1524038003148;
	Wed, 18 Apr 2018 00:53:23 -0700 (PDT)
Received: from hermes.local ([2601:646:8880:466c:68e6:e447:164c:d4e7])
	by smtp.gmail.com with ESMTPSA id
	z15sm1414213pgr.55.2018.04.18.00.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 00:53:22 -0700 (PDT)
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-devel@lists.openembedded.org
References: <88609bfc-f9db-8487-a3bf-523687b2b307@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <72e5eafd-02c9-13cd-0fb6-85802df01b7c@gmail.com>
Date: Wed, 18 Apr 2018 00:53:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <88609bfc-f9db-8487-a3bf-523687b2b307@siemens.com>
Subject: Re: [meta-openwrt] systemd units for OpenWRT components
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
X-List-Received-Date: Wed, 18 Apr 2018 07:53:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/17/18 11:51 PM, Pascal Bach wrote:
> Dear meta-openwrt maintainers
> 
> I'm currently trying to use several OpenWRT components as standalone services.
> During this process I added some Systemd units for them.

Thats perfectly alright, just ensure that they are covered under systemd 
DISTRO_FEATURE

> 
> Is this something that would be accepted in the meta-openwrt layer?
> If not I would have to put this into a separate layer which seems to increase the maintenance effort.
> 
> Regards
> Pascal
> 

