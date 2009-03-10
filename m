Received: from [195.238.6.177] (helo=mailrelay010.isp.belgacom.be)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpa@mgb-tech.com>) id 1Lh3VH-0000mN-95
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 16:04:24 +0100
X-Belgacom-Dynamic: yes
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlAFAAjetUlR83g0/2dsb2JhbACBTtFUhAUG
Received: from 52.120-243-81.adsl-dyn.isp.belgacom.be (HELO
	hermes.mgb-tech.com) ([81.243.120.52])
	by relay.skynet.be with ESMTP; 10 Mar 2009 11:35:10 +0100
Received: from [192.168.1.23] (gandalf.mgb-tech.com [192.168.1.23])
	by hermes.mgb-tech.com (Postfix) with ESMTP id 5C75F11800A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2009 10:38:28 +0100 (CET)
Message-ID: <49B64334.6020606@mgb-tech.com>
Date: Tue, 10 Mar 2009 11:38:44 +0100
From: Jan Pannecoeck <jpa@mgb-tech.com>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49B4F056.5040604@mgb-tech.com>
	<1236632966.29394.25.camel@cheeto.emacinc.com>
In-Reply-To: <1236632966.29394.25.camel@cheeto.emacinc.com>
Subject: Re: Automatically connect to ethernet
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
X-List-Received-Date: Tue, 10 Mar 2009 15:04:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the ifplugd tip, I've tried to cross-compile it for the ARM 
I'm using but didn't succeeded yet... I'll try again later! :-)

Thanks,
Jan

Travis Stratman wrote:
> Jan,
>
> On Mon, 2009-03-09 at 11:32 +0100, Jan Pannecoeck wrote:
>   
>> So my problem is that linux does not connect to the DHCP server 
>> automatically when I plug in the ethernetcable. When I plug-in the cable 
>> before I launch the linux, this is working fine because at start-up the 
>> DHCP-server is asked for a new IP-lease. But when I don't plug-in the 
>> cable, and I plug it in when linux is already booted, the DHCP-server 
>> isn't contacted for a new IP-lease and I can't connect to the Internet. 
>> I can use the "/etc/init.d/networking restart" command but this isn't a 
>> solution of course because it should work all the time, also if I'm not 
>> there to enter that command...
>>
>> So, do I  have to change some settings in the kernel, or do I have to 
>> install some extra packages to get this working properly?
>>
>>     
>
> You should look at ifplugd. This will detect the network link beat and
> bring the interface up/down as required.
>
> TAS
>
>   
>> Thanks in advance,
>> Jan Pannecoeck
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>     
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   


