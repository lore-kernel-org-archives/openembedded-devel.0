Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mj7Xp-00023O-5Z for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 10:19:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Mj7Fc-00037W-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 10:01:00 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 10:01:00 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 10:01:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 03 Sep 2009 10:00:37 +0200
Message-ID: <h7nt36$jk9$1@ger.gmane.org>
References: <4A9F2725.4070208@symas.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4A9F2725.4070208@symas.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Thu, 03 Sep 2009 08:19:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-09-09 04:17, Howard Chu wrote:
> These are the changes I made to use the latest Codec engine, DSP
> modules, etc. for OMAP3530 to build. Tested and working with
> gstreamer-ti on an Always Innovating Touch Book with linux-omap_2.6.29
> kernel / Angstrom...

Thank you for your work on this! Your work does seem to be based on an 
outdated OE checkout, could you try to rebase it on the current 
org.openembedded.dev branch?

> To get a working codec server on the Touch Book, which has 256MB of RAM,
> I had to modify the default server config:

To move the memorymap more stuff has to get changed, but there's an 
easier way that also works with 512MiB and 1024MiB RAM:

put 'mem=80M@0x80000000 mem=128M@0x88000000' in your bootargs and make 
sure your kernel has the arch-has-holes.diff applied to make that 
memoryhole work.

regards,

Koen



