Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD1A74BDB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 02:00:44 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id n9-v6so2608512pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 19:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Hf2jQTiXJWxz1MLlYUgAHkxk1bLTzE/i8haAHJZZzmk=;
	b=DEDBwZQkD0pWPkmiowi2ayiTWAmmLnCK90lDwIq4tjUpcAWjr7HLhJXvm+/IqvMDOe
	6U32urle3A0YES9yRHpOmRBA4viM6jhfS1T5CO+xul6VlY6aZ+/MngLkFbeApM0oDCMI
	MM59ZuuXNHMguLT3rQ4biTYC4/tXpAltCWZJEw0BDxYKUTboM6lSXBOIBc6dcxObEeV3
	vFmzH9opLyLcVeE97taPHFBkm1fqh2SQE+TVPQ5G2LxFtcC8cQmd26ne+9MODoY/DR6V
	Pa/0RINm056Wcd9oQDIy+I9FMzhlr16Vb/0R83h8oIZ2SiGsLJayQ0+szV05Hoju7ZpM
	OEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Hf2jQTiXJWxz1MLlYUgAHkxk1bLTzE/i8haAHJZZzmk=;
	b=H4+PX3L0DtpjKGfL38VsoPbwo2sCSbm2moi6qbBbThsblr7SxXBmZVXgzOjCNzVpys
	k7wd/ZZ5Ozyn5D1GiKqJbh1MMBJqzrj8h3qxbAhYQgYjo8rFMryoMFHOg7sxnZJlln4F
	yjA2l4OCEJ34kNJopbp7VbHmbuAUoa/Pu+HMXqzIMVx4y2ATTuk8BDjhTeUsuhAeJUKN
	F2gCL5dGMFEgfUaHdyDJvDyTunttxd1FmjEl2mHo4Q4n/rmKkUUtBIgwphahrW9mOO/n
	zXFjT3ZVFXGtFHcPSHep987hTsAcRx+jinJcR/x6M34WqmanfaZUDlmtHZ8u1Yd2niAh
	DWqQ==
X-Gm-Message-State: ALKqPwd40g5ygh+H3h7J7Lcz5qO0IaWB+c1PaKzOenEKBgpu+CKbmk7Q
	LzUt/3p1mxkXQ0Pl1p6wWt/8fPN8
X-Google-Smtp-Source: AB8JxZoe2cGuZptMnJRiOrVQMH1iVBl0QVppkfP9EQt0jbjg4EmYDZJyvp/otYZe+C6JM3wdtMhx2g==
X-Received: by 2002:a63:7807:: with SMTP id
	t7-v6mr5861585pgc.125.1526608845675; 
	Thu, 17 May 2018 19:00:45 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:50cf:a971:a3cb:56ce])
	by smtp.gmail.com with ESMTPSA id
	p24-v6sm12395562pfk.58.2018.05.17.19.00.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 19:00:45 -0700 (PDT)
To: Joe Slater <joe.slater@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20180517160131.131994-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3ef325ca-9814-2ce0-b4fe-d4f783f97807@gmail.com>
Date: Thu, 17 May 2018 19:00:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180517160131.131994-1-joe.slater@windriver.com>
Subject: Re: [meta-networking][PATCH 1/1] postfix: add dependencies needed for glibc 2.27
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
X-List-Received-Date: Fri, 18 May 2018 02:00:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joe

This is already fixed by

https://patchwork.openembedded.org/patch/150602/

which is in queue for merge.

On 5/17/18 9:01 AM, Joe Slater wrote:
> We need a dependency on libnsl2.  The libnsl2-native dependency
> is not strictly speaking necessary until the host glibc moves to 2.27.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta-networking/recipes-daemons/postfix/postfix.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 09447d5..d8c7295 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -6,11 +6,11 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
>   
>   HOMEPAGE= "http://www.postfix.org"
>   SECTION = "mail"
> -DEPENDS = "db icu libpcre openssl postfix-native \
> +DEPENDS = "db icu libpcre libnsl2 openssl postfix-native \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
>   "
> -DEPENDS_class-native = "db-native icu-native openssl-native libpcre-native"
> +DEPENDS_class-native = "db-native icu-native openssl-native libpcre-native libnsl2-native"
>   
>   LICENSE = "IPL-1.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
> 

