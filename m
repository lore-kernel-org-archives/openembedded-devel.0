Received: from qmta13.emeryville.ca.mail.comcast.net ([76.96.27.243])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Nl6bZ-0002SJ-DN
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 21:16:14 +0100
Received: from omta22.emeryville.ca.mail.comcast.net ([76.96.30.89])
	by qmta13.emeryville.ca.mail.comcast.net with comcast
	id mic81d0061vN32cADkCLKt; Fri, 26 Feb 2010 20:12:20 +0000
Received: from [192.168.1.101] ([173.13.189.149])
	by omta22.emeryville.ca.mail.comcast.net with comcast
	id mkEv1d0083DqXwV8ikEvsH; Fri, 26 Feb 2010 20:14:56 +0000
Message-ID: <4B882B15.60902@comcast.net>
Date: Fri, 26 Feb 2010 12:12:05 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1266176499.12424.6.camel@ed-hp-laptop>
	<20100226195002.GC25079@gmail.com>
In-Reply-To: <20100226195002.GC25079@gmail.com>
X-SA-Exim-Connect-IP: 76.96.27.243
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: shared-mime-info-native-0.51 do_compile failure
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
X-List-Received-Date: Fri, 26 Feb 2010 20:16:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (14/02/10 11:41), ed wrote:
>   
>> Trying to build image for mini2440 and get the following error.
>>     
>  ==============================
>   
>> Says it has undefined gzopen64
>> But gzopen64 is apparently there.
>> ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: strings
>> libxml2.so |grep gzopen64
>> gzopen64
>> ed ~/mini2440/OE/build/tmp/staging/i686-linux/usr/lib:$: objdump -T
>> libxml2.so |grep gzopen64
>> 00000000      DF *UND*	00000000              gzopen64
>>
>>
>> Any ideas?  
>>     
>
> It must be using libxml from host and libz from your native staging. 
> So either use both from host or both from staging. Mixing can cause this
> problem.
>
> Do you have any of zlib-native or libxml2-native in your local.conf as
> ASSUME_PROVIDED ?
>
>   
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>     
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   
I ended up modifying  libxml12-native.inc file and added 
--with-zlib=${STAGING_INCDIR}/zlib.h to EXTRA_OECONF.
Looked at your email response to Cliff Brake "gettext native failure" on 
2/23/2010.
Not sure if this was the correct way to fix it but it solved my problem.

Thanks
Ed


