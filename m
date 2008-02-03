Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JLmpp-000843-SP
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Feb 2008 22:57:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 27F9E1422AA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2008 22:57:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRzOX6bffi6y
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2008 22:57:20 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id DFFE414171BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2008 22:57:19 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47A2D217.7070000@gmail.com>
References: <1201544344.5882.45.camel@hammer.suse.cz>
	<20080130124544.1f562944@widy.localdomain>
	<1201695196.27523.52.camel@hammer.suse.cz> <47A2D217.7070000@gmail.com>
Date: Sun, 03 Feb 2008 22:57:19 +0100
Message-Id: <1202075839.17746.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Subject: Re: [patch commit request] kdrive xserver: support	for	key	codes 128-255
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Feb 2008 21:57:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Junqian Gordon Xu wrote:
> On 01/30/2008 06:13 AM, Stanislav Brabec wrote:
> >> Paul Sokolovsky wrote:
> >> Can you please elaborate what the application of this patch would mean
> >> for OE (besides fixing support for one specific obscure peripheral)? 
> 
> I guess I probably would be yelled at for not raising this before 
> committing your patch.
> 
> Is this patch specific to Zaurus clamshells, akita/spitz/c7x0? In other 
> words, are there any other devices benifiting from the extended keycode. 
>   I vaguely remember Dmitry asked about extended keycode for tosa, but 
> I'm not sure he's talking about the same thing.

No. It adds support for key codes 128-255 in general.

Let he test to assign these key codes in the kernel driver. He should
see them non-mangled in X.

Note that is cannot provide codes above 255 - it is a major limitation
of X11 protocol.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



