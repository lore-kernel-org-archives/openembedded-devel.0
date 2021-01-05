Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.198.1609867049473909545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 09:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X1qsOWtN;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id b5so15547pjk.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Jan 2021 09:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jam5h5zCdtxDTRCcB4UKyESlFqljouRc3pQSnp+jCdQ=;
        b=X1qsOWtNhravyC57oRLXx2nY+xmaPTrSw4lBXNkqIuJkpKn49+NdkzKQQolxWjGuSP
         AkjzizTzn8MxceLdlwfZ/gmDJybcJB9g0k68YfTZashjTq2tnFLxtX8M3qbeRiclGcNA
         JE4lakQnfbMrLB8CbIHU4jygYSkgCdSrrfcMV319BXrcoK0ttCMp74sM7/lpYfBucR2E
         m8LXx+yiE3PzXehLdKG3AgwNlyNrdECrXnFbRu4KytA2v/leCqp7IWyhZa2iXh1e3q6d
         DnfOnpVtF+zAOumF7/9uqP0EgqIvM7zM4PlJJx+LPrGdYCNjFKNQXlzvrz7t9ZvRitbO
         Bm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jam5h5zCdtxDTRCcB4UKyESlFqljouRc3pQSnp+jCdQ=;
        b=fgjbZblZRoHTaYPTP5yCL3tZOmSCUoJFq3z/I2uhsRXESm1amNNM6w+oeuIvC+8D8o
         dL7plZy6hBmlnak3Lbk3gGEpkdVZwq1wv6ls0Q7kVpbNynWFqThFGYiuO6rVmoRglB5H
         6bJaKjGe0J+DPjO+HmEs9hPG7uYBV0tvgz5+SomOWxx/l3cHiQCkBEVq2F/UapbyKmwY
         Ls8fXuwyWK4UuDhgbzOcG9dPhysJZg2/BsRaAv5dOpid0PHwTZ49+IxBCt11LKonye38
         dMuB8YYxiLSMGbhSTwXe4egTxwMl6XqImRzvBtBan8YSqfX08bw9gVHRReBNk5g0ZJ3G
         gb7A==
X-Gm-Message-State: AOAM533BOuG/KW3pxyVWqAb5uHbGwuG6QUcyQhFGUzwLvoH0DSZhFBuz
	yqI2s9NUv/d84FTqgK0LILoPO+fVNL2LoQ==
X-Google-Smtp-Source: ABdhPJyJqufp8qb07RsvdbSwKuMaJGzyM58eQjHRk9jeGiFSNpQfYuwtmWQ3O7wqeODbeO+mNml7Dw==
X-Received: by 2002:a17:90a:f00f:: with SMTP id bt15mr218026pjb.209.1609867048621;
        Tue, 05 Jan 2021 09:17:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::8fb0? ([2601:646:9200:a0f0::8fb0])
        by smtp.gmail.com with ESMTPSA id g6sm118342pjj.48.2021.01.05.09.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 09:17:28 -0800 (PST)
Subject: Re: [oe] [meta-networking][PATCH 2/3] etbales: remove upstream ebtables-legacy-save
To: Jose Quaresma <quaresma.jose@gmail.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201231090331.223784-1-yi.zhao@windriver.com>
 <20201231090331.223784-2-yi.zhao@windriver.com>
 <CANPvuRm7giL_om_Pdhus8Qe5teOSKmJgDxcEu8qoyGusqX55uA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <2a98d116-830e-e479-e75d-b2aa285f1743@gmail.com>
Date: Tue, 5 Jan 2021 09:17:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CANPvuRm7giL_om_Pdhus8Qe5teOSKmJgDxcEu8qoyGusqX55uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/5/21 2:58 AM, Jose Quaresma wrote:
> Hi,
> 
> Fix typo in commit message:
> 
> -[oe] [meta-networking][PATCH 2/3] etbales: remove upstream 
> ebtables-legacy-save
> +[oe] [meta-networking][PATCH 2/3] ebtables: remove upstream 
> ebtables-legacy-save

I gave edited in master-next

> 
> 
> Yi Zhao <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>> escreveu 
> no dia quinta, 31/12/2020 à(s) 09:03:
> 
>     Remove the upstream ebtables-legacy-save before we install the local
>     ones. And install it to ${sbindir} rather than ${base_sbindir}.
> 
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     ---
>       .../ebtables/ebtables-2.0.11/ebtables-legacy-save           | 2 +-
>       meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>     <http://ebtables_2.0.11.bb>  | 6 +++---
>       2 files changed, 4 insertions(+), 4 deletions(-)
>       mode change 100755 => 100644
>     meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
> 
>     diff --git
>     a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
>     b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
>     old mode 100755
>     new mode 100644
>     index 2d7fc4ed7..2133600f7
>     ---
>     a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
>     +++
>     b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-save
>     @@ -1,6 +1,6 @@
>       #!/bin/bash
> 
>     -EBTABLES="/sbin/ebtables"
>     +EBTABLES="/usr/sbin/ebtables-legacy"
> 
>       [ -x "$EBTABLES" ] || exit 1
> 
>     diff --git
>     a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>     <http://ebtables_2.0.11.bb>
>     b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>     <http://ebtables_2.0.11.bb>
>     index 08d4d661d..be21c372d 100644
>     --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>     <http://ebtables_2.0.11.bb>
>     +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>     <http://ebtables_2.0.11.bb>
>     @@ -28,11 +28,11 @@ do_install_append () {
>              #This file has been provided by netbase
>              rm -f ${D}${sysconfdir}/ethertypes
> 
>     -       install -d ${D}${base_sbindir}
>              # Replace upstream ebtables-save perl script with Fedora
>     bash based rewrite
>              #
>     http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
>     <http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save>
>     -       install -m 0755 ${WORKDIR}/ebtables-legacy-save
>     ${D}${base_sbindir}/ebtables-legacy-save
>     -       sed -i 's!/sbin/!${base_sbindir}/!g'
>     ${D}${base_sbindir}/ebtables-legacy-save
>     +       rm -f ${D}${sbindir}/ebtables-legacy-save
>     +       install -m 0755 ${WORKDIR}/ebtables-legacy-save
>     ${D}${sbindir}/ebtables-legacy-save
>     +
>              # Install systemd service files
>              if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>     'true', 'false', d)}; then
>                      install -d ${D}${systemd_unitdir}/system
>     -- 
>     2.25.1
> 
> 
> 
> 
> 
> 
> -- 
> best regards,
> José Quaresma
> 
> 
> 
> 
