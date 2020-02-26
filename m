Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3478B60635
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 01:59:52 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ep11so566108pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 17:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xICTEIcCyte7d4TwH9ygZ86OUpcJG8ebnFLjTkqkQGg=;
	b=qgQLfkNTHfn16zXpWvTHhfOWq+hPb6A1KX5hWaqGPIsMOkYk27NguxM4RPgo/goAs+
	4lbjScW/d9uje3EEUdR5E69r9iE9EX/Mhp070d6M7TKILX1fMLkV9F5K/IkxU2/BSZIM
	aiIOYc5Oynj3FfeKH1XUAUfriUzFlh9bXgZ/wXPlsCnRa99ZN6lxuDHLSGN+Ftt4s1KJ
	0fd+ipG06wKp6+W3PsHLfuAbOKA1Xk1sGHIawweOFwDtvKWGlZvv6PqE0cfqjF/qgxkQ
	HPqYowLO2qugUw3XAaicp9rIxqKw9XZGqB9SfYSv/hdqfNt8zBg8s/IKuMDxjT4H6cgF
	XYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xICTEIcCyte7d4TwH9ygZ86OUpcJG8ebnFLjTkqkQGg=;
	b=hAshU6rH2DWlLt46Y5d2tc7zz1B+62NjNc6ZkLOze22BdVqkJmi8z4KrpZIoelYPKl
	X8yCoxwGq4+H6g3c4XN3KXUSrYVtGXlEhDtzS+yvV8s6p7Us9S9kuHLz2IccgiT7VbMg
	w/CAlBJNiTPf9LPkFYdoM8rtLmk/q0pH7HvGzDoEKwB1akW9HuenoSD4f3+7meewZVSs
	cHwW5p9np5vAKrVUBbMCHff5rbjOtIq8dTKtUWU4MfzThs2wfZSquhBwhojmp+QMl2bH
	MQoJCb0zRpW5kc02QoZa+I3iKq/xyne4C8y3Bkogw4wOwqYUaJxXZRca9t66dvx9KBVQ
	do0A==
X-Gm-Message-State: APjAAAVUaeDApjIKJRLNA/s6xs1ILAUV24E1bqyG0H+1wDbuW1N5ZwSD
	Cc6v1fPmWaPdZAUGSubU9cOAqSyeSYM=
X-Google-Smtp-Source: APXvYqz/xlFhvcRKvAuTBkh1qWOBOI4VJETGurpaf2+ip/m5yZW3r+PV9HZawozHoubSnHkv+LLh2w==
X-Received: by 2002:a17:90a:ead8:: with SMTP id
	ev24mr2208674pjb.91.1582682392700; 
	Tue, 25 Feb 2020 17:59:52 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:923a:5c32:ada4:3e27?
	([2601:646:9200:4e0:923a:5c32:ada4:3e27])
	by smtp.gmail.com with ESMTPSA id d4sm361063pjg.19.2020.02.25.17.59.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 17:59:52 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <158266574202.15681.9378221674340872770@git.openembedded.org>
	<20200225212222.A6EF3232AA5@git.openembedded.org>
	<CA+chaQci68OmMJZZddXkUSJXmTkxMGdQZ_87i3rOtfD7t38PGg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <81add210-35eb-1ecf-2528-c0e534595f4d@gmail.com>
Date: Tue, 25 Feb 2020 18:00:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQci68OmMJZZddXkUSJXmTkxMGdQZ_87i3rOtfD7t38PGg@mail.gmail.com>
Subject: Re: [oe-commits] [meta-openembedded] 09/10: c-ares: move from meta-networking to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2020 01:59:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/25/20 1:25 PM, Martin Jansa wrote:
> With this one included, you can drop "07/10: nodejs: don't enable ares
> support by default"
> 

yes it will be thanks

> On Tue, Feb 25, 2020 at 10:22 PM <git@git.openembedded.org
> <mailto:git@git.openembedded.org>> wrote:
> 
>     This is an automated email from the git hooks/post-receive script.
> 
>     khem pushed a commit to branch master-next
>     in repository meta-openembedded.
> 
>     commit d15fd2cfb6bcd2472a8b346cc6fe4bc070675d13
>     Author: Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>>
>     AuthorDate: Tue Feb 25 20:36:15 2020 +0100
> 
>         c-ares: move from meta-networking to meta-oe
> 
>         * nodejs from meta-oe depends on this since:
>           commit 76dd3dac1f1e67a5c44ad732b8e827cc36ded641
>           Author: André Draszik <git@andred.net <mailto:git@andred.net>>
>           Date:   Tue Oct 29 16:42:24 2019 +0000
> 
>             nodejs: allow use of system c-ares (and make default)
> 
>             Use system c-ares via PACKAGECONFIG by default. So far,
>             nodejs had been built using its embedded copy of c-ares,
>             which we generally try to avoid, for the known reasons
>             (independent updates, cve & license checks, etc).
> 
>             Notes:
>             * otherwise nodejs uses its bundled version of c-ares
>             * the PACKAGECONFIG variable is 'ares' so as to be in
>               line with other uses of this (wget & curl recipes in
>               OE core)
> 
>             Signed-off-by: André Draszik <git@andred.net
>     <mailto:git@andred.net>>
>             Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
> 
>         Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ---
>      .../recipes-core/packagegroups/packagegroup-meta-networking.bb
>     <http://packagegroup-meta-networking.bb>          | 2 +-
>      meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb>              | 2 +-
>      .../recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch 
>          | 0
>      {meta-networking =>
>     meta-oe}/recipes-support/c-ares/c-ares_1.15.0.bb
>     <http://c-ares_1.15.0.bb>    | 0
>      4 files changed, 2 insertions(+), 2 deletions(-)
> 
>     diff --git
>     a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
>     <http://packagegroup-meta-networking.bb>
>     b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
>     <http://packagegroup-meta-networking.bb>
>     index fa9bf2d..103c99b 100644
>     ---
>     a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
>     <http://packagegroup-meta-networking.bb>
>     +++
>     b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
>     <http://packagegroup-meta-networking.bb>
>     @@ -107,7 +107,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
>          tunctl dovecot ipvsadm stunnel chrony spice-protocol \
>          usbredir ntop wireshark tnftp lksctp-tools \
>          cim-schema-docs cim-schema-final cim-schema-exper \
>     -    libmemcached smcroute libtevent ipcalc c-ares uftp \
>     +    libmemcached smcroute libtevent ipcalc uftp \
>          ntimed linux-atm ssmtp openvpn rdma-core \
>          iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
>          netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
>     diff --git
>     a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb>
>     b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb>
>     index 0bda946..d096539 100644
>     --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb>
>     +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>     <http://packagegroup-meta-oe.bb>
>     @@ -238,7 +238,7 @@ NE10_armv7a = "ne10"
>      NE10_armv7ve = "ne10"
> 
>      RDEPENDS_packagegroup-meta-oe-support ="\
>     -    anthy asio atop augeas avro-c bdwgc frame grail \
>     +    anthy asio atop augeas avro-c bdwgc frame grail c-ares \
>          ccid ceres-solver ckermit cpprest ctapi-common daemonize \
>          daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
>          dstat eject enca epeg espeak fbset fbset-modes \
>     diff --git
>     a/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>     b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>     similarity index 100%
>     rename from
>     meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>     rename to
>     meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>     diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
>     <http://c-ares_1.15.0.bb>
>     b/meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
>     <http://c-ares_1.15.0.bb>
>     similarity index 100%
>     rename from meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
>     <http://c-ares_1.15.0.bb>
>     rename to meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
>     <http://c-ares_1.15.0.bb>
> 
>     -- 
>     To stop receiving notification emails like this one, please contact
>     the administrator of this repository.
>     -- 
>     _______________________________________________
>     Openembedded-commits mailing list
>     Openembedded-commits@lists.openembedded.org
>     <mailto:Openembedded-commits@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> 

