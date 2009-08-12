Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbFnW-0005fP-3O for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 17:31:30 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MbFXb-0001Qx-4W for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 15:15:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 15:15:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 15:15:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 12 Aug 2009 17:13:54 +0200
Message-ID: <h5um7k$ioq$2@ger.gmane.org>
References: <4A81BE84.6010607@atmel.com>
	<200908121433.31479.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <200908121433.31479.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Wed, 12 Aug 2009 15:31:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-09 14:33, Marcin Juszkiewicz wrote:

>> I introduced the possibility to build linux using
>> make<board>_defconfig, instead of using a
>> defconfig in a board directory under linux.
>> LINUX26_DEFCONFIG needs to be defined.
>
> Interesting, will check. I see a problem anyway because linux_*.bb
> recipes by default use defconfig as part of SRC_URI. But we can use
> empty file to satisfy it.

The defconfig-in-OE bit is there because the in-kernel ones are either

a) broken
b) lacking drivers for nearly everything

I suspect you'll be introducing a huge regression when it comes to 
things like uinput, netfilter, usb drivers, etc.

regards,

Koen



