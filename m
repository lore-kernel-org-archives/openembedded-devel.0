Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L1htw-0006Qk-JG
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 14:42:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 4CF7A1417184
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Nov 2008 14:38:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMnBZzPQRsjw
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Nov 2008 14:38:37 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 0F2431416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Nov 2008 14:38:36 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226475337.4118.32.camel@utx.utx.cz>
References: <1226433327.4417.10.camel@utx.utx.cz>
	<1226442540.29923.0.camel@aquilonia>
	<1226475337.4118.32.camel@utx.utx.cz>
Date: Sun, 16 Nov 2008 14:40:38 +0100
Message-Id: <1226842838.4912.13.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: glibc LC_COLLATE bug (was: openmoko OE devs: update	claws-mail and libetpan?)
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
X-List-Received-Date: Sun, 16 Nov 2008 13:42:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:
> Graeme Gregory wrote:
> > On Tue, 2008-11-11 at 20:55 +0100, Stanislav Brabec wrote:
> > 
> > > 3) Add new versions to preferred-om-2008-versions.inc
> > > 
> > As claws maintainer and OM person please do this version.
> 
> Well, I naively expected that the latest version will work better.

Updated in OE. claws-mail-3.6.1 should now build and work.

The crash disappeared with
http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=1773

I have also updated translation to the new menu system:
http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=1774

> And why it depends on LC_COLLATE? I have no idea.

The real bug is located deeply inside glibc:

g_utf8_collate("text", "file") returns 0 ("strings are equal").

It happens only inside claws-mail context (e. g. toolbar_parse_item())
and cannot be reproduced in a simple test case.

Picking old LC_COLLATE file in my locale in /usr/lib/locale makes it
working again => probably localedef tool is broken.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



