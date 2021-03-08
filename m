Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web09.3787.1615239912606714787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 13:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rec5wxnj;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id v192so5047441oia.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 13:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DMdfpxRwp5yF/YdTmJkg4H8JWqXP6vEFdke3N7wl2Cs=;
        b=Rec5wxnj0hTJ6PomT/opEvoMI6a3pI1kbV02CDmEyFxQDLtgDNmwljD9RDhMAwTEpL
         WFD8QltD55pshOuIo5HYUq03c/A0OTeO1+beVV3RBHqnJnsOWSQRNAqwXQassCqbCLTH
         a8sgBUy5oNrI4dc22b+U+TJP+hfMgOqde8qkD3Vi0mf/A/gOJucxPvva1Nu2ykIAJv6R
         k7um2EscqMEMhjYErTV9nxp1VsRG4rC78qXSQU0AQDoJ7BlDwrXsI9mqNI5QYe4KVdlr
         l9MX19+T6SuvORoz3A2L7gD9XFXLczTzkvz6F99e9SXOGTlO0ZHd54XkYgmmuoRkAbm4
         HkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DMdfpxRwp5yF/YdTmJkg4H8JWqXP6vEFdke3N7wl2Cs=;
        b=ZNBhl49UwhKoa2Vp3G2zCkZrjtG8+8uaRwUqhljPsUV+FDBGoKujw1uiRE7LPCvgsk
         fUxIE5csUnjC3OM07qSXAvdnt2Vkd0IuuJryRZBP9eHN2gUyAvKH4OZX9cF7DjB42ZKa
         /yv1ishqOcIyb5dZdRmTHxyOjjHAC2zm8osONT1FY/XsUwb9IQtVUJw6ifc+POJZBF3B
         OzsD4OFTT9vB3IWCYneRKmXAuGOF6MflnhcQXNMvVZRxBpk+YClVD+3DNP6IFzpPnLNU
         OzduS6EZgPjg53Y38yZc5vSVwfxQ/8lNN0TRyDgXWGRbUE/CzELe5glLDsDcllkTl3rV
         H8Mg==
X-Gm-Message-State: AOAM5310D9p7jDc0+2D/We3qs/jMqNUjhEh9B2YHuxUtekJltEgDhiou
	Q5zOVajh+ddQdqOTG+cn268DAjlGCgg=
X-Google-Smtp-Source: ABdhPJydk6BYdGps2uTxJ88uOIBDHrPqFLfHtX6Zy4G5QXGjO7rvNpiCQZ7R1I8PcwTpUBERstGa/w==
X-Received: by 2002:aca:5d82:: with SMTP id r124mr682412oib.59.1615239911626;
        Mon, 08 Mar 2021 13:45:11 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 24sm769170oiq.11.2021.03.08.13.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 13:45:11 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [oe][meta-oe][PATCH] classes: Add Android sparse image class
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210305190859.32217-1-JPEWhacker@gmail.com>
 <CAMKF1sraAE4Y69=vnfnvhXoFRk=sHiOgyU+Ck3C12m1=FN_mFA@mail.gmail.com>
Message-ID: <6e9926ca-3405-30bf-1b04-1a9f60cd3adb@gmail.com>
Date: Mon, 8 Mar 2021 15:45:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sraAE4Y69=vnfnvhXoFRk=sHiOgyU+Ck3C12m1=FN_mFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/8/21 2:54 PM, Khem Raj wrote:
> On Fri, Mar 5, 2021 at 11:09 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>> Adds a class to create sparse image files using the Android tools
>> ---
>>   meta-oe/classes/image_types_simg.bbclass | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta-oe/classes/image_types_simg.bbclass
>>
>> diff --git a/meta-oe/classes/image_types_simg.bbclass b/meta-oe/classes/image_types_simg.bbclass
>> new file mode 100644
>> index 000000000..a53fafe5e
>> --- /dev/null
>> +++ b/meta-oe/classes/image_types_simg.bbclass
>> @@ -0,0 +1,16 @@
>> +inherit image_types
>> +
>> +CONVERSIONTYPES += "simg"
> I wonder if the name could be made sparse-img ?
> simg might indicate, signed image too.

Ya we can do that


>
>> +CONVERSION_CMD_simg() {
>> +    in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> +    out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.simg"
>> +    case "${type}" in
>> +        ext*)
>> +            ext2simg "$in" "$out"
>> +            ;;
>> +        *)
>> +            img2simg "$in" "$out"
>> +            ;;
>> +    esac
>> +}
>> +CONVERSION_DEPENDS_simg = "android-tools-native"
>> --
>> 2.30.0
>>
>>
>> 
>>
