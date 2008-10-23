Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Kt4FD-0001UJ-0b
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 19:45:11 +0200
Received: from p5b0375ab.dip.t-dialin.net ([91.3.117.171]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kt4Ef-0003Ks-8B by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 19:44:39 +0200
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1Kt4Es-0003ky-Nu for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 19:44:51 +0200
Date: Thu, 23 Oct 2008 19:44:50 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081023174450.GB14304@dodger.lab.datenfreihafen.org>
References: <20081023124116.GA15082@datenfreihafen.org>
	<gdq4f3$sff$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gdq4f3$sff$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Pidgin needs to RDEPENDS on pidgin-data?
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
X-List-Received-Date: Thu, 23 Oct 2008 17:45:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2008-10-23 at 17:15, Koen Kooi wrote:
> On 23-10-2008 14:41, Stefan Schmidt wrote:
>>
>> diff --git a/packages/pidgin/pidgin.inc b/packages/pidgin/pidgin.inc
>> index db66d13..e3c35a7 100644
>> --- a/packages/pidgin/pidgin.inc
>> +++ b/packages/pidgin/pidgin.inc
>> @@ -44,7 +44,7 @@ FILES_finch-dbg     = "${bindir}/.debug/finch \
>>
>>   FILES_${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \
>>   	       ${datadir}/applications"
>> -RRECOMMENDS_${PN{ += "${PN}-data "
>
> Typo alert! it's ${PN} (note the closing bracket)

Darn, directly in front of my eyes and I missed it. Just pushed a fix for this.

>> +RDEPENDS_${PN{ += "${PN}-data "
>
> Another typo alert!

Sure, a stupid copy. :)

regards
Stefan Schmidt


