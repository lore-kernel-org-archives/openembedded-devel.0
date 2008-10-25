Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KthRN-0001TY-Uy
	for openembedded-devel@openembedded.org; Sat, 25 Oct 2008 13:36:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KthQf-0007QP-Tz
	for openembedded-devel@openembedded.org; Sat, 25 Oct 2008 11:35:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 25 Oct 2008 11:35:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Oct 2008 11:35:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 25 Oct 2008 13:35:30 +0200
Message-ID: <gdv0a2$u5k$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081023 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: Making thumb builds easier in OE
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
X-List-Received-Date: Sat, 25 Oct 2008 11:36:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed that Phil fixed thumb interworking in glibc for armv4t which 
spurred me to do this:

arm tune files: include tune-thumb by default
* it defaults to non-thumb, so no functional change

So people can now set ARM_INSTRUCTION_SET = "thumb" and resulting ARM 
builds will be in thumb mode.

This does raise a few issues:

  1) How can we handle thumb2? I only changed the arm9 and arm11 tune 
files, how should we do the arm1176 and cortex ones?

  2) Since thumb packages are compatible with non-thumb ones we don't 
really need a seperate arch, but keeping them same feels wrong and is a 
QA nightmare.

for 2) my first thought was to add '-thumb' to the archs, like angstrom 
adds '-oabi' for strongarm packages.

I'm not really interested in a discussion whether thumb(2) is worth it, 
I just want to solve the build- and distro side of it.

Thought suggestions?

regards,

Koen



