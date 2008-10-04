Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Km0jD-0001WP-NA
	for openembedded-devel@openembedded.org; Sat, 04 Oct 2008 08:34:59 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Km0eu-0000Vk-SY
	for openembedded-devel@openembedded.org; Sat, 04 Oct 2008 06:30:32 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Oct 2008 06:30:32 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Oct 2008 06:30:32 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Oct 2008 08:30:21 +0200
Message-ID: <gc72hu$i8f$1@ger.gmane.org>
References: <48E6624C.7000409@opensimpad.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <48E6624C.7000409@opensimpad.org>
Sender: news <news@ger.gmane.org>
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Sat, 04 Oct 2008 06:34:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-10-2008 20:19, Bernhard Guillon wrote:
> Hi all,
> here [1] [2] [3] are my efforts to integrate X/Qt2 into opie. Everything
> works fine for SIMpad. Can we put that into dev branch?
>
> best regrads
> Bernhard Guillon
>
> 1 http://linuxtogo.org/gowiki/Angstrom/XQt/playground
> 2 http://bugs.openembedded.net/show_bug.cgi?id=4582
> 3 http://bugs.openembedded.net/show_bug.cgi?id=4603

NACK!

+do_install() {
[..]
+	install -d ${D}/home/root
+	install -m 0600 .blackboxrc ${D}/home/root

A package NEVER EVER touches $HOME. NEVER! I wish ascii could produces 
some bigger capitals that blink and have baseballbats to get the point 
across, but sadly it can't.

Imagine I don't log in as root and fire up packagekit to install that 
packages. I don't get the .blackboxrc, but the root user suddenly has 
his .blackboxrc overwritten without notice.

So:

A package NEVER EVER touches $HOME. NEVER!

${sysconfdir} exists for a reason.

regards,

Koen



