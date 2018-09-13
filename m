Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7674D78493
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:34:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8D9XlGP024973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 02:33:58 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 13 Sep 2018 02:33:36 -0700
To: ChenQi <Qi.Chen@windriver.com>,
	<openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
References: <20180913082343.435508-1-mingli.yu@windriver.com>
	<fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B9A2E31.1080508@windriver.com>
Date: Thu, 13 Sep 2018 17:30:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [meta-networking][PATCH] postfix: fix pkg_postinst_${PN}
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
X-List-Received-Date: Thu, 13 Sep 2018 09:34:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年09月13日 16:32, ChenQi wrote:
> On 09/13/2018 04:23 PM, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> "exit 0" will break the postinst logic
>> below the line "exit 0" such as:
>> ===
>> update-alternatives --install /usr/sbin/sendmail sendmail
>> /usr/sbin/sendmail.postfix 120
>> update-alternatives --install /usr/bin/mailq mailq
>> /usr/bin/mailq.postfix 120
>> update-alternatives --install /usr/bin/newaliases newaliases
>> /usr/bin/newaliases.postfix 120
>> ===
>>
>> It's enough to call "$INTERCEPT_DIR/postinst_intercept
>> delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}"
>> , so remove it to guarantee the postinstall logic is correct
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta-networking/recipes-daemons/postfix/postfix.inc | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc
>> b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index 49f9f7b1f..71d7ef5df 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -246,7 +246,6 @@ pkg_postinst_${PN} () {
>>           # This can fail depending on host setup
>>           if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases;
>> then
>>               $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
>> ${PKG} mlprefix=${MLPREFIX}
>> -            exit 0
>>           fi
>>           touch $D/etc/postfix/virtual_alias
>>           postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
> I guess you need to use the if...else... block here.

Thanks Qi, Will send out v2 to update the logic.

Thanks,

>
> Regards,
> Chen Qi
>

