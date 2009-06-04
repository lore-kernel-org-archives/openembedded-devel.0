Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MC5pI-0000o5-4n
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 07:49:20 +0200
MIME-version: 1.0
Received: from [87.201.169.145] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKP00FFA9307V90@asmtp022.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	03 Jun 2009 22:40:16 -0700 (PDT)
Message-id: <E1863E56-343C-41E8-8E9E-2E911CD12F39@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <200906040644.46800.zecke@selfish.org>
Date: Thu, 04 Jun 2009 09:40:12 +0400
References: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
	<200906040644.46800.zecke@selfish.org>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: How to fix OE missing checksum error for some	rt2570-k2wrlz recipe
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
X-List-Received-Date: Thu, 04 Jun 2009 05:49:20 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Holger,
			Thanks for the tip.

Here is what I can see in my tmp/checksums.ini.

[http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz2 
]
md5=21f6e873ad7ee34843dbcd1204f9eda3
sha256=5b2d382504d0aee14cf24f0eb3c483a79c712f8aa1ca027a7d4425891f1bb2ec

I've added it to conf/checksums.ini

Best regards,

Elvis


On Jun 4, 2009, at 8:44 AM, Holger Freyther wrote:

> On Thursday 04 June 2009 06:36:35 Elvis Dowson wrote:
>> Hi,
>> 	I am getting a missing checksum error.
>>
>> NOTE: Running task 358 of 558 (ID: 2, /tool/overo-oe/user.collection/
>> recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb, do_fetch)
>> NOTE: Missing checksum
>> ERROR: rt2570-k2wrlz-1.6.4:
>> http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz2
>> has no entry in conf/checksums.ini, not checking URI
>> ERROR: Error in executing: /tool/overo-oe/user.collection/recipes/
>> rt2x00/rt2570-k2wrlz_1.6
>
> In your build directory you have tmp/checksums.ini, you can copy the  
> entry for
> rt... to conf/checksums.ini in the OE metadata... and obviously send  
> a patch
> if that makes sense.
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



