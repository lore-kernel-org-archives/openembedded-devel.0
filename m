Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SKNmg-0004IU-1T
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 07:50:31 +0200
Received: by qao25 with SMTP id 25so209894qao.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2012 22:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=q0dfr/3Ihk1aFlesQJxjA5t0i10YPNs68c6c4oUZv+4=;
	b=ats6xeOuuMoU3QFyOOZTFIgbS1mzYaxJc2IfZ/B1cKVHDgNNWqbQA5LBGhY6nCsWI7
	y4FlL4yREFmNrWlmy2O1UI8z6UQjCwojH1vU9OvuhwWznkX4KLqAkA85jlddrByL62PJ
	oMOlSA/dqpwOeW4CF9ZH6tiWkJqVCB7Esg84QtuGW5B8DYot1IuQ06li9zRfBEM/bNQH
	j+6dUM19ryp6vm/ewl742OGm9J/oapOdmy88t+7cyudK+VnGMXSMJob/akWQF38yaOT0
	knwcj17q2R++7CP7azA1WIxW65T868TIztwNDl9YDY9LscwvS5ICmn7EOI2hCEaEAEQD
	nDGA==
Received: by 10.224.199.202 with SMTP id et10mr1769220qab.60.1334727662683;
	Tue, 17 Apr 2012 22:41:02 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id fo9sm44382476qab.21.2012.04.17.22.40.57
	(version=SSLv3 cipher=OTHER); Tue, 17 Apr 2012 22:41:02 -0700 (PDT)
Message-ID: <4F8E53DD.6060404@gmail.com>
Date: Tue, 17 Apr 2012 22:40:45 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
In-Reply-To: <CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Wed, 18 Apr 2012 05:50:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 10:30 PM, Khem Raj wrote:
> On Tue, Apr 17, 2012 at 5:37 PM, j<vwyodapink@gmail.com>  wrote:
>> Well finally caught what I think is the package the segfault kicks on expat.
>> Though not sure what I should look for to be able to sort it out but will
>> see where I get.
>>
>> Though I still get the gcc and bash messages in the QA log. If anyone is
>> willing to share some info on what or how I can figure out how to find what
>> causes the segfault in the recipe or if I am even catching the correct one.
>>
> you are not giving out enough information. Looking at dmesg is not
> going to give much info
> if ld segfaults which I assume is cross ld here then the corresponding
> recipe should fail
> and then you should look in the build of that package and the commands
> causing the segfaults
> should be in log.do_compile or log.do_install.
>
> Thanks
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
See thats the thing no recipe is failing but the system segfaults. The 
resulting images have had quirks which is what led me to trying to sort 
out the segfault issue.

Sorry to sound so dumb but if there is no recipe failing and 2 separate 
systems are segfaulting in similar manners and both result with not 
fully functioning images/packages where else can I look for info? I 
posted all the logs to one of the builds, and the QA log seems to be the 
only thing really spitting out anything. I am open to trying and or 
sharing any and all relevant info to help sort it out or get me on track 
to sorting it out.

Thank you for all the continued effort.


