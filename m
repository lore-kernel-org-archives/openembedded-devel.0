Received: from [63.245.244.68] (helo=mail.emacinc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1LgmoT-0003Fq-Gi
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 22:15:05 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1LgmjI-0007ov-Bp
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 16:09:50 -0500
From: Travis Stratman <tstratman@emacinc.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49B4F056.5040604@mgb-tech.com>
References: <49B4F056.5040604@mgb-tech.com>
Date: Mon, 09 Mar 2009 16:09:26 -0500
Message-Id: <1236632966.29394.25.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.67
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-Spam-Checker-Version: SpamAssassin 3.1.4 (2006-07-26) on mail.emacinc.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	GREYLIST_ISWHITE autolearn=ham version=3.1.4
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
X-List-Received-Date: Mon, 09 Mar 2009 21:15:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Jan,

On Mon, 2009-03-09 at 11:32 +0100, Jan Pannecoeck wrote:
> 
> So my problem is that linux does not connect to the DHCP server 
> automatically when I plug in the ethernetcable. When I plug-in the cable 
> before I launch the linux, this is working fine because at start-up the 
> DHCP-server is asked for a new IP-lease. But when I don't plug-in the 
> cable, and I plug it in when linux is already booted, the DHCP-server 
> isn't contacted for a new IP-lease and I can't connect to the Internet. 
> I can use the "/etc/init.d/networking restart" command but this isn't a 
> solution of course because it should work all the time, also if I'm not 
> there to enter that command...
> 
> So, do I  have to change some settings in the kernel, or do I have to 
> install some extra packages to get this working properly?
> 

You should look at ifplugd. This will detect the network link beat and
bring the interface up/down as required.

TAS

> Thanks in advance,
> Jan Pannecoeck
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



