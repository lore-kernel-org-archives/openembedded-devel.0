Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NBRPZ-0005vV-BG for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 12:12:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NBROC-0006TG-96
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 12:10:56 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 12:10:56 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 12:10:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Nov 2009 12:10:32 +0100
Message-ID: <he5tf8$91o$1@ger.gmane.org>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>	<he5n72$ltj$1@ger.gmane.org>
	<992df8520911200151q57520791n6395642f5bc18e@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <992df8520911200151q57520791n6395642f5bc18e@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Fri, 20 Nov 2009 11:12:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-11-09 10:51, Alex Ferguson wrote:
> On Fri, Nov 20, 2009 at 11:23 AM, Koen Kooi<k.kooi@student.utwente.nl>wrote:
>
>>
>> Could you please explain why the default tslib.sh isn't working for you?
>
>
> Because it doesn't? /dev/input/touchscreenX doesn't exist.

Then you need to investigate why it doesn't get created.

> The devices
> /dev/input/event0 and /dev/input/event1 are consistently assigned to
> keyboard and touchscreen, respectively, and I'm having no problem with that.

Consistently with your current defconfig, kernelversion and bootargs, 
there is no guarantee that those will stay the same.


> Once the drivers are improved and the need for a custom tslib.sh file
> evaporates, I'll be sure to open a bug report.

We stopped hardcoding event numbers in OE years ago, even the opie 
people saw the light, so I wonder what's the matter with the omnia to go 
backwards a few years :(

regards,

Koen



