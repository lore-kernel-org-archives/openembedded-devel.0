Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RXBSC-0005v1-0y
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 13:46:00 +0100
Received: by wgbds11 with SMTP id ds11so4373259wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 04:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=jTt5ENr4fIaQFo2Rp6RhLFPw+CpixNy37l762csHVVo=;
	b=SKgmkgFktRHCZwY9Quu9+9tMcEPNOlcLq4kfytXvWuS+rwFHFt+3oEbb/brsxo6Ayh
	gNGbw4LhL2CBzdvv+kyjZaex/ZNJGqdVeZylJDIvj+v0/J4W6E/Q6FAf9FmccqZQCX+R
	DWlKxfhiyWXTrNQp3/tmiqMm8VmswNR6lhMpg=
Received: by 10.227.209.82 with SMTP id gf18mr12480534wbb.8.1323002352018;
	Sun, 04 Dec 2011 04:39:12 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id d17sm22009902wbh.19.2011.12.04.04.39.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Dec 2011 04:39:09 -0800 (PST)
Message-ID: <4EDB69E5.3050809@googlemail.com>
Date: Sun, 04 Dec 2011 12:39:01 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>
	<4ED960AB.5040502@googlemail.com>	<4ED96455.8060008@googlemail.com>	<201112031046.44018.GNUtoo@no-log.org>	<4EDA504E.7070304@googlemail.com>	<20111203165213.GB3797@jama.jama.net>	<4EDA6095.5030203@googlemail.com>
	<20111203180303.GD3797@jama.jama.net>
	<4EDA6C03.1040308@googlemail.com>
In-Reply-To: <4EDA6C03.1040308@googlemail.com>
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
X-List-Received-Date: Sun, 04 Dec 2011 12:46:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> Noted, though what I did in the meantime is I logged in via ssh (see 
> below :-) ), called nano, cut-and-paste job from my PC's htcuniversal 
> keymap file, saved this as /etc/keymap-2.6.map (on the phone) and then 
> executed /etc/init.d/keymap - the layout has changed somewhat but it 
> is not what I need, so I am going to see if I could make the 
> corrections I need so that this file matches the htcdream layout exactly.
>
> There are quite a few "non-standard" keys (like "home", "back", two 
> different "alt" keys, one "search" key etc) which I am hoping to 
> capture with this layout config - will search google for the tool to 
> use to see what scan codes they transmit (provided this is how the 
> "keycode" works, that is).
Not having much luck with this at the moment! I dumped the entire 
key-mapping configuration to a separate file using dumpkeys and tried, 
as a test, to reconfigure a non-standard key (called 'menu') to emit the 
letter 'z' when pressed - at least that was the idea.

When I ran "showkeys -s" (to see what was the scan code of that key) I 
noted it as "0xe0 0x5e", so I then did the following: "setkeycodes e05e 
44" (44 in the already-dumped keymap is defined as "keycode 44 = +z +Z 
+z Control_z Control_z Meta_z Meta_Control_z"). After doing that, I 
pressed the "menu" key a couple of times, but nothing happened.

I then tried to remap another "non-standard" key - my "Back" key on the 
actual phone, but again nothing happens (when I press it, it emits '?' 
*regardless* of whether this key is re-defined by me or not). Lastly, I 
tried to do this trick on a "known" key - '1' (scancode 2): no problem, 
it emits the letter 'z' as it should.

I don't know if I am doing this wrong and why it doesn't work with 
"non-standard" keys, maybe the kernel keyboard driver is somehow 
"stopping" these - I have no idea at this point!


