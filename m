Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.8552.1631716199239279030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 07:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hiu9rKkL;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id g184so2900803pgc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=r2C6HWScnlg7j8gpDgJgOoJdU5bG+QlI2OzJq4bfP4A=;
        b=hiu9rKkLMsqY6+Uq5k81+8mIPAzGNYyobewiNOYfOj+wu3yXTyxIbMvbXBmgHAb768
         0ZisjrXGDHXWMrWQ3Y0ZLn4Uf37hRuZB72SCtANon4rpeLLpELfLq2z0KbCXBzeoJkkp
         PLx/sTJlpIlWqIF6YEnvlSExeRKGd9EzstTRBwykfd2SCp+OR9/dOg1gJU3Crqqyp5Z9
         8HMTGXRVSbDuwmSXxDfEl5fqIOXX7bEx4fXnJAW+ddPcGcPditrp46VEBUD8mryOOVSW
         Re877FCLWnQlaW2PayScy6TbT4oOO5GD5g+B44BdWSvMQ4JnhgP4Bgz4riNsU6kbNrhe
         xlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=r2C6HWScnlg7j8gpDgJgOoJdU5bG+QlI2OzJq4bfP4A=;
        b=ZYa5JweCKXs/7VIzS/5KPj5fSokIgPERyr+GTQn3rzxw25g3u6SXuEguYCS9v9DG8l
         uH/sCzTPu4WhLAlRJs/tC4PlMOaqkxzwsMuyT1Wrt5HHZDycqqNnVRW2np4Thd1tZwL6
         kcVbq2gQ/3QLJ+I3LlISvYbPMhP8/vu/chWawL/KSunDmY2oKjQFxpmMmusnAvP9dIlF
         7seX0JG4k2UOGVvDwTyl++nMCDcNUECOgDJFmVJW39fFETW4r+dsOst52+EJ+xnwJty6
         GH7h4yLVin9oLKInyWzpMtJDPOKmY6h7RQeqMR9J5iWqHtF4Mkyl95lg0ZCRP6UZx3o3
         BeIw==
X-Gm-Message-State: AOAM532mx7n+Zob7Q2bpFBWac45H3pDjtVT/bME2LOjRmm/ss8/zSX3j
	28lQofbc/WIdwey4KHl/jeA=
X-Google-Smtp-Source: ABdhPJzLh6kMH8hntIPHURrjNg7i7i4Brk/sWFVlQAHXkIVozFJArXEM2qCuxEryAv632xrZQQYmNQ==
X-Received: by 2002:a65:46cc:: with SMTP id n12mr79199pgr.274.1631716198734;
        Wed, 15 Sep 2021 07:29:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:35e:ec78:cef4:300f? ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id gn11sm4829323pjb.39.2021.09.15.07.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 07:29:58 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Dunfell merge request: Sept 15th
Message-ID: <9a4e3e32-8e32-c956-45eb-7c5e8cc11f42@gmail.com>
Date: Wed, 15 Sep 2021 07:29:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

he following changes since commit 5c347d8ce425dcb4896e6f873810b8bfff5e4e92:

  nss: Two Security fixes CVE-2020-6829 and 12400 (2021-09-05 11:54:45
-0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 2e7e98cd0cb82db214b13224c71134b9335a719b:

  dnsmasq: Security fix CVE-2021-3448 (2021-09-10 15:16:48 -0700)

----------------------------------------------------------------
Armin Kuster (1):
      dnsmasq: Security fix CVE-2021-3448

Pierre-Jean Texier (1):
      stunnel: upgrade 5.56 -> 5.57

Yi Zhao (1):
      krb5: fix CVE-2021-36222

 .../recipes-support/dnsmasq/dnsmasq/CVE-2021-3448.patch         | 1040
+++++++++++++++++++++++++++
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         |    1 +
 .../stunnel/{stunnel_5.56.bb => stunnel_5.57.bb}                |    5 +-
 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch     |  121 ++++
 meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb                |    1 +
 5 files changed, 1165 insertions(+), 3 deletions(-)
 create mode 100644
meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2021-3448.patch
 rename meta-networking/recipes-support/stunnel/{stunnel_5.56.bb =>
stunnel_5.57.bb} (86%)
 create mode 100644
meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch

