Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWUtj-0003G3-2o
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 16:19:35 +0100
Received: by bkbzv15 with SMTP id zv15so3182442bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 07:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/kyh0pkPDLEwTnpqU0Yab1pePLOpNmoS+jrq7/RT/kI=;
	b=A9Nx0wET4REXKkmeBBem+YkvH7d2r2oq13vZySdgRrXP2rKy2g1iUrLFggVwoirVMX
	7k08jNc7CoTKUfMKfxQFGwzl5oYJ+JBH/Qks/hYZAgW+Svc2LVHragOtmYVIFO6m7oKW
	kexzer8drLDmnWH2fgSHKVgHcEFK0e3o0kyQc=
Received: by 10.204.149.86 with SMTP id s22mr11569748bkv.58.1322838771496;
	Fri, 02 Dec 2011 07:12:51 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id w3sm9632078bkq.3.2011.12.02.07.12.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 07:12:50 -0800 (PST)
Message-ID: <4ED8EAEC.3010706@googlemail.com>
Date: Fri, 02 Dec 2011 15:12:44 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>	<201112021120.17762.GNUtoo@no-log.org>	<4ED8DBC7.6080708@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
In-Reply-To: <20111202145256.GD3770@jama.jama.net>
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
X-List-Received-Date: Fri, 02 Dec 2011 15:19:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> So yes this is OE-classic.
>
> For building SHR you should follow SHR instructions:
> http://wiki.shr-project.org/trac/wiki/Building%20SHR
>   
I see. Truth be told, this was the first thing I tried to do, but later 
on decided to use openembedded as my ultimate aim is to have a cli image 
(with less stuff on it as I don't want/need the gui). I think the 
"shr-image" target I build is similar, if not the same, as the building 
of the SHR - a link to which you provided above.

> Where are instructions for building from OE-classic as well as new
> layers, but with htcdream there is problem in oe-core, see this thread:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010993.html
>   
Interesting, but thankfully that doesn't apply to me, right?

> I'm not familiar with htcdream, but this looks like some problem with kernel fb 
> driver, you can try to boot shr-image, setup ssh access and then
> shutdown xserver (with /etc/init.d/xserver-nodm stop) to see if you get
> console login (check inittab if it's starting getty there) and also try
> other vts with chvt.
>   
The phone, as far as I know, is not connected anywhere - I don't have a 
working wifi/gsm etc - fastboot uses the usb link to transfer (and boot) 
the image. Is it possible to, somehow, use usb to connect to the phone 
this way (if so, how)? As you probably have gathered by now, I am a n00b 
when it comes to this smartphone/embedded devices business, so would 
need a bit of help with it. What is "vts" and "chvt"?

I was thinking (that was plan B) to specify runlevel 3, not 5, thus 
forcing a console log in (provided there is one!) - don't know if this 
works on smartphones though! I already discovered that "nomodeset" isn't 
working, sadly!

> If it works you can prepare console-image with right
> /etc/network/interfaces to be able to ssh in as soon as it boots and
> then debug those stripes over ssh too.
>   
This is what I can't figure out - how can I get connectivity on this 
phone if none of my wifi/gms is up and running?

> Well if you can get serial console to htcdream then it would be even
> easier.
>   
That is way over my head I am afraid!

>> I don't know whether I would need this. I also discovered yesterday that 
>> there is another openembedded git repository on freesmartphone.org 
>> (git://git.freesmartphone.org/openembedded.git), but not sure whether 
>> this is the same as the one I have been using...
>>     
>
> This is usually used only by FSO people without R/W access to OE git to
> prepare some changes.
>   
So, I shouldn't use it then?

> Cheers,
>   
Thanks JaMa, your help is appreciated!



