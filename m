Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KXy6u-0007GI-4v
	for openembedded-devel@openembedded.org; Tue, 26 Aug 2008 14:57:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KXy5O-0000Ro-7d
	for openembedded-devel@openembedded.org; Tue, 26 Aug 2008 12:55:50 +0000
Received: from wlan142162.mobiel.utwente.nl ([130.89.142.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 26 Aug 2008 12:55:50 +0000
Received: from k.kooi by wlan142162.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Aug 2008 12:55:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 26 Aug 2008 14:55:39 +0200
Message-ID: <g90ugc$iqk$1@ger.gmane.org>
References: <g90p1m$r3m$1@ger.gmane.org>
	<200808261428.20385.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan142162.mobiel.utwente.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <200808261428.20385.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: disapprove 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4
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
X-List-Received-Date: Tue, 26 Aug 2008 12:57:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Am Dienstag 26 August 2008 13:22:32 schrieb Rolf Leggewie:
>> Koen,
>>
>> may I suggest that instead of screaming "bogus" at the top of your lungs
>> all the time and thus discrediting your fellow contributors' work you
>> start pitching in with quality assurance?  There sure are an awful lot
>> of stale bugs and unbuildable stuff in OE.
>>
>> I am well aware that COMPATIBLE_MACHINE in the definition of fso-image
>> is not the best solution.  At the current state of affairs, it is
>> correct though.  The image relies on $XSERVER which is not defined for
>> all machines in OE.  Those machines are incompatible with that image
>> definition.
>>
>> You're heartily invited to help fix OE to have a sane default for
>> $XSERVER for *all* machines.  I've started work on this but have not yet
>> finished.  Until that is done, removing compatible machine from the
>> image definition is a step backwards which is why I have disapproved
>> commit 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4.
>
> Well, in this case I agree with Koen.  COMPATIBLE_MACHINE should never appear
> in an image recipe, e.g. I used to happily build fso-image for the Motorola
> EZX series and now i can no longer.
>
> Lets fix the XServer issue instead.

If you look at other image recipes using $XSERVER you'll notice they all 
have a weak assignment to fbdev on top.

The other smartphone people (magician, htc-universal, blueangel, etc) 
were wondering why they couldn't build fso-image anymore.



