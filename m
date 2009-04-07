Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrG9t-0004eC-M7
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 20:37:45 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090407183329.VYCV15318.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Apr 2009 14:33:29 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id ciZV1b0054dMFYL03iZV1u; Tue, 07 Apr 2009 14:33:29 -0400
X-Authority-Analysis: v=1.0 c=1 a=c7uaSC4PyioA:10 a=GSOq1Z3Aw2sA:10
	a=U36MuLmLgZ6lsc2nVkoA:9 a=dKfOASi8C_tzzqUMmo8O6P-J1ncA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 7 Apr 2009 11:33:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090407183328.GH2195@smtp.west.cox.net>
References: <1237835454.6521.9.camel@northpole> <grg0jf$sem$1@ger.gmane.org>
	<49DB935B.3000907@2mi.com.br>
MIME-Version: 1.0
In-Reply-To: <49DB935B.3000907@2mi.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.41
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
X-List-Received-Date: Tue, 07 Apr 2009 18:38:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2009 at 02:54:35PM -0300, Jader H. Silva wrote:
> Koen Kooi escreveu:
>> On 23-03-09 20:10, Jader H. Silva wrote:
>>>     It seems libxml2-native is built using host zlib.h.
>>>     My host have a symbol redefinition in zlib.h (gzopen ->   
>>> gzopen64), but
>>>     that symbol does not exists in OE compiled library.
>>>     Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
>>>     solved it. There's a patch attached.
>>
>> The patch seems to solve the problem, could you resend a version that  
>> bumps the PR as well? Once this in .dev we should apply it to  
>> stable/2008 as well.
>>
>> regards,
>>
>> Koen
> Patch with compilation fix and PR update is attached.

As Khem pointed out previously, this is not correct, NACK.  From the
configure script --help:
  --with-zlib[=DIR]       use libz in DIR
So this should be adding '--with-zlib=${STAGING_INCIR}'

-- 
Tom Rini


