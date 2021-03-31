Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.7170.1617199899436258620
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f4tkk4d1;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so1243836pjh.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Mar 2021 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5lULTALtYek0Nj0SLl0gVteolVUUAa3hz5YQHnzfGcA=;
        b=f4tkk4d1v1g7EvR3FH34ORYcI1g+1F7HNbcKO25AH51zxgOoLT5ipzOjMINdOTi01a
         fGAy925LQYt3+UQtFMtd9TIgLhXH3A5aTk3k6qZZqPCBHjDtWyiO3PiKPmnRpfb5LsS/
         MTUo/DuwHBDpKUol8tLPn59zpl9qne0r7AO0tijxuDLs6qBMG3ImBGUYhoeYU94grv4a
         WsM1sFbU11LeIuP3CW6XgNnHuNZu7t8S8dDfkOOUF+wL4kKaeFUe9sVPdszPw0Y948Q+
         5Z/qQdUWmPdj3hCjzB5WMpgl8wrcjEuPiMtV8qX8rmAIA01Qj1HvNFfjiPrtL3FkIeyS
         iB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5lULTALtYek0Nj0SLl0gVteolVUUAa3hz5YQHnzfGcA=;
        b=OuFNtxvCB2tO5pUgoEo5TdTE0CVmvuJOXqAyb8uEw0iZF+HY6eZw2NsXURClmZxkZp
         h9zzvWy8xrQ4BptSjh/GvGqpeY3Vamt2hkQ+NCIFjxWJ2VCqtrSXmYkYpo6nKn7JSrCV
         ZVceL6PfCHXrA6xg3jYieDaemCcV2J5DahpGTgDKkzK5AX5JrJNrV5TW3WFdFnasQJto
         xxcPgv60Rn2176bf4KFGGIOJSi4bpd5vY+CY+WL5Hm/mY4OOFrhiUOCbuEmLmuzt7CWq
         /hgw6YGBF/hZRmuu5Q+NYqii3Gu4/Hhmd+WGGU/kdtFnKVNZ+n6Aw8WPkyFYL2xTos0L
         bVMQ==
X-Gm-Message-State: AOAM5303s5w5bWiQfZcUB9T4R+MdnK0yYMYgKEoPK6LimVsPPaStZ/Mi
	h/in+W6UN5MHYSnwcyZtpnPgQAbGexoE9w==
X-Google-Smtp-Source: ABdhPJwi15QBsjlZ5CzlIIi5Mk76SSLny9ED6QBd9YSykwzugLe629QAfuOIcs+X08hq1eJOnPeBEA==
X-Received: by 2002:a17:90a:8913:: with SMTP id u19mr3666752pjn.59.1617199898275;
        Wed, 31 Mar 2021 07:11:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7c4e? ([2601:646:9200:a0f0::7c4e])
        by smtp.gmail.com with ESMTPSA id r22sm3064148pgu.81.2021.03.31.07.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 07:11:37 -0700 (PDT)
Subject: Re: [meta-oe][PATCH] debootstrap: 1.0.67 -> 1.0.123
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20210331084552.1743345-1-hongxu.jia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d7c8cbd0-6b49-e3ed-636b-68a1eac320fd@gmail.com>
Date: Wed, 31 Mar 2021 07:11:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331084552.1743345-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/31/21 1:45 AM, Hongxu Jia wrote:
> - Excise all devices.tar.gz code
> 
> - Use yocto vars to replace hardcoded dir to support native and nativesdk
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...-yocto-vars-to-replace-hardcoded-dir.patch |  39 ++++++++++++++++++
>   .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -> 0 bytes
>   .../debootstrap/debootstrap_1.0.123.bb        |  22 ++++++++++
>   .../debootstrap/debootstrap_1.0.67.bb         |  35 ----------------
>   4 files changed, 61 insertions(+), 35 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch
>   delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
>   create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
>   delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> 
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch
> new file mode 100644
> index 000000000..77f45e1bf
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-user-yocto-vars-to-replace-hardcoded-dir.patch
> @@ -0,0 +1,39 @@
> +From d780062d8d417bf2aefdf5f73c4b09a0eea4d097 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 31 Mar 2021 15:30:52 +0800
> +Subject: [PATCH] user yocto vars to replace hardcoded dir
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Makefile | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8516803..f183c7a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -5,14 +5,14 @@ all:
> +
> + clean:
> +
> +-DSDIR=$(DESTDIR)/usr/share/debootstrap
> ++DSDIR=$(DESTDIR)${datadir}/debootstrap
> + install:
> + 	mkdir -p $(DSDIR)/scripts
> +-	mkdir -p $(DESTDIR)/usr/sbin
> ++	mkdir -p $(DESTDIR)${sbindir}


I think using

sbindir ?= "/usr/sbin"
$(DESTDIR)$(sbindir)

here could make it upstreamable.

> +
> + 	cp -a scripts/* $(DSDIR)/scripts/
> + 	install -o root -g root -m 0644 functions $(DSDIR)/
> +
> +-	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)/usr/sbin/debootstrap
> +-	chown root:root $(DESTDIR)/usr/sbin/debootstrap
> +-	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
> ++	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)${sbindir}/debootstrap
> ++	chown root:root $(DESTDIR)${sbindir}/debootstrap
> ++	chmod 0755 $(DESTDIR)${sbindir}/debootstrap
> +--
> +2.27.0
> +
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz b/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
> deleted file mode 100644
> index 20eaba3ad22b1e47f6037dea2a0db73eb262ab25..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
> 
> literal 767
> zcmZwCeNfAB0LSqWmeAtza1IGwl2gu8?#%BF38A~LD<bo7h$gz-O%L*wNtiRbQnsk`
> z(3pqn#&sTlp0iDMQABENY{##e)U{2&eLs%Bz5jXr{SHz33;x#M&souaLK7WS=$o3O
> zXx$>ZsnQ25NgZhQuh6w=YnJPhSA_*FtCl6pGAj<PKe_LvYWpB{Z(CFF=|<g|kc_w7
> z?`-GPXd&0V`I^2X#r|-cu)U#Y?zq5hM`kwW@BS8ZS^bh#b}cRRrnE%5cOGWy!e#!&
> zo_Q|Y)^Blk6aQ|-GQOyuUOn~9A`}`d;uOb8k0lZJ7vOs#WB%p%Fz((I8j)YVl@8sB
> z)oNd!Qi@SVS~kOpjVKXKZewGuBvbwZTy89NwU^*c*W9OXvZQxqw`I*dTI=(3`b1G5
> z)5IAF_1DAnm>tjwtw&-whEU0bhh3G^$714fW_S;+>2E{qdMet5KqIYj-)Lh{ukV$_
> zD-qv-6PR!mNf>EIju8bM+wUlXaeX>{w5fqC(vwYIM%YP3Nz{E|{P|jsdH%sk4P>d6
> z99tZDjmGg>x;G+se=71kWJV?;eQaSbjz6~ywz=xO7g~sNLygAH)b_DMpIhQ>F2C92
> z@^5pwT0UmVSF%J!UAN~K2h++Jn0TAmU^Ra>SRx?iNz?vkqmVH2CW<%&Xb>2vW)(Ul
> z^f6INMqwv&Hq$aEo36eUfubL%Y9ta(Ynh#`rY^1O0Eac*A@wmAt-Wj}oy8WM!yyhs
> zu40fd4Ox4-na6gfyw*XgcwG89Ot6k;)}}*LinC#_$RY=MFFN4Gofwq*NT-hpM&9RP
> zpAP#fO_I0{JZeXnl!gb%sYKBgmHXh|8PfU4EWVCo)7==jgBQy&T1V$q+kL6!FnUF%
> zo(j|^dWhAlDp_bW6aGm)^+riUD={L7BiiioTiyj&UE09`UmU1%V&#rLi34eKTF8|i
> lg`pYfzz_{`no;0}G-+Dtic5)C{)_x|f?q~cv>;m`_yZJ@!>9lN
> 
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
> new file mode 100644
> index 000000000..7a8c220ed
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Install a Debian system into a subdirectory"
> +HOMEPAGE = "https://wiki.debian.org/Debootstrap"
> +SECTION = "devel"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
> +
> +SRC_URI  = "\
> +    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
> +    file://0001-user-yocto-vars-to-replace-hardcoded-dir.patch \
> +"
> +
> +SRC_URI[md5sum] = "b959c7ac01839e9b96a733d27b19e59e"
> +SRC_URI[sha256sum] = "5e5a8147ecdd6be0eea5ac4d6ed8192cc653e93f744dd3306c9b1cc51d6ca328"
> +
> +S = "${WORKDIR}/debootstrap"
> +

Add

EXTRA_OEMAKE = "sbindir=${sbindir}"
will ensure it gets overridden from env vars

> +fakeroot do_install() {
> +    oe_runmake 'DESTDIR=${D}' install
> +    chown -R root:root ${D}${datadir}/debootstrap
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> deleted file mode 100644
> index 8472aca6c..000000000
> --- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY = "Install a Debian system into a subdirectory"
> -HOMEPAGE = "https://wiki.debian.org/Debootstrap"
> -SECTION = "devel"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
> -
> -inherit pkgconfig
> -
> -SRC_URI  = "\
> -    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_1.0.67.tar.gz \
> -    file://devices.tar.gz;unpack=0 \
> -"
> -
> -SRC_URI[md5sum] = "eacabfe2e45415af60b1d74c3a23418a"
> -SRC_URI[sha256sum] = "0a12e0a2bbff185d47711a716b1f2734856100e8784361203e834fed0cffa51b"
> -
> -S = "${WORKDIR}/${BP}"
> -
> -# All Makefile does is creation of devices.tar.gz, which fails in OE build, we use
> -# static devices.tar.gz as work around
> -# | NOTE: make -j 8 -e MAKEFLAGS=
> -# | rm -rf dev
> -# | mkdir -p dev
> -# | chown 0:0 dev
> -# | chown: changing ownership of `dev': Operation not permitted
> -# | make: *** [devices.tar.gz] Error 1
> -# | WARNING: exit code 1 from a shell command.
> -do_compile_prepend() {
> -    cp ${WORKDIR}/devices.tar.gz ${B}
> -}
> -
> -do_install() {
> -    oe_runmake 'DESTDIR=${D}' install
> -    chown -R root:root ${D}${datadir}/debootstrap
> -}
> 
