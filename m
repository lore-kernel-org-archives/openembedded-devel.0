Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M8XU7-0006Ma-Tk
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 12:32:50 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M8XMN-0006h9-Ob
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 10:24:47 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 10:24:47 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 10:24:47 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 25 May 2009 12:24:32 +0200
Message-ID: <gvdrl3$h2c$1@ger.gmane.org>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 10:32:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25-05-09 11:54, Ihar Hrachyshka wrote:
> On Mon, May 25, 2009 at 12:25 PM, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl>  wrote:
>> Dnia niedziela, 24 maja 2009 o 20:33:05 Ihar Hrachyshka napisał(a):
>>> The reason for the move is that udevadm binary is executed from udev
>>> init.d script.
>>
>> NACK, NACK, NACK - udevadm is also udevinfo and is used by HAL. Your
>> patch will make my mdev images not working properly because I would need
>> to install mdev and udev to get HAL working and then find a way to not
>> run udev at boot time (even after package upgrades).
>
> I tried to understand your complain (really) but don't get it. What do
> you mean when saying "udevadm is also udevinfo and is used by HAL"?
> And also please provide your solution for the problem of broken images
> with unfuctional udev subsystem.

If you want to have a system that uses mdev as /dev manager and hal, you 
need to install udevadm to make hal happy. I think the solution is to do 
something like this:

RDEPENDS_udev += "udev-utils" in udev_141.bb

regards,

Koen

PS: mdev users need to start thinking about how devicekit and 
util-linux-ng will integrate into their systems, since the hal world 
seems to be moving away from hal to libudev + util-linux-ng

regards,

Koen



