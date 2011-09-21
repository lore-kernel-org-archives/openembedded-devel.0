Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1R6Ogm-0002qR-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 17:26:20 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 597571660383; Wed, 21 Sep 2011 09:21:03 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 14B07166025C;
	Wed, 21 Sep 2011 09:21:02 -0600 (MDT)
Message-ID: <4E7A00DD.3070606@mlbassoc.com>
Date: Wed, 21 Sep 2011 09:21:01 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316615869.54346.YahooMailNeo@web121504.mail.ne1.yahoo.com>
	<4E79FD0C.4010502@mlbassoc.com> <4E79FD5B.3030303@slimlogic.co.uk>
In-Reply-To: <4E79FD5B.3030303@slimlogic.co.uk>
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Wed, 21 Sep 2011 15:26:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-09-21 09:06, Graeme Gregory wrote:
> On 21/09/11 16:04, Gary Thomas wrote:
>> On 2011-09-21 08:37, ibrahim demir wrote:
>>> Dear developers,
>>>
>>>
>>> i have a problem at installing ti codec engine: http://pastebin.com/uU7etDYs . i downloaded ti_cgt_c6000_6.1.17_setup_linux_x86.bin and generated it's md5.
>>>
>>> in recipes/ti/...6.1.17.bb says md5 is : 41ee41cc74800b06705804f7ef901447. But when i calculate its md5, i get this: 5ee5c8e573ab0a1ba1249511d4a06c27. I download again and again
>>> but the result of md5 was the same. Then i changed bb file to 5ee5c8e573ab0a1ba1249511d4a06c27. and run bitbake ti-codec-engine, but the result was: http://pastebin.com/1SCrtWvQ
>>>
>>> so in this case what is my problem, what should i do?
>>
>> Your download is damaged. How did you download it? Make sure you download
>> files in binary mode only. Your file should match this:
>> $ md5sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>> 41ee41cc74800b06705804f7ef901447 ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>> $ ls -l ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>> -rw-rw-r-- 1 gthomas gthomas 77374699 Mar 3 2011 ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>>
> I dont think his download is damaged, I tested my download and my md5sum matches his.

The last error posted implies that it is - that binary file is a self-unpacking
glob which is failing it's internal checksum.

Did you try to run what you downloaded?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


