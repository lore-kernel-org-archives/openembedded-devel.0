Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43451F46C76
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 19:11:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62776.1775502665388525050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 12:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QkRN1x8e;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfb723793so2663669f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502664; x=1776107464; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfCKQQN7rSOMAPhmwyweyblNSvDjms+T8bTbeWShh7U=;
        b=QkRN1x8elpZ+/N5JQsVTCkS18wMyrIN7BjqUg2OCg3WA/CjypPVaJrluIuBC3saj/f
         DI4vAUuk+qtmvLIOT4hu9ltIE7Uu2ucc3wJSmmhSPjIf6aiy1cGVuliPzV7B7BY1ZDHo
         kZp0ZFedoXMrzt56wZnng2raNpXM8XZo9yuzcYM6pH324aHDXgbdy6RdjqIljIZlv633
         C0gKBQkRlyy/pzOcfFtH943AhkPpx3M2nLFCNTUL2CG64m9rr0037dOu20GlECi2yop+
         41+ikqsS3tLwYPCIMjhu9iAww8Io9nwfiyQ7LZB9+utT964HEYhVjgGEp+HlF4YYw1uM
         rxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502664; x=1776107464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfCKQQN7rSOMAPhmwyweyblNSvDjms+T8bTbeWShh7U=;
        b=lB3ZowuJg5Wo34NaAf/jhPTHudWr9m762asUzfVtJCtS2siPbj4OKRUpr+haRi8J67
         kktlnsF1VBs0eR13F7wBT+q/OfCWR2SRG9AKzND+HXzDFi8TO9MGZx3pkDYjAZB7QqtU
         plTAdNg8ivIQFl8odSBwDhYnPahi3xJHmqgE0B6+xG+4Rx9f4Ly734zDg483xgvXlUdK
         rTak7kOi6LIwsd4uQL/AEJov3gqyJXZJz8eBkjqGyBS86FEoa2jLPqcHQKwRTduWgnM7
         pJGa+C+0piVhZMBQ+cBMtbXQPS1r25trhNYjgBybnsXgFXJ7pQri2auPEkuwUjj/GZwl
         t5fg==
X-Gm-Message-State: AOJu0YxlM+awZ9AAb4a2yssHCjf+b5DUJljAPyk+BPrTqBoEVbwuI5rh
	97iclqphyYFASdqLG3vqBs0K5+vBXl1760xgrNbABteOP5KzkWQf/X+dpXP8Og==
X-Gm-Gg: AeBDiet+r/LiSqzj0460Sh4zT4j0T3r6lFBYcQ2nTTr6fR3meVl/2wYro1xULL+ysmm
	NFRd42I13qYnTC3ImQElTtI3nIf0Eh9K+H/4dfh+YODfrMCSuECWpzSP0vAnFUTjMBhLq71GzL5
	D1F0uzwecKQI8sZcPj5CEqwI1tG3Nd8KLmgxtI1duaNvV4RRhLd9BldVwNASaj4gpVfRYi54qRF
	YvigOkepHLmNefnRbfeIebH/lfCH8lHd+9RScImNelybeyuRZ8xj3vyXbTQO7bQdEhtwxo01Lm0
	tyy/kfUQNw3FVdmNSQbEPpf5kdpOxFemeELuiBtZQtY+cGl5tG4pwdqaVFi+t5TEmQomDn3tG59
	W3VuMR/ImuWMEAvENKu1QILPbpigeoyOpchkf/eBaqKObwdsGuB+2sTUBp5Ho2MNvYvQkr0XrEc
	d4CHDlH5W2c/VMSuYNMaENnoNT/RSi7TU=
X-Received: by 2002:a05:6000:4023:b0:43c:dc99:771d with SMTP id ffacd0b85a97d-43d292f483emr18431727f8f.38.1775502663470;
        Mon, 06 Apr 2026 12:11:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f52easm44618864f8f.36.2026.04.06.12.11.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 12:11:03 -0700 (PDT)
Message-ID: <714ae3cf-461f-4fcb-9647-ea4ee5e37bd3@gmail.com>
Date: Mon, 6 Apr 2026 21:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][whinlatter][PATCH 1/2] dovecot: patch
 CVE-2025-59031
To: openembedded-devel@lists.openembedded.org
References: <18A3DA03CDF37206.657799@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18A3DA03CDF37206.657799@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126064

This patch is kinda heavy handed - it removes a feature that was
considered terminally vulnerable.
Alternatively we can also just live with this in the stable branches,
with a note or something in the recipe.
Though CVE scores are pretty random, fwiw this one rolled 4.3.

On 4/6/26 21:06, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
> 
> Backport the patch that was identified[1] by Debian.
> 
> [1]: https://security-tracker.debian.org/tracker/CVE-2025-59031
> 
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../dovecot/dovecot/CVE-2025-59031.patch      | 142 ++++++++++++++++++
>  .../dovecot/dovecot_2.4.1-4.bb                |   1 +
>  2 files changed, 143 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch
> 
> diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch
> new file mode 100644
> index 0000000000..6f13502422
> --- /dev/null
> +++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch
> @@ -0,0 +1,142 @@
> +From aac45a278d95afeec8c702b5b4966ea0a96e5ad6 Mon Sep 17 00:00:00 2001
> +From: Aki Tuomi <aki.tuomi@open-xchange.com>
> +Date: Thu, 8 Jan 2026 08:51:59 +0200
> +Subject: [PATCH] fts: Remove decode2text.sh
> +
> +The script is flawed and not fit for production use, should
> +recommend writing your own script, or using Apache Tika.
> +
> +CVE: CVE-2025-59031
> +Upstream-Status: Backport [https://github.com/dovecot/core/commit/36a95e7fa6b913db6c03a15862628b06be66eb3e]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/plugins/fts/Makefile.am    |   3 -
> + src/plugins/fts/decode2text.sh | 105 ---------------------------------
> + 2 files changed, 108 deletions(-)
> + delete mode 100755 src/plugins/fts/decode2text.sh
> +
> +diff --git a/src/plugins/fts/Makefile.am b/src/plugins/fts/Makefile.am
> +index ae57d8f..4485cf4 100644
> +--- a/src/plugins/fts/Makefile.am
> ++++ b/src/plugins/fts/Makefile.am
> +@@ -65,9 +65,6 @@ xml2text_CPPFLAGS = $(AM_CPPFLAGS) $(BINARY_CFLAGS)
> + xml2text_LDADD = $(LIBDOVECOT) $(BINARY_LDFLAGS)
> + xml2text_DEPENDENCIES = $(module_LTLIBRARIES) $(LIBDOVECOT_DEPS)
> + 
> +-pkglibexec_SCRIPTS = decode2text.sh
> +-EXTRA_DIST = $(pkglibexec_SCRIPTS)
> +-
> + doveadm_module_LTLIBRARIES = \
> + 	lib20_doveadm_fts_plugin.la
> + 
> +diff --git a/src/plugins/fts/decode2text.sh b/src/plugins/fts/decode2text.sh
> +deleted file mode 100755
> +index 151fb7c..0000000
> +--- a/src/plugins/fts/decode2text.sh
> ++++ /dev/null
> +@@ -1,105 +0,0 @@
> +-#!/bin/sh
> +-
> +-# Example attachment decoder script. The attachment comes from stdin, and
> +-# the script is expected to output UTF-8 data to stdout. (If the output isn't
> +-# UTF-8, everything except valid UTF-8 sequences are dropped from it.)
> +-
> +-# The attachment decoding is enabled by setting:
> +-#
> +-# plugin {
> +-#   fts_decoder = decode2text
> +-# }
> +-# service decode2text {
> +-#   executable = script /usr/local/libexec/dovecot/decode2text.sh
> +-#   user = dovecot
> +-#   unix_listener decode2text {
> +-#     mode = 0666
> +-#   }
> +-# }
> +-
> +-libexec_dir=`dirname $0`
> +-content_type=$1
> +-
> +-# The second parameter is the format's filename extension, which is used when
> +-# found from a filename of application/octet-stream. You can also add more
> +-# extensions by giving more parameters.
> +-formats='application/pdf pdf
> +-application/x-pdf pdf
> +-application/msword doc
> +-application/mspowerpoint ppt
> +-application/vnd.ms-powerpoint ppt
> +-application/ms-excel xls
> +-application/x-msexcel xls
> +-application/vnd.ms-excel xls
> +-application/vnd.openxmlformats-officedocument.wordprocessingml.document docx
> +-application/vnd.openxmlformats-officedocument.spreadsheetml.sheet xlsx
> +-application/vnd.openxmlformats-officedocument.presentationml.presentation pptx
> +-application/vnd.oasis.opendocument.text odt
> +-application/vnd.oasis.opendocument.spreadsheet ods
> +-application/vnd.oasis.opendocument.presentation odp
> +-'
> +-
> +-if [ "$content_type" = "" ]; then
> +-  echo "$formats"
> +-  exit 0
> +-fi
> +-
> +-fmt=`echo "$formats" | grep -w "^$content_type" | cut -d ' ' -f 2`
> +-if [ "$fmt" = "" ]; then
> +-  echo "Content-Type: $content_type not supported" >&2
> +-  exit 1
> +-fi
> +-
> +-# most decoders can't handle stdin directly, so write the attachment
> +-# to a temp file
> +-path=`mktemp`
> +-trap "rm -f $path" 0 1 2 3 14 15
> +-cat > $path
> +-
> +-xmlunzip() {
> +-  name=$1
> +-
> +-  tempdir=`mktemp -d`
> +-  if [ "$tempdir" = "" ]; then
> +-    exit 1
> +-  fi
> +-  trap "rm -rf $path $tempdir" 0 1 2 3 14 15
> +-  cd $tempdir || exit 1
> +-  unzip -q "$path" 2>/dev/null || exit 0
> +-  find . -name "$name" -print0 | xargs -0 cat |
> +-    $libexec_dir/xml2text
> +-}
> +-
> +-wait_timeout() {
> +-  childpid=$!
> +-  trap "kill -9 $childpid; rm -f $path" 1 2 3 14 15
> +-  wait $childpid
> +-}
> +-
> +-LANG=en_US.UTF-8
> +-export LANG
> +-if [ $fmt = "pdf" ]; then
> +-  /usr/bin/pdftotext $path - 2>/dev/null&
> +-  wait_timeout 2>/dev/null
> +-elif [ $fmt = "doc" ]; then
> +-  (/usr/bin/catdoc $path; true) 2>/dev/null&
> +-  wait_timeout 2>/dev/null
> +-elif [ $fmt = "ppt" ]; then
> +-  (/usr/bin/catppt $path; true) 2>/dev/null&
> +-  wait_timeout 2>/dev/null
> +-elif [ $fmt = "xls" ]; then
> +-  (/usr/bin/xls2csv $path; true) 2>/dev/null&
> +-  wait_timeout 2>/dev/null
> +-elif [ $fmt = "odt" -o $fmt = "ods" -o $fmt = "odp" ]; then
> +-  xmlunzip "content.xml"
> +-elif [ $fmt = "docx" ]; then
> +-  xmlunzip "document.xml"
> +-elif [ $fmt = "xlsx" ]; then
> +-  xmlunzip "sharedStrings.xml"
> +-elif [ $fmt = "pptx" ]; then
> +-  xmlunzip "slide*.xml"
> +-else
> +-  echo "Buggy decoder script: $fmt not handled" >&2
> +-  exit 1
> +-fi
> +-exit 0
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> index 09583f1694..769e693c5a 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> @@ -22,6 +22,7 @@ SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
>             file://CVE-2025-30189-5.patch \
>             file://CVE-2025-30189-6.patch \
>             file://CVE-2025-30189-7.patch \
> +           file://CVE-2025-59031.patch \
>             "
>  SRC_URI[sha256sum] = "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126062): https://lists.openembedded.org/g/openembedded-devel/message/126062
> Mute This Topic: https://lists.openembedded.org/mt/118695942/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


