Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KlmcZ-0003H6-W0
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 17:31:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KlmYP-0001pB-I1
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 15:26:53 +0000
Received: from ipgw-nl.telfort.nl ([212.41.157.237])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 15:26:53 +0000
Received: from k.kooi by ipgw-nl.telfort.nl with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 15:26:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 03 Oct 2008 17:26:41 +0200
Message-ID: <gc5djj$4em$1@ger.gmane.org>
References: <4883BCB1.7020102@atmel.com> <48E60608.4060105@linuxdevelopment.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ipgw-nl.telfort.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <48E60608.4060105@linuxdevelopment.de>
Sender: news <news@ger.gmane.org>
Subject: Re: binutils fails for AVR32
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
X-List-Received-Date: Fri, 03 Oct 2008 15:31:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03-10-2008 13:46, Robert Wörle wrote:
>> | Configuring in ./intl
>> | configure: warning: build_alias=i686-linux: invalid host type
>> | configure: warning: host_alias=i686-linux: invalid host type
>> | configure: error: can only configure for one host and one target at a
>> time
>> | make[1]: *** [configure-intl] Error 1
>> | make[1]: Leaving directory
>> `/mnt/home/ulf/OpenEmbedded/build-avr32/tmp/work/avr32-angstrom-linux-uclibc/binutils-cross-2.17-r6/binutils-2.17/build.i686-linux.avr32-angstrom-linux-uclibc'
>>
>> | make: *** [all] Error 2
>> | FATAL: oe_runmake failed
>>
>> These problems seems to be caused by build_alias, host_alias and
>> target_alias beeing passed to "configure", but these are only
>> supported by binutils-2.18 and not 2.17 which is used by the AVR32.
>>
>> I am adding
>> ~ (cd ${B}&&  sed -i -e "s,'host_alias=i686-linux',," Makefile)
>> ~ (cd ${B}&&  sed -i -e "s,'build_alias=i686-linux',," Makefile)
>> ~ (cd ${B}&&  sed -i -e "s,'target_alias=avr32-angstrom-linux-uclibc',,"
>> Makefile)
>>
>> to the do_avr32_configure_bfd
>>
> Did you add this as prepend to this stage ? in which bb file did you add
> it ?
> Did the whole toolchain work out for you now ?

It seems your metadata is obsolete, avr32 builds have 'just worked' for 
a few months now thanks to several companies funding OE avr32 work.

A sample of what angstrom can do now:

http://www.youtube.com/watch?v=vvOyixL8BRM

regards,

Koen





