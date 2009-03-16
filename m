Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lj0No-0001GY-NA
	for openembedded-devel@openembedded.org; Mon, 16 Mar 2009 01:08:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id A7BAB1409329
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Mar 2009 01:08:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJF3aOhVthkj for <openembedded-devel@openembedded.org>;
	Mon, 16 Mar 2009 01:08:30 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 7096B1416BA8
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Mar 2009 01:08:30 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
In-Reply-To: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
References: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
Date: Mon, 16 Mar 2009 01:08:08 +0100
Message-Id: <1237162088.5882.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] base-files: add noatime to rootfs mount	options
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
X-List-Received-Date: Mon, 16 Mar 2009 00:08:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Dmitry Artamonow wrote in Sun 03/15 2009 at 23:47 +0300:
> In most machines' fstabs rootfs mounted with 'defaults' option.
> This implies that atime logging is on - i.e. on every read from
> filesystem kernel writes atime stamp to files' metadata.
> Here in embedded world, where rootfs is usually stored on some
> kind of flash (internal NAND/NOR, or external SD/MMC/CF card)
> it is a real problem, because higher number of writes causes
> flash wearing, higher system load and higher chance of filesystem
> corruption.
> 
> Fix it by adding noatime to rootfs mount options in fstab.

Good idea. On Zaurus it even prevents regular hard disc waking up while
executing scripts and significantly increases speed of writing of large
amount of small files.

Patching of udev mount.sh script would be useful as well.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



