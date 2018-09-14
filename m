Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B95B7996B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 01:18:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8E1IAOu017252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 18:18:21 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 13 Sep 2018 18:17:59 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
	<20180913093452.357414-1-mingli.yu@windriver.com>
	<CANNYZj9-NzKB+P0OyVfd2tk_8cMUFT11-y8t28xNoAV1R6C2yA@mail.gmail.com>
	<CANNYZj-cOrvsqv-GJUgusANWDAar3OcGcNyxW-d3QKV_+4F2Yg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B9B0B87.90208@windriver.com>
Date: Fri, 14 Sep 2018 09:14:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-cOrvsqv-GJUgusANWDAar3OcGcNyxW-d3QKV_+4F2Yg@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] postfix: fix pkg_postinst_${PN}
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
X-List-Received-Date: Fri, 14 Sep 2018 01:18:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年09月13日 19:09, Alexander Kanavin wrote:
> Ah, now I get it - there might be more lines in the postinst script
> added from elsewhere. Correct?

Hi Alex,

You are right, there is some other postinst script logic added such as 
by update-alternatives.bbclass.

Thanks,

>
>
> Alex
>
> 2018-09-13 13:07 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
>> I might not be understanding this. Why is the original fragment
>> incorrect and the new one correct?
>>
>> Original:
>>
>>          # This can fail depending on host setup
>>          if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>>              $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
>> ${PKG} mlprefix=${MLPREFIX}
>>              exit 0
>>          fi
>>          touch $D/etc/postfix/virtual_alias
>>          postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>>
>>      fi
>> }
>>
>>
>> Patched:
>>
>>           if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>>               $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
>> ${PKG} mlprefix=${MLPREFIX}
>>           else
>>              touch $D/etc/postfix/virtual_alias
>>              postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>>           fi
>>
>>      fi
>> }
>>
>>
>>
>> What problem is being fixed here?
>>
>> Alex
>>
>> 2018-09-13 11:34 GMT+02:00  <mingli.yu@windriver.com>:
>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> "exit 0" will break the postinst logic
>>> below the line "exit 0" such as:
>>> ===
>>> update-alternatives --install /usr/sbin/sendmail sendmail /usr/sbin/sendmail.postfix 120
>>> update-alternatives --install /usr/bin/mailq mailq /usr/bin/mailq.postfix 120
>>> update-alternatives --install /usr/bin/newaliases newaliases /usr/bin/newaliases.postfix 120
>>> ===
>>>
>>> It's enough to call "$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}"
>>> , so remove it to guarantee the postinstall logic is correct
>>>
>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> ---
>>>   meta-networking/recipes-daemons/postfix/postfix.inc | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
>>> index 49f9f7b1f..882b27b6e 100644
>>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>>> @@ -246,10 +246,10 @@ pkg_postinst_${PN} () {
>>>           # This can fail depending on host setup
>>>           if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>>>               $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
>>> -            exit 0
>>> +        else
>>> +            touch $D/etc/postfix/virtual_alias
>>> +            postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>>>           fi
>>> -        touch $D/etc/postfix/virtual_alias
>>> -        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>>>
>>>       fi
>>>   }
>>> --
>>> 2.13.3
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

