Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDXf5-00057s-CN
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 07:44:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDXVt-0003jG-0a
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 05:35:17 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Jun 2009 05:35:17 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Jun 2009 05:35:17 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Jun 2009 07:35:07 +0200
Message-ID: <h0i7ub$lu6$1@ger.gmane.org>
References: <20090607175542.GA26712@fh-wedel.de> <h0h0el$60i$1@ger.gmane.org>
	<20090607191824.GB28536@fh-wedel.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <20090607191824.GB28536@fh-wedel.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Still not solved: glibc-dbg and insane.bbclass
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
X-List-Received-Date: Mon, 08 Jun 2009 05:44:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-06-09 21:18, Martin Dietze wrote:
> On Sun, June 07, 2009, Koen Kooi wrote:
>
>> What's exactly breaking? It's perfectly legal (and needed for depchains!)
>> for -dbg package to be empty.
>
> This is the QA error I am getting:
>
> | % cat log.qa_package
> | wrong architecture, glibc-dbg, /work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/ld-2.3.3.so
> | wrong architecture, glibc-dbg, /work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/libc-2.3.3.so
>
> And this is what the files look like:
>
> | % file  /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/ld-2.3.3.so
> | /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/ld-2.3.3.so: ELF 32-bit LSB no file type, no machine, invalid version (SYSV)
> | % file  /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/libc-2.3.3.so
> | /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/libc-2.3.3.so: ELF 32-bit LSB no file type, no machine, invalid version (SYSV)
>
> The files are practicall empty (here libc-2.3.3.so):
>
> 7f 45 4c 46  01 01 01 00  00 00 00 00  00 00 00 00  .ELF............
> 00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ................
> 00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ................
> 00 00 00 00  01 00 00 00  03 00 00 00  00 00 00 00  ................
> 00 00 00 00  00 00 00 00  0b 00 00 00  00 00 00 00  ................
> 00 00 00 00  01 00 00 00  00 00 00 00               ............
>
> For whatever reason the build creates those files in .debug
> even though the build is performed without debug code.

Ahh, it creates empty .debug/foo.so files. In that case do:

# The files are empty except for the elf header
INSANE_SKIP_glibc-dbg = True

In the offending glibc recipe

regards,

Koen



