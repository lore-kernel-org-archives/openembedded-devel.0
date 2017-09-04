Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC42D60553
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 01:52:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v841qLlA011606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Sep 2017 18:52:21 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 3 Sep 2017 18:52:20 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1504243590-86579-1-git-send-email-dengke.du@windriver.com>
	<CAMKF1somSGXJ2aVL+uVKN-xjupfz1r-68zVR+86KE1cN0ER3mg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <89897b7f-d587-7fa2-49c4-b21cabe0155a@windriver.com>
Date: Mon, 4 Sep 2017 09:51:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1somSGXJ2aVL+uVKN-xjupfz1r-68zVR+86KE1cN0ER3mg@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] iscsitarget: fix few arguments for netlink_ack
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
X-List-Received-Date: Mon, 04 Sep 2017 01:52:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Thanks, you patch more better.


On 2017年09月01日 21:24, Khem Raj wrote:
> On Thu, Aug 31, 2017 at 10:26 PM, Dengke Du <dengke.du@windriver.com> wrote:
>> After kernel version 4.12, the function netlink_ack need four arguments,
>> so adjust it in iscsitarget.
>>
> check https://patchwork.openembedded.org/patch/143411/
>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   ...itarget-fix-few-arguments-for-netlink_ack.patch | 35 ++++++++++++++++++++++
>>   .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  4 ++-
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
>>
>> diff --git a/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch b/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
>> new file mode 100644
>> index 0000000..84e5853
>> --- /dev/null
>> +++ b/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
>> @@ -0,0 +1,35 @@
>> +From 878b6830cbeb912362ea4cc3497954e72df6f043 Mon Sep 17 00:00:00 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Wed, 30 Aug 2017 06:06:49 -0400
>> +Subject: [PATCH] iscsitarget: fix few arguments for netlink_ack
>> +
>> +After the kernel upgrade to 4.12 in OE, the netlink_ack function
>> +need four arguments, so add it. we can check the commit:
>> +
>> +    2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5
>> +
>> +in kernel.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> +---
>> + kernel/event.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/kernel/event.c b/kernel/event.c
>> +index ef4adcb..8ba5978 100644
>> +--- a/kernel/event.c
>> ++++ b/kernel/event.c
>> +@@ -29,7 +29,7 @@ static void event_recv_skb(struct sk_buff *skb)
>> +               ietd_pid = NETLINK_CB(skb).portid;
>> +               WARN_ON(ietd_pid == 0);
>> +               if (nlh->nlmsg_flags & NLM_F_ACK)
>> +-                      netlink_ack(skb, nlh, 0);
>> ++                      netlink_ack(skb, nlh, 0, NULL);
>> +               skb_pull(skb, rlen);
>> +       }
>> + }
>> +--
>> +2.8.1
>> +
>> diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>> index 5c1e38e..dddea10 100644
>> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>> @@ -14,7 +14,9 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
>>              file://access-sk_v6_daddr-iff-IPV6-defined.patch \
>>              file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch \
>>              file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch \
>> -           file://fix-call-trace-of-ahash-API-calling.patch"
>> +           file://fix-call-trace-of-ahash-API-calling.patch \
>> +           file://0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch \
>> +          "
>>
>>   SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
>>   SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


