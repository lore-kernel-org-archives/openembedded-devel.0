Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OWl83-0000G3-6f
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 09:02:39 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OWl3J-0004Bx-4u by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 08:57:47 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OWl3B-0003Z3-VU
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 08:57:38 +0200
Date: Thu, 8 Jul 2010 08:57:37 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100708065736.GA5242@excalibur.local>
References: <1278509965-32664-1-git-send-email-heinold@inf.fu-berlin.de>
	<AANLkTilK-hX_hPWqDp04sCTV3WiFTPL3ojHL3Jyc6CXX@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilK-hX_hPWqDp04sCTV3WiFTPL3ojHL3Jyc6CXX@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: add support for builtin gcc-atomics for gcc-4.3.x versions
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
X-List-Received-Date: Thu, 08 Jul 2010 07:02:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-07-07 at 17:40, Khem Raj wrote:
> On Wed, Jul 7, 2010 at 6:39 AM,  <heinold@inf.fu-berlin.de> wrote:
> > From: Henning Heinold <heinold@inf.fu-berlin.de>
> >
> > * bump all INC_PR's
> >
> > this are the promised patches for gcc-4.3.x series, which fixes
> > the atomic stuff and therefore make it able to build
> > llvm multithreaded.
> >
> > Signed-off-by: Henning Heinold <h.heinold@tarent.de>
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

I did a lot of compile testing with these patches applied. GCC, pulseaudio and
llvm rebuild as well as building all of them and complete images from scratch.
No problem found. At buglabs we are using them for our builds as well without
problems.

regards
Stefan Schmidt


