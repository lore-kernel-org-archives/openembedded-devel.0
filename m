Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1KMgPU-0001n9-OO
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jul 2008 11:49:56 +0200
Received: (qmail invoked by alias); 26 Jul 2008 09:48:31 -0000
Received: from BAA0a9b.baa.pppool.de (EHLO [192.168.178.36]) [77.128.10.155]
	by mail.gmx.net (mp024) with SMTP; 26 Jul 2008 11:48:31 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19c7oBQ2m5cGp4mly5BlSlyg48GMU0EuTuNrzeTp9
	fEyRf2qmj0Aemp
Message-ID: <488AF2ED.2030709@gmx.de>
Date: Sat, 26 Jul 2008 11:48:29 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4889169C.7040108@gmx.de>
	<1217065082.22069.111.camel@mill.internal.reciva.com>
In-Reply-To: <1217065082.22069.111.camel@mill.internal.reciva.com>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
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
X-List-Received-Date: Sat, 26 Jul 2008 09:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Fri, 2008-07-25 at 01:56 +0200, Thomas Kunze wrote:
>   
>> +/dev/mmcblk0p1	b	6600	0	6	179	1	-	-	-
>>     
>
> Is that "6600" really correct?
>   
Of course not. Just a typo.
> It does also seem bit odd having an mmc device in the "minimal" device
> table.  I can understand why you need it on collie but I am not sure it
> is all that desirable for device-table-minimal.txt to become the union
> of the devices that everybody needs on their favourite platform for
> booting purposes.  Since this is truly a machine specific thing I would
> be inclined to use a separate file, or a collie-specific catenation onto
> the installed copy.
>   
I see your point. But OTOH we have 20 hda*, 9 serial consoles and 16 mtd
nodes in there. So its hardly minimal. In my opinion it doesn't hurt to add
a further node.


