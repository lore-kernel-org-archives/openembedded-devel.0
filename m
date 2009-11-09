Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1N7WNM-00051x-C8
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 16:41:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 321005BFA80
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2009 10:40:37 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26816-04 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  9 Nov 2009 10:40:37 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D5F375BFA6D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2009 10:40:36 -0500 (EST)
Message-ID: <4AF837F4.1050501@cbnco.com>
Date: Mon, 09 Nov 2009 10:40:36 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF353C8.80904@cs.put.poznan.pl>
	<4AF74838.6020308@cs.put.poznan.pl>
In-Reply-To: <4AF74838.6020308@cs.put.poznan.pl>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: menuconfig task for kernels
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
X-List-Received-Date: Mon, 09 Nov 2009 15:41:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Przemyslaw Wesolek wrote:
>> Is this the "right" way to do? If so, maybe menuconfig should be added
>> as 'after do_configure', instead of 'after do_patch'?
> 
> Anyone?

Hi Przemek,

I find if I'm configuring for a new machine, I need to do_patch, copy a 
"close" defconfig into place, run make menuconfig, and copy the .config 
back to the filesdir where it belongs. The menuconfig task doesn't save 
much, as you still have to copy the defconfigs around. I don't use the 
task for that reason, and maybe others are in the same boat.

I think you're right about the order, though; if you sent a patch, I 
would ack it, for what it's worth.

Mike


