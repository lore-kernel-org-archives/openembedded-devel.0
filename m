Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 624656093E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 17:22:14 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id i6so19720954plt.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 09:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Gvjr5IBE5GSOD4UZ90c6144gD2Huh4edGlCWloh5TLM=;
	b=I9X7QMHwHnjNSIMua5+Gg3Mxhwe2MCmeZKL9WSlHywH9V2lrBJ9CnftuLNxk/Wf4TB
	ZgXxf0QHa2EKZaBt2CPZD/Mj8FIn2C1WElLnz9ZU5T79NnDt99DRG0HOSXxJf7+Xz7ov
	5HqdTDuKF1Q0/ou+2xDe2jur/yUo3m3Um6tSgSgPtSr9KqeHyKUF6u84cxWGvmlDuUMb
	zXgc0TADAvSPYJmvmR/prgRXuM/g8HPlUl//RKeWQ2mK7SywZ++VyAblKb8Q5nx1XIpu
	gBXnU+1e7gvS2elFzZHveNRS7qAIToEThIHtsCMZIyw9cu1gLW+FCSoMnzLp8lGZqfXE
	AuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Gvjr5IBE5GSOD4UZ90c6144gD2Huh4edGlCWloh5TLM=;
	b=hr7zbbWyqqR2xj92StFO5PX9clFpkOMUx4vPxaU1c4yGnjmurwbZxI26g6B+Wp5tsf
	OaSE96cPkEo8w0qaInUp/81+ZJmDfzLb0KgUX3Ah1ZPY7om2s7vkORoofe9C6K7KN2ZK
	j8av8MBGC1E36TRiejotuTq5sKo0g41Kx2IHCLpSpIDbxJkW+6Nuslq22Ih2RBuDpp38
	3PyCkejyXmc8iboeWTcNPiKwCHn8MJ0Md5GzZwVGOxMIsqVxWk69gvxh6rHTDlhTUU+U
	LvsyzjlNK8nsqYxJ79MeW0bW3GZ4AFgIXXguFxDDMi7uKF+KbAWdA2eyJL4zpD9Lsqoc
	8deQ==
X-Gm-Message-State: AKGB3mIHT+6HlkM0f8I4PZ6+BYAnRC9TJ3WH0Owx4ITxc1zqLlcGwI2l
	PRnaZy/yeKOImYqSzs9DXYQ=
X-Google-Smtp-Source: ACJfBos65J9dopD0jnYZ58PA8CaCwYYMtEmREaLqKdYgFmRcBHYtkcNyZv5HJuL15xiIKIrpQShskw==
X-Received: by 10.159.194.138 with SMTP id y10mr28989371pln.85.1514395336457; 
	Wed, 27 Dec 2017 09:22:16 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:bd87:68dc:7ad5:c07b?
	([2601:202:4000:1184:bd87:68dc:7ad5:c07b])
	by smtp.gmail.com with ESMTPSA id
	e7sm72883557pfj.44.2017.12.27.09.22.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Dec 2017 09:22:15 -0800 (PST)
To: Bill Randle <bill.randle@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20171223200450.17938-1-bill.randle@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0490e8ff-367f-be31-a4f1-dec8d18abade@gmail.com>
Date: Wed, 27 Dec 2017 09:22:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171223200450.17938-1-bill.randle@gmail.com>
Cc: koen@dominion.thruhere.net
Subject: Re: [meta-oe][PATCH] smstools3: update to 3.1.21; drop uneeded patches
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
X-List-Received-Date: Wed, 27 Dec 2017 17:22:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/23/2017 12:04 PM, Bill Randle wrote:
> Update smstools3 to latest version and drop some patches that no longer
> seem to be required. (Builds and runs fine on poky.)
>
> Signed-off-by: Bill Randle <bill.randle@gmail.com>
> ---
>  .../smstools3/fix-makefile-override.patch          | 24 ----------------------
>  ...s_binpath_and_psops.patch => sms_binpath.patch} |  5 +----
>  .../{smstools3_3.1.15.bb => smstools3_3.1.21.bb}   |  8 +++-----
>  3 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
>  rename meta-oe/recipes-connectivity/smstools3/smstools3/{sms_binpath_and_psops.patch => sms_binpath.patch} (90%)
>  rename meta-oe/recipes-connectivity/smstools3/{smstools3_3.1.15.bb => smstools3_3.1.21.bb} (84%)
>
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
> deleted file mode 100644
> index f0a1d33c9..000000000
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Upstream-Status: Backport [debian]
> -
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -37,16 +37,15 @@
> - # Use the following only on GNU/Linux and only if you need ps listing like "smsd: MAINPROCESS" and "smsd: GSM1"
> - # CFLAGS += -D USE_LINUX_PS_TRICK
> - 
> --all: smsd 
> --
> --smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
> --
> - ifneq (,$(findstring SOLARIS,$(CFLAGS)))
> - ifeq (,$(findstring DISABLE_INET_SOCKET,$(CFLAGS)))
> - override LFLAGS += -lsocket -lnsl
> - endif
> - endif
> - 
> -+all: smsd 
> -+
> -+smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
> - ifneq (,$(findstring NOSTATS,$(CFLAGS)))
> - 	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)
> - else 
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
> similarity index 90%
> rename from meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> rename to meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
> index ffcaa0971..622044632 100644
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
> @@ -12,8 +12,5 @@ Index: smstools3/scripts/sms3
>  -RESETMODEMS=/usr/local/bin/smsd_resetmodems
>  +RESETMODEMS=/usr/bin/smsd_resetmodems
>   NAME=smsd
> --PSOPT="-e"
> -+PSOPT=""
> + PSOPT="-e"
>   ECHO=echo
> - case `uname` in
> -   *BSD|Darwin)
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> similarity index 84%
> rename from meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> rename to meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> index 310a13c22..9885f351b 100644
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> @@ -6,18 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
>  HOMEPAGE = "http://smstools3.kekekasvi.com"
>  
>  SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
> -           file://sms_binpath_and_psops.patch \
> -           file://fix-makefile-override.patch"
> +           file://sms_binpath.patch"
>  
> -SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
> -SRC_URI[sha256sum] = "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
> +SRC_URI[md5sum] = "6a9f038fb38a49cc3a4f8f14a88fb8af"
> +SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e49"
sha256sum is incorrect. it should be
"a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084". I
will fix it locally

- armin

>  
>  
>  S = "${WORKDIR}/${BPN}"
>  
>  EXTRA_OEMAKE += "LFLAGS='${LDFLAGS}'"
>  
> -RDEPENDS_${PN} = "bash"
>  INITSCRIPT_NAME = "sms3"
>  INITSCRIPT_PARAMS = "defaults"
>  


