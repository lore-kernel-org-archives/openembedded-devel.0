Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PLaUF-0001VM-SX
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 13:00:14 +0100
Received: from [192.168.0.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 7E05B1B40D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 12:59:43 +0100 (CET)
Message-ID: <4CEE4F61.3060401@sensortherm.de>
Date: Thu, 25 Nov 2010 12:58:25 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CEC1E17.1030208@sensortherm.de>
	<AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
In-Reply-To: <AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: I've downloaded oe
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
X-List-Received-Date: Thu, 25 Nov 2010 12:00:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 23.11.2010 21:19, schrieb Khem Raj:
> On Tue, Nov 23, 2010 at 12:03 PM, Klaus Schwarzkopf
> <schwarzkopf@sensortherm.de>  wrote:
>> Hi,
>>
>> i've downloaded oe with this script (thanks frans):
>>
>> #!/bin/sh
>>
>> export OE=/home/klaus/development/oe/
>> export BBPATH=${OE}build:${OE}openembedded
>> export PATH=${OE}bitbake/bin:${PATH}
>> export MACHINE=dm355-evm
>>
>> RECIPES="${OE}/openembedded/recipes"
>> LOGFILE="fetchsrc.log"
>>
>> #Find recipes how changed this week
>> #FIND_OPTIONS="-atime 7"
>>
>> for i in $(find ${RECIPES} -name '*.bb' -type f ${FIND_OPTIONS} | sort )
>> do
>>         echo $i
>>         bitbake -c fetch -b $i
>> done>  ${LOGFILE} 2>&1
>>
>> egrep -n 'ERROR.*bb..failed' ${LOGFILE}
>> egrep -n 'KeyError' ${LOGFILE}
>>
>>
>>
>>
>>
>> I found a lot of errors, see attachment! The whole logfile is on my
>> homepage:
>> http://fbi.hooster.de/download/sonstiges/oe/fetchsrc.log.tar.gz
>>
>> How can i/we fix this errors?
>>
>
> You should ignore nonworking and obsolete dirs and some errors are due
> to hh.org going AWOL too
>


egrep -n 'ERROR.*bb..failed' fetchsrc.log | egrep -v 'nonworking' | 
egrep -v 'obsolete' | wc -l
434

egrep -n 'ERROR.*bb..failed' fetchsrc.log | egrep -v 'nonworking' | 
egrep -v 'obsolete' | egrep -v 'opie.*cvs' | wc -l
253


I know, that the opie recipes missing the cvs server on hh.org.

What is the best way to fix the missing download files?
Move the recipes to nonworking directory?
Find the missing files in the internet and upload the files to 
sources.openembedded.org?

A combination: If we could not find the files, move the recipes to 
nonworking.

Greetings

Klaus







