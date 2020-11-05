Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web09.10860.1604597151369808621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 09:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KMe8mOMR;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id z3so1875630pfb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 09:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zJH3kO1HAnldSByZKjgsuu2OMvz1nGQRyqwfmA+sSEY=;
        b=KMe8mOMR2m9wxd5h4CptlAR+8ge4/Uo+YGrbVUZR0xd8tsCJkU4UAql368FVzlAk5m
         yatVvggl/1B1RtDZ4ClS6zgXVJ6BJ6l4u93PfGuMqs7YrAVK8Nk1gf0qSjC7SihxUOya
         34+UidNy4lbwB6eeIiCPXr55ed4SOZZrAzstMKmHj42U41VTHDvKDnUjC1mw8mTFKlGo
         dxQObddw2eaJkVuP/5DjekeqA8j+fqY8l5qvR6PjZUizZgPTuQz/eLAS+zxkwOe6WDUz
         /YNSiadC9l633GirRA+UHz4VOs3W2E2lG9x43AUnzyU+/oqtJjfvW0Nwt3YztYNuPIws
         9/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zJH3kO1HAnldSByZKjgsuu2OMvz1nGQRyqwfmA+sSEY=;
        b=RIu72J8F3yMTd2hfXrlmGlmiZIaAW/KIIXsyzyWycEVXms0g/e1SP/CBU4CngKDxaF
         VbgGL1OTMxnkc2t9t9pyYZrQ/xydWudPAcMSmPdSxoVemKNrepIEcW9X491eIHfF1jH3
         NGQ5zuanLLObf2gvlsYMUktw9JzChIHmbacI1boZ5nYPueblmm4r/Oc27pasjNGxGgBD
         LhXuaKR8f9Zgmx1OapT/hbVlCYyxnfjlMuvdauAaWOFgPelTZ7PNlZ/gqxBH1Zi+kGel
         76u17e6YZArSWYspeFQaS1BC9Jp1YRih98VbcH/mozjhTZpMOm60R2b2XCnlGSWyIj78
         sJvw==
X-Gm-Message-State: AOAM533WN7fEZ3pHRlh0IGL7SCxkytGjcbm/Fb8INHZ14aGOWh/r55Kq
	kJ3GcihPigBxMv6uRiWm+O4QTc4ITWFGvQ==
X-Google-Smtp-Source: ABdhPJz6wsyaRGLRgeddKV0GyLKoa2OAde9K6zVpjTubjLibGp6tRLvbvQrjWOUvpYi6tLuyQKIRIA==
X-Received: by 2002:a65:5606:: with SMTP id l6mr3368547pgs.49.1604597150387;
        Thu, 05 Nov 2020 09:25:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:6955:62e2:f0f4:7e8d? ([2601:646:9200:4e0:6955:62e2:f0f4:7e8d])
        by smtp.gmail.com with ESMTPSA id 3sm3282538pfv.92.2020.11.05.09.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 09:25:49 -0800 (PST)
Subject: Re: [oe] [PATCH 1/4] libmaxminddb: add new recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <164492384A65F946.6094@lists.openembedded.org>
 <7f82ee81-b5b1-639d-ead3-6b040002537a@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <93fa6146-112c-36ea-e0e0-487db3848305@gmail.com>
Date: Thu, 5 Nov 2020 09:25:48 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7f82ee81-b5b1-639d-ead3-6b040002537a@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 11/5/20 1:28 AM, Yu, Mingli wrote:
> Please ignore this series, will resend with the sub-layer name in the 
> subject.
> 

also add new recipes to relevant packagegroups for testing
do we need to delete the existing ntop recipe to accomodate it ?

> Thanks,
> 
> On 11/5/20 5:18 PM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> The libmaxminddb library provides a C library for reading MaxMind
>> DB files, including the GeoIP2 databases from MaxMind.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../libmaxminddb/libmaxminddb_1.4.3.bb        | 20 +++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>   create mode 100644 
>> meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
>>
>> diff --git 
>> a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb 
>> b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
>> new file mode 100644
>> index 000000000..d5c303861
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "C library for the MaxMind DB file format"
>> +DESCRIPTION = "The libmaxminddb library provides a C library for 
>> reading MaxMind DB files, \
>> +ncluding the GeoIP2 databases from MaxMind. This is a custom binary \
>> +format designed to facilitate fast lookups of IP addresses while 
>> allowing \
>> +for great flexibility in the type of data associated with an address."
>> +
>> +HOMEPAGE = "https://github.com/maxmind/libmaxminddb"
>> +SECTION = "libdevel"
>> +LICENSE = " Apache-2.0"
>> +
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>> +"
>> +SRC_URI = 
>> "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz 
>> \
>> +"
>> +SRC_URI[sha256sum] = 
>> "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439"
>> +
>> +S = "${WORKDIR}/${BPN}-${PV}"
>> +
>> +inherit autotools-brokensep
>> +
>>
>>
>>
>>
>>
> 
> 
> 
> 
