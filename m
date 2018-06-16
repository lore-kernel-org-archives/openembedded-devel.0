Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBC9B74D42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 04:31:36 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id l15-v6so13176384oth.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 21:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=iedSHKotYluH+pRX+Y5CgCs2oljR0PDF+rs9OH1Uieg=;
	b=b24Ok5uI4a56lexNyRDWXNmEl32xbzLS+vunkYfjlwLQS9z/TTT0Nk3laYcp8vp0YM
	QbRSDSzRgCeQY8qpXB8l82SiGmbGeefueABtaW32Nf9xfCK1K27sAzFXbqr88NToEdiB
	+gojtJl+zOKUWqk8LPVdHz5JBvD8Ll1RTKPcmMQbH0yIGBd++wUPezAnTjuEDRfH1iP5
	GEaSxWlhbNINUw3O1t+E5dIqwYKhQlES3b2GBpxJA0wAbFY+UQtp5bpVhN6ygMcXZSXc
	abbmfFEhzJ51n6iMAH3QJZyS84hypLvEJTvZ9jp7oUO+lRTHr72lSQUfM+znbJsP7Hkf
	H+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=iedSHKotYluH+pRX+Y5CgCs2oljR0PDF+rs9OH1Uieg=;
	b=MeNEJH5uOx7GkXkfrFXbgB8iYacsB3G49TgMDGOGDxRQ5ZkrTk/K5tlNk6qEjkQYuB
	ALg/S+YC0ahbgHewbQFhX7NqSk8cSegL+ynt+FSTqHWi5ojpEZ+C0ElCqU6fzkIxv3N2
	w/1P6xfzL+d3AyUxG4vic55l97JtHSA5hZOOJxS62DIhpFkbQjazTYtaj8G9HmlxLWYD
	AjSn4epnQGt+Ckyr5Q2xYYdcPlgNmrbtapamtYBRzturhICpMf3LgyyYCOKMtOT/72hS
	6Un+/+UyXyM29KsVcKspmlRzjZ5vNmj4m5RQtRq3U4TqUFbb31ldOibc2kt41/T0+AJJ
	t56w==
X-Gm-Message-State: APt69E0mvcvDs5FJwvXHXO4mF4FG0qQNHaSPj+wgnQg92cjFpEAXs/3u
	OOmX16r7ykNN34eqMzE1+bDpczYTxkI=
X-Google-Smtp-Source: ADUXVKJUBJ2zJPW9/cwvHbPQbPbrj0vAU1ZkUaRlMc0X40VKOPdzRNnSW8hRY7sNX2i4G+TFSiXlxA==
X-Received: by 2002:a9d:4044:: with SMTP id
	o4-v6mr2522344oti.283.1529123497285; 
	Fri, 15 Jun 2018 21:31:37 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	l17-v6sm6989362ote.76.2018.06.15.21.31.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 21:31:36 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1529119696-3508-1-git-send-email-jpuhlman@mvista.com>
	<CAMKF1spRUMqmBR6V8Yh2v0TM9u6tgWU=jshE_pW-jEDYnY=Uyg@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <cbf28da3-78f7-2b04-6603-aeb09c753a1d@mvista.com>
Date: Fri, 15 Jun 2018 21:31:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spRUMqmBR6V8Yh2v0TM9u6tgWU=jshE_pW-jEDYnY=Uyg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] stunnel: Use nogroup rather then nobody for group
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
X-List-Received-Date: Sat, 16 Jun 2018 04:31:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/15/2018 9:22 PM, Khem Raj wrote:
> Hi Jeremy
>
> On Fri, Jun 15, 2018 at 8:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> [log_check] warning: group nobody does not exist - using root
>>
> I do not see this warning in my builds. Could you share steps to reproduce it ?

I added meta-networking to my on top of poky(with meta-python and 
meta-oe) and added
IMAGE_INSTALL_append = " stunnel "
bitbake core-image-minimal

I had been getting it in our production builds, but I literally 
reproduced it this morning with the current master cloned today. If you 
inspect the configure file and search for the variable you should be 
able to see the check. On non-cross compiled systems it checks 
/ect/group for nogroup and uses it if exists. However since we are cross 
compiling it defaults to group nobody, which is not provided in our system.

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


