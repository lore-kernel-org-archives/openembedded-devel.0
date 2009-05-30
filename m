Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAPzz-0003yz-Ml
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 16:57:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MAPrj-0003L5-V9
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 14:48:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 14:48:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 14:48:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 May 2009 16:48:41 +0200
Message-ID: <gvrh09$88g$1@ger.gmane.org>
References: <4A213D52.8050802@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090522 Shredder/3.0b3pre
In-Reply-To: <4A213D52.8050802@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Trying to build cmake in OE for BeagleBoard (errors)
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
X-List-Received-Date: Sat, 30 May 2009 14:57:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-05-09 16:06, Dan wrote:
> Hi all,
>
> I'm trying to build cmake in OE for the Beagle Board from Angstrom
> stable/2009. I can build
> cmake-native correctly, but that's for my host. When I try $bitbake
> cmake, I get errors. The recipe that comes in the OE repository is for
> version 2.4.8. I tried copying and pasting the .bb and renaming to the
> latest version 2.6.4 and get the same exact errors. I am able to build
> other packages like console-image correctly.
>
> Here's my errors from cmake-2.6.4:
>
>
> The cmake_bootstrap.log says this:
>
> Try: ccache
> Line: ccache -isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/
> include -fexpensive-optimizations -frename-registers -fomit-frame-
> pointer -O2 cmake_bootstrap_31053.test.c -o cmake_bootstrap_31053.test

It seems cmake treats $CC was a single word instead of the string it is. 
So instead of it doing 'ccache arm-angstrom-linux-gnueabi-gcc <stuff>' 
it is doing 'ccache <stuff>'.

I think you can get around it by disabling ccache (CCACHE=""), but it 
means cmake will also ignore $TARGET_CC_ARCH, which is a bit more severe.

regards,

Koen



