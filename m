Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B2D109318D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8051.1773995549829902830
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 01:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELwLeZx5;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so1907835e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773995548; x=1774600348; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxUDA5Rt9VWVM8VpC0Bn1a0TIui84cLhlMNTLQcUPHw=;
        b=ELwLeZx574k+72sBpsXKCU7lGOP0xnFpq8PHFi/qQ+SiRBw/agdGKENvfWv+cvNQiX
         myl3oldpxD65GApeBbW+MxhBQ4L8DNHQFwWN+n6QeUU/Lv6kEXuGy3Cm+bPEzNZia2H3
         RBMjCnqHongXCOtD1Yc0Vw8KdlaL9PtzPmAUV/ykw9++7QPub8DAYWcMMqJbB7sZMjnZ
         2BaUAWS22l9H/W7hOfA45wITgkmfUYD142mxuQ72GP+eVL8z/kxaZ+1LrN+44H/ltvPX
         OFMqjGePwfGKslJyC2mPZskQWMlC6lWse0nMtYR7XKYcqDzJ+G5U3wTWGtfBEzFmZP3k
         8uTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995548; x=1774600348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxUDA5Rt9VWVM8VpC0Bn1a0TIui84cLhlMNTLQcUPHw=;
        b=snVlqqTDU/sYJ1YXYxduVI9lhvwpjJuIwRrNAneY1niT3pc06iFjXA7YZ1ydyP/kPK
         b5j7PNO+zEMaF8SG7pC7K+zZEkRhJnW+f+mpFK3IWqoJMrKlspwFq0WVLPKRaYzA5qqt
         Q/Rv+zxMCAeQA3s+CBeds/dpnAnWF6LYqF4EzMaHQ1blAlMOByEPKL9nBh5znAQyVL+Q
         hH5v9pdi5Xfrvga9jb6IP4thfY9Y96OKyIwh0IZlnAMSHstQHg94W30tCxF2YskGiGnj
         v50g2j1AY7gweSCQ3lnhjzI4bvyqa7URmOMIquw3fAZ0tnYedtWkmCXVLgq19r8WQnMk
         HT0g==
X-Forwarded-Encrypted: i=1; AJvYcCVIi3qicK1aNkuH4aX/J6lrprtpK3UtdPMX/RfoOTW7A2f8bpalk8zpA++CX5PFle9XSiB9F+E1e2MdBQrPIrAcaF0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgCZqnlM8IkwTfi7uGlnXumSHg9TVfmuOssLC5khkwS4p/0npg
	8uWMts6iOPUG9eZpvQbMS92DwOVtCVwKVYNuAygPh0l+KB/EQ5jQHPLEAhRS9A==
X-Gm-Gg: ATEYQzyyQ+yXwAys4peV3eSPkhOEboLbLDM8f1VPq0ToixJQIOp+KBLJlCSH6hUf56T
	lXOAHB+zCCerihCTqncCkPEbD0zM0HXGOEICnagqOWcUX5xUzB6pC4HGZTp4joYMnEvjumjuEih
	lN0l4PhN/GcAIjl+zu4QqbbTC8mbzp8/n8Iycf4m1zqfV5dboACKlyj543awb2K52BqvKq/nH4N
	0UECoY6Y0qs6wyBfMsB/j5T6ewCaQECK0QESQKvEHCS+I94TT4a0rPah3J3Sk6wqfx/kyYm/qgx
	JbTAZ5uBORbAWoZID8po3TZwNp7qXUNSGBUhoCAcvdVtCzqME/rpymq1Snrw4PJnWm+lZuTA9Mb
	OBYEAgjafZQ43ID05LGdaCqYEsK8ssFYrtHaZyahxi4BJ5s4QumVJxSzoCMuUezwORA3SC9YTnK
	PjyQG0UF8YBWiTkz5lcsb+RFsYGTD5r0g=
X-Received: by 2002:a05:600c:4e8f:b0:483:badb:618b with SMTP id 5b1f17b1804b1-486fee1e062mr28388755e9.24.1773995547799;
        Fri, 20 Mar 2026 01:32:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d393sm11515925e9.16.2026.03.20.01.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 01:32:27 -0700 (PDT)
Message-ID: <a2179fdd-6665-41de-b5d5-667e3861b073@gmail.com>
Date: Fri, 20 Mar 2026 09:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 3/3] samba: upgrade 4.19.9 -> 4.23.5
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20260305201754.151603-1-skandigraun@gmail.com>
 <20260305201754.151603-3-skandigraun@gmail.com>
 <V542CT.KE4IFLMSTCWD2@t-online.de>
 <4ba11fc4-05a8-4a78-8b82-2a1e4aad59c7@gmail.com>
 <CAMKF1sq3vYuiL3=HO7O6hotNkAdKSdjL-cv021=F3QXJu3qUKQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sq3vYuiL3=HO7O6hotNkAdKSdjL-cv021=F3QXJu3qUKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 08:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125423

On 3/17/26 21:28, Khem Raj wrote:
> 
> 
> On Tue, Mar 17, 2026 at 11:53 AM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     On 3/17/26 19:46, Markus Volk wrote:
>     > On Thu, Mar 5 2026 at 21:17:51 +01:00:00, Gyorgy Sarvari via
>     > lists.openembedded.org <http://lists.openembedded.org>
>     <skandigraun=gmail.com@lists.openembedded.org
>     <mailto:gmail.com@lists.openembedded.org>> wrote:
>     >> SAMBA4_IDMAP_MODULES
>     >
>     > I see an error with this update:
>     > ERROR: samba-4.23.6-r0 do_compile: Execution of '/home/flk/bitbake-
>     > builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/
>     > run.do_compile.1254855' failed with exit code 1
>     > ERROR: Logfile of failure stored in: /home/flk/bitbake-builds/poky/
>     > build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/
>     log.do_compile.1254855
>     > Log data follows:
>     > | DEBUG: Executing shell function do_compile
>     > | Waf: Entering directory `/home/flk/bitbake-builds/poky/build/
>     tmp/work/
>     > corei7-64-oe-linux/samba/4.23.6/sources/samba-4.23.6/bin/default'
>     > | Selected system MIT krb5 libraries, Heimdal use is disabled
>     > | Checking project rules ...
>     > | Project rules pass
>     > | [3427/3555] Processing manpages/smb.conf.5: docs-xml/manpages/
>     > smb.conf.5.xml bin/default/docs-xml/smbdotconf/parameters.all.xml bin/
>     > default/docs-xml/build/DTD/samba.build.pathconfig docs-xml/build/DTD/
>     > samba.entities bin/default/docs-xml/build/DTD/samba.build.version ->
>     > bin/default/docs-xml/manpages/smb.conf.5
>     > | runtime error: file file:///home/flk/bitbake-builds/poky/build/tmp/
>     > work/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/share/
>     > xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl <file:///home/flk/
>     > bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/
>     > recipe-sysroot-native/usr/share/xml/docbook/xsl-
>     stylesheets-1.79.1/lib/
>     > lib.xsl> line 58 element choose
>     > | xsltApplySequenceConstructor: A potential infinite template
>     recursion
>     > was detected.
>     > | You can adjust xsltMaxDepth (--maxdepth) in order to raise the
>     maximum
>     > number of nested template calls and variables/params (currently set to
>     > 3000).
> 
> 
>     :)
>     Interesting, because I have seen this too, but then it suddenly
>     disappeared, though I spent like an hour on it trying to get back,
>     because I found a patch to fix this...
> 
>     Anyway, will take a look at it - thank you for testing it.
> 
> 
> I will hold off this one for now then.
>  
> 
V2 sent - sorry for taking this long. I wanted to look into the
"error-comes-and-goes" part I mentioned, and spent more time on it than
I wanted to - and eventually it was fruitless. For now I will write it
up for temporary insanity on my end...

