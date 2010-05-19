Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OElWP-0006na-7t
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 17:49:26 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 815DDF4C31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 11:45:25 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 19 May 2010 11:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=XLijtvBN951JxJesJDRmTFfmgmc=;
	b=uN17M7epdzc12kz43ZU3hb6H0WK6w38/3980R1OxNd8S7YUbUOm7mwfLszE7gr4I9/nO3WgAhTXxHS52CId+p3MCgeSz7TPKZutZK/Jj7PVWTZo20k8JWGbN1yDIWzMJzARnjtshbLSGLeW+RLsXWnjbLcrgO1aLlyNQsszTilk=
X-Sasl-enc: GLiXHC4J/pebalLf4xhHrbAg8H8P3Dbjvdf2JFdJoYkL 1274283925
Received: from [192.168.1.34] (hnvr-4d078ae5.pool.mediaWays.net [77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D64385746D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 11:45:24 -0400 (EDT)
Date: Wed, 19 May 2010 17:46:50 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<4BF3C9B8.8080501@mlbassoc.com>
	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Wed, 19 May 2010 15:49:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Wed, 19 May 2010, Vitus Jensen wrote:
> On Wed, 19 May 2010, Gary Thomas wrote:
>>  On 05/19/2010 03:38 AM, Vitus Jensen wrote:
>> > 
>> >   We noticed a strange problem with C++ code casting long long variables
>> >   to double, as a lot of qt-embedded code is doing.
>> > 
>> >   =================
>> >   double
>> >   convert(long long l)
>> >   {
>> >   return (double)l; // or double(l)
>> >   }
>> > 
>> >   int
>> >   main(int argc, char * argv[])
>> >   {
>> >   long long l = 10;
>> >   double f;
>> > 
>> >   f = convert(l);
>> >   printf("convert: %lld => %f\n", l, f);
>> >   return 0;
>> >   }
>> >   ====================
>> > 
>> >   output:
>> >   convert: 10 => 0.000000
>> > 
>> >   C++ compiled via powerpc-angstrom-linux-g++ gives the above result.
>> >   Compiling the same code as C using powerpc-angstrom-linux-gcc works
>> >   fine. But when looking at the assembler code both compiler produce
>> >   virtually identical output and both call __floatdidf to do the actual
>> >   conversion. Very strange, has anyone ever seen similar effects?
>>
>>  Is this from a recent tree (i.e. post Richard Purdie's restructuring)?
>>
>>  I've seen similar problems with C++ code on Poky which uses the same
>>  changes.
>
> No, I'm building everything from the stable branch.  There were some commits 
> cherry-picked from .dev but those only add Qt 4.5.2.
>
> Poky is ARM only, right?  Perhaps it would be helpfull to build a compiler 
> from .dev and for a widely used powerpc-platform?  How does n1200 sound? It 
> uses the same ppc603e.

Unfortunately .dev switched to gcc-4.3.3 in the meantime which fails for 
ppc603e platforms because of undefined references to __nldbl_fprintf and 
__nldbl_sprintf during compile.

Platform tqm8540 (ppce500, just to try some other ppc cpu) fails in 
gcc-4.3.3 compile, too.  Possible related to this:

endian.h:34:4: warning: #warning Cannot determine current byte order, 
assuming big-endian.

So currently .dev should be unbuildable for ppc users?  Without selecting 
a non-default compiler that is.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


