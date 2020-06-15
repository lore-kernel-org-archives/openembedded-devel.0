Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.20134.1592232996473631498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 07:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z4eRlvZ5;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id b5so7915287pfp.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=dTqyAn22aFL5D3MTQmetP7MZPc6pT1jgSot+yWFTX7k=;
        b=Z4eRlvZ5OP4psmB+WO9xvj5vAIqdHx+uYuJaXgIp3Un7EWWXC+hMF/PxJ1+VcQBGto
         V73oIK7GXLGnBh5flXu9wl/z+n7BDAohVuNUlFctf2Sg2ovQ126sqEI4El/TcWWaP3cA
         AbcHY+mACSKroKRL28xWCGPNl+S+M/KD1/dITQIp4j0jRdBC0WyheTlduXFB7OG1TnCM
         L0RK0M2VkJBAFBJb4b/pHq/m0+Koqh3kfPy+unCVNFD+HF64D5ZQI+ZQU358ExNwSPCx
         TirgJ8f5Vhnyw5HSvoZHcTGX1T522taGhaMjEHkI/Cno7hZhAkM031O4hACwVig3qlIO
         xAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=dTqyAn22aFL5D3MTQmetP7MZPc6pT1jgSot+yWFTX7k=;
        b=s8DgLaaDlEGbFKP0ofx7uL5OGaC1cIWgSThBqiutoe/WJfxVMLa4plCuWT+r0pDDIj
         oK4742YXANpW+ClGO4JzEp7+GsyqVR52Iknvk6098pywu7ioPe1jDfhFSyAzcWr2iBd3
         nf3pAQlJgHU5WHWxOCEHcAAtoz32pLT7DhdXNQqI9xSdrbFoWeE2RY6zp1b1YW25CU+E
         zXrx3YhIJFK92u9GIPoD3MQ3HDeePsTtJ8MZS4Bi+uuLZoAgopDSu0hrkxa2K5CIYaed
         Qv7WVhfDQ+2j32HiFdUbNasgoi3Fxa8iwPx4Wk2me+AI6WJpS83ed04lZBfjO98xADUq
         ddWg==
X-Gm-Message-State: AOAM531bDn5EUfuOtnYaeuLFw7lNKGbX3gvmrYM4vRpcygcwWwz0e4wx
	O6re47Dc8UmGV/MAFRC8cMYsbDd5
X-Google-Smtp-Source: ABdhPJxU+1EevVss+DkLySrCPoOl4zj9jTCxT/LI+MGpg7dNDrAHOQHG58guWEYptqp/n79RYQZcag==
X-Received: by 2002:aa7:9a5d:: with SMTP id x29mr22597294pfj.65.1592232995638;
        Mon, 15 Jun 2020 07:56:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e920:50fc:4b6a:daf0? ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id k12sm14070285pfk.219.2020.06.15.07.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 07:56:34 -0700 (PDT)
Subject: Re: [oe] [dunfell 00/27] Merge request #3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1591886131.git.akuster808@gmail.com>
 <CAMKF1so4fDkW6eitZgDgPua2MdxAk5Q8tMLTXbySMT3+=XYzKQ@mail.gmail.com>
 <d2b73e4b-2462-e6cd-4a1b-067c5c3f8de3@gmail.com>
 <CAMKF1sqVJOtM2jg94XA8TxEX8OhWEvP9Rb+5g7TwBF3MQzu4=g@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f32efa91-fd98-0a0a-2437-0c189e0e7e76@gmail.com>
Date: Mon, 15 Jun 2020 07:56:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqVJOtM2jg94XA8TxEX8OhWEvP9Rb+5g7TwBF3MQzu4=g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------FC2C051A9E610B558D92DF9D"
Content-Language: en-US

--------------FC2C051A9E610B558D92DF9D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 6/14/20 6:51 PM, Khem Raj wrote:
>
>
> On Sun, Jun 14, 2020 at 7:48 AM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 6/11/20 11:52 AM, Khem Raj wrote:
>     > On Thu, Jun 11, 2020 at 7:38 AM akuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>> wrote:
>     >> Please merge these changes to dunfell
>     >> Cover letter only
>     >>
>     >> The following changes since commit
>     cc155826b0b4f202a8fa4ac103b7c38368d32734:
>     >>
>     >>   thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)
>     >>
>     >> are available in the Git repository at:
>     >>
>     >>   git://git.openembedded.org/meta-openembedded
>     <http://git.openembedded.org/meta-openembedded> dunfell-next
>     >> 
>      http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next
>     >>
>     >> Adrian Bunk (1):
>     >>   python3-docutils: Remove, moved to OE-core
>     >>
>     >> Andreas Müller (1):
>     >>   fluidsynth: upgrade 2.1.2 -> 2.1.3
>     >>
>     >> Denys Dmytriyenko (2):
>     >>   python3-pycryptodome(x): moved to OE-Core, remove from
>     meta-python
>     >>   python3-pyelftools: moved to OE-Core, remove from meta-python
>     >>
>     >> Domarys Correa (1):
>     >>   python3-pyyaml: Update 5.3 -> 5.3.1
>     >>
>     >> Hongxu Jia (1):
>     >>   multipath-tools: fix compiling parallel issue
>     >>
>     >> Kai Kang (1):
>     >>   plymouth: disable systemd-integration for sysvinit
>     >>
>     >> Khem Raj (1):
>     >>   dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs
>     > this is not needed. Since relevant change in core is going to
>     reverted
>     > I plan to revert it in master of meta-oe too.
>
>     Do i need to resend the merge request?
>
>
> No are you ready with it now ?

Thanks,
Armin
>
>
>
>     - armin
>     >> Konrad Weihmann (6):
>     >>   passwdqc: remove double modify operation
>     >>   sound-theme-freedesktop: remove double depends
>     >>   python3-cmd2: remove double colorama in RDEPENDS
>     >>   python3-smbus2: remove duplicate RDEPENDS settings
>     >>   python3-twisted: remove double var modification
>     >>   proftpd: Fix typo for SRC_URI[md5sum]
>     >>
>     >> Leon Anavi (1):
>     >>   python3-colorama: Upgrade 0.4.1 -> 0.4.3
>     >>
>     >> Maciej Pijanowski (1):
>     >>   qpdf: fix typo in RDEPENDS
>     >>
>     >> Martin Jansa (2):
>     >>   irssi: package libirc_proxy.a in PN-staticdev
>     >>   meta-python: depend on core version 12 or higher
>     >>
>     >> Patrick Williams (1):
>     >>   net-snmp: refresh patches
>     >>
>     >> Zang Ruochen (4):
>     >>   libgphoto2: upgrade 2.5.24 -> 2.5.25
>     >>   mosquitto: upgrade 1.6.9 -> 1.6.10
>     >>   snort: upgrade 2.9.15 -> 2.9.16
>     >>   wireshark: upgrade 3.2.2 -> 3.2.4
>     >>
>     >> Zheng Ruoqin (4):
>     >>   nano: upgrade 4.9.2 -> 4.9.3
>     >>   gsoap: upgrade 2.8.100 -> 2.8.103
>     >>   logwatch: upgrade 7.5.1 -> 7.5.3
>     >>   libnet-dns-perl: upgrade 1.23 -> 1.24
>     >>
>     >>  .../fluidsynth/fluidsynth.inc                 |  4 +-
>     >>  ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++----
>     >>  ...mosquitto_1.6.9.bb <http://mosquitto_1.6.9.bb> =>
>     mosquitto_1.6.10.bb <http://mosquitto_1.6.10.bb>} |  4 +-
>     >>  ...deck-for-gettid-API-during-configure.patch | 48
>     -------------------
>     >>  .../{snort_2.9.15.bb <http://snort_2.9.15.bb> =>
>     snort_2.9.16.bb <http://snort_2.9.16.bb>}      |  5 +-
>     >>  .../recipes-daemons/proftpd/proftpd_1.3.6.bb
>     <http://proftpd_1.3.6.bb>  |  2 +-
>     >>  ...upport-for-building-applications-and.patch | 24 +++++-----
>     >>  .../0001-config_os_headers-Error-Fix.patch    | 10 ++--
>     >>  ...t-snmp-fix-compile-error-disable-des.patch | 14 +++---
>     >>  ...add-knob-whether-nlist.h-are-checked.patch | 15 +++---
>     >>  ...{wireshark_3.2.2.bb <http://wireshark_3.2.2.bb> =>
>     wireshark_3.2.4.bb <http://wireshark_3.2.4.bb>} |  4 +-
>     >>  .../recipes-connectivity/irssi/irssi_1.2.2.bb
>     <http://irssi_1.2.2.bb> |  2 +
>     >>  .../recipes-core/plymouth/plymouth_0.9.4.bb
>     <http://plymouth_0.9.4.bb>   |  2 +-
>     >>  .../{logwatch_7.5.1.bb <http://logwatch_7.5.1.bb> =>
>     logwatch_7.5.3.bb <http://logwatch_7.5.3.bb>}  |  4 +-
>     >>  ...gphoto2_2.5.24.bb <http://gphoto2_2.5.24.bb> =>
>     libgphoto2_2.5.25.bb <http://libgphoto2_2.5.25.bb>} |  4 +-
>     >>  .../sound-theme-freedesktop_0.8.bb
>     <http://sound-theme-freedesktop_0.8.bb>            |  2 +-
>     >>  meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
>     <http://qpdf_10.0.1.bb>  |  2 +-
>     >>  .../passwdqc/passwdqc_1.3.1.bb <http://passwdqc_1.3.1.bb>     
>               |  2 +-
>     >>  .../dfu-util/dfu-util-native_0.9.bb
>     <http://dfu-util-native_0.9.bb>           |  1 -
>     >>  .../{gsoap_2.8.100.bb <http://gsoap_2.8.100.bb> =>
>     gsoap_2.8.103.bb <http://gsoap_2.8.103.bb>}    |  4 +-
>     >>  ...add-explicit-dependency-on-libraries.patch | 40
>     ++++++++++++++++
>     >>  .../multipath-tools/multipath-tools_0.8.4.bb
>     <http://multipath-tools_0.8.4.bb>  |  1 +
>     >>  .../nano/{nano_4.9.2.bb <http://nano_4.9.2.bb> =>
>     nano_4.9.3.bb <http://nano_4.9.3.bb>}     |  4 +-
>     >>  ...s-perl_1.23.bb <http://s-perl_1.23.bb> =>
>     libnet-dns-perl_1.24.bb <http://libnet-dns-perl_1.24.bb>} |  4 +-
>     >>  meta-python/conf/layer.conf                   |  2 +-
>     >>  .../python/python-pycryptodome.inc            | 29 -----------
>     >>  .../python/python3-cmd2_0.9.23.bb
>     <http://python3-cmd2_0.9.23.bb>             |  1 -
>     >>  ...ama_0.4.1.bb <http://ama_0.4.1.bb> =>
>     python3-colorama_0.4.3.bb <http://python3-colorama_0.4.3.bb>} |  4 +-
>     >>  .../python/python3-docutils_0.15.2.bb
>     <http://python3-docutils_0.15.2.bb>         | 15 ------
>     >>  .../python/python3-pycryptodome_3.9.4.bb
>     <http://python3-pycryptodome_3.9.4.bb>      |  2 -
>     >>  .../python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>     | 10 ----
>     >>  .../python/python3-pyelftools_0.25.bb
>     <http://python3-pyelftools_0.25.bb>         | 14 ------
>     >>  .../python/python3-pyyaml_5.3.1.bb
>     <http://python3-pyyaml_5.3.1.bb>            | 18 +++++++
>     >>  .../python/python3-pyyaml_5.3.bb
>     <http://python3-pyyaml_5.3.bb>              | 19 --------
>     >>  .../python/python3-smbus2_0.3.0.bb
>     <http://python3-smbus2_0.3.0.bb>            |  2 -
>     >>  .../python/python3-twisted_19.10.0.bb
>     <http://python3-twisted_19.10.0.bb>         |  4 +-
>     >>  36 files changed, 144 insertions(+), 210 deletions(-)
>     >>  rename
>     meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.9.bb
>     <http://mosquitto_1.6.9.bb> => mosquitto_1.6.10.bb
>     <http://mosquitto_1.6.10.bb>} (95%)
>     >>  delete mode 100644
>     meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
>     >>  rename
>     meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb
>     <http://snort_2.9.15.bb> => snort_2.9.16.bb
>     <http://snort_2.9.16.bb>} (95%)
>     >>  rename
>     meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb
>     <http://wireshark_3.2.2.bb> => wireshark_3.2.4.bb
>     <http://wireshark_3.2.4.bb>} (95%)
>     >>  rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb
>     <http://logwatch_7.5.1.bb> => logwatch_7.5.3.bb
>     <http://logwatch_7.5.3.bb>} (95%)
>     >>  rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb
>     <http://libgphoto2_2.5.24.bb> => libgphoto2_2.5.25.bb
>     <http://libgphoto2_2.5.25.bb>} (91%)
>     >>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb
>     <http://gsoap_2.8.100.bb> => gsoap_2.8.103.bb
>     <http://gsoap_2.8.103.bb>} (89%)
>     >>  create mode 100644
>     meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
>     >>  rename meta-oe/recipes-support/nano/{nano_4.9.2.bb
>     <http://nano_4.9.2.bb> => nano_4.9.3.bb <http://nano_4.9.3.bb>} (80%)
>     >>  rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb
>     <http://libnet-dns-perl_1.23.bb> => libnet-dns-perl_1.24.bb
>     <http://libnet-dns-perl_1.24.bb>} (92%)
>     >>  delete mode 100644
>     meta-python/recipes-devtools/python/python-pycryptodome.inc
>     >>  rename
>     meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb
>     <http://python3-colorama_0.4.1.bb> => python3-colorama_0.4.3.bb
>     <http://python3-colorama_0.4.3.bb>} (61%)
>     >>  delete mode 100644
>     meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
>     <http://python3-docutils_0.15.2.bb>
>     >>  delete mode 100644
>     meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
>     <http://python3-pycryptodome_3.9.4.bb>
>     >>  delete mode 100644
>     meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>
>     >>  delete mode 100644
>     meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
>     <http://python3-pyelftools_0.25.bb>
>     >>  create mode 100644
>     meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
>     <http://python3-pyyaml_5.3.1.bb>
>     >>  delete mode 100644
>     meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
>     <http://python3-pyyaml_5.3.bb>
>     >>
>     >> --
>     >> 2.17.1
>     >>
>     >> 
>


--------------FC2C051A9E610B558D92DF9D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/14/20 6:51 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqVJOtM2jg94XA8TxEX8OhWEvP9Rb+5g7TwBF3MQzu4=g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sun, Jun 14, 2020 at 7:48
            AM akuster808 &lt;<a href="mailto:akuster808@gmail.com"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            On 6/11/20 11:52 AM, Khem Raj wrote:<br>
            &gt; On Thu, Jun 11, 2020 at 7:38 AM akuster &lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
            &gt;&gt; Please merge these changes to dunfell<br>
            &gt;&gt; Cover letter only<br>
            &gt;&gt;<br>
            &gt;&gt; The following changes since commit
            cc155826b0b4f202a8fa4ac103b7c38368d32734:<br>
            &gt;&gt;<br>
            &gt;&gt;   thunar: upgrade 1.8.14 -&gt; 1.8.15 (2020-05-28
            21:50:13 -0700)<br>
            &gt;&gt;<br>
            &gt;&gt; are available in the Git repository at:<br>
            &gt;&gt;<br>
            &gt;&gt;   git://<a
              href="http://git.openembedded.org/meta-openembedded"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.openembedded.org/meta-openembedded</a>
            dunfell-next<br>
            &gt;&gt;   <a
href="http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next</a><br>
            &gt;&gt;<br>
            &gt;&gt; Adrian Bunk (1):<br>
            &gt;&gt;   python3-docutils: Remove, moved to OE-core<br>
            &gt;&gt;<br>
            &gt;&gt; Andreas Müller (1):<br>
            &gt;&gt;   fluidsynth: upgrade 2.1.2 -&gt; 2.1.3<br>
            &gt;&gt;<br>
            &gt;&gt; Denys Dmytriyenko (2):<br>
            &gt;&gt;   python3-pycryptodome(x): moved to OE-Core, remove
            from meta-python<br>
            &gt;&gt;   python3-pyelftools: moved to OE-Core, remove from
            meta-python<br>
            &gt;&gt;<br>
            &gt;&gt; Domarys Correa (1):<br>
            &gt;&gt;   python3-pyyaml: Update 5.3 -&gt; 5.3.1<br>
            &gt;&gt;<br>
            &gt;&gt; Hongxu Jia (1):<br>
            &gt;&gt;   multipath-tools: fix compiling parallel issue<br>
            &gt;&gt;<br>
            &gt;&gt; Kai Kang (1):<br>
            &gt;&gt;   plymouth: disable systemd-integration for
            sysvinit<br>
            &gt;&gt;<br>
            &gt;&gt; Khem Raj (1):<br>
            &gt;&gt;   dfu-util-native: Remove DEPLOY_DIR_TOOLS from
            sstate-outputdirs<br>
            &gt; this is not needed. Since relevant change in core is
            going to reverted<br>
            &gt; I plan to revert it in master of meta-oe too.<br>
            <br>
            Do i need to resend the merge request?</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">No are you ready with it now ?</div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks,<br>
    Armin<br>
    <blockquote type="cite"
cite="mid:CAMKF1sqVJOtM2jg94XA8TxEX8OhWEvP9Rb+5g7TwBF3MQzu4=g@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            - armin<br>
            &gt;&gt; Konrad Weihmann (6):<br>
            &gt;&gt;   passwdqc: remove double modify operation<br>
            &gt;&gt;   sound-theme-freedesktop: remove double depends<br>
            &gt;&gt;   python3-cmd2: remove double colorama in RDEPENDS<br>
            &gt;&gt;   python3-smbus2: remove duplicate RDEPENDS
            settings<br>
            &gt;&gt;   python3-twisted: remove double var modification<br>
            &gt;&gt;   proftpd: Fix typo for SRC_URI[md5sum]<br>
            &gt;&gt;<br>
            &gt;&gt; Leon Anavi (1):<br>
            &gt;&gt;   python3-colorama: Upgrade 0.4.1 -&gt; 0.4.3<br>
            &gt;&gt;<br>
            &gt;&gt; Maciej Pijanowski (1):<br>
            &gt;&gt;   qpdf: fix typo in RDEPENDS<br>
            &gt;&gt;<br>
            &gt;&gt; Martin Jansa (2):<br>
            &gt;&gt;   irssi: package libirc_proxy.a in PN-staticdev<br>
            &gt;&gt;   meta-python: depend on core version 12 or higher<br>
            &gt;&gt;<br>
            &gt;&gt; Patrick Williams (1):<br>
            &gt;&gt;   net-snmp: refresh patches<br>
            &gt;&gt;<br>
            &gt;&gt; Zang Ruochen (4):<br>
            &gt;&gt;   libgphoto2: upgrade 2.5.24 -&gt; 2.5.25<br>
            &gt;&gt;   mosquitto: upgrade 1.6.9 -&gt; 1.6.10<br>
            &gt;&gt;   snort: upgrade 2.9.15 -&gt; 2.9.16<br>
            &gt;&gt;   wireshark: upgrade 3.2.2 -&gt; 3.2.4<br>
            &gt;&gt;<br>
            &gt;&gt; Zheng Ruoqin (4):<br>
            &gt;&gt;   nano: upgrade 4.9.2 -&gt; 4.9.3<br>
            &gt;&gt;   gsoap: upgrade 2.8.100 -&gt; 2.8.103<br>
            &gt;&gt;   logwatch: upgrade 7.5.1 -&gt; 7.5.3<br>
            &gt;&gt;   libnet-dns-perl: upgrade 1.23 -&gt; 1.24<br>
            &gt;&gt;<br>
            &gt;&gt;  .../fluidsynth/fluidsynth.inc                 |  4
            +-<br>
            &gt;&gt;  ...tables-helper-we-have-to-use-native-.patch | 32
            +++++++++----<br>
            &gt;&gt;  ...<a href="http://mosquitto_1.6.9.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">mosquitto_1.6.9.bb</a>
            =&gt; <a href="http://mosquitto_1.6.10.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">mosquitto_1.6.10.bb</a>}
            |  4 +-<br>
            &gt;&gt;  ...deck-for-gettid-API-during-configure.patch | 48
            -------------------<br>
            &gt;&gt;  .../{<a href="http://snort_2.9.15.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">snort_2.9.15.bb</a>
            =&gt; <a href="http://snort_2.9.16.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">snort_2.9.16.bb</a>} 
                |  5 +-<br>
            &gt;&gt;  .../recipes-daemons/proftpd/<a
              href="http://proftpd_1.3.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">proftpd_1.3.6.bb</a> 
            |  2 +-<br>
            &gt;&gt;  ...upport-for-building-applications-and.patch | 24
            +++++-----<br>
            &gt;&gt;  .../0001-config_os_headers-Error-Fix.patch    | 10
            ++--<br>
            &gt;&gt;  ...t-snmp-fix-compile-error-disable-des.patch | 14
            +++---<br>
            &gt;&gt;  ...add-knob-whether-nlist.h-are-checked.patch | 15
            +++---<br>
            &gt;&gt;  ...{<a href="http://wireshark_3.2.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">wireshark_3.2.2.bb</a>
            =&gt; <a href="http://wireshark_3.2.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">wireshark_3.2.4.bb</a>}
            |  4 +-<br>
            &gt;&gt;  .../recipes-connectivity/irssi/<a
              href="http://irssi_1.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">irssi_1.2.2.bb</a>
            |  2 +<br>
            &gt;&gt;  .../recipes-core/plymouth/<a
              href="http://plymouth_0.9.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">plymouth_0.9.4.bb</a> 
             |  2 +-<br>
            &gt;&gt;  .../{<a href="http://logwatch_7.5.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">logwatch_7.5.1.bb</a>
            =&gt; <a href="http://logwatch_7.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">logwatch_7.5.3.bb</a>} 
            |  4 +-<br>
            &gt;&gt;  ...<a href="http://gphoto2_2.5.24.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gphoto2_2.5.24.bb</a>
            =&gt; <a href="http://libgphoto2_2.5.25.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libgphoto2_2.5.25.bb</a>}
            |  4 +-<br>
            &gt;&gt;  .../<a
              href="http://sound-theme-freedesktop_0.8.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">sound-theme-freedesktop_0.8.bb</a> 
                      |  2 +-<br>
            &gt;&gt;  meta-oe/recipes-printing/qpdf/<a
              href="http://qpdf_10.0.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">qpdf_10.0.1.bb</a> 
            |  2 +-<br>
            &gt;&gt;  .../passwdqc/<a href="http://passwdqc_1.3.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">passwdqc_1.3.1.bb</a> 
                          |  2 +-<br>
            &gt;&gt;  .../dfu-util/<a
              href="http://dfu-util-native_0.9.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">dfu-util-native_0.9.bb</a> 
                     |  1 -<br>
            &gt;&gt;  .../{<a href="http://gsoap_2.8.100.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gsoap_2.8.100.bb</a>
            =&gt; <a href="http://gsoap_2.8.103.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gsoap_2.8.103.bb</a>} 
              |  4 +-<br>
            &gt;&gt;  ...add-explicit-dependency-on-libraries.patch | 40
            ++++++++++++++++<br>
            &gt;&gt;  .../multipath-tools/<a
              href="http://multipath-tools_0.8.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">multipath-tools_0.8.4.bb</a> 
            |  1 +<br>
            &gt;&gt;  .../nano/{<a href="http://nano_4.9.2.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">nano_4.9.2.bb</a>
            =&gt; <a href="http://nano_4.9.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">nano_4.9.3.bb</a>} 
               |  4 +-<br>
            &gt;&gt;  ...<a href="http://s-perl_1.23.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">s-perl_1.23.bb</a>
            =&gt; <a href="http://libnet-dns-perl_1.24.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libnet-dns-perl_1.24.bb</a>}
            |  4 +-<br>
            &gt;&gt;  meta-python/conf/layer.conf                   |  2
            +-<br>
            &gt;&gt;  .../python/python-pycryptodome.inc            | 29
            -----------<br>
            &gt;&gt;  .../python/<a href="http://python3-cmd2_0.9.23.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-cmd2_0.9.23.bb</a> 
                       |  1 -<br>
            &gt;&gt;  ...<a href="http://ama_0.4.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">ama_0.4.1.bb</a>
            =&gt; <a href="http://python3-colorama_0.4.3.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-colorama_0.4.3.bb</a>}
            |  4 +-<br>
            &gt;&gt;  .../python/<a
              href="http://python3-docutils_0.15.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-docutils_0.15.2.bb</a> 
                   | 15 ------<br>
            &gt;&gt;  .../python/<a
              href="http://python3-pycryptodome_3.9.4.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pycryptodome_3.9.4.bb</a> 
                |  2 -<br>
            &gt;&gt;  .../python/<a
              href="http://python3-pycryptodomex_3.9.4.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pycryptodomex_3.9.4.bb</a> 
               | 10 ----<br>
            &gt;&gt;  .../python/<a
              href="http://python3-pyelftools_0.25.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pyelftools_0.25.bb</a> 
                   | 14 ------<br>
            &gt;&gt;  .../python/<a
              href="http://python3-pyyaml_5.3.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pyyaml_5.3.1.bb</a> 
                      | 18 +++++++<br>
            &gt;&gt;  .../python/<a href="http://python3-pyyaml_5.3.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pyyaml_5.3.bb</a> 
                        | 19 --------<br>
            &gt;&gt;  .../python/<a
              href="http://python3-smbus2_0.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-smbus2_0.3.0.bb</a> 
                      |  2 -<br>
            &gt;&gt;  .../python/<a
              href="http://python3-twisted_19.10.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-twisted_19.10.0.bb</a> 
                   |  4 +-<br>
            &gt;&gt;  36 files changed, 144 insertions(+), 210
            deletions(-)<br>
            &gt;&gt;  rename
            meta-networking/recipes-connectivity/mosquitto/{<a
              href="http://mosquitto_1.6.9.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">mosquitto_1.6.9.bb</a>
            =&gt; <a href="http://mosquitto_1.6.10.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">mosquitto_1.6.10.bb</a>}
            (95%)<br>
            &gt;&gt;  delete mode 100644
meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch<br>
            &gt;&gt;  rename
            meta-networking/recipes-connectivity/snort/{<a
              href="http://snort_2.9.15.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">snort_2.9.15.bb</a>
            =&gt; <a href="http://snort_2.9.16.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">snort_2.9.16.bb</a>}
            (95%)<br>
            &gt;&gt;  rename meta-networking/recipes-support/wireshark/{<a
              href="http://wireshark_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">wireshark_3.2.2.bb</a>
            =&gt; <a href="http://wireshark_3.2.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">wireshark_3.2.4.bb</a>}
            (95%)<br>
            &gt;&gt;  rename meta-oe/recipes-extended/logwatch/{<a
              href="http://logwatch_7.5.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">logwatch_7.5.1.bb</a>
            =&gt; <a href="http://logwatch_7.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">logwatch_7.5.3.bb</a>}
            (95%)<br>
            &gt;&gt;  rename meta-oe/recipes-graphics/gphoto2/{<a
              href="http://libgphoto2_2.5.24.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libgphoto2_2.5.24.bb</a>
            =&gt; <a href="http://libgphoto2_2.5.25.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libgphoto2_2.5.25.bb</a>}
            (91%)<br>
            &gt;&gt;  rename meta-oe/recipes-support/gsoap/{<a
              href="http://gsoap_2.8.100.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gsoap_2.8.100.bb</a>
            =&gt; <a href="http://gsoap_2.8.103.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gsoap_2.8.103.bb</a>}
            (89%)<br>
            &gt;&gt;  create mode 100644
meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch<br>
            &gt;&gt;  rename meta-oe/recipes-support/nano/{<a
              href="http://nano_4.9.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">nano_4.9.2.bb</a>
            =&gt; <a href="http://nano_4.9.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">nano_4.9.3.bb</a>}
            (80%)<br>
            &gt;&gt;  rename meta-perl/recipes-perl/libnet/{<a
              href="http://libnet-dns-perl_1.23.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libnet-dns-perl_1.23.bb</a>
            =&gt; <a href="http://libnet-dns-perl_1.24.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libnet-dns-perl_1.24.bb</a>}
            (92%)<br>
            &gt;&gt;  delete mode 100644
            meta-python/recipes-devtools/python/python-pycryptodome.inc<br>
            &gt;&gt;  rename meta-python/recipes-devtools/python/{<a
              href="http://python3-colorama_0.4.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-colorama_0.4.1.bb</a>
            =&gt; <a href="http://python3-colorama_0.4.3.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-colorama_0.4.3.bb</a>}
            (61%)<br>
            &gt;&gt;  delete mode 100644
            meta-python/recipes-devtools/python/<a
              href="http://python3-docutils_0.15.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-docutils_0.15.2.bb</a><br>
            &gt;&gt;  delete mode 100644
            meta-python/recipes-devtools/python/<a
              href="http://python3-pycryptodome_3.9.4.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pycryptodome_3.9.4.bb</a><br>
            &gt;&gt;  delete mode 100644
            meta-python/recipes-devtools/python/<a
              href="http://python3-pycryptodomex_3.9.4.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pycryptodomex_3.9.4.bb</a><br>
            &gt;&gt;  delete mode 100644
            meta-python/recipes-devtools/python/<a
              href="http://python3-pyelftools_0.25.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pyelftools_0.25.bb</a><br>
            &gt;&gt;  create mode 100644
            meta-python/recipes-devtools/python/<a
              href="http://python3-pyyaml_5.3.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pyyaml_5.3.1.bb</a><br>
            &gt;&gt;  delete mode 100644
            meta-python/recipes-devtools/python/<a
              href="http://python3-pyyaml_5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-pyyaml_5.3.bb</a><br>
            &gt;&gt;<br>
            &gt;&gt; --<br>
            &gt;&gt; 2.17.1<br>
            &gt;&gt;<br>
            &gt;&gt; <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------FC2C051A9E610B558D92DF9D--
