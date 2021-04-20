Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.10900.1618926252540887347
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 06:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LEIbcl9m;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so30706739otf.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 06:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=O5oJXaG57zyx56XU0TGWAYHUd0ihRekamdeWe+9IXZg=;
        b=LEIbcl9mMxxMdeyvVDlSZgwfpsabaz7MJfJlpb27MQI8aM5ZyDXtDS3NQ2Iubmqwne
         O22GyQA2PCAFFr3IYJSrL3+cGnE7gIudJ6BtNBZTbi2LkgNNroEf0bghiGVVE9TWxna5
         E1JRKZEYi6mLsqSyTddNFUOuxJHi31/qi0dReFbogTYDKrn95IYKb1f3By0m2PUgJDXp
         ZWGWe/YQHpEh7VC60044uZSehAlu/BeOyoN5QnYd6O+OILOzINC9G4OUUhELY4cn9Oqq
         7ZzeFSWormiIGVHbxMmSxtd8Il96uw+IBd2ym8vinzmlf0mof+zj1b3ypprgpkfgYSvc
         zHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=O5oJXaG57zyx56XU0TGWAYHUd0ihRekamdeWe+9IXZg=;
        b=YfvoWkInuEP1wxdWt59kP5DhipzuzrOEMJ3DQsNbAoJjKgpMFo8xYyceMODaHW2BqA
         xC9i5TU+7NogiCgrw1TJ+ku7L4/RbVLD62Op8e+rKJUxxVhP0G4+OpNSpQ72cBRjH37H
         2/UiprKD3pEYiOBNrElhMdJ7x5BJUofpknwzLsUfiqoilrRO0a4iPIV7uA0HVpkDHiVB
         j8VglN8+C/mLr4ZTR7nJGi5Mq+7ud3jVHwkrB5d7dlePiEAJFN78uD2xoy7Ec1AuYswo
         3rS9Gmn6ZW7R5gyRFniVkmV820H+CoBjA7ezYkh7eCMrW+cGQpaYAjh5EYqcmSaw78NG
         rqPA==
X-Gm-Message-State: AOAM533OlT2wlMlO8uug4qjCOG4XZLpKZ7Kqqld4oCi0jY7PUB5ydHj/
	J1Wkp4qprl7/9Co//6wSHlo=
X-Google-Smtp-Source: ABdhPJy8XxbS5uk3jMjmKhFyn9HYi27vsJ8j5EY2vNXLGo6HFW01frwnvBBa4AvneIpx4WFX1+RcrQ==
X-Received: by 2002:a05:6830:1411:: with SMTP id v17mr19626542otp.87.1618926251896;
        Tue, 20 Apr 2021 06:44:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:eda2:54f2:452e:fbfe? ([2601:202:4180:a5c0:eda2:54f2:452e:fbfe])
        by smtp.gmail.com with ESMTPSA id r9sm1986809otn.64.2021.04.20.06.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 06:44:11 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Hardnott-next merge request April 20th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <74386e21-3620-1920-df78-d0225a66ea24@gmail.com>
Date: Tue, 20 Apr 2021 06:44:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 94fe80ce8609d62e51cc190595a9f0c2a4a5a89e:

  xterm: upgrade 366 -> 367 (2021-04-08 13:13:29 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 2297d4ee04b47bc574f8879732d9e213ab7bf685:

  wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)

----------------------------------------------------------------
Andreas Müller (2):
      catfish: add python3-dbus to RDEPENDS
      fluidsynth: upgrade 2.1.7 -> 2.2.0

Armin Kuster (1):
      wireguard: update to v1.0.20210219 +1

Hongxu Jia (1):
      debootstrap: 1.0.67 -> 1.0.123

Joe Hershberger (1):
      strongswan: Make PACKAGECONFIG a default value

Kamil Dziezyk (1):
      bats: upgrade 1.1.0 -> 1.3.0

Khem Raj (6):
      tbb: Fix build with musl
      core-image-minimal-xfce: Use graphical.target as default
      vnstat: Disable install parallism to fix a potential install race
      open-vm-tools: Fix build with gcc 11
      nss: Re-enable -Werror
      gimp: Disable vector icon generation on mips/glibc too

Leon Anavi (23):
      python3-ruamel-yaml: Upgrade 0.17.2 -> 0.17.4
      python3-croniter: Upgrade 1.0.10 -> 1.0.11
      python3-decorator: Upgrade 5.0.5 -> 5.0.6
      python3-grpcio-tools: Upgrade 1.36.1 -> 1.37.0
      python3-speedtest-cli: Upgrade 2.1.2 -> 2.1.3
      python3-python-vlc: Upgrade 3.0.11115 -> 3.0.12117
      python3-robotframework: Upgrade 4.0 -> 4.0.1
      python3-grpcio: Upgrade 1.36.1 -> 1.37.0
      python3-cerberus: Upgrade 1.3.2 -> 1.3.3
      python3-humanize: Upgrade 3.3.0 -> 3.4.0
      python3-monotonic: Upgrade 1.5 -> 1.6
      python3-sqlalchemy: Upgrade 1.4.6 -> 1.4.7
      python3-typed-ast: Upgrade 1.4.2 -> 1.4.3
      python3-backports-functools-lru-cache: Upgrade 1.6.3 -> 1.6.4
      python3-xmlschema: Upgrade 1.6.0 -> 1.6.1
      python3-pyroute2: Upgrade 0.5.17 -> 0.5.18
      python3-sympy: Upgrade 1.7.1 -> 1.8
      python3-pandas: Upgrade 1.2.3 -> 1.2.4
      python3-humanize: Upgrade 3.4.0 -> 3.4.1
      python3-decorator: Upgrade 5.0.6 -> 5.0.7
      python3-colorlog: Upgrade 4.8.0 -> 5.0.1
      python3-google-api-python-client: Upgrade 2.1.0 -> 2.2.0
      python3-croniter: Upgrade 1.0.11 -> 1.0.12

Martin Jansa (2):
      opencv: fetch wechat_qrcode files used by dnn PACKAGECONFIG
      opencv: link sfm module with Glog

Naveen Saini (2):
      tbb: upgrade 2020.3 -> 2021.2.0
      ocl-icd: upgrade 2.2.14 -> 2.3.0

Randy MacLeod (1):
      open-vm-tools: upgrade 11.0.1 -> 11.2.5

Ross Burton (1):
      fwts: upgrade to 21.03.00

Stefan Ghinea (1):
      hostapd: fix CVE-2021-30004

Vinícius Ossanes Aquino (2):
      modemmanager: upgrade 1.14.10 -> 1.16.2
      libqmi: upgrade 1.26.6 -> 1.28.2

Yi Fan Yu (4):
      redis: upgrade 6.0.9 -> 6.2.1
      syslog-ng: upgrade 3.24.1 -> 3.31.2
      syslog-ng: remove CONFIG_TLS override for arm DEBUG_BUILD
      syslog-ng: Drop an obsolete patch to add --enable-libnet

persianpros (5):
      PEP8 double aggressive E701, E70 and E502
      PEP8 double aggressive E20 and E211
      PEP8 double aggressive E22, E224, E241, E242 and E27
      PEP8 double aggressive E301 ~ E306
      PEP8 double aggressive W291 ~ W293 and W391

wangmy (1):
      uftrace: Fix error on aarch64 when binutils update to 2.35.1

zangrc (5):
      fuse3: upgrade 3.10.2 -> 3.10.3
      cifs-utils: upgrade 6.12 -> 6.13
      dnsmasq: upgrade 2.84 -> 2.85
      nbdkit: upgrade 1.25.5 -> 1.25.6
      wolfssl: upgrade 4.7.0 -> 4.7.1

zhengruoqin (5):
      python3-absl: upgrade 0.10.0 -> 0.12.0
      python3-astroid: upgrade 2.5.2 -> 2.5.3
      python3-bitarray: upgrade 1.9.1 -> 1.9.2
      irssi: upgrade 1.2.2 -> 1.2.3
      librsync: upgrade 2.3.1 -> 2.3.2

