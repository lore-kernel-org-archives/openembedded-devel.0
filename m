Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MWRif-0006Cn-SG
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 11:14:37 +0200
Received: by ewy23 with SMTP id 23so548153ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 01:59:36 -0700 (PDT)
Received: by 10.210.79.3 with SMTP id c3mr1385205ebb.16.1248944376822;
	Thu, 30 Jul 2009 01:59:36 -0700 (PDT)
Received: from ?192.168.1.64? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 28sm1279623eyg.40.2009.07.30.01.59.35
	(version=SSLv3 cipher=RC4-MD5); Thu, 30 Jul 2009 01:59:35 -0700 (PDT)
Message-ID: <4A7160F2.8030000@xora.org.uk>
Date: Thu, 30 Jul 2009 09:59:30 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A6FD077.1060001@gmail.com>
	<h4ou1e$s42$1@ger.gmane.org>	<4A700A74.7040507@xora.org.uk>	<200907291131.04967.marcin@juszkiewicz.com.pl>	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>	<20090730053353.GF25691@smtp.west.cox.net>
	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
In-Reply-To: <6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Thu, 30 Jul 2009 09:14:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> 2009/7/30 Tom Rini <trini@embeddedalley.com>:
>   
>> That should work.
>>     
>
> Could you show me how?
> I have tried, but the ${UBOOT_ENTRYPOINT} used by either linux.inc or
> kernel.bbclass is parsed and put into the run.do_foo file before the
> symbol searching occurs.
>
>   
Why dont you prepend it to the current uImage creation code running only 
conditionally on UBOOT_ENTRYSYMBOL being set? As its in the same bit of 
shell code your resetting of UBOOT_ENTRYPOINT will take precedence! Also 
means other machines can use it.

Graeme



