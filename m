Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1P3zM9-0002Yo-8z
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 00:54:39 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 2E455166089A; Thu,  7 Oct 2010 16:54:11 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id C92511660816;
	Thu,  7 Oct 2010 16:54:10 -0600 (MDT)
Message-ID: <4CAE4F92.5080107@mlbassoc.com>
Date: Thu, 07 Oct 2010 16:54:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <3ADCCD33-6EA5-43FA-84EE-31D6B7C5A005@mac.com>
In-Reply-To: <3ADCCD33-6EA5-43FA-84EE-31D6B7C5A005@mac.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to modify /etc/network/interfaces file in a OE recipe
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
X-List-Received-Date: Thu, 07 Oct 2010 22:54:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2010 03:11 PM, Elvis Dowson wrote:
> Hi,
>         Would someone be able to help me with modifying an omap3-console-image recipe, such that in the final image, the /etc/network/interfaces file gets edited as follows
>
> #auto eth0				<- remove # sign ( auto eth0 )
> #iface eth0 inet dhcp		<- remove # sign ( iface eth0 inet dhcp )
> #iface eth1 inet dhcp
>
> I am using a Gumstix Overo + Chestnut43 expansion board, which has an inbuilt wired ethernet interface. I have to make this modification manually, to enable this interface each time. However, if I can modify the OE recipe somehow to do this it would be great. I know it can be done, but I don't know where to start and which file to modify.

Add the file the way you like it to .../openembedded/recipes/netbase/netbase/overo
and rebuild netbase.  Use the beagleboard as an example.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


