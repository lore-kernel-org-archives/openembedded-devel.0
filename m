Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.6124.1621739506963340429
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 20:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSKuc9iC;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id q67so946339pfb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 20:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZNW61iiaXERn9H9Bc/WLzcyJL0tK8n9qd9vBOnnqbzE=;
        b=KSKuc9iCFti4kIYlNDB6Ta1KgnqbiNFSWB7K6DCbXopYAS23eYDvkdAm6GWmDQ3jB9
         iYUU4bfE4KFYn9Yn+6/vvQMuWAXoRcT6ankz18b+nUgxdePilIGfqgwbOybby+VziRnG
         4cKGiVFE4jFah2thg/OZJGHVmWqcA+EaxA8QssLbyrNTYk3N1oX+CncL0k1AMipFS99b
         6ongJomOhWcef0eFdXO2THfV5xn+70eGITCI+Rd7tK7BZ/UhUy35QtO+ZelHE/ZJH5TX
         9/aObS0Q/trlKmLFQr3KFVzM+e9mEbYAFSCpz6A4cJEm2MzODO/m9x3Y6U7aFK1U14z9
         zqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZNW61iiaXERn9H9Bc/WLzcyJL0tK8n9qd9vBOnnqbzE=;
        b=Ajbl1AxbDLFU+2A1Er8vF8cUkC2BNEZxHtdGm3M81pBmrGAwcUhch2T9WfPqlYryWL
         Hftr8eaIW3ctbh8kgEhflCUCfJseAJP+RwYaGOvE/UrXOKoF6ueygjxufUZbXb25Kg9m
         vYkFhwQ2TQLh+Yi4DKVPLbk9BDZ/9G2Pf34msYJsyIu/ugOGnZYBO76j7YkZLMtRhSWZ
         CJIlmHyGgmpSIZ61Y7/mr2dPYx69M8Cg8ao5FU78GXewGUKJiD0//e5KD1XY72kEXiez
         23KZrwpBF+ngnRgKmyT/NeXdMkHpa9G7TjnPjCkbnnDUWe/YPOKssfg5l37NEaY7g4Cn
         WDeA==
X-Gm-Message-State: AOAM532UZKruCvomqL7Ff0BVcN7N14x7f6hLTAl2jd/5e3zB/zzOPDAy
	Duj0dNkXQloT26dXmLzkZJ7FQ7RVz2DSXw==
X-Google-Smtp-Source: ABdhPJwephfZ/5hfw8RfItUmrKhgw4lMLgkbQr9hvW5JTGn7mVORQqM5h2Y2Lrf4CmFwj8amGNpvfg==
X-Received: by 2002:a05:6a00:706:b029:217:9e8d:f9cc with SMTP id 6-20020a056a000706b02902179e8df9ccmr18228552pfl.1.1621739506131;
        Sat, 22 May 2021 20:11:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d04c? ([2601:646:9200:a0f0::d04c])
        by smtp.gmail.com with ESMTPSA id c130sm7599656pfc.51.2021.05.22.20.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 20:11:45 -0700 (PDT)
Subject: Re: hardknott merge request May 22th
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <b9a1ed01-587d-bd43-52dc-6386b1b463aa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <86d7db45-00ae-1561-5358-b04786feae00@gmail.com>
Date: Sat, 22 May 2021 20:11:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b9a1ed01-587d-bd43-52dc-6386b1b463aa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

this is now merged thanks

On 5/22/21 12:04 PM, akuster808 wrote:
> The following changes since commit bbe3855ec7d7e1417a42e9d7a4d1d3d338812088:
> 
>    ostree: switch from default master branch to main to fix do_fetch
> failure (2021-05-13 21:37:32 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to cf5bd6a8308108b4313a1e45ce8aa87e73125bf9:
> 
>    xfce4-settings: upgrade 4.16.0 -> 4.16.1 (2021-05-17 07:18:41 -0700)
> 
> ----------------------------------------------------------------
> Andreas Müller (2):
>        zsh: reduce priority slightly to avoid conflict with bash
>        xfce4-settings: upgrade 4.16.0 -> 4.16.1
> 
> Khem Raj (3):
>        aom: Match the name for AOM-Patent-License-1.0
>        libdevmapper,lvm2: Do not inherit license
>        python3-jinja2_2.%.bbappend: Delete
> 
> Saul Wold (2):
>        tbb: Disable PPC as COMPATIBLE_MACHINE
>        packagegroup-meta-oe: conditional remove tbb for powerpc
> 
> Silcet (1):
>        ufw: fix python shebang
> 
> zangrc (3):
>        fetchmail: upgrade 6.4.18 -> 6.4.19
>        openvpn: upgrade 2.5.1 -> 2.5.2
>        wireshark: upgrade 3.4.4 -> 3.4.5
> 
>   meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb             |  2 +-
>   .../ufw/ufw/fix-dynamic-update-of-python-shebang.patch          | 57
> +++++++++++++++++++++++++++++
>   meta-networking/recipes-connectivity/ufw/ufw_0.33.bb            |  1 +
>   .../fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb}      |  4 +-
>   .../openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb}              |  4 +-
>   .../wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb}        |  2 +-
>   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb      |  2 +-
>   meta-oe/recipes-shells/zsh/zsh_5.4.2.bb                         |  2 +-
>   meta-oe/recipes-support/lvm2/lvm2.inc                           |  5 +--
>   meta-oe/recipes-support/tbb/tbb_2021.2.0.bb                     |  3 ++
>   meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend | 13
> -------
>   .../{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb}      |  2 +-
>   12 files changed, 72 insertions(+), 25 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch
>   rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.18.bb
> => fetchmail_6.4.19.bb} (83%)
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.5.1.bb =>
> openvpn_2.5.2.bb} (95%)
>   rename meta-networking/recipes-support/wireshark/{wireshark_3.4.4.bb =>
> wireshark_3.4.5.bb} (97%)
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
>   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.0.bb
> => xfce4-settings_4.16.1.bb} (93%)
> 
