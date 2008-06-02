Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K3D8r-0002hH-Ms
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 18:44:17 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K3D4f-0002qn-8e
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 16:39:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 16:39:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 16:39:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Jun 2008 18:39:50 +0200
Message-ID: <g217om$hae$1@ger.gmane.org>
References: <20080531171735.3C118189300@amethyst.openembedded.net>	<200806021649.15159.mickey@vanille-media.de>	<g212at$qtm$1@ger.gmane.org>
	<200806021805.03241.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
In-Reply-To: <200806021805.03241.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: org.oe.dev dbus 1.2.1: fix pidfile location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 02 Jun 2008 16:44:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> On Monday 02 June 2008 17:07:10 Koen Kooi wrote:
>> Michael 'Mickey' Lauer wrote:
>>> On Saturday 31 May 2008 19:17:35 koen commit wrote:
>>>> dbus 1.2.1: fix pidfile location
>>> I'm afraid this patch breaks restartability which I fixed a couple of
>>> weeks ago. Can you double check whether you can use the init script and
>>> restart dbus still works?
>> Heh :) The fix makes this work for me:
>>
>> /etc/init.d/dbus-1 stop ; /etc/init.d/dbus-1 start
>>
>> Is that what you meant?
>
> I was using /etc/init.d/dbus-1 restart, but I think that should have the same
> semantics.

root@beagleboard:~# /etc/init.d/dbus-1 restart
Stopping Hardware abstraction layer hald
Stopping system message bus: stopped process in pidfile 
'/var/run/dbus/pid' (pid 1602)
dbus.
Starting system message bus: dbus.
Starting Hardware abstraction layer hald
root@beagleboard:~#

> Is that working for you with ash or bash?

That's with

lrwxrwxrwx  1 root root 7 May 28 17:23 /bin/sh -> busybox

regards,

Koen



