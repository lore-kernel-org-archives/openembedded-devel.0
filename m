Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.1755.1591753023794188889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 18:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vUuRNMST;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id m7so308647plt.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 18:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TxFk9O1QW8TXaejlZGUaMFChONly4v//DDI8c+XFSg8=;
        b=vUuRNMSTpBLN9pRBJSnDxbXgM2z9J+/mqA2N2aOcVbAvplsqQ0eBba/MAvufRYxURa
         wAJ32Kw7P4gwkaxZOs89yOvJ+UCWZxgmec6ukhdOUM6EnHBJrA45kgczuQQ8rE2dKhkS
         7PtuYx9SC1NxTJw3LbiJVRYgHHpjX0QBT/OicGvMrRfiqUQOAFXXJYqPAmruU4JhJ/by
         axNJ9OkAjClSWJ7YrsuORS1FGLW1SeHJd45gi098UnAVAtkYc2UctCedTfKtWu9Z90gT
         AqcngFLCC5qW3rPuxFKDHdPzDgB3zo/u2Arc+wn9SjAJHun0JHzZkVuJoQ36iBcUX1lc
         HlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=TxFk9O1QW8TXaejlZGUaMFChONly4v//DDI8c+XFSg8=;
        b=OTqT4G3CpbpE2U1tVrZi1DTMS5C7wxZPQwqj+KnHOezPbgTXOqwtd6N6mCF3KUrQjM
         s1P++OOry6qo/coaKtJr8eWVfbuOmynm4u3ypyZAfYvzVU5HaBmr0WGtk0x1xRCyo03N
         H4NnZ5YQfKRSTestQo6ISn2awGkf+ru+Xy1allqIfLI/O4Z5qcJqG2UWn8iE7Ewm/c7Z
         kHXfQhd4nkR7evEKtEuMe8Ll/cMxSuZYZpG7XkegGWiqiK7w93zCbmTRlioIU7sn54Z1
         3rcMrkTGjdlo+YN/yG8n0kUYGuYI2Xe47fVwdz2umq+y8KetVKpTgAAmEBt8Ap1xMO3C
         ChdA==
X-Gm-Message-State: AOAM533PWUduFK8bjvLKf5xD3VzgcdZXafgO1wTCv+XAnsPELxjh6G8O
	S0QZ6UHwHRkO8A60O6QflkfnfmQh
X-Google-Smtp-Source: ABdhPJznoAj5QYI7200uYQ733PysFg0ODRKMVGaZDjh0ZMBcyfOgVVDrNX27VeNf9atx13EmlJJlaA==
X-Received: by 2002:a17:90b:310e:: with SMTP id gc14mr620935pjb.35.1591753022957;
        Tue, 09 Jun 2020 18:37:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:254a:4327:67e1:d5be? ([2601:202:4180:a5c0:254a:4327:67e1:d5be])
        by smtp.gmail.com with ESMTPSA id u20sm11730844pfk.91.2020.06.09.18.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:37:02 -0700 (PDT)
Subject: Re: [oe] [dunfell 00/35] Merge Request
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <16158ACEBF1AD616.29014@lists.openembedded.org>
 <32b06ca1-94ba-0717-b070-d85865aae0fa@gmail.com>
 <CAMKF1spRgs1gFq90xdHvCQEbWpDeG7yYmo5DzrnmQer3Mje6eA@mail.gmail.com>
 <e85b6a9e-93c6-e25e-abf6-0cda6011746a@gmail.com>
 <CAMKF1sqM8--DwMr6wuV-M1LSw+MWMttJUmx=hYHSpcT4r6ZACQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d957f433-4c4c-63a2-f3be-dfe7e0e50724@gmail.com>
Date: Tue, 9 Jun 2020 18:37:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqM8--DwMr6wuV-M1LSw+MWMttJUmx=hYHSpcT4r6ZACQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/9/20 6:21 PM, Khem Raj wrote:
> On Tue, Jun 9, 2020 at 2:33 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 6/9/20 11:48 AM, Khem Raj wrote:
>>
>>
>>
>> On Tue, Jun 9, 2020 at 8:46 AM akuster <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 6/4/20 9:16 PM, akuster via lists.openembedded.org wrote:
>>>
>>> Ping.
>>>
>>> any issue with this merge request?
>>
>> I Am fine with these changes were you looking for wider feedback or is it ready to merge
>>
>>
>> Looking for it to be merged, this series was  from a review from last week.
>>
>> Not to be confused with the one sent out early this week.
>>
> Ah yes, I kind of squashed it in my mind.
Sorry. I was worried that may happen.
>  This one is merged now.

Thanks,
Armin
>
>> - armin
>>
>>
>>> -armin
>>>
>>> Please merge these changes to Dunfell
>>>
>>> Cover letter only
>>>
>>> The following changes since commit e413c1ef621688e69bb7830bb3151ed23b30b73e:
>>>
>>>   samba: upgrade 4.10.13 -> 4.10.15 (2020-05-20 16:50:45 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://git.openembedded.org/meta-openembedded dunfell-next
>>>   http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next
>>>
>>> Adrian Bunk (2):
>>>   unicode-ucd: Stop broken license downloading
>>>   postfix: Upgrade 3.4.10 -> 3.4.12
>>>
>>> Andreas Müller (2):
>>>   gexiv2: upgrade 0.12.0 -> 0.12.1
>>>   thunar: upgrade 1.8.14 -> 1.8.15
>>>
>>> Andrew Geissler (1):
>>>   nlohmann-json: backport gcc10 fix
>>>
>>> Armin Kuster (1):
>>>   tremor: update SRC_URI as project moved to gitlab
>>>
>>> Christoph Steiger (1):
>>>   python-periphery: Add python-mmap to RDEPENDS
>>>
>>> Domarys Correa (1):
>>>   python3-jinja2: Update 2.11.1 -> 2.11.2
>>>
>>> Kai Kang (3):
>>>   xfconf: 4.14.2 -> 4.14.3
>>>   thunar: 1.8.12 -> 1.8.14
>>>   catfish: 1.4.11 -> 1.4.13
>>>
>>> Khem Raj (4):
>>>   netplan: Depend on systemd if it is in distro
>>>   uim: Add patch to fix -fno-common link error
>>>   postfix: Upgrade to 3.4.10 and compile with -fcommon
>>>   safec: Update to latest on 3.5.1 release tags
>>>
>>> Leon Anavi (5):
>>>   python3-gmqtt: Upgrade to 0.6.5
>>>   python3-appdirs: Upgrade to 1.4.4
>>>   python3-pandas: Upgrade 1.0.1 -> 1.0.3
>>>   python3-parallax: Upgrade 1.0.5 -> 1.0.6
>>>   python3-openpyxl: Upgrade 2.6.3 -> 3.0.3
>>>
>>> Pierre-Jean Texier (3):
>>>   librsync: upgrade 2.3.0 -> 2.3.1
>>>   ser2net: fix upstream check URL
>>>   ser2net: upgrade 4.1.5 -> 4.1.8
>>>
>>> Trevor Gamblin (1):
>>>   python3-iso8601: add python3-numbers to RDEPENDS
>>>
>>> Wang Mingyu (4):
>>>   jansson: upgrade 2.12 -> 2.13.1
>>>   openldap: upgrade 2.4.49 -> 2.4.50
>>>   python3-pycparser: upgrade 2.19 -> 2.20
>>>   cryptsetup: upgrade 2.3.1 -> 2.3.2
>>>
>>> Yanfei Xu (1):
>>>   turbostat: fix the build failure for new v5.7-rc6 kernel
>>>
>>> Yi Zhao (1):
>>>   apache2: create log/run directory via pkg_postinst
>>>
>>> Zang Ruochen (2):
>>>   dnsmasq: upgrade 2.80 -> 2.81
>>>   fetchmail: upgrade 6.4.3 -> 6.4.4
>>>
>>> Zheng Ruoqin (3):
>>>   dstat: Fix runtime error that depend python.
>>>   kea: upgrade 1.7.6 -> 1.7.7
>>>   libqmi: upgrade 1.24.8 -> 1.24.12
>>>
>>>  .../{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb}    |  4 +-
>>>  .../tremor/tremor_20180319.bb                 |  2 +-
>>>  .../kea/{kea_1.7.6.bb => kea_1.7.7.bb}        |  4 +-
>>>  .../netplan/netplan_0.98.bb                   |  3 +-
>>>  ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------
>>>  .../{postfix_3.4.8.bb => postfix_3.4.12.bb}   |  5 +-
>>>  ...nsmasq-fix-build-against-5.2-headers.patch | 31 ------
>>>  ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 ---------
>>>  .../recipes-support/dnsmasq/dnsmasq_2.80.bb   | 10 --
>>>  .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |  8 ++
>>>  ...{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb} |  4 +-
>>>  .../{libqmi_1.24.8.bb => libqmi_1.24.12.bb}   |  3 +-
>>>  .../{ser2net_4.1.5.bb => ser2net_4.1.8.bb}    |  5 +-
>>>  ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 ------
>>>  .../safec/{safec_3.5.bb => safec_3.5.1.bb}    |  8 +-
>>>  ...ryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb} |  4 +-
>>>  ...latize-basic_json-ctor-from-json_ref.patch | 99 +++++++++++++++++++
>>>  .../nlohmann-json/0001-typo-fix.patch         | 43 ++++++++
>>>  .../nlohmann-json/nlohmann-json_3.7.3.bb      |  5 +-
>>>  .../{jansson_2.12.bb => jansson_2.13.1.bb}    |  6 +-
>>>  .../recipes-kernel/turbostat/turbostat_3.4.bb | 20 +++-
>>>  .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++
>>>  meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  4 +-
>>>  .../{librsync_2.3.0.bb => librsync_2.3.1.bb}  |  2 +-
>>>  ...{openldap_2.4.49.bb => openldap_2.4.50.bb} |  4 +-
>>>  .../uim/uim/JMP_BUF_GC_jmp_buf.patch          | 15 +++
>>>  meta-oe/recipes-support/uim/uim_1.8.8.bb      |  1 +
>>>  .../unicode-ucd/files/license.html            | 98 ++++++++++++++++++
>>>  .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
>>>  .../python/python-iso8601.inc                 |  1 +
>>>  .../python/python-periphery.inc               |  2 +
>>>  ...dirs_1.4.3.bb => python3-appdirs_1.4.4.bb} |  4 +-
>>>  ...-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} |  4 +-
>>>  .../python/python3-jinja2_2.11.1.bb           |  4 -
>>>  ...on-jinja2.inc => python3-jinja2_2.11.2.bb} | 40 +++++---
>>>  ...yxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} |  6 +-
>>>  .../python/python3-pandas_1.0.1.bb            |  2 -
>>>  ...hon-pandas.inc => python3-pandas_1.0.3.bb} |  6 +-
>>>  ...lax_1.0.5.bb => python3-parallax_1.0.6.bb} |  4 +-
>>>  ...rser_2.19.bb => python3-pycparser_2.20.bb} |  4 +-
>>>  .../recipes-httpd/apache2/apache2_2.4.43.bb   | 18 ++++
>>>  .../apache2/files/apache2-volatile.conf       |  2 +
>>>  .../apache2/files/apache2.service             |  4 -
>>>  .../recipes-httpd/apache2/files/init          |  5 -
>>>  .../apache2/files/volatiles.04_apache2        |  3 +
>>>  .../{catfish_1.4.11.bb => catfish_1.4.13.bb}  |  4 +-
>>>  .../{thunar_1.8.12.bb => thunar_1.8.15.bb}    |  4 +-
>>>  .../{xfconf_4.14.2.bb => xfconf_4.14.3.bb}    |  4 +-
>>>  48 files changed, 475 insertions(+), 246 deletions(-)
>>>  rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb} (69%)
>>>  rename meta-networking/recipes-connectivity/kea/{kea_1.7.6.bb => kea_1.7.7.bb} (94%)
>>>  delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
>>>  rename meta-networking/recipes-daemons/postfix/{postfix_3.4.8.bb => postfix_3.4.12.bb} (75%)
>>>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
>>>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
>>>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
>>>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
>>>  rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb} (86%)
>>>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.8.bb => libqmi_1.24.12.bb} (85%)
>>>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.5.bb => ser2net_4.1.8.bb} (69%)
>>>  delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
>>>  rename meta-oe/recipes-core/safec/{safec_3.5.bb => safec_3.5.1.bb} (59%)
>>>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb} (96%)
>>>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
>>>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
>>>  rename meta-oe/recipes-extended/jansson/{jansson_2.12.bb => jansson_2.13.1.bb} (60%)
>>>  create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
>>>  rename meta-oe/recipes-support/librsync/{librsync_2.3.0.bb => librsync_2.3.1.bb} (88%)
>>>  rename meta-oe/recipes-support/openldap/{openldap_2.4.49.bb => openldap_2.4.50.bb} (98%)
>>>  create mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
>>>  create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.html
>>>  rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb} (75%)
>>>  rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} (74%)
>>>  delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
>>>  rename meta-python/recipes-devtools/python/{python-jinja2.inc => python3-jinja2_2.11.2.bb} (44%)
>>>  rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} (70%)
>>>  delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
>>>  rename meta-python/recipes-devtools/python/{python-pandas.inc => python3-pandas_1.0.3.bb} (78%)
>>>  rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb} (72%)
>>>  rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb} (74%)
>>>  create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
>>>  create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
>>>  rename meta-xfce/recipes-apps/catfish/{catfish_1.4.11.bb => catfish_1.4.13.bb} (72%)
>>>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.12.bb => thunar_1.8.15.bb} (84%)
>>>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.2.bb => xfconf_4.14.3.bb} (83%)
>>>
>>>
>>>
>>> 
>>

