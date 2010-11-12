Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PGtXB-0003Qk-SE
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 14:19:19 +0100
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0B0801B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 13:21:17 +0000 (UTC)
Message-ID: <4CDD3E99.9090400@freyther.de>
Date: Fri, 12 Nov 2010 14:18:17 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CDD2445.5050506@nedap.com>
In-Reply-To: <4CDD2445.5050506@nedap.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: alignment errors
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
X-List-Received-Date: Fri, 12 Nov 2010 13:19:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/12/2010 12:25 PM, Jaap de Jong wrote:
> Hi,
> 
> I'm working on a recipe for ptpd2.
> When I run it on my armv5te I get traps:
> 
> [ 5034.410000] Alignment trap: ptpd2 (523) PC=0x0000e7cc Instr=0xe5870004
> Address=0x0001d459 FSR 0x801
> 
> What is the best way to tackle this?
> Do I have to add "__attribute__ ((packed))" on critical places?
>

use addr2line or gdb (if this is inside a library) to get the method/code that
is triggering that and then see what it looks like. In most cases the easiest
way to get around this is to use memcpy or such.


