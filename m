Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E46ECAAA1
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 23:02:35 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web09.30812.1662418950619321603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 16:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qynA9IcV;
 spf=pass (domain: gmail.com, ip: 209.85.128.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-333a4a5d495so80522167b3.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 16:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hAVbqBn72/a13M+QuZW4qBvX/KnNAsL9KXihxYKuLtE=;
        b=qynA9IcVe0OhGrd4nZNsouOS7t8xMgf+5ePuVmk5eTgYmqFTB89vDsn3gCOLpDIany
         v/F0unyZ0QtahPEJ3Qk3ow1+J5JWtW8hOf7XSN/tzHJgfnC3Je151wRRfU+EbSZpp1i4
         U5cOztnrqVRTEparECCSLaTWu1hJmTxnbq6xJmPcSBPRG9YeJ/SGFTd+lfWkynrV4TV4
         7A/If1HlC5Maulwx6Qcq2arD4TKdg8PXHjuGSt1UQjl1H8DfcMnNAxvhksZP72rGZ8tt
         43GKpT4BCdrxtFr+h3GhJepKEqKC7A7ztTopGVeooXF4aW2EsIibgZb3wTovyy02XgNF
         ipgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hAVbqBn72/a13M+QuZW4qBvX/KnNAsL9KXihxYKuLtE=;
        b=DorClSJKkVTGcL1LZ2Mt2v3kZfxLg/GnNhG1hO4KRIGGCBCDFboxFU409m1kb9OaFI
         HJTR4v/m0iKOHAGU0EdIVJ41viWOt73w3iqn/hypZ7h4Uk2O1B/wzmvkApjPny8uBlXw
         WaS58PH3YzdZukBMCoq5UhOK1LAnXLn5oqwoepP/E0/eG01TBzGdRmHdgH/649xYld3p
         4WVxdSv8dm5JSjly1ugDnsZHvtMtO1lvdLnOdwenJNbtXfreiZ6HsqiNtlEaT6CP08QE
         wXTfC2nLNeuoMJFJZXss3t527EXQlJVrn0KiyqQ/PiaqvR5TkKWaNzQn1tlZLgYoAHlI
         bAAQ==
X-Gm-Message-State: ACgBeo31hnMI1bNaAg+0uQmOcR8C2ZOPbGcPoAy+tP8CG5kQCwhJj+UC
	mwVUPBjrBW/0cGowzKu0ajsqNQKbE/t0DxUE+IA=
X-Google-Smtp-Source: 
 AA6agR5eg8qgvMbF50za57vksvZU5/3z67zeny1GZto+1K8mgRFXgrJbKxTezL4L6FSd/gJhIY8qUkJugjYQN0K5xt4=
X-Received: by 2002:a81:a108:0:b0:345:1ba8:638f with SMTP id
 y8-20020a81a108000000b003451ba8638fmr9109581ywg.422.1662418949641; Mon, 05
 Sep 2022 16:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <8a1e59b7-1594-d1af-1944-e42b5649cc33@gmail.com>
In-Reply-To: <8a1e59b7-1594-d1af-1944-e42b5649cc33@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Sep 2022 16:02:01 -0700
Message-ID: 
 <CAMKF1socV+aDJ6TbbZrZGVZv-unMH6yokpn_4=kD88Z5gtrAww@mail.gmail.com>
Subject: Re: kirkstone merge request: Sept 5th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 23:02:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98674

merged thanks Armin

On Mon, Sep 5, 2022 at 11:50 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit acbe74879807fc6f82b62525d32c823899e19036:
>
>    cryptsetup: Add support for building without SSH tokens (2022-08-09
> 09:51:57 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 8f96c05f6d82fde052f2cb1652c13922814accb0:
>
>    lmdb: only set SONAME on the shared library (2022-09-04 07:52:16 -0400)
>
> ----------------------------------------------------------------
> Changqing Li (2):
>        fuse3: support ptest
>        fuse3: fix ptest test_passthrough_hp failure
>
> Justin Bronder (1):
>        lmdb: only set SONAME on the shared library
>
> Khem Raj (1):
>        audit: Upgrade to 3.0.8 and fix build with linux 5.17+
>
> Lei Maohui (1):
>        xrdp: Fix buildpaths warning.
>
> Saul Wold (10):
>        libipc-signal-perl: Fix LICENSE string
>        libdigest-hmac-perl: Fix LICENSE string
>        libio-socket-ssl-perl: Fix LICENSE string
>        libdigest-sha1-perl: Fix LICENSE string
>        libmime-types-perl: Fix LICENSE string
>        libauthen-sasl-perl: Fix LICENSE string
>        libnet-ldap-perl: Fix LICENSE string
>        libxml-libxml-perl: Fix LICENSE string
>        libnet-telnet-perl: Fix LICENSE string
>        libproc-waitstat-perl: Fix LICENSE string
>
>   ...01-test-test_syscalls.c-allow-EBADF-in-fcheck_stat-631.patch | 45
> +++++++++++++++++++++++++++++
>   meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb           | 26
> ++++++++++++++---
>   .../lmdb/files/0001-make-set-soname-on-liblmdb.patch            | 22
> ++++++++++++++
>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb                         | 3 +-
>   .../audit/audit/Fixed-swig-host-contamination-issue.patch       | 13
> ++-------
>   .../recipes-security/audit/{audit_3.0.7.bb => audit_3.0.8.bb} |  7 ++++-
>   meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb                     | 1 +
>   meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb    | 2 +-
>   meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb    | 2 +-
>   meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb    | 2 +-
>   meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 +-
>   meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb        | 2 +-
>   meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb       | 2 +-
>   meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 +-
>   meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb        | 2 +-
>   meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb    | 2 +-
>   meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb      | 2 +-
>   17 files changed, 110 insertions(+), 27 deletions(-)
>   create mode 100644
> meta-filesystems/recipes-support/fuse/fuse3/0001-test-test_syscalls.c-allow-EBADF-in-fcheck_stat-631.patch
>   create mode 100644
> meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch
>   rename meta-oe/recipes-security/audit/{audit_3.0.7.bb =>
> audit_3.0.8.bb} (93%)
>

