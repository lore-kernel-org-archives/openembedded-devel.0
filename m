Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Mgg9G-0003nN-4Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 16:40:22 +0200
Received: by ewy19 with SMTP id 19so1551761ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 07:22:16 -0700 (PDT)
Received: by 10.216.55.208 with SMTP id k58mr1811679wec.9.1251382936203;
	Thu, 27 Aug 2009 07:22:16 -0700 (PDT)
Received: from ?10.8.0.6? (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id g11sm629366gve.21.2009.08.27.07.22.14
	(version=SSLv3 cipher=RC4-MD5); Thu, 27 Aug 2009 07:22:15 -0700 (PDT)
Message-ID: <4A969697.60007@xora.org.uk>
Date: Thu, 27 Aug 2009 15:22:15 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>	<4A962EA9.8010908@xora.org.uk>	<1251357326.4215.577.camel@lenovo.internal.reciva.com>	<1251372751.3420.30.camel@hammer.suse.cz>	<1251379478.27780.31.camel@mill.internal.reciva.com>	<1251381366.25803.12.camel@hammer.suse.cz>
	<1251382193.27780.49.camel@mill.internal.reciva.com>
In-Reply-To: <1251382193.27780.49.camel@mill.internal.reciva.com>
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install	ld.so.conf, so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 14:40:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Thu, 2009-08-27 at 15:56 +0200, Stanislav Brabec wrote:
>   
>> Phil Blundell wrote:
>>     
>>> On the other hand, if you find yourself obliged to spread the libraries
>>> across many directories, and/or if you plan to use hwcap-based
>>> searching, installing ldconfig might indeed be a net win.  If you're
>>> seeing 15 path lookups for each library load then it sounds like your
>>> system falls into this category.
>>>       
>> No, it is not my case. My image is just a plain angstrom-2008.1. These
>> 15 directories don't exist. With ld.so.cache I don't see these lookups.
>>
>> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
>> open("/var/run/ld.so.cache", O_RDONLY)  = -1 ENOENT (No such file or directory)
>> open("/lib/tls/v5l/fast-mult/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
>> stat64("/lib/tls/v5l/fast-mult/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)
>>     
>
> Right, so it appears that your distro is indeed using hwcap-based
> library searches; as I said above, this is one of the situations where
> ldconfig is a benefit.
>   
That would be an accidental Angstrom regression then! Ooops!

Graeme



