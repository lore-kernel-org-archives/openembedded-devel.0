Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACCB65D1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 03:05:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L35eQi003372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Apr 2014 20:05:40 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 20 Apr 2014 20:05:40 -0700
Message-ID: <53548B00.5000700@windriver.com>
Date: Mon, 21 Apr 2014 11:05:36 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>	<CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>	<1791318.0sP5eWebrA@peggleto-mobl5.ger.corp.intel.com>	<CANx9H-DrUWLKp95ouOZZThCTqdgmdFHdD5aoXA4E3ZHsK9Wdyg@mail.gmail.com>	<53547FB6.5040609@windriver.com>
	<CANx9H-CNfFvLaedkKvBug+YO1uKrcuvEOPfTGLfhfe5wBCidLA@mail.gmail.com>
In-Reply-To: <CANx9H-CNfFvLaedkKvBug+YO1uKrcuvEOPfTGLfhfe5wBCidLA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-perl][PATCH v2 01/10] libmodule-metadata-perl: add 1.000019
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Apr 2014 03:05:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2014 11:01 AM, Tim Orling wrote:
> On Sun, Apr 20, 2014 at 7:17 PM, Hongxu Jia <hongxu.jia@windriver.com>wrote:
>
>> On 04/21/2014 04:19 AM, Tim Orling wrote:
>>
>>> (1) I am thinking about dropping this patch. perl-native provides
>>> Module::Metadata 1.00004, so if subsequent packages are being
>>> cross-compiled I have not yet proven there is a need for the updated
>>> v1.000019 provided here.
>>>
>>> (2) The question is, if one wanted to build subsequent packages in-situ,
>>> how to provide Module::Metadata 1.00004 on a target system, since it is
>>> only provided by perl-native?
>>>
>> It is also provided by perl, for target.
>>
>> //Hongxu
>>
>>
> I am not seeing it. Am I missing something?


Hi Tim,

I am afraid Module::Metadataj is not in perl by default, you need
to tweak poky/meta/recipes-devtools/perl/perl_5.14.3.bb, to create
a new package for Module::Metadata, you could reference what
'perl-module-cpan' did, such as:
...
PACKAGES += "perl-module-metadata"
FILES_perl-module-metadata += ">>the files you need<<"
...

And add 'perl-module-metadata' to your recipes's RDEPENDS.

//Hongxu

>
> root@beaglebone:~# perl -mModule::Metadata
>
> Can't locate Module/Metadata.pm in @INC (@INC contains: /etc/perl
> /usr/lib/perl/site_perl/5.14.3/ /usr/lib/perl/site_perl/5.14.3
> /usr/lib/perl/vendor_perl/5.14.3/ /usr/lib/perl/vendor_perl/5.14.3
> /usr/lib/perl/5.14.3/ /usr/lib/perl/5.14.3 /usr/local/lib/site_perl
> /usr/lib/perl/5.14.3 .).
>
> BEGIN failed--compilation aborted.
>
>>> --Tim
>>> --
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


