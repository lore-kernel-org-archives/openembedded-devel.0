Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC308FEDA0B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:53:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84065.1773773621925824815
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 11:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mucnlLUM;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486507134e4so12306505e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773620; x=1774378420; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+h/0MNlNBoXerRnaOp59CoWNeuxq5nPq7ugrv3zsWJo=;
        b=mucnlLUMSkhrMH6PhhLjMLwveQTfibFxwKS1KD/2KrS/ImTlWUzuGOsn5MD1Jawhkt
         kgr/Y1Z2H3eNPHaluTs3zl9n0B8FnpdArZYdJy0onLlyceXnty14InugiDjkqTYeDNd3
         BRGvjna//gZkHhbfgUW/EavzJiQqZSVhb5p6xf4ER3oon5XuDwfKbFXzxBO2SL8IOCqo
         lF2bI8r/2sVanC+Kj32truP/W7YQbp4PcArXxflRqc7vsWZa/Ao9c1iyN5OyqHkmNbcq
         WcgB0natynX3LbrbMB1M/aJD808FCN28ySeIZ1SfsD9JR7TZdrOToYnBfzTU10BFgxcS
         wgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773620; x=1774378420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+h/0MNlNBoXerRnaOp59CoWNeuxq5nPq7ugrv3zsWJo=;
        b=OHW8FeUaCaJl6kH4HYPJj6uJY9nuOAodzeRAL60o6/v1NNUZAcv/l8iRxuffWQxVYZ
         wDlS6b8WdqKO609u2hvyES/uOoEvmeRrCfuwy5PUcKF2AqHrg5m/gTh3V0iQU2103HiB
         1EeebhOHk3/BoIGY5XUVyZf4AqNKbj+TOFs0UnSA6kjIXE//p9im/jkduHzssZ+GSMbc
         nm3sJmNUqbVuOXEQl4xx6uCXH02E5OoBEyw+PIZv6hs0dZG8Qtwv2YDsoQt5CTYBcgki
         tAu8GuB0E7cUdewxRqvZFuasInAJ/ahoy/bG30Pk3zdL1wH+e25OWJKeFNy4zKYn8olv
         +wtg==
X-Gm-Message-State: AOJu0YyhL+d3YQmEYrgNBzl++PWX+jbFECK8sdBDi4LMnoSlve1SSz4W
	IppoC7XIoVwTQZFpzohiXh3D0ATSUD12BBL8IJc6BLMzXlAG7wjaPGXl
X-Gm-Gg: ATEYQzxxDcHsSM0z2Dx9zTQvN3TsbtcRKvVZ46qTZJN2VLhBPbSzFkUdmoi5mJmL6tt
	604hYwfE5Vy4J6Rca8MI+IwcbAptF1AXVDTPu/MFYCFw3kWqZZXVrODS54f2dKzMaPbAk0WHFx2
	0nErdqqh7AVvBUvWdV7x8xeJpWfw1P/LssU/+DZhFhj7/I5mED2U/wxrBPcCKuGy9ZjmZH8c8xi
	MZDEZQ8OXqe2Ispb7/XdBhw/GB8dm9lNZFXKfrPeiSH+PqcqgOtZKxkrUIT0UMeGGOEH/S3CKDb
	iHQCA34YsllEIz9b4hzYEmd5Vi0zqUsihULl+T47z3jFT9JBKy1OJE8ye0uRDt7OvWON3OUBXOZ
	YIgenEgU/+E/rCTyXNG+QrFAZB7/Jj8VXeS0oBerrukSUEfPjI0qomTNj8NEZedjognY4ja45+Y
	mhQKjnVtIjZbHbEHEpJ9pOK9JNB9jTLg4=
X-Received: by 2002:a05:600c:458a:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-486f4457abfmr12838155e9.23.1773773620054;
        Tue, 17 Mar 2026 11:53:40 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f46320e7sm2151925e9.9.2026.03.17.11.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 11:53:39 -0700 (PDT)
Message-ID: <4ba11fc4-05a8-4a78-8b82-2a1e4aad59c7@gmail.com>
Date: Tue, 17 Mar 2026 19:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 3/3] samba: upgrade 4.19.9 -> 4.23.5
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
References: <20260305201754.151603-1-skandigraun@gmail.com>
 <20260305201754.151603-3-skandigraun@gmail.com>
 <V542CT.KE4IFLMSTCWD2@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <V542CT.KE4IFLMSTCWD2@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 18:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125332

On 3/17/26 19:46, Markus Volk wrote:
> On Thu, Mar 5 2026 at 21:17:51 +01:00:00, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> SAMBA4_IDMAP_MODULES
> 
> I see an error with this update:
> ERROR: samba-4.23.6-r0 do_compile: Execution of '/home/flk/bitbake-
> builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/
> run.do_compile.1254855' failed with exit code 1
> ERROR: Logfile of failure stored in: /home/flk/bitbake-builds/poky/
> build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/log.do_compile.1254855
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Waf: Entering directory `/home/flk/bitbake-builds/poky/build/tmp/work/
> corei7-64-oe-linux/samba/4.23.6/sources/samba-4.23.6/bin/default'
> | Selected system MIT krb5 libraries, Heimdal use is disabled
> | Checking project rules ...
> | Project rules pass
> | [3427/3555] Processing manpages/smb.conf.5: docs-xml/manpages/
> smb.conf.5.xml bin/default/docs-xml/smbdotconf/parameters.all.xml bin/
> default/docs-xml/build/DTD/samba.build.pathconfig docs-xml/build/DTD/
> samba.entities bin/default/docs-xml/build/DTD/samba.build.version ->
> bin/default/docs-xml/manpages/smb.conf.5
> | runtime error: file file:///home/flk/bitbake-builds/poky/build/tmp/
> work/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/share/
> xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl <file:///home/flk/
> bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/
> recipe-sysroot-native/usr/share/xml/docbook/xsl-stylesheets-1.79.1/lib/
> lib.xsl> line 58 element choose
> | xsltApplySequenceConstructor: A potential infinite template recursion
> was detected.
> | You can adjust xsltMaxDepth (--maxdepth) in order to raise the maximum
> number of nested template calls and variables/params (currently set to
> 3000).


:)
Interesting, because I have seen this too, but then it suddenly
disappeared, though I spent like an hour on it trying to get back,
because I found a patch to fix this...

Anyway, will take a look at it - thank you for testing it.

