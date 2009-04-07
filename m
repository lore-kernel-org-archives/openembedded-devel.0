Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LrGbd-00059h-1b
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 21:05:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 33D8E5010901
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 16:09:22 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxzCJOT-uD6p
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 16:09:17 -0300 (BRT)
Received: from [192.168.15.105] (unknown [189.102.204.146])
	by mail.2mi.com.br (Postfix) with ESMTP id 4060750277F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 16:09:17 -0300 (BRT)
Message-ID: <49DBA326.4060401@2mi.com.br>
Date: Tue, 07 Apr 2009 16:01:58 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1237835454.6521.9.camel@northpole>
	<grg0jf$sem$1@ger.gmane.org>	<49DB935B.3000907@2mi.com.br>
	<20090407183328.GH2195@smtp.west.cox.net>
In-Reply-To: <20090407183328.GH2195@smtp.west.cox.net>
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
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
X-List-Received-Date: Tue, 07 Apr 2009 19:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini escreveu:
> On Tue, Apr 07, 2009 at 02:54:35PM -0300, Jader H. Silva wrote:
>   
>> Koen Kooi escreveu:
>>     
>>> On 23-03-09 20:10, Jader H. Silva wrote:
>>>       
>>>>     It seems libxml2-native is built using host zlib.h.
>>>>     My host have a symbol redefinition in zlib.h (gzopen ->   
>>>> gzopen64), but
>>>>     that symbol does not exists in OE compiled library.
>>>>     Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
>>>>     solved it. There's a patch attached.
>>>>         
>>> The patch seems to solve the problem, could you resend a version that  
>>> bumps the PR as well? Once this in .dev we should apply it to  
>>> stable/2008 as well.
>>>
>>> regards,
>>>
>>> Koen
>>>       
>> Patch with compilation fix and PR update is attached.
>>     
>
> As Khem pointed out previously, this is not correct, NACK.  From the
> configure script --help:
>   --with-zlib[=DIR]       use libz in DIR
> So this should be adding '--with-zlib=${STAGING_INCIR}'
>
>   
--with-zlib=${STAGING_INCDIR} don't fix it.


