Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NQzU7-0002UY-Ag
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 09:37:22 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 110401B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Jan 2010 08:32:24 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 2 Jan 2010 09:35:04 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1262417674-26652-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1262417674-26652-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <201001020935.04959.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix compiling error of uclibc-initial-0.9.30.1 due to incorrect uClibc.machine for qemumips
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
X-List-Received-Date: Sat, 02 Jan 2010 08:37:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 02 January 2010 08:34:34 Guo Hongruan wrote:
> 1. Add mips entry for linux-uclibc into package_qa_get_machine_dict of
>  insane.bbclass. Without it the insance check will fail due to key miss
>  exception.

>  2. Rewrite the complete qemumips/uClibc.machine, In the
>  previous one, the TARGET_ARCH is set i386 (not mips). ---
>  classes/insane.bbclass                             |    1 +


Please split up the patch as there is no relationship between the two things. 
The first one is a nice catch and I thought we already had this. I can't 
comment on the second one.

The other bit is... use "Signed-off-by:" on your patches if you want them 
included in OE. Only if you use the above they will show up in 
patchwork.openembedded.org which people go through to look at outstanding 
patches...

thanks
	z.!

PS: keep up the nice work :)


