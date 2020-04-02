Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.6693.1585798331638775722
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 20:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0323W8kC007411
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 1 Apr 2020 20:32:08 -0700 (PDT)
Received: from mt-manjaro (128.224.21.26) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Apr
 2020 20:32:07 -0700
References: <87o8sbf8e4.fsf@windriver.com> <87k12zeyre.fsf@windriver.com>
 <4bb66aea-66e2-7810-4986-f3ea63ed7992@gmail.com>
User-agent: mu4e 1.2.0; emacs 28.0.50
From: "Matthew" <matthew.zeng@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Matthew <matthew.zeng@windriver.com>,
        <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Regarding poppler auto PACKAGECONFIG when qt5-layer exists
Message-ID: <87v9mipo0t.fsf@windriver.com>
In-Reply-To: <4bb66aea-66e2-7810-4986-f3ea63ed7992@gmail.com>
Date: Wed, 1 Apr 2020 23:32:05 -0400
MIME-Version: 1.0
X-Originating-IP: [128.224.21.26]
Content-Type: text/plain


Khem Raj <raj.khem@gmail.com> writes:

> On 4/1/20 1:28 PM, Matthew wrote:
>> Hello,
>> In meta-oe/recipes-support/poppler/poppler_0.85.0.bb line 17, there
>> is the line
>>      PACKAGECONFIG ??= "jpeg openjpeg png tiff nss
>> ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '',
>> d)}"
>> Let's say I add meta-qt5 to bblayers.conf, but I don't plan to use
>> it immediately in a build. Therefore I haven't make any additional
>> change to local.conf.
>> However I will be receiving the following error when starting a
>> build:
>>      WARNING: qtbase is not whitelisted, figuring out PNWHITELIST...
>>      ERROR: Nothing PROVIDES 'qtbase' (but .../meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.85.0.bb DEPENDS on or otherwise requires it)
>> because PACKAGECONFIG is changed so it assumes I'll be using qt5. Is
>> this reasonable?
>>
>
> Yeah I think here the choice is dynamic, what happens if you add a
> bbappend where you do PACKAGECONFIG_remove = "qt5" does that work ?

Haven't test specifically, but this should work.

However I personally don't think it is reasonable to add a PACKAGECONFIG_remove line, or any line in local.conf for a layer that I don't plan to use immediately.
The layer is added to bblayers.conf because I can use it whenever I feel necessary for my build, but I don't think anything should be triggered based on bblayers.conf, it creates more confusion.

Matthew

>
>> --
>> Mingde (Matthew) Zeng
>>
>> 
>>


--
Mingde (Matthew) Zeng
