Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ntlfi-0002NZ-6j
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 18:44:20 +0100
Received: from p5b037b4e.dip.t-dialin.net ([91.3.123.78] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NtlcW-0002kb-Bl by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 18:41:08 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NtlcV-0005kt-RU
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 18:40:55 +0100
Date: Mon, 22 Mar 2010 18:40:55 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100322174055.GA19274@excalibur.local>
References: <openembedded-devel@lists.openembedded.org>
	<1269019049-25807-1-git-send-email-aalonso00@gmail.com>
	<20100321112854.GB7325@excalibur.local>
	<d1ded4381003221021n29191b3ch9e0e61b81f4cabb4@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d1ded4381003221021n29191b3ch9e0e61b81f4cabb4@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot_git.bb: add xilinx-ml507 support
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
X-List-Received-Date: Mon, 22 Mar 2010 17:44:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-03-22 at 11:21, Adrian Alonso wrote:
> 
> Fix previous error a patch should be at patchqueue, also is attached.
> 
> u-boot source code provides a parameter definition for a hardware reference
> design
> documented at [1]; Even trying to replicating this hardware project it would
> not necessary
> match the hardware address model used by u-boot so is safer to overwrite
> this header file (xparameters.h);
> Also u-boot expects a set of macros that are not generated whit xilinx
> tools, and I append them
> at the end of the header file, I know this is ugly but there's no way to
> provide a patch since the
> header file is generated based on the hardware modules included in the
> project.
> 
> This probably can be included in xilinx-bsp.bbclass but I will need to
> detect when u-boot or linux-kernel
> is inheriting the class to perform the right action. But at the moment I
> don't know ho to do it.

OK, thanks for the time explaining it. Will test your patch and push it.

regards
Stefan Schmidt


