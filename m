Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JLmmq-0007yO-Qt
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Feb 2008 22:54:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 18BE61422AA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2008 22:54:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJX5NFOwnoek
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2008 22:54:15 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id CF19B1422AA0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2008 22:54:14 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47A2D0A5.3030806@gmail.com>
References: <1201531952.5882.32.camel@hammer.suse.cz>
	<47A2D0A5.3030806@gmail.com>
Date: Sun, 03 Feb 2008 22:54:14 +0100
Message-Id: <1202075654.17746.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Subject: Re: [patch commit request] kernel fixes for Zaurus akita+spitz
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
X-List-Received-Date: Sun, 03 Feb 2008 21:54:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Junqian Gordon Xu wrote:
> On 01/28/2008 08:52 AM, Stanislav Brabec wrote:

> > -CONFIG_MTD_SHARP_SL=y
> > +CONFIG_MTD_SHARP_SL=m

> > +CONFIG_SHARPSL_RC=m
> 
> Shouldn't defconfig-akita be updated as well? Pleas advice.

Probably yes for CONFIG_SHARPSL_RC=m. It should work there, too.

Optionally for CONFIG_MTD_SHARP_SL=m. On akita, the reported bug
(missing PROM access when compiled as module) does not happen, because
mtd support is compiled directly into the kernel. On the other hand it
is possible, because access to the initial PROM is probably not
mandatory for boot (and even rarely used). Please test.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



