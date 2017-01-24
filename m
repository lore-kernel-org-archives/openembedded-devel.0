Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id BBC9671CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 19:26:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so17379937pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 11:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=102jvbzHyLwPy827fPEJeOEYtcDvCkiTU3eU5FKB0js=;
	b=dI4uG/PTDXigNU0e0D8q8aaQaFPVHHknJN8JC1asNZt0oCmM7q50JzoPYf/Jm//JB9
	0Q1dyzL1OwctvP9Qb8fbqMv/cw5DzKJJ9gGzaTKgx4EJtxVITgqrtvmDfbwrLSLgW0vh
	KkXYoOk4WGi+Mf7xpvYc5KFtIWxgoke3h+NSkUJ/X9gLSXVmxG3RwDI7f7sKEnEHjU4X
	PbEdkWMDYqs9vrfdJW6SYJbGtYd0BQrTWCZkdusNoaTsEDWa3BnxtqupNlPEV4bMcpiQ
	ISty7fn9Hym1GSJxUATNryjF2cromcsXew6+P9AjjY+CZpmqTHmy59GsUFcuzvOU7jv3
	9BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=102jvbzHyLwPy827fPEJeOEYtcDvCkiTU3eU5FKB0js=;
	b=au9TZpmy68DlNpptj28UC26RTic4XepHbmG/jnSdRQaG5h6Y+9v0h4mdsXwXngksPD
	b+CQffjxkumc6JFfaY3prcTdb1jMZwHOra0YKev3ATVJz+T3ksai3q0PlBTFYB/+E7o4
	u3TKCL4fzNy98KSq4ReA1Fb0AiRkOAuXzeLNXlekJt6l0kV/flgDgp77CaDsorNSmcMB
	vg9TjL6poiOfK1xdGOImRsqWpvJs4SnizLH5jR0OBm1Q71KVwPOJelgqW3uYWJ2o1r7Q
	IvA/l/kGXOhgX5yapNZuQiZ8e0kYf6/uxXLRdF/6S5gfj/Qh+NMPrkEVXMPVaeh70355
	SggA==
X-Gm-Message-State: AIkVDXLVqpglLXHX5nLw6l+L67wVlyy+GBdKqMUwJN2tiNaaOOBrSd4pIHdKzgqWm6sTCQ==
X-Received: by 10.99.135.195 with SMTP id i186mr41805051pge.105.1485285981039; 
	Tue, 24 Jan 2017 11:26:21 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:c8b8:641d:6d81:476d])
	by smtp.gmail.com with ESMTPSA id
	s17sm7580305pgo.27.2017.01.24.11.26.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 11:26:20 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <86fff81d-24d5-68d8-5f56-34c828564f55@gmail.com>
Date: Tue, 24 Jan 2017 11:26:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [meta-oe][PATCH] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Tue, 24 Jan 2017 19:26:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/24/17 11:19 AM, Andre McCurdy wrote:
> When cross compiling, the word size of the compiler set via HOST_CC
> must match the word size of the target. That's achieved by appending
> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
> 
> Unfortunately the current list of over-rides (powerpc, x86 and arm)
> does not cover all cases. Add mips and mipsel to the list too (which
> is still not enough to cover all targets or corner cases such as x32,
> but better than before).

x32 ABI is not supported in luaJIT

> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> index 964dc1d..2049846 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> @@ -24,6 +24,8 @@ BBCLASSEXTEND = "native"
>  BUILD_CC_ARCH_append_powerpc = ' -m32'
>  BUILD_CC_ARCH_append_x86 = ' -m32'
>  BUILD_CC_ARCH_append_arm = ' -m32'
> +BUILD_CC_ARCH_append_mips = ' -m32'
> +BUILD_CC_ARCH_append_mipsel = ' -m32'
>  
>  # The lua makefiles expect the TARGET_SYS to be from uname -s
>  # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
> 

