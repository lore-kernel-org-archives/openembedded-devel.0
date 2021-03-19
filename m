Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.437.1616175364846064758
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HoVjTNWW;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so7058085pjq.5
        for <Openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z/HxXkSbGh1Ln+01V6vHPTFeJQncaU9eDzsnuDScAfs=;
        b=HoVjTNWWd4HsnhMSnnQinf31BQR5NwF58DS7lNcqsFOJEVWK71Ul4nnkPmM5+D3JLF
         9y9gftEUlM0OcnwePji5MvhVA49Aj1j5Wzl7cbHPcZLKU1XyG84uZn7Kale7BdcSTgQI
         /39TRF3+nHKXA6wElx14gcrChSAapCZ+PxP9NfKQpx+inTuW9SocIAq+7ObdOe6ee9Jx
         1oOpmBcXB4RG637ltKxeXvsMI1sefvmwzMjpd1Fam+6nKWwro1T5GV+DVtsT6gC6X/b1
         cXNAoa4DGWm1ZWOWqp8nuaDDp8+6hXu8Bm8dBigYmnfA6HwLH0keh59fmUSvYhwTb2FB
         PYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z/HxXkSbGh1Ln+01V6vHPTFeJQncaU9eDzsnuDScAfs=;
        b=CdCaNMgd5v0Henl/kvAiRZH7KSffVqfZ/ZycZ8x0QM3bTsnGaoIveisc+SJ/o4/aC5
         UtbkCgrZvEBDyIkjexG8g6r/5Cim6HKjNMW0w3Tbis83YhNPuaeRc3HpS+oxs1mLw751
         T2xwLbg0212NRi33p2GfMxX+22JzRzFcPfj8LRDmU2PDkvxmpQYQc0mXgpPKPLl6MInd
         ARZFsZ1V/7Dj4WYnHqVBj1SCAMkb7XeAE6qAm31uqhhnvf+gqBqNt6+PBclDmpggwZeo
         eRdrCUHwexDwxXY6/g9eNR2iHfHj6hZASeYpALPhOtE0hQKg1IPxknsduzMfR00KUsW5
         wm4Q==
X-Gm-Message-State: AOAM530o8YFAtsfO/q6ucjqLodud2JFRbymX+b2MHDsFKKn3BUKGtNS4
	fIkXuRrKgg1xIyAVPSi8tOA=
X-Google-Smtp-Source: ABdhPJwLK5HUQFxykhDprLzIDy5C/E3T3bl47w0OcDtesqygi7HUQGnLHCK1LZZ2q0jldjBvWMHuDA==
X-Received: by 2002:a17:902:c382:b029:e4:33bb:8a3f with SMTP id g2-20020a170902c382b02900e433bb8a3fmr15578123plg.9.1616175364131;
        Fri, 19 Mar 2021 10:36:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b117? ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id j22sm5322131pjz.3.2021.03.19.10.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 10:36:03 -0700 (PDT)
Subject: Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
To: Sana Kazi <Sana.Kazi@kpit.com>,
 "Openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
Cc: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>,
 Nisha Parrakat <Nisha.Parrakat@kpit.com>
References: <20210309063513.10410-1-Sana.Kazi@kpit.com>
 <BMXPR01MB3221CE7ACA0211ED19B9164399689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
 <c9489c74-f9c3-976a-c1e6-645afe9c2f4a@gmail.com>
 <BMXPR01MB322133C4D35B77124D00104699689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <6988d70c-149a-3d51-8bea-480cbb1110b1@gmail.com>
Date: Fri, 19 Mar 2021 10:36:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB322133C4D35B77124D00104699689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/19/21 10:16 AM, Sana Kazi wrote:
> Hi,
> 
> It is merged in dunfell but not yet in master. Are you planning to merge 
> it in master?
> 

Please update you copies isnt it this one
https://git.openembedded.org/meta-openembedded/commit/?id=f37e5423da984b7dc721d52f04673d3afc0879a1

> Thanks & Regards,
> 
> Sana Kazi
>   KPIT Technologies Limited
> 
> 
> 
> ------------------------------------------------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Friday, March 19, 2021 10:11 PM
> *To:* Sana Kazi <Sana.Kazi@kpit.com>; 
> Openembedded-devel@lists.openembedded.org 
> <Openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: 
> Whitelisted CVE-2007-0613 for mdns
> Hello Sana
> 
> It was in latest pull from Armin which was merged today
> it should be in already in dunfell now. Let us know if not.
> 
> On 3/19/21 6:31 AM, Sana Kazi wrote:
>> Hi Team,
>> 
>> Could you please review below patch to be upstreamed for mdns
>> 
>> 
>> Thanks & Regards,
>> 
>> Sana Kazi
>>   KPIT Technologies Limited
>> 
>> 
>> 
>> ------------------------------------------------------------------------
>> *From:* Sana Kazi <Sana.Kazi@kpit.com>
>> *Sent:* Tuesday, March 9, 2021 12:06 PM
>> *To:* Openembedded-devel@lists.openembedded.org 
>> <Openembedded-devel@lists.openembedded.org>; raj.khem@gmail.com 
>> <raj.khem@gmail.com>
>> *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade 
>> <Aditya.Tayade@kpit.com>; Harpritkaur Bhandari 
>> <Harpritkaur.Bhandari@kpit.com>
>> *Subject:* [meta-networking][meta-oe][master][dunfell][PATCH] mdns: 
>> Whitelisted CVE-2007-0613 for mdns
>> CVE-2007-0613 is not applicable as it only affects Apple products
>> i.e. ichat,mdnsresponder, instant message framework and MacOS.
>> Also, https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zEEydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zEEydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zEEydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zEEydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;reserved=0>> 
> shows the part of code
>> affected by CVE-2007-0613 which is not preset in upstream source code.
>> Hence, CVE-2007-0613 does not affect other Yocto implementations and
>> is not reported for other distros can be marked whitelisted.
>> Links:
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0>>
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&amp;reserved=0> 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&amp;reserved=0>>
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;reserved=0>>
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FMQ7vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FMQ7vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FMQ7vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FMQ7vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;reserved=0>>
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0>>
>> ---
>>   .../recipes-protocols/mdns/mdns_1310.40.42.bb       | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>> 
>> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb 
>> b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
>> index 445ed87e4..60bc26bf1 100644
>> --- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
>> +++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
>> @@ -27,6 +27,19 @@ SRC_URI[sha256sum] = 
>> "bea29e1616cd56ccb8f88c0fad2bcdc4031f4deb2d899c793e2f27a838
>> 
>>   CVE_PRODUCT = "apple:mdnsresponder"
>> 
>> +# CVE-2007-0613 is not applicable as it only affects Apple products
>> +# i.e. ichat,mdnsresponder, instant message framework and MacOS.
>> +# Also, https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7RyM%2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7RyM%2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7RyM%2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7RyM%2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;reserved=0>> 
> shows the part of code
>> +# affected by CVE-2007-0613 which is not preset in upstream source code.
>> +# Hence, CVE-2007-0613 does not affect other Yocto implementations and
>> +# is not reported for other distros can be marked whitelisted.
>> +# Links:
>> +# https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=0>>
>> +# 
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&amp;reserved=0> 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&amp;reserved=0>>
>> +# https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=qAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=qAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=qAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=qAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;reserved=0>>
>> +# https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=0> 
> 
>> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=0 
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=0>>
>> +CVE_CHECK_WHITELIST += "CVE-2007-0613"
>> +
>>   PARALLEL_MAKE = ""
>> 
>>   S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
>> -- 
>> 2.17.1
>> 
>> This message contains information that may be privileged or confidential 
>> and is the property of the KPIT Technologies Ltd. It is intended only 
>> for the person to whom it is addressed. If you are not the intended 
>> recipient, you are not authorized to read, print, retain copy, 
>> disseminate, distribute, or use this message or any part thereof. If you 
>> receive this message in error, please notify the sender immediately and 
>> delete all copies of this message. KPIT Technologies Ltd. does not 
>> accept any liability for virus infected mails.
> This message contains information that may be privileged or confidential 
> and is the property of the KPIT Technologies Ltd. It is intended only 
> for the person to whom it is addressed. If you are not the intended 
> recipient, you are not authorized to read, print, retain copy, 
> disseminate, distribute, or use this message or any part thereof. If you 
> receive this message in error, please notify the sender immediately and 
> delete all copies of this message. KPIT Technologies Ltd. does not 
> accept any liability for virus infected mails.
