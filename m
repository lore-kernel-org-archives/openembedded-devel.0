Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L1j6N-0004TD-OP
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 15:59:51 +0100
Received: from p5b0350b7.dip.t-dialin.net ([91.3.80.183]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L1j49-0004mf-G2 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Nov 2008 15:57:36 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1L1j5j-0007QZ-J2 for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 15:59:11 +0100
Date: Sun, 16 Nov 2008 15:59:11 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081116145911.GB14299@dodger.lab.datenfreihafen.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gfnf5u$r3j$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Sun, 16 Nov 2008 14:59:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Sorry for the delay. Having a cold I decided to have a releaxed weekend. Will
take a deeper look next days if the stuff below does not help.

On Sat, 2008-11-15 at 22:32, Koen Kooi wrote:
>
> I just built and installed the updated e-wm and it refuses to start:

Installed means from the updated angstrom feed I guess?

> [..]
> ESTART: 0.20785 [0.00140] - ipc
> INFO: E_IPC_SOCKET=/tmp/enlightenment-root/disp-:0.0-4494
> ESTART: 0.21292 [0.00507] - font
> ESTART: 0.21494 [0.00202] - theme
> ESTART: 0.25406 [0.03912] - splash
> ESTART: 0.25430 [0.00024] - test file format support
> <<<< Enlightenment Error >>>>
> Enlightenment found Evas can't load PNG files. Check Evas has PNG
> loader support.
>
> E17: Begin shutdown procedure!
>
> But I have:

The only thing I could think about bringing such serious breakage could be the
new dependency of all kind of e libs on eina. Can you please check if the lib is
installed?

> Could the people that touched e-wm please make it work again?

Sure.

As a sidenote. This was not rushed in without testing or review. I spent some
good hours on reviewing it together with mickey, in his role as E maintainer in
OE. We also decided to keep some more patches out until there is more time for
review.

And I of course tested it before pushing. Building and actually using it. No
breakage here. But as I only tested with a complete new image and not with
updating from a feed I may have messed up here. Should not happen though :(

If eina is installed in a matching version I would need the foolowing to track
this down as I don't have the problem here:

- Full x.log
- Full strace
- Full list of installed packages

Thanks forthe time to look into this problem and let me know.

regards
Stefan Schmidt


