Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 486AF65D5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 02:37:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6P2bhj1003523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 19:37:43 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 24 Jul 2014 19:37:43 -0700
Message-ID: <53D1C2F6.4010905@windriver.com>
Date: Fri, 25 Jul 2014 10:37:42 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406184181-23969-1-git-send-email-rongqing.li@windriver.com>
	<20140724110231.GG2492@jama>
In-Reply-To: <20140724110231.GG2492@jama>
Subject: Re: [PATCH][meta-networking] openvpn: not use the hardcoded libdir
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
X-List-Received-Date: Fri, 25 Jul 2014 02:37:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/24/2014 07:02 PM, Martin Jansa wrote:
> On Thu, Jul 24, 2014 at 02:43:01PM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> it will lead to QA failure, since .debug dir can not be installed into dbg package
>>
>>      ERROR: QA Issue: non debug package contains .debug directory: openvpn path
>>      /work/core2-64-wrs-linux/openvpn/2.3.4-r0/packages-split/openvpn/usr/lib64i
>>      /openvpn/plugins/.debug/openvpn-plugin-down-root.so [debug-files]
>
> Can you please check this floating dependency?
>
> snort/snort/latest lost dependency on  util-linux-libuuid
>

Hi, martin:


This patch is fixing the openvpn, not snort, it should be a good fix.

About snort dependency, snort will check if util-linux-libuuid exist or
not when do configuration, and no configuration options can control it,
so PACKAGECONFIG can not be used on snort, so I like leave it to wait
until I have time

-Roy



>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
>> index a3322a0..48e04b7 100644
>> --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
>> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
>> @@ -28,4 +28,4 @@ do_install_append() {
>>
>>   RRECOMMENDS_${PN} = "kernel-module-tun"
>>
>> -FILES_${PN}-dbg += "/usr/lib/openvpn/plugins/.debug"
>> +FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

