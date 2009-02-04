Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LUfxK-0001Bs-Hr
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 12:30:10 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUfxE-0005tD-WA
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 11:30:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 11:30:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 11:30:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Feb 2009 12:29:55 +0100
Message-ID: <gmbu7j$f7s$1@ger.gmane.org>
References: <1233059140.7818.4.camel@ubuntu2>
	<497F0D92.4040904@gmail.com>	<1233136141.7444.3.camel@ubuntu2>
	<49802D8A.6020208@gmail.com>	<1233227644.6517.5.camel@ubuntu2>
	<49832BE7.6090801@gmail.com>	<1233586679.6429.5.camel@ubuntu2>
	<49871B9D.3040202@gmail.com> <1233739630.6176.4.camel@ubuntu2>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <1233739630.6176.4.camel@ubuntu2>
Sender: news <news@ger.gmane.org>
Subject: Re: Build problems
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
X-List-Received-Date: Wed, 04 Feb 2009 11:30:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04-02-09 10:27, Paolo Cremonese wrote:
> Sorry, don't know...
>
> Now the image works !
>
> Then I try to build a gpe-image, but i get an error at the last step.

Don't use dash as /bin/sh, use bash and rebuild libtool-cross and gtk+

regards,

Koen

>
> Thanks in advance,
>
> Paolo
>
>
>
> | /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux/4.2.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2: ignoring invalid character `\001' in script
> | /home/paolo/oe/stuff/build/tmp/cross/i586/lib/gcc/i586-angstrom-linux/4.2.4/../../../../i586-angstrom-linux/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2: syntax error in VERSION script
> | collect2: ld returned 1 exit status
> | make[4]: *** [libgdk_pixbuf-2.0.la] Error 1
> | make[4]: Leaving directory
> `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> +-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
> | make[3]: *** [all-recursive] Error 1
> | make[3]: Leaving directory
> `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> +-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
> | make[2]: *** [all] Error 2
> | make[2]: Leaving directory
> `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> +-2.14.2-r1/gtk+-2.14.2/gdk-pixbuf'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> +-2.14.2-r1/gtk+-2.14.2'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task
> failed: /home/paolo/oe/stuff/build/tmp/work/i586-angstrom-linux/gtk
> +-2.14.2-r1/temp/log.do_compile.22403
> NOTE: package gtk+-2.14.2-r1: task do_compile: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package gtk+-2.14.2: failed
> ERROR: Build of /home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
> +_2.14.2.bb do_compile failed
> ERROR: Task 951 (/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk
> +_2.14.2.bb, do_compile) failed
> NOTE: Tasks Summary: Attempted 1003 tasks of which 788 didn't need to be
> rerun and 1 failed.
> ERROR: '/home/paolo/oe/stuff/openembedded/packages/gtk+/gtk+_2.14.2.bb'
> failed
> NOTE: build 200902040809: completed
>
>
>
>
>
>
> On lun, 2009-02-02 at 17:13 +0100, Marco Cavallini wrote:
>> Paolo Cremonese ha scritto:
>>> Fine, waiting for GRUB patch. (what is "hrw" ?)
>>>
>>> My target has not hard disk, only CF.
>>> To run the image, do I need a RAMFS ?
>>> And in this case, I have to add it to the GRUB "menu.lst" ?
>> Paolo,
>> hrw is Marcin Juszkiewicz, an OE developer and mantainer.
>> GRUB patch was pushed this morning and is ready for use into git mainstream.
>>
>> Cordiali Saluti / Kindest Regards / mit freundlichen Grüssen
>> --
>> Marco Cavallini | KOAN sas | Bergamo - Italia
>>   embedded and real-time software engineering
>>     Atmel third party certified consultant
>> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>>        http://www.KoanSoftware.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




