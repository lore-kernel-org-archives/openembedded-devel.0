Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Onusj-0004iX-6F
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 16:54:02 +0200
Received: (qmail 6984 invoked by uid 1003); 24 Aug 2010 14:53:07 -0000
Received: from pool-96-240-180-89.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.89)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Aug 2010 14:53:07 -0000
Message-ID: <4C73DCD2.4000004@balister.org>
Date: Tue, 24 Aug 2010 10:53:06 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C73D124.9080501@balister.org>
	<AANLkTim2em_n1V354oi5=5rqC2b7R+eb4P+QXHf17ao1@mail.gmail.com>
In-Reply-To: <AANLkTim2em_n1V354oi5=5rqC2b7R+eb4P+QXHf17ao1@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Has the file:// behavior changed in SRC_URI
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
X-List-Received-Date: Tue, 24 Aug 2010 14:54:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2010 10:37 AM, Chris Larson wrote:
> On Tue, Aug 24, 2010 at 7:03 AM, Philip Balister<philip@balister.org>wrote:
>
>> I know I used to be able to use a local directory with kernel source like
>> this:
>>
>> SRC_URI = "file:///home/balister/kernel_source"
>>
>> but now all that is copied to ${WORK} is an empty directory. This is with
>> bitbake 1.10.0.
>>
>> Any thoughts?
>
>
> Should work, if it doesn't its a bug in the metadata.  Are you using
> relatively recent OE, or a split off tree?  There was a fix that went into
> OE for do_unpack to obey either the 'path' *or* 'host' url components for
> file: uris, because which it goes in was changed in bitbake.

This is a recent metadata pull and the 1.10.0 tarball for bitbake.

Philip


