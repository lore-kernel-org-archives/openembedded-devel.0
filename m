Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53A696E890
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:04:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D348pk023268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:04:09 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 12 Feb 2014 19:03:59 -0800
Message-ID: <52FC361E.4030708@windriver.com>
Date: Thu, 13 Feb 2014 11:03:58 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
	<CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
In-Reply-To: <CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Thu, 13 Feb 2014 03:04:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/22/2014 10:21 PM, Otavio Salvador wrote:
> On Mon, Jan 20, 2014 at 10:52 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The $(subdirs) contains all the dirs under the ${B}, and this one:
>>
>> do_unpack[cleandirs] = "${S}/patches"
>>
>> will create a "patches" dir, then there will be compile errors, filter
>> out the patches will fix the problem.
>>
>> Note: poky doesn't have this problem since it separates the ${S} and
>> ${B}
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> Couldn't we change it for OE-Core as well? So we avoid having to patch
> the build system.
>

Hi Otavio,

I'm sorry, I don't quite understand what do you mean, this patch didn't
change the build system, it changed the Make.rules.

// Robert

