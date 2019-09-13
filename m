Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD246C3E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 14:49:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8DEnimK015858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2019 07:49:44 -0700 (PDT)
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 13 Sep 2019 07:49:43 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1568379265-22706-1-git-send-email-trevor.gamblin@windriver.com>
	<CAMKF1so4CM9VfcCK_1nnSTZM54n0PzD4_vWEkP_az-k3sDD=sg@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <1cdc82fc-c0e0-193d-008a-c6b264a8f28f@windriver.com>
Date: Fri, 13 Sep 2019 10:49:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so4CM9VfcCK_1nnSTZM54n0PzD4_vWEkP_az-k3sDD=sg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openjpeg: upgrade 2.3.0 -> 2.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 14:49:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/13/19 9:54 AM, Khem Raj wrote:
> On Fri, Sep 13, 2019 at 5:54 AM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Upgrading fixes CVE-2018-21010 and incorporates other bug fixes
>> from upstream.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb}    | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
>> similarity index 100%
>> rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
>> rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> a simple rename does not help since its uses a git based fetcher, I am
> sure it will have to also update SRCREV, otherwise effectively it
> builds 2.3.0 in guise of 2.3.1
>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
Thanks for catching that. v2 incoming.

