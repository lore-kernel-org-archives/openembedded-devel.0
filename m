Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PAmPE-0004RX-31
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 18:29:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 95F7D66C2F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 12:29:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12157-04 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 26 Oct 2010 12:29:05 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 64AAC579CD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 12:29:05 -0400 (EDT)
Message-ID: <4CC701D0.5070702@cbnco.com>
Date: Tue, 26 Oct 2010 12:29:04 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC6F440.10509@opendreambox.org>
	<4CC6F818.5010105@opendreambox.org>
In-Reply-To: <4CC6F818.5010105@opendreambox.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 26 Oct 2010 16:29:49 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:
> On 10/26/2010 05:31 PM, Andreas Oberritter wrote:
>> How about splitting it into 5 patches?
>>
>> - classes (7 files)
>> - contrib (4 files)
>> - recipes/*/*.bb (24 files)
>> - recipes/*/*.inc (14 files)
>> - other files in recipes except recipes/obsolete (11 files)
> 
> Or how about those 37 patches?
> 
> http://git.opendreambox.org/?p=obi/openembedded.git;a=shortlog;h=refs/heads/equality-operator
> 
> Rationale:
> - bbclasses: 1 patch per file
> - contrib and recipes: 1 patch per directory

For the series:

Acked-By: Michael Smith <msmith@cbnco.com>

Except this one:

http://git.opendreambox.org/?p=obi/openembedded.git;a=commitdiff;h=ad7b2c9ab0c305034c39d2efc5a52789965bb5c2

where some lines had == twice, looks like your sed may not have caught it.



BTW, some of the files have constructs like this:

if [ "x$HAS_MADWIFI" = "x1" ]

I think this "x" business is for old broken shells that can't handle an 
empty quoted string as the first argument. Does anyone know the standard 
well enough to say? I figure [ "" = "1" ] should be legal everywhere. 
This is just a pet peeve/bike shed on my part.

Mike


