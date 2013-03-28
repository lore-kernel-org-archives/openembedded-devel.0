Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1ULLSu-00032L-AN
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 23:38:36 +0100
Received: from host-92-24-36-84.ppp.as43234.net ([92.24.36.84]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1ULKrc-0008K2-FX by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 23:00:06 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1ULKrU-0001ot-Ah for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 22:00:00 +0000
Date: Thu, 28 Mar 2013 21:59:51 +0000
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130328215943.GA6608@novatech.datenfreihafen.org>
References: <1364484753-22122-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1364484753-22122-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [meta-networking][PATCH] 6lowpan-tools: add git version
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
X-List-Received-Date: Thu, 28 Mar 2013 22:38:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2013-03-28 at 16:32, Koen Kooi wrote:
> The 0.3 release was 6 months ago and git HEAD contains fixes to make it work with contiki, so build from git instead of backporting all the patches.

Sounds like a good idea. And not only because one of the patches is
from me ;)

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-support/6lowpan/6lowpan-tools_git.bb     | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb

Any special reason why this is named 6lowpan here?

6lowpan normally refers to IPv6 over LoWPAN while the lowpan-tools
do not configure anything regarding IPv6 but the plain LoWPAN which is
the protocol layer below. I would suggest renaming it to lowpan-tools.

regards
Stefan Schmidt


