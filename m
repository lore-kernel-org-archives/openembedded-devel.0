Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Kt0fQ-0007pg-3X
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 15:56:00 +0200
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kt0eg-0005lP-VO by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 15:55:29 +0200
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Kt0eW-00052Y-8q
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 15:55:04 +0200
Date: Thu, 23 Oct 2008 15:55:04 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081023135504.GA16216@datenfreihafen.org>
References: <20081023124116.GA15082@datenfreihafen.org>
	<gdpu80$25g$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gdpu80$25g$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
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
X-List-Received-Date: Thu, 23 Oct 2008 13:56:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2008-10-23 at 15:29, Koen Kooi wrote:
> On 23-10-2008 14:41, Stefan Schmidt wrote:
>>
>> I have a user bug report here that pidgin segfaults without pidgin-data
>> installed:
>> http://trac.freesmartphone.org/ticket/170
>>
>> In pidgin.inc it only RRECOMMANDS pidgin-data, but not RDEPENDS on it.
>> Patch below is what I would push if nobody objects.
>
> That patch is no good. The real fix is to move the 2 files pidgin needs  
> from -data to the main package.

As you already know that two files are missing, can you name them so I can
cookup a patch?

> Also: if pidgin-data is not getting installed when installing pidgin  
> something is wrong with your feeds.

Hmm, It seems I need a better understanding then. From where comes the dep from
pidgin on pidgin-data? Do I miss some OE magic here?

Besides that it could good be that the feed is broken in that regard. Time to
fix it.

regards
Stefan Schmidt


