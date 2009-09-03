Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1Mj9mj-0007fI-3o
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 12:43:21 +0200
Received: from [76.91.220.157] (helo=[192.168.1.29])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1Mj9UV-0007Ss-7k
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 03:24:31 -0700
Message-ID: <4A9F9959.5010408@symas.com>
Date: Thu, 03 Sep 2009 03:24:25 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090819 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.7.1251972002.477.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.7.1251972002.477.openembedded-devel@lists.openembedded.org>
Subject: Re: TI DSP updates
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
X-List-Received-Date: Thu, 03 Sep 2009 10:43:21 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

> Date: Thu, 03 Sep 2009 10:00:37 +0200
> From: Koen Kooi <k.kooi@student.utwente.nl>

> On 03-09-09 04:17, Howard Chu wrote:
>> > These are the changes I made to use the latest Codec engine, DSP
>> > modules, etc. for OMAP3530 to build. Tested and working with
>> > gstreamer-ti on an Always Innovating Touch Book with linux-omap_2.6.29
>> > kernel / Angstrom...
> Thank you for your work on this! Your work does seem to be based on an
> outdated OE checkout, could you try to rebase it on the current
> org.openembedded.dev branch?

Ah, I thought I had rebased with HEAD just before I posted. But sure, I'll try 
updating again.

>> > To get a working codec server on the Touch Book, which has 256MB of RAM,
>> > I had to modify the default server config:
> To move the memorymap more stuff has to get changed, but there's an
> easier way that also works with 512MiB and 1024MiB RAM:
>
> put 'mem=80M@0x80000000 mem=128M@0x88000000' in your bootargs and make
> sure your kernel has the arch-has-holes.diff applied to make that
> memoryhole work.

Interesting. I guess that's more future-proof but currently no OMAP3530 can 
have more than 256MB of RAM... Also, not sure what else you're referring to 
that needs to be changed. The dsplink driver doesn't care. The codec server 
only needs to know where the end of memory is, and it arranges the rest of the 
map itself. It chose to use only 29M of memory, and I can't complain about 
that, better than eating up 40M. Here's the datasheet it generated for this 
codec server:

http://highlandsun.com/hyc/cs.x64P.DataSheet.html

The gstreamer ticodecplugin just needs to be pointed at that server.tcf file 
to use the same config. If I'm missing the point you're making, please explain 
again, thanks.

If I had known about that memory hole trick I would probably not have bothered 
rebuilding any of this, could've just downloaded a new codec combo and run 
with it. Live and learn...
-- 
   -- Howard Chu
   CTO, Symas Corp.           http://www.symas.com
   Director, Highland Sun     http://highlandsun.com/hyc/
   Chief Architect, OpenLDAP  http://www.openldap.org/project/


