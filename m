Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.7941.1608018294948972634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j7xNiXA/;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id t37so14670956pga.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 23:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lb4GZUN5cYgTHuSmCOkpozbcSmzXbpN2Hr3dVjfj4V8=;
        b=j7xNiXA/rQf+JOz95wCXpgELxEV+mAvQ2V5Bebp7dG1AatEZPxIwjFyXh+C0CdP4sa
         vgzCcp5gfMIWjlcgZzghstre7fXOj6kCZceaAaZUGkXwHwBeEfi+3q26WTpJ2DVJw+vC
         nBhMzHx9UELYAT9q4KpK5sJJM7pcQgTpQL3+EgJPVdv9vngiHzQ7One9hYDR/L0iBKwk
         cwNkQWM7oSzp+RunX6gjRSiDDInvMv100KEK5SyvW1AmqRAYVF6FhxphjJtsgLvz8txo
         M6vPk9w9ip8ELeDDLDhvFixcmDrtbIxGumiC/wesebRCyCDHkY2LYAuOwsV0TRaa+bY9
         2/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lb4GZUN5cYgTHuSmCOkpozbcSmzXbpN2Hr3dVjfj4V8=;
        b=RloPcDq/37OnGhh4OCSQWozJc7+odqexNaJUiKaNpihBPEOcswt9P6CND2dPm5jbn6
         GCsOYyfbyr/SpORxaEsEnw5elQGWpPOyr3W1nKrSLOt8nGLr3YpfQfRKBD9h+CGEqeWL
         nOljQO5XxyAnULp/I6FscwNfDUak7ZZAWfgD11XT03JFj3D4W7KjviWndkMoT36WlV5S
         ZnsHVHSDKQDRWiq9JoAgJJNMlHsTc+EPie+l+Rg+GaR/VUZsWchge2Co25BfONivCYtj
         4yRTQhj8syONWW7dBR9Hp69XUlm4DpDBRNKMAI/fKgcMSUa+X0Tmjc+Qi87GF9EXg4ZZ
         DvBw==
X-Gm-Message-State: AOAM532p0Omo9weHtFCkU7WVsVri6TTqkyxb11aZDgu4PNsvwP4+tSu/
	HYZm96KOpcs1byS8dZHsllIXfphD/LUP7w==
X-Google-Smtp-Source: ABdhPJzubuYI5FUNTMgZpq5DfEWjQ2ha5achoenUW7exWhC7ETqs+bbu58/O8LN6ObkTa4IUc9NsKg==
X-Received: by 2002:a63:d354:: with SMTP id u20mr26216235pgi.344.1608018294143;
        Mon, 14 Dec 2020 23:44:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:d4b8:2f3a:109e:b8c6? ([2601:646:9200:4e0:d4b8:2f3a:109e:b8c6])
        by smtp.gmail.com with ESMTPSA id e5sm2168892pjs.0.2020.12.14.23.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 23:44:53 -0800 (PST)
Subject: Re: [oe] [PATCH v2] bitwise: add new recipe
To: Ramon Fried <rfried.dev@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20201215055226.1395-1-rfried.dev@gmail.com>
 <ded0788f-0501-f733-7d3f-267ceb9455f9@gmail.com>
 <CAGi-RULy-qSqH8XTgP9sv+XKaVOeOH38bnLizOb-6DWjy+P7Bw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <39d99e3a-b05c-6745-1375-2476da01396a@gmail.com>
Date: Mon, 14 Dec 2020 23:44:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RULy-qSqH8XTgP9sv+XKaVOeOH38bnLizOb-6DWjy+P7Bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 12/14/20 11:02 PM, Ramon Fried wrote:
> On Tue, Dec 15, 2020 at 8:20 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 12/14/20 9:52 PM, Ramon Fried wrote:
>>> Bitwise is multi base interactive calculator supporting
>>> dynamic base conversion and bit manipulation.
>>> It's a handy tool for low level hackers, kernel developers and
>>> device drivers developers.
>>>
>>> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
>>> ---
>>>    .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>>>    .../recipes-extended/bitwise/bitwise_0.41.bb  | 28 +++++++++++++++++++
>>>    2 files changed, 29 insertions(+)
>>>    create mode 100644 meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
>>>
>>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>> index 2c46d21b7..577f2e788 100644
>>> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>> @@ -307,6 +307,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TU
>>>    RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
>>>
>>>    RDEPENDS_packagegroup-meta-oe-extended ="\
>>> +     bitwise \
>>>        ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
>>>         brotli \
>>>         byacc \
>>> diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
>>> new file mode 100644
>>> index 000000000..2c4ffb1eb
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
>>> @@ -0,0 +1,28 @@
>>> +SUMMARY = "Bitwise terminal calculator"
>>> +DESCRIPTION = "Bitwise is multi base interactive calculator \
>>> +supporting dynamic base conversion and bit manipulation.\
>>> +It's a handy tool for low level hackers, \
>>> +kernel developers and device drivers developers."
>>> +
>>> +HOMEPAGE = "https://github.com/mellowcandle/bitwise"
>>> +SECTION = "console/utils"
>>> +
>>> +LICENSE = "GPLv3"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
>>> +
>>> +SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz"
>>> +SRC_URI[md5sum] = "62514cb4d26771eec56a54901299b09e"
>>> +SRC_URI[sha1sum] = "753662205db576f86de7ab89b303b6e411dcf04a"
>>> +SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
>>> +SRC_URI[sha384sum] = "ff15c72b60e71b2029d316688350ec07119b1b56e3c911d9bf3f23e3939d9f86d43853b9e812ad7ae7a002a71a559fb2"
>>> +SRC_URI[sha512sum] = "fc4a612d73bd34a20a87181420ca46549815a86c2861ad918a6539e3bf15230af5e534724f368080a2de0874deac7052e58075683fd32bce1ee070b777d24a9b"
>>
>> we only need SRC_URI[sha256sum] please delete rest of them.
> Sure.
>>
>>> +
>>> +UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
>>> +
>>> +S = "${WORKDIR}/${BPN}-v${PV}"
>>> +
>>> +DEPENDS = "ncurses readline"
>>> +
>>> +CFLAGS_prepend = "-I${S}/inc "
>>
>> I meant that you can avoid this by fixing the code with a patch like
>>
>> https://gist.github.com/kraj/1e5f8fb76705159afa4bb78a5a8f0311
> I don't mind, I can do both, whatever you prefer.

thanks then lets go with this patch

>>
>> this patch can be upstreamed as well, if you want to take it forward
>> feel free.
>>
>>> +
>>> +inherit autotools
>>>
>>>
>>>
>>> 
>>>
