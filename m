Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1KMhd6-0008KL-MP
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jul 2008 13:08:04 +0200
Received: (qmail invoked by alias); 26 Jul 2008 11:06:38 -0000
Received: from BAA0a9b.baa.pppool.de (EHLO [192.168.178.33]) [77.128.10.155]
	by mail.gmx.net (mp019) with SMTP; 26 Jul 2008 13:06:38 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19uEO0rtWRumPvZr4Jf0YeDwDAOsP5hBErEWEQ3EM
	R7IrKlU1s8FyuG
Message-ID: <488B053D.2090005@gmx.de>
Date: Sat, 26 Jul 2008 13:06:37 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4889169C.7040108@gmx.de>	<1217065082.22069.111.camel@mill.internal.reciva.com>	<488AF2ED.2030709@gmx.de>
	<1217068829.5463.20.camel@dax.rpnet.com>
In-Reply-To: <1217068829.5463.20.camel@dax.rpnet.com>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 26 Jul 2008 11:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Sat, 2008-07-26 at 11:48 +0200, Thomas Kunze wrote:
>   
>> Phil Blundell wrote:
>>     
>>> On Fri, 2008-07-25 at 01:56 +0200, Thomas Kunze wrote:
>>>   
>>>       
>>>> +/dev/mmcblk0p1	b	6600	0	6	179	1	-	-	-
>>>>     
>>>>         
>>> Is that "6600" really correct?
>>>   
>>>       
>> Of course not. Just a typo.
>>     
>>> It does also seem bit odd having an mmc device in the "minimal" device
>>> table.  I can understand why you need it on collie but I am not sure it
>>> is all that desirable for device-table-minimal.txt to become the union
>>> of the devices that everybody needs on their favourite platform for
>>> booting purposes.  Since this is truly a machine specific thing I would
>>> be inclined to use a separate file, or a collie-specific catenation onto
>>> the installed copy.
>>>   
>>>       
>> I see your point. But OTOH we have 20 hda*, 9 serial consoles and 16 mtd
>> nodes in there. So its hardly minimal. In my opinion it doesn't hurt to add
>> a further node.
>>     
>
> As mentioned on irc, there is a more fundamental problem. The mmc block
> device number is assigned from the dynamic pool, not the static one. If
> you have any other device which uses a dynamic block number the file
> becomes incorrect. You therefore really have to create these nodes using
> udev/mdev or some custom script which finds the right value from sysfs.
>   
That's bad. Ok than its a bad idea to include this in the default device
table. Using sysdev would need
an extra C program as there is no regexpr support in klibc and hence no
sed/grep etc.
As I don't have any other devices enabled that use a dynamic block
number (Otherwise it wouldn't work ;),
I will create separate file for the mmc node for now.


