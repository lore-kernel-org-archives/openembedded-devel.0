Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDA1065CD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 12:14:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8OCDwCS029229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 05:13:58 -0700 (PDT)
Received: from server.local (128.224.20.249) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 05:13:57 -0700
Message-ID: <5422B583.1010905@windriver.com>
Date: Wed, 24 Sep 2014 08:13:55 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1411537323-29871-1-git-send-email-rongqing.li@windriver.com>
	<lvto7r$7em$1@ger.gmane.org> <542274B2.7080300@windriver.com>
	<54227A95.2050700@windriver.com>
In-Reply-To: <54227A95.2050700@windriver.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] iscsi-initiator-utils: add recipe file
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
X-List-Received-Date: Wed, 24 Sep 2014 12:14:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-24, 4:02 AM, Rongqing Li wrote:
>
>
> On 09/24/2014 03:37 PM, Rongqing Li wrote:
>>
>> I see there are two recipes for iscsi under meta-cloud-service,
>> one is called iscsi-initiator-utils, other is called open-iscsi.
>> and open-iscsi provides the systemd support and kernel modules,
>> so I will copy open-iscsi into meta-oe/meta-oe.
>>
>>
>
>
> Giveup to use open-iscsi, and continue to use  iscsi-initiator-utils ,
> since open-iscsi-kernel can not pass compile.

And FWIW, I'm going to continue to carry my own version in 
meta-cloud-services.

We are heavily version dependent on all the components in the cloud
space, so we can't follow the cadence of pretty much any other layer.

Out of curiosity, if you need it .. why not just use it out of
meta-cloud-services ?

Bruce

>
>
> -R
>> -Roy
>>
>>
>>
>>
>> On 09/24/2014 02:27 PM, Koen Kooi wrote:
>>> rongqing.li@windriver.com  schreef op 24-09-14 07:42:
>>>> >From: Roy Li<rongqing.li@windriver.com>
>>>> >
>>>> >The package provides the server daemon for the iSCSI protocol, as
>>>> well as
>>>> >the utility programs used to manage it. iSCSI is a protocol for
>>>> >distributed disk access using SCSI commands sent over Internet
>>>> Protocol
>>>> >networks
>>>> >
>>>> >It's a fairly basic utility, so copy it from meta-cloud-service to
>>>> >meta-oe
>>>> >
>>>> >Signed-off-by: Roy Li<rongqing.li@windriver.com>  ---
>>> [..]
>>>
>>>> >+++
>>>> >b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils.inc
>>>>
>>
>


