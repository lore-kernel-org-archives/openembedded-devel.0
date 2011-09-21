Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1R6OY2-0002d8-JE
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 17:17:18 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id 9568413005C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 16:06:04 +0100 (BST)
Message-ID: <4E79FD5B.3030303@slimlogic.co.uk>
Date: Wed, 21 Sep 2011 16:06:03 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316615869.54346.YahooMailNeo@web121504.mail.ne1.yahoo.com>
	<4E79FD0C.4010502@mlbassoc.com>
In-Reply-To: <4E79FD0C.4010502@mlbassoc.com>
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
X-List-Received-Date: Wed, 21 Sep 2011 15:17:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/11 16:04, Gary Thomas wrote:
> On 2011-09-21 08:37, ibrahim demir wrote:
>> Dear developers,
>>
>>
>> i have a problem at installing ti codec engine: 
>> http://pastebin.com/uU7etDYs . i downloaded 
>> ti_cgt_c6000_6.1.17_setup_linux_x86.bin and generated it's md5.
>>
>> in recipes/ti/...6.1.17.bb says md5 is : 
>> 41ee41cc74800b06705804f7ef901447. But when i calculate its md5, i get 
>> this: 5ee5c8e573ab0a1ba1249511d4a06c27. I download again and again 
>> but the result of md5 was the same. Then i changed bb file to 
>> 5ee5c8e573ab0a1ba1249511d4a06c27. and run bitbake ti-codec-engine, 
>> but the result was: http://pastebin.com/1SCrtWvQ
>>
>> so in this case what is my problem, what should i do?
>
> Your download is damaged.  How did you download it?  Make sure you 
> download
> files in binary mode only.  Your file should match this:
>   $ md5sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>   41ee41cc74800b06705804f7ef901447  
> ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>   $ ls -l ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>   -rw-rw-r-- 1 gthomas gthomas 77374699 Mar  3  2011 
> ti_cgt_c6000_6.1.17_setup_linux_x86.bin
>
I dont think his download is damaged, I tested my download and my md5sum 
matches his.

Graeme



