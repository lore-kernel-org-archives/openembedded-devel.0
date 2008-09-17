Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kfu21-0007uN-UJ
	for openembedded-devel@openembedded.org; Wed, 17 Sep 2008 12:13:10 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kftz1-0006zJ-OJ
	for openembedded-devel@openembedded.org; Wed, 17 Sep 2008 10:10:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Sep 2008 10:10:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Sep 2008 10:10:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Sep 2008 12:09:53 +0200
Message-ID: <gaql1h$b9$1@ger.gmane.org>
References: <f96d234e0809161327v2d71e99bx79192593ff99086a@mail.gmail.com>	<gap6bl$2ca$1@ger.gmane.org>
	<f96d234e0809161439tc0ed410jad0ae837edd24e29@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080901030016 Shredder/3.0b1pre
In-Reply-To: <f96d234e0809161439tc0ed410jad0ae837edd24e29@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: xserver-kdrive 1.4 and USB keyboard
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
X-List-Received-Date: Wed, 17 Sep 2008 10:13:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> On Tue, Sep 16, 2008 at 4:53 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> Cliff Brake wrote:
>>> Does anyone have this combination working yet?
>>>
>>> On my system, ctrl-alt-f1 does not work, and caps/num lock lights do
>>> not work when X is running.  Keyboard works fine at the console.
>> I suspect that's because kdrive 1.4 lacks a default keymap. Graeme provided
>> a really bare-bones one that makes X access keys (e.g. xkbd,
>> matchbox-keyboard). Making USB keyboards work properly proved to be too much
>> work, so I am now using full-blown Xorg on anything with a usb-keyboard.
>> Having said that, the A-z keys did work on beagle, the fact that left-mouse
>> button clicks produced a 'q' was the final straw (clock on window running
>> powertop - boom).
>> Something is very broken in kdrive, which might be due to people working on
>> it only care for tablets from a certain scandinavian company.
>
> Thanks.  Yes, you are correct.  I can get arrow keys, and enter to
> work, but not cap/num lock or Ctrl-Alt-F1.

In that case fixing the keymap would be the way to go. You'll need to 
poke the resident X exports on how to do that properly, though :)

regards,

Koen

>
> Cliff
>




