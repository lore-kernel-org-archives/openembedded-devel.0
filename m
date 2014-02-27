Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8786B8DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 01:46:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1R1kPRQ026088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Feb 2014 17:46:26 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 26 Feb 2014 17:46:25 -0800
Message-ID: <530E98EB.1050203@windriver.com>
Date: Thu, 27 Feb 2014 09:46:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1393325556.git.hongxu.jia@windriver.com>
	<a1776d6a50c9a7fcd20a4fc7ce55931088872cfb.1393325556.git.hongxu.jia@windriver.com>
	<20140226231150.GV26981@jama>
In-Reply-To: <20140226231150.GV26981@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] strongswan: fix building lib32-strongswan failed while systemd enabled
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
X-List-Received-Date: Thu, 27 Feb 2014 01:46:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2014 07:11 AM, Martin Jansa wrote:
> On Tue, Feb 25, 2014 at 06:54:16PM +0800, Hongxu Jia wrote:
>> While systemd enabled, there was an error to build lib32-strongswan:
>> ...
>> | ERROR: Function failed: SYSTEMD_SERVICE_lib32-strongswan value
>> lib32-strongswan.service does not exist
>> ...
> Please use [meta-networking] tag in subject so it's easier to filter
> them on patchwork to separate bundles.

Sorry for the missing, should I resend them?

//Hongxu

>> The name of the service file should be the hardcoded
>> 'strongswan.service' rather than '${PN}.service', so
>> the 'strongswan.service' will be found while building
>> lib32-strongswan.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
>> index eb49494..e45e81a 100644
>> --- a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
>> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
>> @@ -33,4 +33,4 @@ INSANE_SKIP_${PN}-plugins = "staticdev"
>>   RPROVIDES_${PN} += "${PN}-systemd"
>>   RREPLACES_${PN} += "${PN}-systemd"
>>   RCONFLICTS_${PN} += "${PN}-systemd"
>> -SYSTEMD_SERVICE_${PN} = "${PN}.service"
>> +SYSTEMD_SERVICE_${PN} = "strongswan.service"
>> -- 
>> 1.8.1.2
>>


