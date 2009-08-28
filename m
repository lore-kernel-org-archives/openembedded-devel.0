Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mh28m-00083g-CS for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2009 16:09:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Mh1r5-0004BF-RS
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2009 15:51:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 15:51:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 15:51:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Aug 2009 15:50:33 +0200
Message-ID: <h78nba$vs$1@ger.gmane.org>
References: <E1MgfbN-0005E3-EZ@melo.openembedded.org>
	<200908281450.34613.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200908281450.34613.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Pratheesh Gangadhar : glib-2.0 2.21.4: add armv6 atomic ops, this fixes 100% utilization hangs when doing DSP based GStreamer playback
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
X-List-Received-Date: Fri, 28 Aug 2009 14:09:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28-08-09 14:50, Marcin Juszkiewicz wrote:
> Dnia czwartek, 27 sierpnia 2009 o 16:05:21 git version control napisał(a):
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 1eb89aacbc6830fe242eac36ba8bcb61d98807f5
>> URL:
>>   http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=1eb89aacbc68
>> 30fe242eac36ba8bcb61d98807f5
>>
>> Author: Pratheesh Gangadhar<pratheesh.gangadhar@gmail.com>
>> Date:   Thu Aug 27 02:51:00 2009 +0530
>>
>> glib-2.0 2.21.4: add armv6 atomic ops, this fixes 100% utilization hangs
>> when doing DSP based GStreamer playback
>>
>> GLIB by default uses ARMV5 instructions for emulating atomic operations and
>> this patch (derived from
>> https://stage.maemo.org/svn/maemo/projects/haf/trunk/glib/debian/patches/25
>> -gatomic.patch) make use ARMV6 atomic instructions instead. CPU goes into
>> "sched_yield" while loop during hang - due to a race condition triggered by
>>   high rate context switching while running DSP plugins.
>
> 1. Your change reverted PR from r4 (set in glib.inc) to r1

I overlooked that when reviewing, sorry

> 2. This is not buildable for arm<6:
>
> | arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb -D
> HAVE_CONFIG_H -I. -I.. -I.. -DG_LOG_DOMAIN=\"GLib\" -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -DG_DISABLE_CHECKS -DG_DISABLE_DEPRECATED -DGLIB_COMPIL
> ATION -DPCRE_STATIC -isystem/home/hrw/devel/build/angstrom/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include -DG_DISABLE_SINGLE_INCLUDES -pthread
>   -isystem/home/hrw/devel/build/angstrom/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-
> pointer -O2 -ggdb3 -Wall -mno-thumb -isystem/home/hrw/devel/build/angstrom/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -
> frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall -MT libgatomic_la-gatomic.lo -MD -MP -MF .deps/libgatomic_la-gatomic.Tpo -c gatomic.c  -fPIC -DPIC -o
> .libs/libgatomic_la-gatomic.o
> | /tmp/ccEqvIUs.s: Assembler messages:
> | /tmp/ccEqvIUs.s:9449: Error: selected processor does not support `ldrex r0,[r2]'
> | /tmp/ccEqvIUs.s:9451: Error: selected processor does not support `strex r3,ip,[r2]'
> | /tmp/ccEqvIUs.s:9477: Error: selected processor does not support `ldrex r2,[r0]'
> | /tmp/ccEqvIUs.s:9479: Error: selected processor does not support `strex r3,r2,[r0]'
> | /tmp/ccEqvIUs.s:9504: Error: selected processor does not support `ldrex r3,[r0]'
> | /tmp/ccEqvIUs.s:9507: Error: selected processor does not support `strexeq ip,r2,[r0]'
> | /tmp/ccEqvIUs.s:9532: Error: selected processor does not support `ldrex r3,[r0]'
> | /tmp/ccEqvIUs.s:9535: Error: selected processor does not support `strexeq ip,r2,[r0]'
> | /tmp/ccEqvIUs.s:9577: Error: selected processor does not support `ldrex r3,[r0]'
> | /tmp/ccEqvIUs.s:9578: Error: selected processor does not support `strex r3,r1,[r0]'
> | /tmp/ccEqvIUs.s:9620: Error: selected processor does not support `ldrex r3,[r0]'
> | /tmp/ccEqvIUs.s:9621: Error: selected processor does not support `strex r3,r1,[r0]'
> | make[4]: *** [libgatomic_la-gatomic.lo] Error 1
> | make[4]: *** Waiting for unfinished jobs....

That's weird, since that's all wrapped in 'if G_ATOMIC_ARM > 6', but I 
made the patch armv6 and armv7 only to be really sure. Thanks for 
finding this issue.

regards,

Koen



