Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CECBE6FE3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:16:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8BFGire026126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Sep 2014 08:16:44 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 11 Sep 2014 08:16:44 -0700
Message-ID: <5411BCDB.7040500@windriver.com>
Date: Thu, 11 Sep 2014 23:16:43 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1410274929-16519-1-git-send-email-liezhi.yang@windriver.com>
	<2640190.uKkUWoK2di@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2640190.uKkUWoK2di@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl] [PATCH] meta-perl: fix for eglibc-gconvs
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
X-List-Received-Date: Thu, 11 Sep 2014 15:16:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/11/2014 11:03 PM, Paul Eggleton wrote:
> Hi Robert,
>
> On Tuesday 09 September 2014 08:02:09 Robert Yang wrote:
>> There is no eglibc-gconvs now, but glibc-gconvs.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-perl/libnet/libnet-libidn-perl_0.12.bb |    4 ++--
>>   .../recipes-perl/libtext/libtext-iconv-perl_1.7.bb |    2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
>> b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb index
>> 42b213d..f896d11 100644
>> --- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
>> +++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
>> @@ -8,9 +8,9 @@ SECTION = "libs"
>>   LICENSE = "Artistic-1.0 | GPLv1+"
>>   HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
>>   DEPENDS += "libidn"
>> -# We must need eglibc-gconvs to enable charset related functions,
>> +# We must need glibc-gconv to enable charset related functions,
>>   # such as Net::LibIDN::idn_to_ascii().
>> -RDEPENDS_${PN} += "eglibc-gconvs"
>> +RDEPENDS_${PN} += "glibc-gconv"
>
> Ah, should that be glibc-gconvs?

Yes, I think so, sorry, I was confused by glibc-gconv and glibc-gconvs,
will send a V2 tomorrow.

// Robert

>
> Cheers,
> Paul
>

