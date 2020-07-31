Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.14322.1596183524554475228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 01:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06V8IgED020701
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 31 Jul 2020 01:18:42 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 31 Jul
 2020 01:18:41 -0700
Subject: Re: [oe] [meta-networking][PATCH 2/2] samba: upgrade 4.10.15 -> 4.10.17
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200729093513.6782-1-yi.zhao@windriver.com>
 <20200729093513.6782-2-yi.zhao@windriver.com>
 <CAMKF1sp3j++PvdP-3CnOkG7h7F3m3KSUQ-7ikeTqvP-JCkH1Kg@mail.gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <a35393f6-5213-15e4-ebee-f1df51d56d7f@windriver.com>
Date: Fri, 31 Jul 2020 16:18:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3j++PvdP-3CnOkG7h7F3m3KSUQ-7ikeTqvP-JCkH1Kg@mail.gmail.com>
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/31/20 1:57 PM, Khem Raj wrote:
> this fails to build on musl see
> https://errors.yoctoproject.org/Errors/Details/426320/ perhaps we need
> patches from https://bugzilla.samba.org/show_bug.cgi?id=14415


Thanks. I will send V2.


//Yi


>
> On Wed, Jul 29, 2020 at 2:35 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>> This is a security release in order to address the following defects:
>>
>> CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD
>>                  DC LDAP Server with ASQ, VLV and paged_results.
>> CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
>>                  excessive CPU
>> CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
>>                  paged_results and VLV.
>> CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../samba/{samba_4.10.15.bb => samba_4.10.17.bb}              | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-networking/recipes-connectivity/samba/{samba_4.10.15.bb => samba_4.10.17.bb} (99%)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
>> similarity index 99%
>> rename from meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
>> rename to meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
>> index 01250cb43..6b1e5a042 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
>> @@ -36,8 +36,8 @@ SRC_URI_append_libc-musl = " \
>>              file://0001-samba-fix-musl-lib-without-innetgr.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "67e9f6b8c5140475641bf5121c93b3d4"
>> -SRC_URI[sha256sum] = "0b8b62558b62fbb121015f28f40fae0f07522710b6bef77c508b51bb6914ced9"
>> +SRC_URI[md5sum] = "f69cac9ba5035ee60257520a209a0a83"
>> +SRC_URI[sha256sum] = "03dc9758e7bfa2faf7cdeb45b4d40997e2ee16a41e71996aa666bc069e70ba3e"
>>
>>   UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
>>
>> --
>> 2.17.1
>>
>> 
