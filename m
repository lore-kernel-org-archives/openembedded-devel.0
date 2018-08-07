Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0050878A0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 02:03:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w772345k015460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Aug 2018 19:03:04 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 6 Aug 2018 19:03:04 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
	<20180806085408.44739-5-kai.kang@windriver.com>
	<CAMKF1sr=0BRHHRTmWf0yXn46JvtJZZROhx2zARqCxX_onepBcg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c99ee604-94bb-5433-39aa-2c16a4607df2@windriver.com>
Date: Tue, 7 Aug 2018 10:00:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr=0BRHHRTmWf0yXn46JvtJZZROhx2zARqCxX_onepBcg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 04/10] xfce4-embed-plugin: 1.0.0 -> 1.6.0
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
X-List-Received-Date: Tue, 07 Aug 2018 02:03:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月07日 01:31, Khem Raj wrote:
> On Mon, Aug 6, 2018 at 1:55 AM Kai Kang <kai.kang@windriver.com> wrote:
>> Upgrade xfce4-embed-plugin from 1.0.0 to 1.6.0
>> * update md5sum of license file that its text has been updated
>>
> Please summarise the change explicitly.

It just updated text of COPYING to match the one at gnu.org. See 
https://github.com/xfce-mirror/xfce4-embed-plugin/commit/d20cec5e01cc5486423a82b284e53f3b79239912#diff-7116ef0705885343c9e1b2171a06be0e
I'll send V2 of this patch.

Regards,
Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb}    | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-xfce/recipes-panel-plugins/embed/{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb} (57%)
>>
>> diff --git a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
>> similarity index 57%
>> rename from meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
>> rename to meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
>> index cab3ea754..387b183f1 100644
>> --- a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
>> +++ b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
>> @@ -2,11 +2,11 @@ DESCRIPTION = "A panel plugin that embeds arbitrary windows (or GtkPlug widgets)
>>   HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-embed-plugin"
>>   SECTION = "x11/application"
>>   LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>
>>   inherit xfce-panel-plugin
>>
>>   # DEPENDS += "xfconf xorgproto libxtst"
>>
>> -SRC_URI[md5sum] = "c5b86cbc1c54ee7c1d2e95a4502fed8e"
>> -SRC_URI[sha256sum] = "35d4c6c56dd6468c0e5afe66f657c1526f2d830a577105a51da43657651832e3"
>> +SRC_URI[md5sum] = "6870b116b85e4fa68d1b9ef76bd1d279"
>> +SRC_URI[sha256sum] = "c767df6360e8194b32bc24823dd000975edba0cafe525c23d7854029359ee228"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Regards,
Neil | Kai Kang


