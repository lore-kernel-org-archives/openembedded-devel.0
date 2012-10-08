Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gmarco.dev@gmail.com>) id 1TL74f-0003j4-Tr
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 08:44:22 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so1708285bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2012 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=3i0w31Wr2YKZ7rLAJThaBEmawYbvXSFmg4TAo/+i/To=;
	b=dRK2QYGCeGJ4oBSMp28uCsgSQtyQujBG9XplxMSGrLqTS75J6BYTLaeKZV6xGUvwnI
	4Fl88RTcfgozAnE5eEX03ZUq9ms2fH/PE/IuUbvpaG/R+7tRkEe0tlrIHoD2p6hNlCfc
	V9PDaQx9TzhrwiS9fKPERa1RWJ/xjDydSFS+5wfKBhPNgEfogTa4bSk27ZkZTKbyo7ud
	wd18d7COjLCsQrAcwJQ+b8owCPF+qr9QeV/0FuAl7pt4ajqCDu2YbFB+B08sbl99ofgm
	Fl5kbjjdfKauBVLa0mlnivyC/uQfHCWPE6rkgvpc2h/vxqOXooHpQSfYj8omvI00Extk
	xffw==
Received: by 10.204.136.197 with SMTP id s5mr4975547bkt.88.1349677876242;
	Sun, 07 Oct 2012 23:31:16 -0700 (PDT)
Received: from [192.168.1.149] (net-93-70-97-230.cust.dsl.vodafone.it.
	[93.70.97.230])
	by mx.google.com with ESMTPS id g8sm11243857bkv.6.2012.10.07.23.31.14
	(version=SSLv3 cipher=OTHER); Sun, 07 Oct 2012 23:31:15 -0700 (PDT)
Message-ID: <50727328.10703@gmail.com>
Date: Mon, 08 Oct 2012 08:31:04 +0200
From: Marco Guerri <gmarco.dev@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
	<20121005105103.162c1a06@eb-e6520>
In-Reply-To: <20121005105103.162c1a06@eb-e6520>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: External toolchain - Helloworld works but help needed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 06:44:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Thank you to everyone, I've solved my problem following the example of 
external-sourcery-toolchain.bb. Now all the libraries are deployed 
correctly into the filesystem and I can boot a minimal-image. Right now 
I'm using oe classic but I will switch to oe-core asap.

Best regards
Marco

Il 10/05/2012 10:51 AM, Eric Bénard ha scritto:
> Hi Marco,
>
> Le Thu, 4 Oct 2012 16:16:44 +0200,
> Marco Guerri <gmarco.dev@gmail.com> a écrit :
>> I'm having some troubles trying to get a working filesystem for a custom
>> board based on a Freescale iMX35 SOC.
> you can find our working BSP for an i.MX35 board here :
> https://github.com/eukrea/meta-eukrea
> (use MACHINE="eukrea-cpuimx35")
>
> Best regards
> Eric



