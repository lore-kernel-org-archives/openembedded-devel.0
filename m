Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.6621.1596897740236135999
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 07:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B+SmdFf5;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id kr4so2401370pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=my7jKdSi8uppvMEIM9BZGWxNWbcVoscV4uscRhGuzUE=;
        b=B+SmdFf5a/pGzkni44WW2VqNBq878UfiRLLqKQ6I9u0tWNchwzd76IrqM6j1ZHofnY
         HygMiyQRbc+TV916UMN3d5ubzcopYps8LDkb6Vegj5E8I8RlEDqNzOJPFj8RI7PWxgv3
         zrROzJwFz7mXJEYW0x8vNl10z/l2UsDE3DhxVIBnFBqZzWLsy1GM5vr5igNvTS2T+8Nc
         ViE6sdjhVg9Yws8go2uCO66klwG0BRJYpeAKwXHQiYmcjqYLFB8sjB+S8njOEg1cWePq
         WvgIQKYAYKg17D6yVFnpMzmefFUtXKocVMV3Lvoa/0ZnEJ2oALgVRH+NmRZ5DAruGVQu
         ZmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=my7jKdSi8uppvMEIM9BZGWxNWbcVoscV4uscRhGuzUE=;
        b=lnSE5NuFgJBYPzTXZLioTFmKqAcY4Lo3j9yNoS6ZHx0WlkRS4y7jqZ3GzUJm1w5XIX
         NJ15gQJh7k393a0i1T/R4G4tKxdgwA/7/otgGdC/EXmu7AdLFwVudoVQGvKFmzHnfpMc
         Zd0IIyyUMQ2vx6R+Xs7v3TMv7Tq1VlokleFFqhBdA6dgSUmKRanhj0z4SHSZn+niXDtC
         8RtJL00c8oAP/wIC5be7ZDQ30SizSMaiIYDEDB2eShve/WVt5bLBD4xWuqgsHGB/+ezN
         4TOBR1RNHODPzj+mOfWMl6ekAjAw8gzKycwjx/QfFg65YyjTpXWG4AnOGMF0uxc/tIeN
         6LYw==
X-Gm-Message-State: AOAM530w2bpAZurKcB98KR57Z8rbeG4oPsk+svxXbGDl3FbNZbi1exhn
	FwhnD4mI1La2Tbajbqh+lEjqMPly
X-Google-Smtp-Source: ABdhPJwBwzinBe9Q2WoapHLbpV7lmkq1uO5RonzLswW17ItBBWlAs3/8QeTrbvGhQZtVaNVoYOIiUw==
X-Received: by 2002:a17:90a:f18a:: with SMTP id bv10mr11138308pjb.106.1596897739453;
        Sat, 08 Aug 2020 07:42:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ddd8:1d38:7eb0:693c? ([2601:202:4180:a5c0:ddd8:1d38:7eb0:693c])
        by smtp.gmail.com with ESMTPSA id n12sm19010080pfj.99.2020.08.08.07.42.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2020 07:42:18 -0700 (PDT)
Subject: Re: [oe] [dunfell 00/21] Dunfell pull request 4/29
To: openembedded-devel@lists.openembedded.org
References: <16266581D00EA270.9059@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <238a96a5-6068-cd1a-6555-399cd9366656@gmail.com>
Date: Sat, 8 Aug 2020 07:42:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16266581D00EA270.9059@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------9F06C385D52E7DE28B452884"
Content-Language: en-US

--------------9F06C385D52E7DE28B452884
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/29/20 7:04 PM, akuster via lists.openembedded.org wrote:
> Cover letter only.
>
> Please merge this into dunfell.

Any issue for this pull request?

-armin
>
> The following changes since commit cc6fc6b1641ab23089c1e3bba11e0c6394f0867c:
>
>   ntp: update 4.2.8p15 (2020-07-01 08:01:41 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next
>
> Andreas Müller (3):
>   blueman: upgrade 2.1.1 -> 2.1.3
>   modemmanager: upgrade 1.12.10 -> 1.12.12
>   ibus: upgrade 1.5.21 -> 1.5.22
>
> Armin Kuster (4):
>   net-snmp: Security fix CVE-2019-20892
>   wireshark: Update to 3.2.5
>   Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
>   jsoncpp: add PE do to revert to older PV
>
> Bog999 (1):
>   python3: Add python3-cryptography to RDEPENDS for python3-redis
>
> Changqing Li (1):
>   libmcrypt: set CLEANBROKEN
>
> Khem Raj (1):
>   nss: Remove mcpu to avoid march conflicts
>
> Konrad Weihmann (1):
>   openldap: packaging fixes
>
> Ovidiu Panait (2):
>   freediameter: Fix testcnx ptest failure
>   nss: Fix CVE-2020-12399
>
> Pierre-Jean Texier (1):
>   minicoredumper: update SRC_URI to use github instead
>
> Qi.Chen@windriver.com (1):
>   multipath-tools: disable parallel build as a workaround
>
> Robert Yang (1):
>   drbd-utils: Add CLEANBROKEN to fix rebuild errors
>
> Zang Ruochen (1):
>   nftables: upgrade 0.9.5 -> 0.9.6
>
> Zheng Ruoqin (4):
>   Fix build error when enable multilib.
>   mraa: Disable python2, otherwise, there is a build error when enable
>     multilib.
>   paho-mqtt-c: Fix build error when enable multilib.
>   upm:Fix build error when enable multilib.
>
>  .../tracker/tracker-miners_2.3.3.bb           |   4 +
>  meta-gnome/recipes-support/ibus/ibus.inc      |   4 +-
>  .../{blueman_2.1.1.bb => blueman_2.1.3.bb}    |   3 +-
>  .../{nftables_0.9.5.bb => nftables_0.9.6.bb}  |   2 +-
>  .../0001-Fix-testcnx-expired-CA-data.patch    | 746 ++++++++++++++++++
>  .../freediameter/freediameter_1.3.2.bb        |   1 +
>  .../net-snmp/net-snmp/CVE-2019-20892.patch    | 118 +++
>  .../net-snmp/net-snmp_5.8.bb                  |   1 +
>  .../recipes-support/drbd/drbd-utils_9.12.0.bb |   2 +
>  ...{wireshark_3.2.4.bb => wireshark_3.2.5.bb} |   3 +-
>  ...ger_1.12.10.bb => modemmanager_1.12.12.bb} |   7 +-
>  .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb          |   4 +
>  .../libmcrypt/libmcrypt_2.5.8.bb              |   2 +
>  .../{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb}    |   4 +-
>  meta-oe/recipes-extended/mraa/mraa_git.bb     |   2 +-
>  meta-oe/recipes-extended/upm/upm_git.bb       |   4 +
>  .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
>  .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
>  ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 +++
>  meta-oe/recipes-support/nss/nss_3.51.1.bb     |   5 +
>  .../openldap/openldap_2.4.50.bb               |   4 +-
>  .../python/python3-redis_2.10.6.bb            |   1 +
>  22 files changed, 1013 insertions(+), 17 deletions(-)
>  rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb} (94%)
>  rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb} (93%)
>  create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-Fix-testcnx-expired-CA-data.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb} (93%)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb} (92%)
>  create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch
>
>
> 


--------------9F06C385D52E7DE28B452884
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/29/20 7:04 PM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16266581D00EA270.9059@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Cover letter only.

Please merge this into dunfell.</pre>
    </blockquote>
    <br>
    Any issue for this pull request?<br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:16266581D00EA270.9059@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

The following changes since commit cc6fc6b1641ab23089c1e3bba11e0c6394f0867c:

  ntp: update 4.2.8p15 (2020-07-01 08:01:41 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded dunfell-next
  <a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next">http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next</a>

Andreas Müller (3):
  blueman: upgrade 2.1.1 -&gt; 2.1.3
  modemmanager: upgrade 1.12.10 -&gt; 1.12.12
  ibus: upgrade 1.5.21 -&gt; 1.5.22

Armin Kuster (4):
  net-snmp: Security fix CVE-2019-20892
  wireshark: Update to 3.2.5
  Revert "jsoncpp: upgrade 1.9.2 -&gt; 1.9.3"
  jsoncpp: add PE do to revert to older PV

Bog999 (1):
  python3: Add python3-cryptography to RDEPENDS for python3-redis

Changqing Li (1):
  libmcrypt: set CLEANBROKEN

Khem Raj (1):
  nss: Remove mcpu to avoid march conflicts

Konrad Weihmann (1):
  openldap: packaging fixes

Ovidiu Panait (2):
  freediameter: Fix testcnx ptest failure
  nss: Fix CVE-2020-12399

Pierre-Jean Texier (1):
  minicoredumper: update SRC_URI to use github instead

<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a> (1):
  multipath-tools: disable parallel build as a workaround

Robert Yang (1):
  drbd-utils: Add CLEANBROKEN to fix rebuild errors

Zang Ruochen (1):
  nftables: upgrade 0.9.5 -&gt; 0.9.6

Zheng Ruoqin (4):
  Fix build error when enable multilib.
  mraa: Disable python2, otherwise, there is a build error when enable
    multilib.
  paho-mqtt-c: Fix build error when enable multilib.
  upm:Fix build error when enable multilib.

 .../tracker/tracker-miners_2.3.3.bb           |   4 +
 meta-gnome/recipes-support/ibus/ibus.inc      |   4 +-
 .../{blueman_2.1.1.bb =&gt; blueman_2.1.3.bb}    |   3 +-
 .../{nftables_0.9.5.bb =&gt; nftables_0.9.6.bb}  |   2 +-
 .../0001-Fix-testcnx-expired-CA-data.patch    | 746 ++++++++++++++++++
 .../freediameter/freediameter_1.3.2.bb        |   1 +
 .../net-snmp/net-snmp/CVE-2019-20892.patch    | 118 +++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 .../recipes-support/drbd/drbd-utils_9.12.0.bb |   2 +
 ...{wireshark_3.2.4.bb =&gt; wireshark_3.2.5.bb} |   3 +-
 ...ger_1.12.10.bb =&gt; modemmanager_1.12.12.bb} |   7 +-
 .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb          |   4 +
 .../libmcrypt/libmcrypt_2.5.8.bb              |   2 +
 .../{jsoncpp_1.9.3.bb =&gt; jsoncpp_1.9.2.bb}    |   4 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb     |   2 +-
 meta-oe/recipes-extended/upm/upm_git.bb       |   4 +
 .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 +++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   5 +
 .../openldap/openldap_2.4.50.bb               |   4 +-
 .../python/python3-redis_2.10.6.bb            |   1 +
 22 files changed, 1013 insertions(+), 17 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb =&gt; blueman_2.1.3.bb} (94%)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb =&gt; nftables_0.9.6.bb} (93%)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-Fix-testcnx-expired-CA-data.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb =&gt; wireshark_3.2.5.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.bb =&gt; modemmanager_1.12.12.bb} (93%)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb =&gt; jsoncpp_1.9.2.bb} (92%)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9F06C385D52E7DE28B452884--
