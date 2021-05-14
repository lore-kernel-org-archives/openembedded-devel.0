Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.4572.1620967882798498199
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 21:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EZ/YooJC;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id a11so15638789plh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 21:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=iafSIYMMU0WlAqwoNLOi+1KStzYm6NdYH5C8rHJeXC0=;
        b=EZ/YooJCi2PJLxASJsBVj3MVx/goXvDe12E5WBQ4/y3qywjB4PbluPoUU97NJUvcCE
         4wLyO6nM/b6lI2QT5SNZ+TBGzPAcjHdEWTqln61kURrV6P5GnLLQca9dqIWSw9lGhIEi
         vvwk+49pIILfpfuB04MTACgOw9zgxhq0BwtrAAjRCrYCIMpFIpnG1hdpXd6mQQOERtYU
         YWeJgSrZQbdpgcduFQWY/KHwBa/MNnWdYVb89uxN2TbewrQU8E+i3fhqlo+EZ+N6NGde
         q4RYfji3xZyVbU5sdRDeJus6I4L+80i6oab7VFkdjAgfsOCH1IP5NRTQirzqu/qRSU+L
         eYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=iafSIYMMU0WlAqwoNLOi+1KStzYm6NdYH5C8rHJeXC0=;
        b=NACa5NHuHMjmkuRHvRhy+2ED/LN1xtcnGD2pqHs8dUwb5iaQ/0bpXWKXKKFj4vE3Rf
         h+LWEHryVk8L4LmJZHdx5Yn9ruB0C8cSvchLxeTuGtzeN4IRxDWsEtPOA++SL0Fo6YHB
         IieopNx7gNO6fl3k6zuhF3oxUnFFitp9FPkD/H+Bc1z4dH1HhWra70aj/N90xaXbStX9
         5we093uIACYyxNe/iYNsnTfn8ShKyW+nnl7wXOOzcLpTz0+O1kCYrlyiABT/d7JbOFYj
         z6yuMH+AnHI1kmHyrO7yf7etarnbX7lNXDHRS6tBlK3k79nnBwmcQu/RPjTORehmQcdb
         gV6A==
X-Gm-Message-State: AOAM531DibicAuuJL8viHRrxNxd2Fj2Hch64Ny5p/3D566GnvAsMmuwm
	/gEcNQwJdjsuy9WKlxTUfTU=
X-Google-Smtp-Source: ABdhPJxDL32nbwY03E/jxtMiLn6sNqdjdCdImLRohgz6oLoDXQ2RrAQ5Pm3sw9b1lqYFXRXwxGya9g==
X-Received: by 2002:a17:90b:2397:: with SMTP id mr23mr16930228pjb.77.1620967881778;
        Thu, 13 May 2021 21:51:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b? ([2601:202:4180:a5c0:e2:8f3f:6fa1:8a8b])
        by smtp.gmail.com with ESMTPSA id v8sm3151859pff.220.2021.05.13.21.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 21:51:21 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Gatesgarth merge request May 13th
Message-ID: <e50d9308-f329-4dc9-cf79-d439e3a0d3f1@gmail.com>
Date: Thu, 13 May 2021 21:51:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 70ee7293017c4f38fee71ffdb60e4713fdc88bcf:

  nodejs: 12.20.2 -> 12.21.0 (2021-04-29 21:41:27 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to f3f7a5f1a4713f145107bb043e0d14cb3a51c62f:

  ostree: switch from default master branch to main to fix do_fetch
failure (2021-05-13 21:44:45 -0700)

----------------------------------------------------------------
Martin Jansa (1):
      ostree: switch from default master branch to main to fix do_fetch
failure

 meta-oe/recipes-extended/ostree/ostree_2020.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

