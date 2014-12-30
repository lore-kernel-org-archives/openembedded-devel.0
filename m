Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2277C72475
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 05:40:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBU5esFh018495
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 21:40:55 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 29 Dec 2014 21:40:54 -0800
Message-ID: <54A23AE5.2080804@windriver.com>
Date: Tue, 30 Dec 2014 13:40:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1418977765-46144-1-git-send-email-liezhi.yang@windriver.com>	<1418977765-46144-3-git-send-email-liezhi.yang@windriver.com>
	<20141229200657.GD4672@mentor.com>
In-Reply-To: <20141229200657.GD4672@mentor.com>
Subject: Re: [meta-networking] [PATCH 3/3] netkit-rusers: fix parallel build issue
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
X-List-Received-Date: Tue, 30 Dec 2014 05:41:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/2014 04:06 AM, Joe MacDonald wrote:
> Hi Robert,
>
> I merged this patch after removing your "LOCAL REV:" comment from the
> commit log) but I haven't merged the esmtp ones yet, I wanted to confirm
> first that the runtime behaviour wasn't impacted.  Just FYI.

Ah, sorry, my fault, I will remove the "(LOCAL REV" and send again, it
doesn't affect the runtime behaviour since I only remove it from sysroot.

// Robert

>
> -J
>
> [[oe] [meta-networking] [PATCH 3/3] netkit-rusers: fix parallel build issue] On 14.12.19 (Fri 00:29) Robert Yang wrote:
>
>> Fixed:
>> rusers.x: No such file or directory
>> Makefile:44: recipe for target 'rusers_xdr.c' failed
>>
>> (LOCAL REV: NOT UPSTREAM) -- Sent to meta-networking on 20141219
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   ...rusersd-Makefile-fix-parallel-build-issue.patch |   30 ++++++++++++++++++++
>>   .../netkit-rusers/netkit-rusers_0.17.bb            |    1 +
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
>>
>> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
>> new file mode 100644
>> index 0000000..d85178d
>> --- /dev/null
>> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
>> @@ -0,0 +1,30 @@
>> +From c23cc112a480f90950de5cf1de09b1a7e732bf21 Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Mon, 15 Dec 2014 18:31:13 -0800
>> +Subject: [PATCH] rpc.rusersd/Makefile: fix parallel build issue
>> +
>> +Fixed:
>> +rusers.x: No such file or directory
>> +Makefile:44: recipe for target 'rusers_xdr.c' failed
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + rpc.rusersd/Makefile |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/rpc.rusersd/Makefile b/rpc.rusersd/Makefile
>> +index 792f528..65a424a 100644
>> +--- a/rpc.rusersd/Makefile
>> ++++ b/rpc.rusersd/Makefile
>> +@@ -40,5 +40,5 @@ rusers.x:
>> + rusers.h: $(RUSERSX) rusers.x
>> + 	$(RPCGEN) -h -o rusers.h rusers.x
>> +
>> +-rusers_xdr.c: $(RUSERSX)
>> ++rusers_xdr.c: $(RUSERSX) rusers.x
>> + 	$(RPCGEN) -c -C -o rusers_xdr.c rusers.x
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
>> index e59f7a7..c930842 100644
>> --- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
>> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
>> @@ -8,6 +8,7 @@ DEPENDS = " tcp-wrappers libtirpc rpcbind"
>>
>>   SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
>>              ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
>> +           file://rpc.rusersd-Makefile-fix-parallel-build-issue.patch \
>>   "
>>
>>   SRC_URI[archive.md5sum] = "dc99a80b9fde2ab427c874f88f1c1602"
>> --
>> 1.7.9.5
>>
>>
>>

