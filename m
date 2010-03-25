Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nur4E-0001zr-C8
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:42:02 +0100
Received: from p5b036bbd.dip.t-dialin.net ([91.3.107.189] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nur17-0000dF-Vu by authid <stefan@sostec.de> with cram_md5;
	Thu, 25 Mar 2010 18:38:53 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>)
	id 1Nur17-0002uu-Ew; Thu, 25 Mar 2010 18:38:49 +0100
Date: Thu, 25 Mar 2010 18:38:49 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Antonio Ospite <ospite@studenti.unina.it>
Message-ID: <20100325173849.GE11431@excalibur.local>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<1269537597-26456-4-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <1269537597-26456-4-git-send-email-ospite@studenti.unina.it>
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
Cc: openezx-devel@lists.openezx.org,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/5] ezx: update ezxd version and ezxd.init script
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
X-List-Received-Date: Thu, 25 Mar 2010 17:42:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-03-25 at 18:19, Antonio Ospite wrote:
> Newer kernels have drivers for BP interaction built as modules, add the
> loading sequence in ezxd.init.
> 
> Fix also the recipe so that the CC and CROSS variables do not interfere
> with the crosscompiler from OE.

Hmm, we should really think about moving it from the handwritten makefile to
autotools. On the other hand it was never designed to stay ... as so much other
code. :)

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


