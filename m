Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqnMw-0001x2-PG
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 13:56:39 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 12DCC24386
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 13:53:33 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuwSAJJ4nEtT4zvyPGdsb2JhbAAHmnMBAQEBN7YehHsEhhc
X-IronPort-AV: E=Sophos;i="4.49,638,1262559600"; d="scan'208";a="49933766"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 14 Mar 2010 13:53:33 +0100
Message-ID: <4B9CDC4C.9000300@atmel.com>
Date: Sun, 14 Mar 2010 13:53:32 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>	<hnfpdp$mg6$1@dough.gmane.org>	<4B9B8207.1040909@atmel.com>
	<hnilir$gqr$1@dough.gmane.org>
In-Reply-To: <hnilir$gqr$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 62.127.194.21
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] multimedia:;Add media contents to rootfs
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
X-List-Received-Date: Sun, 14 Mar 2010 12:56:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 13-03-10 13:16, Ulf Samuelsson wrote:
>> Koen Kooi skrev:
>>> On 12-03-10 22:39, Ulf Samuelsson wrote:
>>>> This package will copy the contents of "multimedia.tar.bz2."
>>>> (Note the dot at the end) to the "/home/root/multimedia" directory
>>>> in the target. By replacing the empty default file, you
>>>> can add your own multimedia files for testing.
>>>> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
>>>
>>> NAK. Package never never touch $HOME, if you want things installed into
>>> $HOME, look into /etc/skel.
>>>
>> The purpose is not to have a "multimedia" directory in each home
>> so I dont think "/etc/skel" is applicable.
> 
>> The purpose of this package is to be able to easily load some
>> jpeg pictures, movies, mp3 files into the root file system
>> when you build a demo.
> 
> Like
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=6a6d6bab519aefb44e3d49d305134057adf7539e
> does?

Yes, except that this is hardwired to a certain movie, and this patch
will allow you to load your own content.

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



