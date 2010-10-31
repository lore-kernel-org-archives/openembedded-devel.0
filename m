Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1PCVRl-0006rx-SP
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 11:47:34 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id BE80E275CE2F; Sun, 31 Oct 2010 11:46:48 +0100 (CET)
Received: from [10.1.1.50] (unknown [89.204.153.69])
	by gravedo.de (Postfix) with ESMTPSA id E913B275CE22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Oct 2010 11:46:46 +0100 (CET)
Message-ID: <4CCD4913.4050003@gravedo.de>
Date: Sun, 31 Oct 2010 11:46:43 +0100
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12pre) Gecko/20101026 Lightning/1.0b2 Shredder/3.1.6pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>	<1287427884-1517-5-git-send-email-morphis@gravedo.de>
	<1288515288.2232.0.camel@gnutoo-laptop>
In-Reply-To: <1288515288.2232.0.camel@gnutoo-laptop>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/15] netbase: powerup usb0 interface automatically on palmpre machine
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
X-List-Received-Date: Sun, 31 Oct 2010 10:47:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 31.10.2010 09:54, Denis 'GNUtoo' Carikli wrote:
> On Mon, 2010-10-18 at 20:51 +0200, Simon Busch wrote:
>> Signed-off-by: Simon Busch <morphis@gravedo.de>
>> ---
>>  recipes/netbase/netbase/palmpre/interfaces |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/netbase/netbase/palmpre/interfaces b/recipes/netbase/netbase/palmpre/interfaces
>> index ca2e007..17416c1 100644
>> --- a/recipes/netbase/netbase/palmpre/interfaces
>> +++ b/recipes/netbase/netbase/palmpre/interfaces
>> @@ -6,6 +6,7 @@ iface lo inet loopback
>>  
>>  # Ethernet/RNDIS gadget (g_ether)
>>  # ... or on host side, usbnet and random hwaddr
>> +auto usb0
>>  iface usb0 inet static
>>  	address 192.168.0.202
>>  	netmask 255.255.255.0
> what about PR bump?

Damn it! I forgot about it .... sorry for this. I tried to be very
careful with all of these patches but in the end I made this one little
mistake ... forgive me :)

regards,
morphis


