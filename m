Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1PNl6K-0007Pf-9p
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 12:43:57 +0100
Received: from [192.168.1.128] (95-90-74-25-dynip.superkabel.de [95.90.74.25])
	by dd20204.kasserver.com (Postfix) with ESMTP id 543CD1805BA39
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 12:42:20 +0100 (CET)
Message-ID: <4CF6346B.2060407@opensimpad.org>
Date: Wed, 01 Dec 2010 12:41:31 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>	<ico56o$f8$2@dough.gmane.org>	<20101127140200.GH10755@ibawizard.net>	<AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
	<AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>
In-Reply-To: <AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Wed, 01 Dec 2010 11:43:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.2010 15:27, Andrea Adami wrote:
> On Sat, Nov 27, 2010 at 3:13 PM, Andrea Adami<andrea.adami@gmail.com>  =
wrote:
>   =20
>> Ok, then I suggest to stay with 0.9.30.2 and add the two hacks documen=
ted here:
>>
>> 1) replacing log2f(i) with logf(i)/logf(2)
>> http://www.mail-archive.com/uclibc@uclibc.org/msg04949.html
>>     =20
> Patch courtesy of Bernhard Guillon already done (bad that OE Patchwork
> is down...)
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November/0=
27326.html
>
>   =20
>> 2) '--disable-tls' for e2fsprogs
>> http://patchwork.openembedded.org/patch/2069/
>>
>>     =20
> Here the patch is trivial...my concern is both should be Angstrom-only,=
 isn't?
>
>   =20

This is true. We could add some python foo and check for angstrom? In my =

opinion the log2f patch is of no real harm. The tls support might be a=20
problem.

Best regrads
Bernhard Guillon



