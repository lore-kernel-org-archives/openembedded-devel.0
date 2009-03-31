Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Loatd-0007Fs-Vz
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 12:08:42 +0200
Received: from w1405.wlan.rz.tu-bs.de ([134.169.205.135] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LoarT-0003hX-DF by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 12:06:29 +0200
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LoarS-0006ac-TR
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 12:06:26 +0200
Date: Tue, 31 Mar 2009 12:06:26 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090331100626.GA25328@excalibur.local>
References: <20090329131749.GA350@excalibur.local> <gqnvos$4qb$1@ger.gmane.org>
	<20090330124536.GD10473@excalibur.local>
	<gqqk8b$2eb$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gqqk8b$2eb$1@ger.gmane.org>
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
X-List-Received-Date: Tue, 31 Mar 2009 10:08:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2009-03-30 at 16:16, Koen Kooi wrote:
> On 30-03-09 14:45, Stefan Schmidt wrote:
>> Hello.
>>
>> On Sun, 2009-03-29 at 16:14, Koen Kooi wrote:
>>> On 29-03-09 15:17, Stefan Schmidt wrote:
>>>>
>>>> I would like to get some feedback from other people using connman in OE. I did
>>>> the following to package the test scripts which enables you to install them as
>>>> separate package.
>>>
>>> The package is missing RDEPENDS on the necessary python interpreter and
>>> modules.
>>
>> Good point. That reminds me of some other recipes that lack such things. Will
>> have a look at them later.
>>
>> I'm wondering how I should handle this case as connman itself does not RDEPEND
>> on python here. Is there a special trick for such FILE_${PN} packages and
>> RDEPENDS?
>
> Yes, overrides work on RDEPENDS as well, so RDEPENDS_${PN}-test-utils =  
> "python-core python-dbus python-b0rk" will work.

Cool. Another bit I did not know from OE so far. Will make the changes and
resend.

regards
Stefan Schmidt


