Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LoGu4-0002rp-P6
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 14:47:48 +0200
Received: from w1517.wlan.rz.tu-bs.de ([134.169.205.247] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LoGrx-00088C-Cy by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 14:45:42 +0200
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LoGrw-0002oN-Px
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 14:45:36 +0200
Date: Mon, 30 Mar 2009 14:45:36 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090330124536.GD10473@excalibur.local>
References: <20090329131749.GA350@excalibur.local> <gqnvos$4qb$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gqnvos$4qb$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [PATCH] connman: Package python test scripts into	connman-test-utils
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
X-List-Received-Date: Mon, 30 Mar 2009 12:47:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2009-03-29 at 16:14, Koen Kooi wrote:
> On 29-03-09 15:17, Stefan Schmidt wrote:
>>
>> I would like to get some feedback from other people using connman in OE. I did
>> the following to package the test scripts which enables you to install them as
>> separate package.
>
> The package is missing RDEPENDS on the necessary python interpreter and  
> modules.

Good point. That reminds me of some other recipes that lack such things. Will
have a look at them later.

I'm wondering how I should handle this case as connman itself does not RDEPEND
on python here. Is there a special trick for such FILE_${PN} packages and
RDEPENDS?

regards
Stefan Schmidt


