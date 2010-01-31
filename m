Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NbQds-0007fH-0s
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 04:38:35 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8B9CC1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 03:35:35 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2010 04:35:35 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u7dnj4v0mn1qzu@camelguo>
In-Reply-To: <op.u7dnj4v0mn1qzu@camelguo>
MIME-Version: 1.0
Message-Id: <201001310435.35312.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 03:38:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 31 January 2010 04:20:18 Guo Hongruan wrote:

> -mno-thumb-interwork  -Wall -Wstrict-prototypes -fno-stack-protector -c -o
> board.o board.c
> board.c:126: error: inline function 'coloured_LED_init' cannot be declared
> weak
> board.c:128: error: inline function 'red_LED_on' cannot be declared weak
> board.c:130: error: inline function 'red_LED_off' cannot be declared weak
> board.c:132: error: inline function 'green_LED_on' cannot be declared weak
> board.c:134: error: inline function 'green_LED_off' cannot be declared weak
> board.c:136: error: inline function 'yellow_LED_on' cannot be declared weak
> board.c:138: error: inline function 'yellow_LED_off' cannot be declared
> weak

> anyone can give me some hints?

Yeah,

please make sure some of your outstanding stuff is getting cleaned up and 
included in the upstream OpenEmbedded.


Now if you look at the code in board.c:96[1]

void inline __yellow_LED_off(void) {}
void yellow_LED_off(void) __attribute__((weak, alias("__yellow_LED_off")));

There are two GCC attributes that you could check the manual for. The first one 
is weak and the second one is an alias.

The idea of weak here seems to be that you have a default ARM implementation 
(__yellow_LED_off) but that a specific board could just write "void 
yellow_LED_off(void) { real_gpio_foo }" and U-Boot is properly linking and will 
use the board specific routine..

The alias is more or less to be able to have two names for the same text 
segment.


Now to the hint:
1.) The issue seems to be caused by using newer GCC?
2.) Take it up with upstream uboot to see how they want it to be changed.
2.1.) E.g. removing the "inline" could work and it should not increase the
       size of the text section
2.2) E.g. instead of using the alias it could call the inline function...



[1] http://git.denx.de/cgi-bin/gitweb.cgi?p=u-
boot.git;a=blob;f=lib_arm/board.c;h=e148739152c0826130ab70f249c74aa010165d67;hb=HEAD#l96


