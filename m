Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QvWQX-0001Bf-UL
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 17:28:38 +0200
Received: by yxl11 with SMTP id 11so1329355yxl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=K+1HKDM0aaPNJvCkNQk4W4dDpjJew4wMbm6QTiVDPvs=;
	b=JzEd3Nf1eP30mCxSf4r1b7F9gEK6m6ZLT4XLswo6PWTDbklY0QhQsrxeYQ3cEyNb5D
	M+2tCQoulF8iZ6tMvFHDs11kDHqaNyuo8J/pYj1dzI8S87r2QxYKGxsvV77Tet1sUat/
	jWJ3j2absAny7npubnEoe4t9uozP7orD/8psk=
Received: by 10.91.27.24 with SMTP id e24mr2474789agj.83.1314026633315;
	Mon, 22 Aug 2011 08:23:53 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g17sm5318417ank.10.2011.08.22.08.23.50
	(version=SSLv3 cipher=OTHER); Mon, 22 Aug 2011 08:23:51 -0700 (PDT)
Message-ID: <4E527485.70305@gmail.com>
Date: Mon, 22 Aug 2011 08:23:49 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201101310012.51498.schnitzeltony@gmx.de><1296461709.3922.4.camel@mattotaupa>
	<20110131090826.149890@gmx.net>
	<989A078976CDAD4CB2DC976EEF70E2A5068A53EB@eu2-mail.mgc.mentorg.com>
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A5068A53EB@eu2-mail.mgc.mentorg.com>
Cc: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Subject: Re: [meta-oe] need to add some verfication package recipes
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
X-List-Received-Date: Mon, 22 Aug 2011 15:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/2011 12:53 AM, Ahsan, Noor wrote:
> Hello,
>
> I need to add some packages in meta-oe which are related to verification and benchmark. The packages are as follows. I just need to know in which directories the recipes of these package should go.
>
> 1. lmbench (Tools for performance analysis)
> 2. netperf (benchmark the performance of different type of networks)
> 3. iperf (measure maximum TCP and UDP bandwitdth)
> 4. bonie++ (filesystem benchmark tool)
> 5. izone3 (filesystem and disk benchmar)
> 6. dbench (used to stress the filesystem or a server to see which workload it become stuarated)
> 7. tbench (filesystem benchmark which generates load patterns)
> 8. toibench (multithreaded I.O benchmark)
>
>
> Kindly suggest me to which recipes dir the recipes for these package should go thanks.

recipes-benchmarks seems more appropriate here. If the directory does 
not exist create it.

>
> Regards,
> Noor
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



