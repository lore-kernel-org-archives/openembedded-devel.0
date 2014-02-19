Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBED6E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 02:19:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1J2JsVP005825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 18:19:54 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 18 Feb 2014 18:19:53 -0800
Message-ID: <530414CE.5020808@windriver.com>
Date: Wed, 19 Feb 2014 10:19:58 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1390376858-17416-1-git-send-email-kai.kang@windriver.com>
	<20140122113111.GS4100@jama>
In-Reply-To: <20140122113111.GS4100@jama>
X-Originating-IP: [128.224.162.231]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] ntp: fix perl path in scripts
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
X-List-Received-Date: Wed, 19 Feb 2014 02:19:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?01?22? 19:31, Martin Jansa wrote:
> On Wed, Jan 22, 2014 at 03:47:38PM +0800, Kai Kang wrote:
>> Scripts ntptrace and ntp-wait use /bin/perl directly that cause
>> ntp-utils depends on /bin/perl but no package provides it. It should use
>> '${USRBINPATH}/env perl'.
> Next time please add [meta-networking] tag, but it's already in right
> patchwork bundle so that you don't need to resend it.

OK, thanks.

--Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/recipes-support/ntp/ntp.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
>> index 9ea24e9..8ada604 100644
>> --- a/meta-networking/recipes-support/ntp/ntp.inc
>> +++ b/meta-networking/recipes-support/ntp/ntp.inc
>> @@ -54,6 +54,8 @@ do_install_append() {
>>       sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
>>       sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
>>       sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${bindir}/ntpdate-sync
>> +    sed -i '1s!/bin/perl!${USRBINPATH}/env perl!' ${D}${sbindir}/ntptrace
>> +    sed -i '1s!/bin/perl!${USRBINPATH}/env perl!' ${D}${sbindir}/ntp-wait
>>   
>>       install -d ${D}/${sysconfdir}/default
>>       install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
>> -- 
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Regards,
Neil | Kai Kang


