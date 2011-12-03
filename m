Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWuXq-00032H-2C
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 19:42:42 +0100
Received: by bkbzv15 with SMTP id zv15so4211189bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 10:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VxY/xAs5/C9nLZoNoCWFJmos4OseAJaqdpfGlJiA+S4=;
	b=TRP12p/Ttav957eWmF88IqndN9fGejtkdu3y10vTBLJ+LWsZEfsq/IE9zjfROnykzp
	Ccdht+1Vq6IQWk8RaZ9+f/47i8DbIC01Uv5HA9+JWw8ENnoR7Tr7xZ2xZ3FPoh+ku7uH
	+NN4MoWEgeHAaWQQZiuHznykD0kNyfFovrdLw=
Received: by 10.180.20.134 with SMTP id n6mr4484978wie.49.1322937354882;
	Sat, 03 Dec 2011 10:35:54 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id n9sm12270177wbo.16.2011.12.03.10.35.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Dec 2011 10:35:54 -0800 (PST)
Message-ID: <4EDA6C03.1040308@googlemail.com>
Date: Sat, 03 Dec 2011 18:35:47 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>
	<4ED960AB.5040502@googlemail.com>	<4ED96455.8060008@googlemail.com>	<201112031046.44018.GNUtoo@no-log.org>	<4EDA504E.7070304@googlemail.com>	<20111203165213.GB3797@jama.jama.net>	<4EDA6095.5030203@googlemail.com>
	<20111203180303.GD3797@jama.jama.net>
In-Reply-To: <20111203180303.GD3797@jama.jama.net>
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
X-List-Received-Date: Sat, 03 Dec 2011 18:42:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> You haven't specify target I guess..
> bitbake -c savedefconfig virtual/kernel
>   
Noted, thanks as always! I did try this but this time I am getting a 
make error from linux-leviathan_git recipe - "make savedefconfig" -> No 
rules to make target savedefconfig, so it is obviously not defined. 
Nevermind, I copied the file myself.

>> 1) how do I "activate" this keymap (provided it is the one I want);
>>     
>
> copy htcuniversal file to match MACHINE (so htcdream) and rebuild
> keymaps recipe, don't know if htcuniversal is using same layout..
>   
Noted, though what I did in the meantime is I logged in via ssh (see 
below :-) ), called nano, cut-and-paste job from my PC's htcuniversal 
keymap file, saved this as /etc/keymap-2.6.map (on the phone) and then 
executed /etc/init.d/keymap - the layout has changed somewhat but it is 
not what I need, so I am going to see if I could make the corrections I 
need so that this file matches the htcdream layout exactly.

There are quite a few "non-standard" keys (like "home", "back", two 
different "alt" keys, one "search" key etc) which I am hoping to capture 
with this layout config - will search google for the tool to use to see 
what scan codes they transmit (provided this is how the "keycode" works, 
that is).

What baffles me though is that I've had a very good layout on my 
shr-image (full GUI), but I can't see any keyboard map layouts there 
either - maybe the gui terminal I've been using there defines its own 
layouts in some different way?

>> 4) When I do all the changes, do I just do the versioning "magic" (bump 
>> up the keymaps PR) in order to trigger a re-make of the stuff I changed 
>> (great trick that!)?
>>     
>
> yes 
> 1) add file
> 2) bump PR,
> 3) rebuild
> 4) test it on device,
> 5) update it on device if it's not 100% correct and then sync keymap-2.6.map 
> with htcdream in OE
> 6) send patch to OE ML
>   
Noted, will do!

>> Hmm, I don't know what OE commit I have, but just checked my /etc/rcS.d 
>>     
>
> And I cannot run commands (git log even) in your checkout so I don't know it too :).
>   
It turns out that correcting this error (which is what I did do) fixes 
this as I am now able to use ssh and log in remotely. One other annoying 
thing - I don't seem to have "/var/log/messages" anywhere on this phone 
- everything is shown on the screen - is this something I could alter as 
well?

> Yes this is in initscripts-shr which are used only when you're building
> SHR and shr-images, if you're still playing with fso- or default
> console- iamges then IIRC normal initscript recipe is used and you have
> to apply similar fix there..
>   
I just did a grep on the entire recipes directory and apart from the 
shr-initscript recipe nothing else is there, so I altered that recipe 
(and bumped the version number to trigger a rebuild).



