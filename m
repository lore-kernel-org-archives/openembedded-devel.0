Received: from mail.emacinc.com ([63.245.244.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1Nck3i-0004hf-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 19:34:41 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1Nck19-0001Gf-L3
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 12:32:06 -0600
From: Travis Stratman <tstratman@emacinc.com>
To: OE dev list <openembedded-devel@lists.openembedded.org>
Date: Wed, 03 Feb 2010 12:31:54 -0600
Message-Id: <1265221914.4267.273.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.68
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: re-run install task without cleaning
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
X-List-Received-Date: Wed, 03 Feb 2010 18:34:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I have been working with Qt embedded and I want to make a subtle change
to the bitbake script that will only affect the install task (which now
completes successfully). Normally when I do something like this I just
clean and build the whole thing over again to get bitbake to use the new
install task. Just doing a '-c install' won't work because the previous
build completed successfully.

Because Qt takes about 2 hours to compile, I'm hoping that there is some
trick that I am not aware of where I can change and re-run the install
task (and all subsequent tasks) without rebuilding the whole package.

Any suggestions?

Thanks,

TAS



