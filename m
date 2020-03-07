Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC53360FFB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2020 02:56:56 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j5so4439938otn.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 18:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=XCLnGHXfJ9tFyE9vYmbpLIpXOkNAQSQ+ern96ldC2aM=;
	b=Rjx2QVb0+oykDsI7FHqJ0Uo0fUhO0kwN7ld8Ji1QGYJHrJ+iXaw+rKx8yOyPLDRTKZ
	MRLdtypzuTMCs0xAr8H+nl98ujrRe98j0TMJ89g2SkI101574UvPwUMJTfwcgEo4XEGW
	YQe9BsAixOR4tCLkwfChzHf3Ig3Rm8AVPo5GFWDYFbFC22AkrUqYImQkyQFLghJZRiUK
	lFN/gHW8dKDMSzMmeKtfG5n0QDDlPlQknHxNcizA3joGFEwX55MhFkoRaw+XuSpzbbU8
	yjNL6CipfzPJXjXnltdmD/V2KvEIyj3cUKItUDri44fUpFBKAv4dstUzOrj9ToUQ1usD
	yIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=XCLnGHXfJ9tFyE9vYmbpLIpXOkNAQSQ+ern96ldC2aM=;
	b=isz2o6Cl5OFS8Q9ILgUQfCWLJfzioQWRr/LV7Lhd9eSPpxDWNxnDvBIgT61lXQVI63
	AKIIVz8Jn+rAqVs4qIuPQHeizbYsYIoD3VXSa/QaSthQxGmBd95+ZqJTQ015vvXVZwhX
	BXbA5PF7/pbb2my5HI86zytz/CluyHaMO1vyqA1x49uH7z6PseXiSni0GVYAI1MgzEzo
	J3fcT9qrvdi+57tUquKPQpEYzlOmXn9PfENXOxt0apWSyNU+M5RfE7sHydjip7Cbjrba
	VOwE2oAwzbh4ZFm+dkdoDUm1urtpMTixVxOBZ27zi5Vtu1gVWK9Ptp7KsVW758X72org
	v1/A==
X-Gm-Message-State: ANhLgQ0MDDPZgacshj0SiBOTh3wh/itYQREujF6XjH5JZPg5TQ5JhegW
	FZn79oxhVjaeFHpwhOEKoIoquzoOJLA=
X-Google-Smtp-Source: ADFU+vvFtE5HOKAFZd+/Pg5hg9rttUAUbIc1eoCJweFRkF52akNsn8+opFQVKIudxcuIN3ToCx3uWA==
X-Received: by 2002:a9d:480c:: with SMTP id c12mr4950272otf.336.1583549817139; 
	Fri, 06 Mar 2020 18:56:57 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3?
	([2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3])
	by smtp.gmail.com with ESMTPSA id 93sm2128349otp.80.2020.03.06.18.56.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Mar 2020 18:56:56 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200305223937.12418-1-jpuhlman@mvista.com>
	<20200305223937.12418-4-jpuhlman@mvista.com>
	<74c7eed5-4a2b-aeb2-2c4f-b89f335897a0@gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <ff31c97e-c802-278b-05b6-858b8e3212a9@mvista.com>
Date: Fri, 6 Mar 2020 18:56:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <74c7eed5-4a2b-aeb2-2c4f-b89f335897a0@gmail.com>
Subject: Re: [meta-networking][PATCH 4/7] net-snmp: fix reproducibilty issues in net-snmp-config
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
X-List-Received-Date: Sat, 07 Mar 2020 02:56:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/6/2020 5:36 PM, Khem Raj wrote:
> Hi Jeremy
>
> On 3/5/20 2:39 PM, Jeremy A. Puhlman wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> Both STAGING_HOST_DIR and -fmacro-prefix-map path to WORKDIR were
>> encoded in the config.
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git 
>> a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb 
>> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
>> index 317350e94..91c50c4e3 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
>> @@ -124,11 +124,13 @@ do_install_append() {
>>           -i ${D}${bindir}/net-snmp-create-v3-user
>>       sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
>>           -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
>> +        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
>>           -e 's@[^ ]*--sysroot=[^ "]*@@g' \
>>           -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
>>           -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
>>           -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
>>           -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
>> +        -e 's@${STAGING_DIR_HOST}@@g' \
>
> This is causing problems, indirectly like
>
> https://errors.yoctoproject.org/Errors/Details/393851/
> https://errors.yoctoproject.org/Errors/Details/393852/
> https://errors.yoctoproject.org/Errors/Details/393853/
>
> Since its editing out the paths, whats left is just /usr/lib
> and that gets added to compiler commandline as -L/usr/lib which
> thankfully gets caught by Build QA
>
> perhaps this regexp can be made less greedy
Okay, no problem, I have some builds running locally to check.


-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


