Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWtmb-0001kj-2c
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 18:53:53 +0100
Received: by wgbds11 with SMTP id ds11so3148014wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 09:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Q/G86EyheizCUHcx4NKYH+/+0c/J5vrQPfSgQluRfoA=;
	b=Uf9CZTTRMoegHarwvr6mQ+vuOsnjF6MR2+c8Y6gSM0G8D3DUHIA8w+nJ2RHo+aiZvG
	9yeRLQR6BioN73yVZluO3a3Mnxs+7Ol5eexth9Oqut1k204J46R5773HsNx0wihMQohc
	X9K1l3yapJ4U5xFw+oE0Cw5232z2UYmQ8hYX4=
Received: by 10.227.206.144 with SMTP id fu16mr10180167wbb.23.1322934429093;
	Sat, 03 Dec 2011 09:47:09 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id es5sm17284487wbb.11.2011.12.03.09.47.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Dec 2011 09:47:08 -0800 (PST)
Message-ID: <4EDA6095.5030203@googlemail.com>
Date: Sat, 03 Dec 2011 17:47:01 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>
	<4ED960AB.5040502@googlemail.com>	<4ED96455.8060008@googlemail.com>	<201112031046.44018.GNUtoo@no-log.org>	<4EDA504E.7070304@googlemail.com>
	<20111203165213.GB3797@jama.jama.net>
In-Reply-To: <20111203165213.GB3797@jama.jama.net>
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
X-List-Received-Date: Sat, 03 Dec 2011 17:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> then you will like:
> bitbake -c menuconfig virtual/kernel 
>   
Indeed!

> and to save defconfig you can use -c savedefconfig (not 100% sure it's
> available in linux-leviathan in OE-classic).
>   
Nope, this doesn't seem available - it tells me "Nothing to do" and to 
run "bitbake world" if I want something done (I like that attitude :-) 
), so I had to copy the new file myself.

> You need to add right keymap to keymaps recipe and check that it's in
> /etc/keymap-2.6.map and then /etc/init.d/keymap.sh should load it for
> you during boot.
>   
Hmm, in my rootfs I do have /etc/init.d/keymap and I just looked at that 
script - it looks for either /etc/keymap-*something* or 
/etc/keymap-extension-*something*. I have neither!

In the recipe directory (keymaps/files) there is a directory called 
"htcuniversal" which has a single file called keymap-2.6.map:

#altgr keycode 18 = euro
altgr keycode 15 = tilde
altgr keycode 24 = slash
altgr keycode 25 = backslash
altgr keycode 32 = pound
altgr keycode 37 = quotedbl
altgr keycode 38 = apostrophe
altgr keycode 50 = question
altgr keycode 51 = semicolon
altgr keycode 52 = colon

Now, I have four questions:
1) how do I "activate" this keymap (provided it is the one I want);
2) it seems that in this file I could redefine *any* key I want. If so, 
is there any man/doc page I can look at to educate myself, because I am 
almost 100% certain that I would need to redefine some of the keys in 
the "standard" setting.
3) How do I find the "keycode" numbers - is there a tool I could execute 
(probably on my phone) to find a certain keycode when I press it so that 
I could redefine it later (presumably in a similar file as the 
keymap-2.6.map I listed above)?
4) When I do all the changes, do I just do the versioning "magic" (bump 
up the keymaps PR) in order to trigger a re-make of the stuff I changed 
(great trick that!)?

> This usually means that /dev/pts wasn't mounted during boot, I don't
> remember if htcdream was doing something weird but for palmpre GarthPS
> needed this:
> http://git.openembedded.org/openembedded/commit/?id=fcb43100609fcb955cfac6ad6b92d3b5ddf08c20
> and I'm not sure if somebody tested htcdream since then.. so check order
> of mountdevsubfs.sh and udev init if htcdream is using udev (not
> devtmpfs)
>   
Hmm, I don't know what OE commit I have, but just checked my /etc/rcS.d 
on the phone's rootfs - it seems that I have the (buggy) 
"S04mountdevsubfs.sh" instead of "S05mountdevsubfs.sh". How do I 
alter/change this (presumably by altering some of the recipes)?



