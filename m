Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWVxe-0005t3-CJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 17:27:42 +0100
Received: by bkbzv15 with SMTP id zv15so3254927bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=LQk2Tmr1WXlS805GAulDHqv1CCdY4DRYIr9rtByKkm4=;
	b=Ru6Cc0d46Zve/zCqE/oKZzWrEhALJHgtn0c/CO8jjhXvD/2CYUmNLdagFN09CpBoMZ
	yS2u+4TW1TxqibYGzXxQeuk118RGXlkiL4QSNFmG9EGTU05LwSOiJ0rjTvElKdXk9EBY
	zjegpwC2trNP/V5xu0hBlDmA+qt8r9qC8fer0=
Received: by 10.204.10.77 with SMTP id o13mr11863546bko.12.1322842859672;
	Fri, 02 Dec 2011 08:20:59 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id x14sm17986497bkf.10.2011.12.02.08.20.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 08:20:58 -0800 (PST)
Message-ID: <4ED8FAE5.7010804@googlemail.com>
Date: Fri, 02 Dec 2011 16:20:53 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>	<201112021120.17762.GNUtoo@no-log.org>	<4ED8DBC7.6080708@googlemail.com>	<20111202145256.GD3770@jama.jama.net>	<4ED8EAEC.3010706@googlemail.com>
	<20111202154608.GE3770@jama.jama.net>
In-Reply-To: <20111202154608.GE3770@jama.jama.net>
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 16:27:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks again, JaMa,


>> Interesting, but thankfully that doesn't apply to me, right?
>>     
>
> No if you decide to stuck with old OE-classic.. but would be great to
> get htcdream well supported with oe-core..
>   
Once I get my phone up and running I'll give it a go - I've been 
following the discussion about oe-classic/oe-core with interest, so I am 
willing to help out if I can.

  

>> The phone, as far as I know, is not connected anywhere - I don't have a 
>> working wifi/gsm etc - fastboot uses the usb link to transfer (and boot) 
>> the image. Is it possible to, somehow, use usb to connect to the phone 
>> this way (if so, how)? As you probably have gathered by now, I am a n00b 
>> when it comes to this smartphone/embedded devices business, so would 
>> need a bit of help with it. What is "vts" and "chvt"?
>>     
>
> Well I was expecting that setting usbnet (g_ether kernel module) is easy
> on htcdream as it's easy on other devices and that you can load it on
> boot and check that usb0 is set to auto.
>   
Ah, right, in other words connecting the device (my phone) via usb *is* 
possible, right? If so, I presume this "usb0" interface acts in a 
similar fashion as my "eth0" for example (ifconfig, route etc can be 
applied to it), right? Quite a revelation to me this! How do I get it 
connected on the "host" side (on my PC on which the usb is used) - do I 
see a similar adapter on it as well? How does that work then?

> vt - virtual terminal
> chvt - change foreground virtual terminal
>
> as sometimes Xserver is started on different vt then where getty is
> enabled, but depends on config and I'm not familiar with htcdream ..
>   
Noted, thanks!

>> I was thinking (that was plan B) to specify runlevel 3, not 5, thus 
>> forcing a console log in (provided there is one!) - don't know if this 
>> works on smartphones though! I already discovered that "nomodeset" isn't 
>> working, sadly!
>>     
>
> you need to have getty enabled in inittab ie:
> t1:2345:respawn:/sbin/getty 38400 tty1
>   
I'll check that at first opportunity - is it possible that *might* be 
the reason I am not getting anywhere with my console-image rootfs? I 
haven't checked the inittab there ... will do that when I get home tonight!

>> This is what I can't figure out - how can I get connectivity on this 
>> phone if none of my wifi/gms is up and running?
>>     
>
> usbnet is usually easiest
>   
So, I presume this usbnet is a point-to-point adapted, is it? Do I have 
to set up special routing (i.e. with route add etc) for it? Do I have to 
give it an ip address from the net I am on my host PC or is this different?



