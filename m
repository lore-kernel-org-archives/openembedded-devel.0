Received: from [195.238.6.177] (helo=mailrelay010.isp.belgacom.be)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpa@mgb-tech.com>) id 1LgcoJ-0000dL-Rx
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 11:34:15 +0100
X-Belgacom-Dynamic: yes
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AogFAIaMtElbsltG/2dsb2JhbACBTs8khAUG
Received: from 70.91-178-91.adsl-dyn.isp.belgacom.be (HELO
	hermes.mgb-tech.com) ([91.178.91.70])
	by relay.skynet.be with ESMTP; 09 Mar 2009 11:29:19 +0100
Received: from [192.168.1.23] (gandalf.mgb-tech.com [192.168.1.23])
	by hermes.mgb-tech.com (Postfix) with ESMTP id B3967117FFD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2009 10:32:50 +0100 (CET)
Message-ID: <49B4F056.5040604@mgb-tech.com>
Date: Mon, 09 Mar 2009 11:32:54 +0100
From: Jan Pannecoeck <jpa@mgb-tech.com>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Automatically connect to ethernet
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
X-List-Received-Date: Mon, 09 Mar 2009 10:34:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I'm using OpenEmbedded for an Taskit PanelCard. I've been able to get 
everything I needed working properly except for one thing now. And I 
assume that it is a problem in the OE linux kernel, or me missing some 
packages.

So my problem is that linux does not connect to the DHCP server 
automatically when I plug in the ethernetcable. When I plug-in the cable 
before I launch the linux, this is working fine because at start-up the 
DHCP-server is asked for a new IP-lease. But when I don't plug-in the 
cable, and I plug it in when linux is already booted, the DHCP-server 
isn't contacted for a new IP-lease and I can't connect to the Internet. 
I can use the "/etc/init.d/networking restart" command but this isn't a 
solution of course because it should work all the time, also if I'm not 
there to enter that command...

So, do I  have to change some settings in the kernel, or do I have to 
install some extra packages to get this working properly?

Thanks in advance,
Jan Pannecoeck


