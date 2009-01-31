Received: from [209.85.219.11] (helo=mail-ew0-f11.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LT5Tg-0002uq-Mt
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 03:21:00 +0100
Received: by ewy4 with SMTP id 4so49949ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 18:13:10 -0800 (PST)
Received: by 10.210.92.8 with SMTP id p8mr2142790ebb.6.1233367990592;
	Fri, 30 Jan 2009 18:13:10 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id i8sm2894762nfh.10.2009.01.30.18.13.09
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jan 2009 18:13:09 -0800 (PST)
Message-ID: <4983B3B4.5070201@xora.org.uk>
Date: Sat, 31 Jan 2009 02:13:08 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1232244759.git.andrea.adami@gmail.com>	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
	<200901310401.11885.jay4mail@gmail.com>
In-Reply-To: <200901310401.11885.jay4mail@gmail.com>
X-Enigmail-Version: 0.95.0
Subject: Re: [PATCH 08/14] zaurus-2.6.inc: switch to kexecboot and deploy kernel in /boot
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
X-List-Received-Date: Sat, 31 Jan 2009 02:21:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Yuri Bushmelev wrote:
> Hello!
>   
>> ---
>>  conf/machine/include/zaurus-2.6.inc |    4 ++++
>>  1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/machine/include/zaurus-2.6.inc
>> b/conf/machine/include/zaurus-2.6.inc index eee7631..8adb3d5 100644
>> --- a/conf/machine/include/zaurus-2.6.inc
>> +++ b/conf/machine/include/zaurus-2.6.inc
>> @@ -83,3 +83,7 @@ zaurus_make_installkit () {
>>  RDEPENDS_kernel-base = ""
>>
>>  KERNEL_IMAGETYPE ?= "zImage"
>> +
>> +# uncomment this if you want to override the legacy layout
>> +# and deploy kernel in /boot
>> +require conf/machine/include/kexecboot.inc
>>     
>
> IMHO, we are ready now to switch on kexecboot by default for all supported 
> zauruses (at least) in .dev branch.
>   
I think we are now as well, kexecboot makes zaurus booting a dream
compared to what it used to be. Haven't had any problems at all on the tosa.

Graeme (XorA)



