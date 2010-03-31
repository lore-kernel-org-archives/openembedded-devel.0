Received: from server3.tinynetworks.co.uk ([89.16.176.161]
	helo=mx.tinynetworks.co.uk) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn@welchs.me.uk>) id 1Nx0xj-0001zT-EQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 18:40:16 +0200
Received: from mx.tinynetworks.co.uk (localhost.localdomain [127.0.0.1])
	by mx.tinynetworks.co.uk (Postfix) with ESMTP id 9ED4C636178
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 17:37:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=tinynetworks.co.uk; h=
	message-id:date:from:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=postfix;
	bh=ul1FB8wlNv2sCgZO9BGK4YVaALE=; b=V2saxnY5lVuzZOWAyvXn4uGbVIzg
	YBmgnAvPaiA6yHH9/NadO1ABLSHj5pj4cJ+GLYbgyT91aZyK9L1yHcg47UJnqyVI
	+ki1hnNJ2XDGpENUvry/hzRKOLgA2clbv2ddZs4n4bN9Asi7SYE7y5kfcuRVte27
	CIc2hETJRIhFauw=
Received: from [192.168.0.118] (unknown [82.152.154.75])
	by mx.tinynetworks.co.uk (Postfix) with ESMTPSA id 57EE8636055
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 17:37:01 +0100 (BST)
Message-ID: <4BB37A29.2000800@welchs.me.uk>
Date: Wed, 31 Mar 2010 17:36:57 +0100
From: Martyn Welch <martyn@welchs.me.uk>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100331132523.31493.75635.stgit@ES-J7S4D2J.amer.consind.ge.com>	<w2u5e088bd91003310701t15cc16c5w4075659e89068d0f@mail.gmail.com>
	<20100331150219.GA29082@zlo.nu>
In-Reply-To: <20100331150219.GA29082@zlo.nu>
X-SA-Exim-Connect-IP: 89.16.176.161
X-SA-Exim-Mail-From: martyn@welchs.me.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dhcp: Correct leases directory location
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
X-List-Received-Date: Wed, 31 Mar 2010 16:40:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marc Olzheim wrote:
> On Wed, Mar 31, 2010 at 07:01:29AM -0700, Steve Sakoman wrote:
>   
>> On Wed, 2010-03-31 at 14:29 +0100, Martyn Welch wrote:
>>     
>>> The DHCP client currently expects to be able to create a leases file in
>>> "/var/lib/dhcp" as configured in dhcp3.inc. Recipe is currently creating a
>>> directory called "/var/lib/dhcp3", resulting in the following error:
>>>
>>> can't create /var/lib/dhcp/dhclient.eth0.leases
>>>
>>> Correct directory naming to resolve error.
>>>
>>> Signed-off-by: Martyn Welch <martyn.welch@ge.com>
>>>
>>> ---
>>>
>>>  Steve: This seems to be directy reversing a change you made. The commit
>>>   message doesn't give me any idea of why you did it, can you remember?
>>>       
>> Interesting.  I made the change because I was getting quite similar
>> errors, but for files being created in /var/lib/dhcp3!
>>
>> I'm not sure what is different about our overall set ups, but perhaps
>> the proper fix is to create both directories.
>>
>> Steve
>>     
>
> Hmm, note that recipes/dhcp/files/init-server uses /var/lib/dhcp as well.
>
> dhclient from 3.1.2p1 uses /var/lib/dhcp by default. Maybe one of the
> older versions used /var/lib/dhcp3 by default...
>
> I did not spot this myself because dhclient is run from network-manager
> on our system, which passes it command line arguments on where to put
> the lease file.
>
> Marc
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   

The contents of do_compile:

do_compile() {
        make RANLIB=${RANLIB} 
PREDEFINES='-D_PATH_DHCPD_DB=\"/var/lib/dhcp/dhcpd.leases\" \
        -D_PATH_DHCLIENT_DB=\"/var/lib/dhcp/dhclient.leases\" \
        -D_PATH_DHCLIENT_SCRIPT=\"/sbin/dhclient-script\" \
        -D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
        -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
}


Would suggest an explicit preference to using "var/lib/dhcp". May be 
there is another argument that has been missed?

Martyn


