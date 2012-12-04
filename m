Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TfsVl-0003Ok-48
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 14:26:17 +0100
Received: from localhost ([127.0.0.1]:35867 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TfsHq-0006tk-Eu
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:11:46 +0000
Received: from [195.171.99.130] (port=19593 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TfsHq-0006th-Cc
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:11:46 +0000
Message-ID: <50BDF709.5090505@communistcode.co.uk>
Date: Tue, 04 Dec 2012 13:13:45 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50BDECAC.5070805@communistcode.co.uk>
	<50BDF27F.2030804@linaro.org>
In-Reply-To: <50BDF27F.2030804@linaro.org>
Subject: Re: php-cgi cannot install package
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
X-List-Received-Date: Tue, 04 Dec 2012 13:26:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The issue I have with FPM (albeit noting I haven't researched this much) 
is that FPM keeps the PHP binary running regardless as a daemon right? 
If there is a memory leak in PHP then this will grow over time, where-as 
the php-cgi is a one-shot run of the binary and memory issues won't 
effect the system as the memory gets cleared every time?

If I am being daft, let me know and I will look into switching to FPM.

On 04/12/12 12:54, Marcin Juszkiewicz wrote:
> W dniu 04.12.2012 13:29, Jack Mitchell pisze:
>> I tried to build the recently commited PHP changes today and received
>> this error at do_rootfs, any ideas?
>>
>> The only package I select is php-cgi through IMAGE_INSTALL.
> Good catch. Looks like enabling FPM disabled CGI interface.
>
> But for performance reasons I suggest switch to FPM.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



