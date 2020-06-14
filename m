Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.29469.1592146080854075131
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 07:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AGjGskm+;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id s88so5932255pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2020 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=W9TvqMeWImOrkMAnR/7VIepfhEnHpjQsz6xnIJ6RFwQ=;
        b=AGjGskm+zB3U5IYlM5379T9F6eCCsjm0H3QJjckLB4FG8yE/8b8y51Tn33cT16TL0e
         u2buho+GlrBKbgCnDDJOj8DWYk/ptip1zdsjW1gSy/vW4GaXno/PH6ybOGCicWp7N7b4
         uMc2vG7Vqt0njdWcnQGB+jzyyU846qQucJMkvZK3AKcUoLHQXivL5UtrkemO67kYMCDr
         r2wv/Xqat4DYOjN9cynOhFXmX+M/ko4hziJN4Fg553g6Iy38GHmyft4FLzfbopipeh0Y
         MxjP1FVwVE/rypMMjJauNqKtmLpx0E6iQQ5+cSdjUthS3yhBxp6YErZI3K92pvEU0MiT
         m4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=W9TvqMeWImOrkMAnR/7VIepfhEnHpjQsz6xnIJ6RFwQ=;
        b=g6pzyWLK1ED6TFqJFM0zfV49VV9TpNIYxq8qHYzObLKq8WTJMy7O5R71AmQiCW0Wu9
         EkyYPlhsk21A9xF2tE0rtPB5iKCupKYkzN1x98mFe4GQww436MzfcZ8tfeK1727qzY7H
         MyySOcIdJVU0aYMJmsJh+yzGkmBMijso7j34dx4TFZcXAz/LNHVoX3FNxMj0tlu5rHg+
         CDSSKuX/2vD9T+49Guxhi2qOz0J0aj0zfTHpR7nbWpPTbWeUPKNFUPOojmKOtmeIx6yQ
         K8hMXjUZSclCmkGPyJPTrpIaHYAjtmL9SaqtGswI4fyrD+y7daaIIELVrV3oxl1I1tah
         Q+Iw==
X-Gm-Message-State: AOAM53092DA6G/7tjwCPyNmq6TK1R39yHnQFstMHl4lbjurGo0mcaWW8
	UlcchDSj2QRXBqCdBvRG7tde6Dop
X-Google-Smtp-Source: ABdhPJxA9qrrZAoY8Zkp0J1SYQdLWf/SyO9KzfT62GMS4vqJ/dPWMB+7nTYo+0HOgWT8Inal9LRHFw==
X-Received: by 2002:a17:902:724a:: with SMTP id c10mr18564708pll.306.1592146079983;
        Sun, 14 Jun 2020 07:47:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:91d2:e8a2:8739:ccee? ([2601:202:4180:a5c0:91d2:e8a2:8739:ccee])
        by smtp.gmail.com with ESMTPSA id i67sm11232878pfb.82.2020.06.14.07.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2020 07:47:59 -0700 (PDT)
Subject: Re: [oe] [dunfell 00/27] Merge request #3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1591886131.git.akuster808@gmail.com>
 <CAMKF1so4fDkW6eitZgDgPua2MdxAk5Q8tMLTXbySMT3+=XYzKQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d2b73e4b-2462-e6cd-4a1b-067c5c3f8de3@gmail.com>
Date: Sun, 14 Jun 2020 07:47:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so4fDkW6eitZgDgPua2MdxAk5Q8tMLTXbySMT3+=XYzKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/11/20 11:52 AM, Khem Raj wrote:
> On Thu, Jun 11, 2020 at 7:38 AM akuster <akuster808@gmail.com> wrote:
>> Please merge these changes to dunfell
>> Cover letter only
>>
>> The following changes since commit cc155826b0b4f202a8fa4ac103b7c38368d32734:
>>
>>   thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded dunfell-next
>>   http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next
>>
>> Adrian Bunk (1):
>>   python3-docutils: Remove, moved to OE-core
>>
>> Andreas Müller (1):
>>   fluidsynth: upgrade 2.1.2 -> 2.1.3
>>
>> Denys Dmytriyenko (2):
>>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
>>   python3-pyelftools: moved to OE-Core, remove from meta-python
>>
>> Domarys Correa (1):
>>   python3-pyyaml: Update 5.3 -> 5.3.1
>>
>> Hongxu Jia (1):
>>   multipath-tools: fix compiling parallel issue
>>
>> Kai Kang (1):
>>   plymouth: disable systemd-integration for sysvinit
>>
>> Khem Raj (1):
>>   dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs
> this is not needed. Since relevant change in core is going to reverted
> I plan to revert it in master of meta-oe too.

Do i need to resend the merge request?

- armin
>> Konrad Weihmann (6):
>>   passwdqc: remove double modify operation
>>   sound-theme-freedesktop: remove double depends
>>   python3-cmd2: remove double colorama in RDEPENDS
>>   python3-smbus2: remove duplicate RDEPENDS settings
>>   python3-twisted: remove double var modification
>>   proftpd: Fix typo for SRC_URI[md5sum]
>>
>> Leon Anavi (1):
>>   python3-colorama: Upgrade 0.4.1 -> 0.4.3
>>
>> Maciej Pijanowski (1):
>>   qpdf: fix typo in RDEPENDS
>>
>> Martin Jansa (2):
>>   irssi: package libirc_proxy.a in PN-staticdev
>>   meta-python: depend on core version 12 or higher
>>
>> Patrick Williams (1):
>>   net-snmp: refresh patches
>>
>> Zang Ruochen (4):
>>   libgphoto2: upgrade 2.5.24 -> 2.5.25
>>   mosquitto: upgrade 1.6.9 -> 1.6.10
>>   snort: upgrade 2.9.15 -> 2.9.16
>>   wireshark: upgrade 3.2.2 -> 3.2.4
>>
>> Zheng Ruoqin (4):
>>   nano: upgrade 4.9.2 -> 4.9.3
>>   gsoap: upgrade 2.8.100 -> 2.8.103
>>   logwatch: upgrade 7.5.1 -> 7.5.3
>>   libnet-dns-perl: upgrade 1.23 -> 1.24
>>
>>  .../fluidsynth/fluidsynth.inc                 |  4 +-
>>  ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++----
>>  ...mosquitto_1.6.9.bb => mosquitto_1.6.10.bb} |  4 +-
>>  ...deck-for-gettid-API-during-configure.patch | 48 -------------------
>>  .../{snort_2.9.15.bb => snort_2.9.16.bb}      |  5 +-
>>  .../recipes-daemons/proftpd/proftpd_1.3.6.bb  |  2 +-
>>  ...upport-for-building-applications-and.patch | 24 +++++-----
>>  .../0001-config_os_headers-Error-Fix.patch    | 10 ++--
>>  ...t-snmp-fix-compile-error-disable-des.patch | 14 +++---
>>  ...add-knob-whether-nlist.h-are-checked.patch | 15 +++---
>>  ...{wireshark_3.2.2.bb => wireshark_3.2.4.bb} |  4 +-
>>  .../recipes-connectivity/irssi/irssi_1.2.2.bb |  2 +
>>  .../recipes-core/plymouth/plymouth_0.9.4.bb   |  2 +-
>>  .../{logwatch_7.5.1.bb => logwatch_7.5.3.bb}  |  4 +-
>>  ...gphoto2_2.5.24.bb => libgphoto2_2.5.25.bb} |  4 +-
>>  .../sound-theme-freedesktop_0.8.bb            |  2 +-
>>  meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb  |  2 +-
>>  .../passwdqc/passwdqc_1.3.1.bb                |  2 +-
>>  .../dfu-util/dfu-util-native_0.9.bb           |  1 -
>>  .../{gsoap_2.8.100.bb => gsoap_2.8.103.bb}    |  4 +-
>>  ...add-explicit-dependency-on-libraries.patch | 40 ++++++++++++++++
>>  .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
>>  .../nano/{nano_4.9.2.bb => nano_4.9.3.bb}     |  4 +-
>>  ...s-perl_1.23.bb => libnet-dns-perl_1.24.bb} |  4 +-
>>  meta-python/conf/layer.conf                   |  2 +-
>>  .../python/python-pycryptodome.inc            | 29 -----------
>>  .../python/python3-cmd2_0.9.23.bb             |  1 -
>>  ...ama_0.4.1.bb => python3-colorama_0.4.3.bb} |  4 +-
>>  .../python/python3-docutils_0.15.2.bb         | 15 ------
>>  .../python/python3-pycryptodome_3.9.4.bb      |  2 -
>>  .../python/python3-pycryptodomex_3.9.4.bb     | 10 ----
>>  .../python/python3-pyelftools_0.25.bb         | 14 ------
>>  .../python/python3-pyyaml_5.3.1.bb            | 18 +++++++
>>  .../python/python3-pyyaml_5.3.bb              | 19 --------
>>  .../python/python3-smbus2_0.3.0.bb            |  2 -
>>  .../python/python3-twisted_19.10.0.bb         |  4 +-
>>  36 files changed, 144 insertions(+), 210 deletions(-)
>>  rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.9.bb => mosquitto_1.6.10.bb} (95%)
>>  delete mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
>>  rename meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb => snort_2.9.16.bb} (95%)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb => wireshark_3.2.4.bb} (95%)
>>  rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb => logwatch_7.5.3.bb} (95%)
>>  rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb => libgphoto2_2.5.25.bb} (91%)
>>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb => gsoap_2.8.103.bb} (89%)
>>  create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
>>  rename meta-oe/recipes-support/nano/{nano_4.9.2.bb => nano_4.9.3.bb} (80%)
>>  rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb => libnet-dns-perl_1.24.bb} (92%)
>>  delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
>>  rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb} (61%)
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
>>
>> --
>> 2.17.1
>>
>> 

