Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B179273830
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:43:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t249h8vf010660
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Mar 2015 01:43:08 -0800 (PST)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:43:08 -0800
Message-ID: <54F6D3AA.3010302@windriver.com>
Date: Wed, 4 Mar 2015 17:43:06 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <obi@opendreambox.org>
References: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
	<54F6CC88.8080402@opendreambox.org>
In-Reply-To: <54F6CC88.8080402@opendreambox.org>
Subject: Re: [PATCH][meta-oe] samba: disable services for sysvinit
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
X-List-Received-Date: Wed, 04 Mar 2015 09:43:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2015 05:12 PM, Andreas Oberritter wrote:
> Dear Wenzong Fan,
>
> On 04.03.2015 07:18, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> The smb, nmb, winbind services have been disabled for systemd system
>> by default, disable them for sysvinit as well.
>
> why would anybody install these services without the desire for using
> them? Did the patch disabling them for systemd get merged by mistake? I
> remember Paul objecting to it.

The samba is not a common service that required by system, especially in 
some security environment, it should be configured correctly first - 
This is why I incline to disable it by default.

Yes, it did - this may give me some hints that it should be disabled ...

Thanks
Wenzong

>
> Regards,
> Andreas
>
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta-oe/recipes-connectivity/samba/samba.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
>> index abfd5ca..99216ce 100644
>> --- a/meta-oe/recipes-connectivity/samba/samba.inc
>> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
>> @@ -69,7 +69,7 @@ INITSCRIPT_NAME_winbind = "winbind"
>>   # No dependencies, goes in at level 20 (NOTE: take care with the
>>   # level, later levels put the shutdown later too - see the links
>>   # in rc6.d, the shutdown must precede network shutdown).
>> -INITSCRIPT_PARAMS = "defaults"
>> +INITSCRIPT_PARAMS = "disable"
>>   CONFFILES_${PN} = "${sysconfdir}/samba/smb.conf"
>>
>>   do_configure_prepend () {
>>
>

