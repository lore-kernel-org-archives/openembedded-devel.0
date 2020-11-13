Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.14656.1605231151998483187
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 17:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=FJROxruz;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.215.177, mailfrom: scott.branden@broadcom.com)
Received: by mail-pg1-f177.google.com with SMTP id i7so5778305pgh.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2020 17:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=ArnfR19jMQyKN1W94+9F4mg6zb1mw8WJLeNwB0kEE6o=;
        b=FJROxruz/Bf9fikHahz8CwjAATr74YiZLbMxo5G1ngMOTB5yAE52NdZU3/SzfNhsdJ
         pZQ8R1O7yYHI7c+NdSgn47mhgF2UCiWOfYhtD0B1pU1PBG7AHEED/7W9Rc1sOb4fa2nD
         YC7aL01NCN0bbg30qEqdsfzLXr3qkYfsvgRbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=ArnfR19jMQyKN1W94+9F4mg6zb1mw8WJLeNwB0kEE6o=;
        b=K8x4A7RFfKwzgWdDi0QUNmNWBIuYWkk4EA/HSj7k6exo4mNHR/RvSyuk4KRtuZNXsV
         QzZ+7b4+WFcfdpd3Pn2/+JTIHB0Q8s7UG4znqD0z0FeiPTsmdLJ/ff8QV/RsU+1t5WV4
         H5YFxMJYjKouEF7QnGqD6kS6TzDNEJzIqQKBWOSzRKWNlGcADfprXUd5u+OeoBvlY19Z
         R5Y21bYOpEfUHHonshJ3LYxjGJrCqfieLWFPoPuBdq7mIQU0GRieEY6EtgnUG5eFUq8F
         9Hl1PknB/hJoJbes3CukpJxVSJGdEcquC5ipoMvVb2n9L44JdhI1DBwYqUb49aZ5z4Z8
         rCqQ==
X-Gm-Message-State: AOAM5314L50CejgtdJq6nHu3OiEJZzlGtU6tUnTNjtymQb3F2xOS427f
	1qPHBosHJBkxuNs7ki/a2f07E2DduT2SKditYgOzujh3HHmfBn4ebTRrjRltVoY+pE6yMh5oeEL
	jN5NW7S0Jwr9SrRTlBitOsOP6R2LaCNhplYCt+zMsNEQG/PpDoUWNvjsnC5LXOcgi+GRrH/RdaB
	ETyptnI8zQnGZ2cwf2jhcDi1xDnaH7
X-Google-Smtp-Source: ABdhPJxbrgRbkv+67XyasC8Ta3szey2MriS8JeBcrTVSdty+TuiPIssOsHUyzT4swijoI2eOgUHzfA==
X-Received: by 2002:a65:520a:: with SMTP id o10mr104715pgp.319.1605231150896;
        Thu, 12 Nov 2020 17:32:30 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id i29sm7160443pgb.10.2020.11.12.17.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 17:32:30 -0800 (PST)
Subject: Re: [oe] all external kernel modules fail to compile with with poky and linux 5.10-rc1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <1787995e-ca28-2c7f-589d-de56b747b024@broadcom.com>
 <CADkTA4PTw6y8H5jTA8-b2FCHG3jKyj9hgxKR=9-zEhu0TH+ZGw@mail.gmail.com>
From: "Scott Branden" <scott.branden@broadcom.com>
Message-ID: <55be6468-f6a3-fb3e-5ec6-32cff9bc2dea@broadcom.com>
Date: Thu, 12 Nov 2020 17:32:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PTw6y8H5jTA8-b2FCHG3jKyj9hgxKR=9-zEhu0TH+ZGw@mail.gmail.com>
X-Groupsio-MsgNum: 87910
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000091b22f05b3f300dc"

--00000000000091b22f05b3f300dc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-CA

Hi Bruce,

On 2020-11-12 4:13 p.m., Bruce Ashfield wrote:
> On Thu, Nov 12, 2020 at 6:57 PM Scott Branden via
> lists.openembedded.org
> <scott.branden=broadcom.com@lists.openembedded.org> wrote:
>> It appears the all external modules fail to compile if you try using the 5.10-rc1 or later kernel due to this commit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=596b0474d3d9b1242eab713f84d8873f9887d980
>>
>> Has anyone tried to compile the latest kernel or has a fix for yocto?
> linux-yocto-dev is on v5.10-rc3, and is running without issues. That
> includes on-target and external module tests passing.
>
> That being said, there may be something different in the kernel
> recipes, or there's an artifact that we need to get into the kernel
> staging directory for what you are building.
>
> Is there a reproducer that you can send, so I can test against it ?
I'll have to look at linux-yocto-dev first then and see if I can reproduce it there tomorrow.  We don't use linux-yocto.

We have a multiconfig setup and devtool checkout our own linux kernel and set the STAGING_KERNEL_DIR to point to the checked out kernel (why STAGING_KERNEL_DIR needs to be set when we devtool checkout the kernel seems like it should automatically be done by devtool or something....).
Next, merge the latest kernel to our tree and try to build: bitbake mc:stingray:cryptodev-module (or any external kernel module) and the compile fails as such:

ERROR: mc:stingray:cryptodev-module-1.11-r0 do_compile: oe_runmake failed
ERROR: mc:stingray:cryptodev-module-1.11-r0 do_compile: Execution of '/mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/temp/run.do_compile.13766' failed with exit code 1:
make -C /mnt/2ndHDD/yocto/nxs/poky/build/workspace/sources/brcm-linux M=/mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git ARCH=arm64 CROSS_COMPILE=aarch64-poky-linux- modules
make[1]: Entering directory '/mnt/2ndHDD/yocto/nxs/poky/build/workspace/sources/brcm-linux'
make[2]: Entering directory '/mnt/2ndHDD/yocto/nxs/poky/build/tmp/work-shared/bcm958742k/kernel-build-artifacts'
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/ioctl.o
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/main.o
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/cryptlib.o
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/authenc.o
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/util.o
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/zc.o
  LD [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.o
  MODPOST /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/Module.symvers
make[4]: *** No rule to make target 'scripts/module.lds', needed by '/mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.  Stop.
make[4]: *** Waiting for unfinished jobs....
  CC [M]  /mnt/2ndHDD/yocto/nxs/poky/build/tmp/work/bcm958742k-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.mod.o
/mnt/2ndHDD/yocto/nxs/poky/build/workspace/sources/brcm-linux/scripts/Makefile.modpost:117: recipe for target '__modpost' failed
make[3]: *** [__modpost] Error 2
/mnt/2ndHDD/yocto/nxs/poky/build/workspace/sources/brcm-linux/Makefile:1703: recipe for target 'modules' failed
make[2]: *** [modules] Error 2
make[2]: Leaving directory '/mnt/2ndHDD/yocto/nxs/poky/build/tmp/work-shared/bcm958742k/kernel-build-artifacts'
Makefile:185: recipe for target '__sub-make' failed
make[1]: *** [__sub-make] Error 2
make[1]: Leaving directory '/mnt/2ndHDD/yocto/nxs/poky/build/workspace/sources/brcm-linux'
Makefile:27: recipe for target 'build' failed
make: *** [build] Error 2
WARNING: exit code 1 from a shell command.


If I revert the change highlighted in the kernel everything builds:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=596b0474d3d9b1242eab713f84d8873f9887d980
 






>
> Bruce
>
>
>
>> 
>>
>


--00000000000091b22f05b3f300dc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
I/3RRboOeC9M13VNr5feU91O0iDoMreAgPQJ0Lo7YrodKYug0Tt/fFDjkW3v3VIbEr2liUN69U0C
AwEAAaOCAdEwggHNMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUH
MAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNo
YTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3Nw
ZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1Ud
HwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hh
MmczLmNybDAlBgNVHREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUWOK7
qiyDSt/IDm/SRcNi/sTEiyswDQYJKoZIhvcNAQELBQADggEBAEe2edd4F9tpp0GPmrFrQ+xp9kY7
uxBzPdCw588bgVrPemjLwiwV37XTT4iWJtNhPfEpaguM6jeLm58LCvHq5/IBjcyHyf4URQVwAg7B
pqkH8/M+IBstu4/D+znPHB59X+c+au3Q8D+xoNFd7I30kaE+oJuBuFsGXRBc0Ci+FM86x9k7SF8U
aui1E7Y9wDfsRSCL2TSwU773f09WkrvVdlKxNqQZj2z7bQUUn+yfXdFfBz0LqlYNfn7xJOpQE3HI
H4jq6U9+b0Qf+J0n0wyysjXPSeQ7EKXVkT8dM2KSpIN86v5dd9LkAz3C1dmjuPRGEC8ZhI1IjMBt
0itrn6C23NsxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0g
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQg747rIFwn
SmIwZJSNohDtkMVbQIV6hVLRiGXWPFfg8zUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjAxMTEzMDEzMjMxWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADAGxNDciDtw/9PMw0ugGPv/YCc/
j+IeDk320Ht267DUbOuZE0lf2xhfcoMYC7gYv1MVh5enIA4VRqeFp8cy+O5NnrD6RhvGk6PP26eP
Z3n6LwLMiv8apF2VnkjFhV16Mu4TPqmkywT47QfV4QszvyXKuJrYR4FlHgJJr/LzVtO7h38lLndH
H0Vh4GguZaMVXHZFLuc6FsvGfq5sG0Mn5PN2X6POwN3hafrzKoYa00VeK7FOWNqz53sIIphS5wcm
xKctw+zu+EJcWOo0K6wym8/n5jAGLYGOqYQ2j2JwLS9Dqbpl4r+4eyZTWbaERQgyjXRS0s+QbLkb
Vm5YVA4LKzs=

--00000000000091b22f05b3f300dc--
