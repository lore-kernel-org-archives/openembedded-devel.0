Received: from smtplq-out5.aruba.it ([62.149.158.25] helo=smtplq04.aruba.it)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pierluigi.passaro@phoenixsoftware.it>)
	id 1P9QsU-0004SD-CK for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 01:18:27 +0200
Received: (qmail 32329 invoked by uid 89); 22 Oct 2010 21:31:07 -0000
Received: from unknown (HELO smtp1.aruba.it) (62.149.128.201)
	by smtplq04.aruba.it with SMTP; 22 Oct 2010 21:31:07 -0000
Received: (qmail 5086 invoked by uid 89); 22 Oct 2010 21:31:08 -0000
Received: from unknown (HELO ?192.168.8.32?)
	(pierluigi.passaro@phoenixsoftware.it@78.12.139.28)
	by smtp1.ad.aruba.it with SMTP; 22 Oct 2010 21:31:08 -0000
Message-ID: <4CC2029C.5070106@phoenixsoftware.it>
Date: Fri, 22 Oct 2010 23:31:08 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC0C67C.6060806@phoenixsoftware.it>
	<AANLkTi=ir567dGvzgOTgwvba3M0k1wyWmAJiwG4HNeJG@mail.gmail.com>
In-Reply-To: <AANLkTi=ir567dGvzgOTgwvba3M0k1wyWmAJiwG4HNeJG@mail.gmail.com>
X-SA-Exim-Connect-IP: 62.149.158.25
X-SA-Exim-Mail-From: pierluigi.passaro@phoenixsoftware.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl and libtool 2.4
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
X-List-Received-Date: Fri, 22 Oct 2010 23:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Thu, Oct 21, 2010 at 4:02 PM, Pierluigi Passaro
> <pierluigi.passaro@phoenixsoftware.it> wrote:
>   
>> Hi all,
>> LIBTOOL_HAS_SYSROOT feature has been recently enabled on Angstom 2010.x
>> distro.
>>
>> However, using CodeSourcery toolchain, this feature lead to use CSL sysroot
>> as search path, that is generally different from
>> ${STAGING_DIR_TARGET}${libdir} folder used for packages.
>>     
>
> hmmm yes I see the problem. Right now its left upto the compile to provide
> the sysroot which works well with internal toolchain but will not work with
> external toolchains or the compilers which dont support --print-sysroot option
>
> I will come up with a patch so specify the sysroot for libtool so that it
> does not rely upon the compiler to compute it.
>
>   
I'm not expert of libtool mechanisms but please let me know I can 
provide any support.
>> At present I worked around the problem with the attached patch, but I was
>> wondering if this could be a misconfiguration or a bug.
>>
>> Any suggestion will be appreciated.
>>
>>     
>
> With libtool 2.4 I dont see a reason to disable sysroot. The variable is only
> provided to keep libtool 2.2.6 functional as same time. So when using 2.4 please
> do not disable the sysroot feature.
>
>   
I agree with you, I will just keep the patch for personal use, until 
libtool will not rely on CSL compiler to compute sysroot.
>> Regards
>> Gigi
>>
>> --
>> Ing. Pierluigi Passaro
>> Viale Don Luigi Sturzo 34
>> 30174 Venezia Mestre
>> Cel: +39 348 355 4119
>> Tel: +39 041 862 3373
>> Fax: +39 041 862 3173
>> Web: www.phoenixsoftware.it
>> P.IVA 03884060272
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>     
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


