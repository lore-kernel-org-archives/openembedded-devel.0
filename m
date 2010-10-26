Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAt4v-0006Xo-WA
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 01:37:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 64E99314A2E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 01:36:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id w1Xut8TGQMFo
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 01:36:26 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id E0B41314A272
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 01:36:25 +0200 (CEST)
Message-ID: <4CC765F9.4090005@opendreambox.org>
Date: Wed, 27 Oct 2010 01:36:25 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC6F440.10509@opendreambox.org>	<4CC6F818.5010105@opendreambox.org>
	<4CC701D0.5070702@cbnco.com>
In-Reply-To: <4CC701D0.5070702@cbnco.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Tue, 26 Oct 2010 23:37:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/26/2010 06:29 PM, Michael Smith wrote:
> Andreas Oberritter wrote:
>> On 10/26/2010 05:31 PM, Andreas Oberritter wrote:
>>> How about splitting it into 5 patches?
>>>
>>> - classes (7 files)
>>> - contrib (4 files)
>>> - recipes/*/*.bb (24 files)
>>> - recipes/*/*.inc (14 files)
>>> - other files in recipes except recipes/obsolete (11 files)
>>
>> Or how about those 37 patches?
>>
>> http://git.opendreambox.org/?p=obi/openembedded.git;a=shortlog;h=refs/heads/equality-operator
>>
>>
>> Rationale:
>> - bbclasses: 1 patch per file
>> - contrib and recipes: 1 patch per directory
> 
> For the series:
> 
> Acked-By: Michael Smith <msmith@cbnco.com>
> 
> Except this one:
> 
> http://git.opendreambox.org/?p=obi/openembedded.git;a=commitdiff;h=ad7b2c9ab0c305034c39d2efc5a52789965bb5c2
> 
> 
> where some lines had == twice, looks like your sed may not have caught it.

Thanks for spotting! I've updated the patch series and added your ack.

> BTW, some of the files have constructs like this:
> 
> if [ "x$HAS_MADWIFI" = "x1" ]
> 
> I think this "x" business is for old broken shells that can't handle an
> empty quoted string as the first argument. Does anyone know the standard
> well enough to say? I figure [ "" = "1" ] should be legal everywhere.
> This is just a pet peeve/bike shed on my part.

Autotools use constructs like that everywhere, so it's likely increasing
portability while decreasing readability.

A random forum post suggests that some versions of '[' have problems, if
the first operand equals '!' or '(' [1].

It's not easy to search for [ or test or x on google. ;-)

Regards,
Andreas

[1]
http://www.techtalkz.com/unix/78138-testing-equality-bash-scripts.html#post329122


