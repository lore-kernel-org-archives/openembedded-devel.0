Received: from mazama.dcclabs.tv ([91.121.153.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pawelo@dcclabs.tv>) id 1RTrba-0005E1-CE
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 09:57:58 +0100
Received: from [192.168.1.1] (fish.king.net.pl [83.19.124.154])
	by mazama.dcclabs.tv (Postfix) with ESMTPSA id F1408403C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 09:51:22 +0100 (CET)
Message-ID: <4ECF5704.9060100@dcclabs.tv>
Date: Fri, 25 Nov 2011 09:51:16 +0100
From: Pawel Osmialowski <pawelo@dcclabs.tv>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.20) Gecko/20110916 Lightning/1.0b3pre Thunderbird/3.1.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ECA1EA0.9080309@dcclabs.tv>	<CAMKF1sqtTsT-W5SuegBrJS9q9JLEze2rU1R8axSrSkwsq-0_Tw@mail.gmail.com>	<4ECE2EE0.8050708@dcclabs.tv>
	<20111124175323.GB28767@sakrah.homelinux.org>
In-Reply-To: <20111124175323.GB28767@sakrah.homelinux.org>
Subject: Re: Cannot compile glibc-initial for ARM
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
X-List-Received-Date: Fri, 25 Nov 2011 08:57:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Khem,

I've found that it still tried to build long outdated OABI and therefore
nothing new could be found in config.log (it looked the same as the one
pasted in my previous messages). So I tried something different. At the
end of my distro config file, I've added following:

TARGET_OS = "linux-gnueabi"

DISTRO_FEATURES += "eabi wifi"

And now eglibc built is completed!

Best regards,
Paul

P. S.
To be able to produce RPMs I had to apply two my small patches, one on
createrepo, one on fakechroot, they won't build as native tools
otherwise. Shall I upload these patches somewhere?


W dniu 24.11.2011 18:53, Khem Raj pisze:
> On (24/11/11 12:47), Pawel Osmialowski wrote:
>> Hi Khem,
>>
>> Thanks for your answer.
>>
>> Unfortunately, removing TARGET_OS and changing glibc to eglibc did not help:
>>
>> | running configure fragment for ports/sysdeps/arm/elf
>> | checking for ARM TLS support... yes
>> | running configure fragment for nptl/sysdeps/pthread
>> | configure: error: working compiler support for visibility
>> attribute is required
>> NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_configure: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/pawelo/h3660/openembedded/h3660/../recipes/eglibc/eglibc-initial_2.12.bb
>> do_configure failed
> can you post the config.log that you will find in glibc-initial build
> tree
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



