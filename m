Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA35AC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 11:25:24 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.28722.1747567521560875970
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 04:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6YuzqhK;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ace333d5f7bso570029766b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747567520; x=1748172320; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CLRc7KXRjI59d5qMhWvnd7eqOCoMnh0VSbfNYJD4a6E=;
        b=j6YuzqhKZ3VpucV2kSXjIOg6tX4hbf9jOp33iHP++JNih8NG9idOATsm/AoL0fc17E
         UfPRGxl6LPeFjCRV0M20xHa14v+hVYlI0wWQsHM9huYHzkajAk4jVzyC8rBDIpJcGGP1
         PBcEZ0UknQ0BY6VsoO29WRnIdHQ3wk45qzNkw5xQ8DSZFQpsm/fQSPsRU6ZbT+5VmiGw
         Sj30Wo5w8460HEtxph1gL4BPJBEsFxx8/hGNnC9+QsXbYHQ2JM9gl/tz9na6z5zQTdgx
         Uz7yOgksi+OxV5vvX+iJvja5PtaS6AqA2MhP3jjqzd+DxHEajJnfdU82lmoaKufZr4Yo
         DxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567520; x=1748172320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLRc7KXRjI59d5qMhWvnd7eqOCoMnh0VSbfNYJD4a6E=;
        b=TCSeRv/SdfpakU9gAuhAlMWevhoOuvKfk5U0QjwBhvMxSkNUfFCtqW1B0s/qFekOpp
         816/nEEoUd+Mfv5DYaEyuAK15ja/bkI9LeeisKRYVI38nUsfQJ0FIGUMlTkqgR/qkjky
         gkKsmTKcphwq+fL8RoJisntBE+mDh3AYGvsYZ+4CP/1P6TzF/f/M4NY7zbpi2hI7mSCC
         1U8XKFK4eciKf5kbzoyAxczbORV17ARQWE3WUNFwFhw7AHbcRTbfybf362+6i03mNFFw
         fkzh+2XXFKpP0ccTOCGiojitrSI2WkOggGirn3Cw2bac7cWVXsFrTKaVTfCNVJqrVc5T
         bq6w==
X-Forwarded-Encrypted: i=1; AJvYcCUz2WtUxGGD+OfBhATXwV0g7JBKvLLOZFyn4MjqWTNbd7eNuycRk9fUfIEllGSb/RA9UJJMK2e+W1zdPl2OaI1qD8k=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaUJkn/CvNu0IWQXgXfkl94B2o95AAgbTfpqh8DcDkIIg5yLV1
	OXxtf4NGkHC1ykWtwZUw26mBrqDEWInyhPZdbXrTKELzsd2n6RIpDE0b
X-Gm-Gg: ASbGncvOvtRWs/J7+SWeqsE2TwuxT/6GVUn571Df10ifD/InM3sVGFO2UZxVV7vqhMY
	CDrFZpWfSkLr+E+JyUP39k6KBC7KuwncG3kygi50YjKfUYgpxkhErN9IwYq4QEXqV4La7nAsELs
	91lOA0TmQtFA8/b1DMA5GHuK4K2xZ2+73ATxAwsd3+BI6nDEbNkgg4UA4J07sN/FyO5hYdz637D
	ISwXi6xhB1HdS5NBrwyzZuGqc51/COECITidindDHsQZZ3AeHfJ6en33q8lOdqLjdyn86kfpfoG
	aXliiaofcwcMzm+UZydt3F8cgQHgWFCh60ejfdgza/5TROAptj2lIIsvJY4=
X-Google-Smtp-Source: AGHT+IGd2f4CXhcpv2KcND8HYxXk3nOig7fRwWEiP3HSzTeBP/ZLy9NiS+fdsnuusv1iSG91AXo/Ww==
X-Received: by 2002:a17:907:7da2:b0:ad4:d9c9:c758 with SMTP id a640c23a62f3a-ad536b7c8dfmr711839766b.11.1747567519481;
        Sun, 18 May 2025 04:25:19 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca827sm428445666b.163.2025.05.18.04.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 04:25:19 -0700 (PDT)
Message-ID: <b1ccf20b-e0f4-4129-a7b8-b2d82d060c11@gmail.com>
Date: Sun, 18 May 2025 13:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
To: chris.paterson2@renesas.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
 <18409A3613E810CF.2693@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18409A3613E810CF.2693@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 11:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117453

On 5/18/25 13:03, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 5/18/25 00:31, Chris Paterson via lists.openembedded.org wrote:
>> Hello,
>>
>> This is my first time submitting an issue to meta-openembedded, apologies if it's not the preferred format.
>>
>> # Issue summary
>> I'm trying to get yocto-layer-check to pass for a BSP meta-layer that depends on meta-openembedded/meta-oe.
>> However. it fails for the test_machine_signatures check for the Walnascar branch.
>>
>> Note that the test passes with Scarthgap.
>>
>> Three different packages seem to trigger the issue (worked out because if each is deleted the test passes):
>> * meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
>> * meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
>> * meta-oe/recipes-support/smarty/smarty_5.4.3.bb
>>
>>
>> # Steps to reproduce
>> I've reproduced the issue using machines from the meta-layer I'm working with [0] as well as qemuarm & qemuarm64.
>>
>> Check out dependency layers (poky, meta-openembedded, meta-arm)
>> source poky/oe-init-build-env
>> yocto-check-layer-wrapper ../meta-rz-bsp --dependency ../meta-openembedded/meta-oe ../poky/meta ../poky/meta-poky ../meta-arm/meta-arm ../meta-arm/meta-arm-toolchain/ --no-auto-dependency  --machines qemuarm qemuarm64
>>
>> [0] https://github.com/renesas-rz/rz-community-bsp (Walnascar branch not pushed yet)
>>
>>
>> # Example log
>> INFO: FAIL: test_machine_signatures (bsp.BSPCheckLayer.test_machine_signatures)                                                                                                            
>> INFO: ----------------------------------------------------------------------        
>> INFO: Traceback (most recent call last):                                                                                                                                                   
>>   File "/home/patersonc/work/rz-community-bsp/poky/scripts/lib/checklayer/cases/bsp.py", line 206, in test_machine_signatures
>>     self.fail('\n'.join(msg))                                                                                                                                                              
>> AssertionError: The machines have conflicting signatures for some shared tasks:       
>>    allarch smarty:do_package_qa: 416787047ca76d43b094860cf617234f957d11895e7b7be20cbe9203289f27e1 (hihope-rzg2h) != 1e482ffc1ead26bcd1f89d4dcf92e497dd6223933941b3ec6e483cb0072c9f5d (hihope-rzg2n)
>>    allarch spectre-meltdown-checker:do_package_qa: c6a667fa0b94c98ab0a22882ccb135063cf91e56d95200dc09d8d3e736d39478 (hihope-rzg2h) != 80aac380e472e717bf59392222093e33ee7dfab1683601c88a1e3e785835b8dc (hihope-rzg2n)
>>                                                                                              
>> 4 tasks where not listed because some other task of the recipe already differed.                                                                                                           
>> It is likely that differences from different recipes also have the same root cause.                                                                                                        
>>                                                                                              
>> To investigate, run bitbake-diffsigs -t recipename taskname -s fromsig tosig.                                                                                                              
>> Example: (hihope-rzg2h) != (hihope-rzg2n) in the last line         
>> Command: bitbake-diffsigs -t spectre-meltdown-checker do_package_qa -s c6a667fa0b94c98ab0a22882ccb135063cf91e56d95200dc09d8d3e736d39478 80aac380e472e717bf59392222093e33ee7dfab1683601c88a1e3e785835b8dc
>>    NOTE: Reconnecting to bitbake server...
>>    Hash for task dependency binutils:do_packagedata changed from a8e8aa500d5d99c24ee6889e11d2f2d86d1eb0faa42b777bfbc40c278acc14d3 to a3f446066cfca1799ebc96d8f9c29b9c3c574bbd8d0a864c35ab626fe9bcdf30
>>        Hash for task dependency binutils:do_package changed from 62a0df60c316310c111ae0290df55cbd1b003f73a8e9b4bfd6b2c14fbbb0be2a to 17c92c3ab2f3a1e17a5393af48c24896d8c16c61f254e51e82c2a5097135d292
>>            Hash for task dependency binutils:do_install changed from 2c16d297331a279bd665cb713c7c5267493917c19d6166e74c397b1b7502e40d to 83caf59fabb26c3acf6e9a1ca5fa6f487e6258765bd8886b74f9026a989a11cd
>>                Hash for task dependency binutils:do_compile changed from 3c72377ec56a75e514f6312b729f3c865f0a3751f10363edeb32a95f17a2697d to b3b6db1b73f5b52a28a3ac141e6b819bd07bdc5e658b18c76276db73f911e799
>>                    Hash for task dependency binutils:do_configure changed from cd53c81e1d46362c59ece6e482bfa50a91215f9240dfe1bfc9fad503b5b8dece to dbabddb01bcc620e96365a3fe631d5adb4e10b9e47e6460d29f971559cb53b63
>>                        Hash for task dependency binutils:do_deploy_source_date_epoch changed from a2bd1a2043978532caf40c589a8d703fb4d69dfe4fae5251ab0c13ac38f3f3a6 to 21148ea2ab02788c94aa3a19f95fffb26fbd5a8d1a40f015a3111122d77ef3eb
>>                            basehash changed from 683c7492fd7b4578defacc0ecd06661cdf345e467c9fa1879ed78cd13ad49a3c to da67890339ef0715eeeed4ebeca2a5fd0c7a597b6356e9f8a0ca2532561940ee      
>>                            Variable TUNE_CCARGS value changed:        
>>                            " [--mcpu=cortex-a57.cortex-a53+crc-] {+-mcpu=cortex-a57+crc+} -mbranch-protection=standard"
>>
> As the next step I would compare the development/history of TUNE_CCARGS
> for the two machines (while having meta-oe also in bblayers.conf):
> MACHINE=hihope-rzg2h bitbake -e binutils > machine1
> MACHINE=hihope-rzg2n bitbake -e binutils > machine2

Sorry for the spam - re-reading it, let me modify my mail a bit:
Instead of running these for different machines, run them with the same
machine, but with- and without having your custom layer in bblayer.conf,
and compare those TUNE_CCARGS values.

>
> The output should display all the variables, and their values, along
> with the reason/source of the value. I'd expect this to show why the
> value is different. (Beside binutils you could also check
> spectre-meltdown-checker. I think one of them should show the root cause
> of the failure - if the problem stems from meta-oe, this should
> hopefully also help us with showing the source of issue)
>
>> # Theories
>> Why do I think the issue is meta-oe and not meta-rz-bsp?
>> * Not a lot has changed in the bsp layer for the Walnascar upgrade and it was all fine for Kirkstone/Scarthgap.
>> * Creating a dummy bsp meta-layer (only containing a layers.conf and a machine definition) still produces the same error.
>>
>> I'm guessing that the BSP test cases from yocto-check-layer are not normally run over meta-oe as it's not a BSP layer. And presumably few other BSP layers have tried running the tests yet?
>> Both kernel-hardening-checker and spectre-meltdown-checker are new to Walnascar so maybe that why the issue hasn't been seen before.
>>
>>
>> Kind regards, Chris
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117452): https://lists.openembedded.org/g/openembedded-devel/message/117452
> Mute This Topic: https://lists.openembedded.org/mt/113168928/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


