Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JW8Ej-0006a8-TE
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 11:49:43 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id CAF6C146C002
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2008 11:48:28 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fqg9c0$g00$1@ger.gmane.org>
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
Date: Mon, 03 Mar 2008 11:48:28 +0100
Message-Id: <1204541308.5725.10.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwwmmxt optimization and soft float in OE on PXA270
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
X-List-Received-Date: Mon, 03 Mar 2008 10:49:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> Angstrom already enables softfloat (for FPU-less systems) and -Os by
> default *and* enables iwmmxt (if you have MACHINE_FEATURES = "iwmmxt")
> for apps which have been proven to benefit from iwmmxt (e.g. mplayer).

Ah, I see. ABI-compatible softfp mode is enabled by patching gcc, not in
conf files.

> I still get mysterious segfaults when running an all iwmmxt glibc system
> (uclibc is even worse), so I don't think flipping the global switch is a
> good idea.

Which applications are failing for you?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



