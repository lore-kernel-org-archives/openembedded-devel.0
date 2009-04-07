Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrHSO-0002wi-Pc
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 22:01:37 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090407195639.JJIE6112.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 15:56:39 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id cjwf1b00N4dMFYL04jwfgQ; Tue, 07 Apr 2009 15:56:40 -0400
X-Authority-Analysis: v=1.0 c=1 a=c7uaSC4PyioA:10 a=GSOq1Z3Aw2sA:10
	a=4HC8UZe3aWX9X6VriVsA:9 a=nqalhdpQJ7RW8NUW12L3zPcGOQUA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 12:56:39 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407195639.GI2195@smtp.west.cox.net>
References: <1237835454.6521.9.camel@northpole> <grg0jf$sem$1@ger.gmane.org>
	<49DB935B.3000907@2mi.com.br>
	<20090407183328.GH2195@smtp.west.cox.net>
	<49DBA326.4060401@2mi.com.br>
MIME-Version: 1.0
In-Reply-To: <49DBA326.4060401@2mi.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.44
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml2-native build against host zlib.h
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
X-List-Received-Date: Tue, 07 Apr 2009 20:02:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 04:01:58PM -0300, Jader H. Silva wrote:
> Tom Rini escreveu:
>> On Tue, Apr 07, 2009 at 02:54:35PM -0300, Jader H. Silva wrote:
>>   
>>> Koen Kooi escreveu:
>>>     
>>>> On 23-03-09 20:10, Jader H. Silva wrote:
>>>>       
>>>>>     It seems libxml2-native is built using host zlib.h.
>>>>>     My host have a symbol redefinition in zlib.h (gzopen ->    
>>>>> gzopen64), but
>>>>>     that symbol does not exists in OE compiled library.
>>>>>     Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
>>>>>     solved it. There's a patch attached.
>>>>>         
>>>> The patch seems to solve the problem, could you resend a version 
>>>> that  bumps the PR as well? Once this in .dev we should apply it to 
>>>>  stable/2008 as well.
>>>>
>>>> regards,
>>>>
>>>> Koen
>>>>       
>>> Patch with compilation fix and PR update is attached.
>>>     
>>
>> As Khem pointed out previously, this is not correct, NACK.  From the
>> configure script --help:
>>   --with-zlib[=DIR]       use libz in DIR
>> So this should be adding '--with-zlib=${STAGING_INCIR}'
>>
>>   
> --with-zlib=${STAGING_INCDIR} don't fix it.

That's odd.  Reading libxml2-native-2.7.2-r2/libxml2-2.7.2/configure I
don't see how that value being a file and not a dir could work.  In
fact, moving my system zlib.h out of the way and reading config.log I
see things like:
configure:12246: checking zlib.h usability
configure:12263: gcc -c
-isystem/home/trini/work/OE-upstream/tmp.4.3.3/staging/x86_64-linux/usr/include
-O2
-isystem/home/trini/work/OE-upstream/tmp.4.3.3/staging/x86_64-linux/usr/include
conftest.c >&5
configure:12269: $? = 0
configure:12283: result: yes
configure:12287: checking zlib.h presence
configure:12302: gcc -E
-isystem/home/trini/work/OE-upstream/tmp.4.3.3/staging/x86_64-linux/usr/include
conftest.c
configure:12308: $? = 0
configure:12322: result: yes
configure:12350: checking for zlib.h
configure:12358: result: yes

Can you tell us more about what host system you're using and possibly
just as importantly what config.log looks like when you use your patch?
I'm not saying you don't have a failure, I'm just saying it's puzzling
that your patch works.

Also, trying to figure out when zlib-native gets pulled in and I see
it's coming from file-native, so perhaps we should, while we're in here
anyhow, add zlib-native to the dep list for libxml2-native?

-- 
Tom Rini


