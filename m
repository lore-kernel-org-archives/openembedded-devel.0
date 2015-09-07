Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C0D2A7669F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:08:26 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so81725989wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Sep 2015 05:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ikd5U/J8DluGwVRDvFb+FMQbEuLztPrLy/QHT0KkntU=;
	b=JbiDz1IWuk6iwmdwjFw3y3ST7A9MxS4py7D7cCCmUN64hBEXzLbXfSAWhqHyNFRhjI
	+Fs62QeSBoCor162Dod+DQT1RBnNZTfMjsTQycj+kxwv8jyCMM1DQKfD5zWWKZib3IhO
	mOU6GVshM218t/j0VkMaMRwgZddN1bkG91qkwaI3BRNryXiPCzruFh0uVibwAmXFAwDx
	9GM4U9T0TDP06eoW+MeLcfEXsYr932f/fQMWsriLH/uud9rKCmr1VEi53NvaJKDuLn87
	tDrSi7uEFTiSCPP7r6W9OZPLV92p8uX4YtDoP11fzdC8R8TCma8X0oechT7JgIWRCep0
	+jgA==
X-Gm-Message-State: ALoCoQkds/YDudQ7+s8R1Zsdp1GpFJ40WoHpuItKEBWvR7tZehVHMdq4qjqYLPrJN5NB75CPjWNZ
X-Received: by 10.180.105.196 with SMTP id go4mr30346169wib.36.1441627706304; 
	Mon, 07 Sep 2015 05:08:26 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	wo2sm19738525wjb.2.2015.09.07.05.08.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Sep 2015 05:08:25 -0700 (PDT)
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>, pb@pbcl.net
References: <55E949A4.9050805@dresearch-fe.de> <55EAD217.3010806@topic.nl>
	<55ED383E.6070005@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55ED7E38.8050201@dresearch-fe.de>
Date: Mon, 7 Sep 2015 14:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55ED383E.6070005@dresearch-fe.de>
Subject: Re: [OE-core] "sub" machine types?
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
X-List-Received-Date: Mon, 07 Sep 2015 12:08:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 07.09.2015 09:09, Steffen Sledz wrote:
> On 05.09.2015 13:29, Mike Looijmans wrote:
>> ... and I think the u-boot recipe recently learned to have multiple targets, so you can build multiple bootloaders for a single machine too.
> 
> That sounds great. Can someone give a pointer to some documentation or examples for that?

Is it correct to just replace the UBOOT_MACHINE item in the machine config with something like this?

UBOOT_CONFIG ??= "sub1 sub2 sub3"
UBOOT_CONFIG[sub1] = "mymachine_sub1_config"
UBOOT_CONFIG[sub2] = "mymachine_sub2_config"
UBOOT_CONFIG[sub3] = "mymachine_sub3_config"

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

