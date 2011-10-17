Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFvWf-000517-Bu
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 00:19:17 +0200
Received: by gyc15 with SMTP id 15so3329560gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 15:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=2HcGIjymWJUCIbefYclX3P4QzNRpJ1musKuT6d6/KvI=;
	b=iPtdgSMrS8lgaWsoWruse+5CLsQhqYLkqmx2Nc1dYjJb1Nd5jk+f9vD+ZbW5SZY1DK
	1nBZjVxk0DE21filyE6D25jPFW6nyQt4E6SrNuB1UBd/Gk5vpq82Up2H/fV5NvUVPfgs
	hPo9BKQv2EWTL+UkUmxOo2Ehywcx8pPGqeSg8=
Received: by 10.150.236.11 with SMTP id j11mr52969ybh.8.1318889607860;
	Mon, 17 Oct 2011 15:13:27 -0700 (PDT)
Received: from [172.23.8.192] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id t7sm29899672anh.15.2011.10.17.15.13.26
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 15:13:26 -0700 (PDT)
Message-ID: <4E9CA882.7080107@gmail.com>
Date: Mon, 17 Oct 2011 15:13:22 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com>
In-Reply-To: <4E9C93AB.7090705@telia.com>
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Mon, 17 Oct 2011 22:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 1:44 PM, Ulf Samuelsson wrote:
> If anyone is interested...
>

thanks for numbers. Is there statistics on 64bit host Vs. 32bit build 
host available too ?

> Same machine in two different configurations.
>
> .........................................................#1...........................#2
>
> P8Z68V Pro
> Core-i7 2600K @ 3.4 GHz..................4.4 GHz
> 8 GB @ ...........................................1333
> MHz...............1640 MHz
> 1TB WD Black 7200 RPM
> Ubuntu 11-10
>
> Almost all source code already in source directory
>
> Building meta-toolchain is 13% faster with overclocking.
>
>
> #1
> build: meta-toolchain
> START 10:46:23 55:52
> FINISH 11:42:15
> build: core-image-minimal
> START 11:42:15 17:34
> FINISH 11:59:49
> build: core-image-sato
> START 13:40:47 01:19
> FINISH 13:42:06
> Build fails, since one package could not be downloaded.
> build: meta-toolchain-sdk
> START 13:42:06 00:38
> FINISH 13:42:44
> build: adt-installer
> START 13:42:44 00:03
> FINISH 13:42:51
> build: meta-ide-support
> START 13:42:51 01:13
> FINISH 13:44:04
>
>
>
> #2
> build: meta-toolchain
> START 20:18:51 49:19 (vs 55:52)
> FINISH 21:08:10
> build: core-image-minimal
> START 21:08:10 16:38 (vs 17:34)
> FINISH 21:24:48
> build: core-image-sato
> START 21:24:48 15:38 (vs 01:19 - I think I have a problem in the first
> build)
> FINISH 21:40:26
> build: meta-toolchain-sdk
> START 21:40:26 00:59 (vs 00:38)
> FINISH 21:41:25
> build: adt-installer
> START 21:41:25 00:03 (vs 00:03)
> FINISH 21:41:28
> build: meta-ide-support
> START 21:41:28 01:03 (vs 01:13)
> FINISH 21:42:31
>
>
>



