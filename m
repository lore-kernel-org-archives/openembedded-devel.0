Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J1cCS-0002Cz-4N
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 07:33:08 +0100
Received: by nf-out-0910.google.com with SMTP id h3so834846nfh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Dec 2007 22:29:02 -0800 (PST)
Received: by 10.86.62.3 with SMTP id k3mr5190401fga.1197268142430;
	Sun, 09 Dec 2007 22:29:02 -0800 (PST)
Received: from ?192.168.20.12? ( [82.193.97.45])
	by mx.google.com with ESMTPS id g1sm7076814muf.2007.12.09.22.28.59
	(version=SSLv3 cipher=OTHER); Sun, 09 Dec 2007 22:29:00 -0800 (PST)
Date: Mon, 10 Dec 2007 08:32:36 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <817303159.20071210083236@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <4759C1A2.3070308@student.utwente.nl>
References: <474EA852.7090306@whitby.id.au>
	<474ECF9A.6050603@student.utwente.nl>
	<b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>
	<474FF886.7060308@whitby.id.au>
	<b6ebd0a50711300859l392f9b43i8168d2377fb8c852@mail.gmail.com>
	<19c1b8a90712071139w299bab68k8005b8cc8d1116da@mail.gmail.com>
	<4759C1A2.3070308@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2007 06:33:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, December 7, 2007, 11:56:50 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Khem Raj schreef:
>> On Nov 30, 2007 8:59 AM, Chris Larson <clarson@kergoth.com> wrote:
>>> On Nov 30, 2007 4:48 AM, Rod Whitby <rod@whitby.id.au> wrote:
>>>> Chris Larson wrote:
>>>>> Afaik, the execution of the hotplug/coldplug scripts on startup should
>>>>> generate the hotplug events for the ethernet interfaces and bring them
>>>>> up that way.  In debian, the hotplug scripts bring them up with ifup
>>>>> --allow=hotplug [iface], such that you need an 'allow-hotplug eth0' in
>>>>> interfaces to have them brought up that way.  I'm too rusty with OE to
>>>>> say how we do it today, but it's not likely that auto is needed.
>>>> Unfortunately, the busybox ifup applet does not support the
>>>> allow-hotplug keyword.
>>>>
>>>> Based on the feedback, I'll add 'auto eth0'.
>> 
>> fwiw with this change my nfsrooted rfs does not boot. I think its a
>> nice to have nfsroot option for dev work.

> doing any form of 'ifup' on the interface that connects to you nfsroot
> with shutdown the interface before trying to bring it up. I have the
> same problem on my PVR, and as a workaround I edited
> /path/to/nfs/etc/network/interface on the nfs server and removed the auto.
> Volunteers to teach ifup not to not close the link when using nfsroot?

  I've been having this issue in my queue. There're few problems with
current OE init scripts and nfsroot. I'm going to get to this one
sweet day, but if anyone gets to this earlier, even better ;-).

> regards,

> Koen




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



