Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD25FC48BC4
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:26:19 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.12779.1700054773725443265
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3/UEaOi;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a8628e54d4so7428837b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700054772; x=1700659572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nt2T8hFAjLmgHSngsHSDlYKnML3bGcTd893eMdZpbL4=;
        b=Y3/UEaOixQY5nxo8oq0BpFMXDaMSK9arS92a7SfjEx6nkoHIuoNQ4nagI4OFtRiCSL
         41b5Nw4KR8qj8GhQw03cKfAqpU2Ls9lV3UhKZdP2hN2NTnYElWvG8XA/77lRq2vvor/b
         rJ1UFxlWk7K+uyYG/w9AQVD4zAoygZ08+t1Oqta62qkwXzRgXK36G/4YQEPQmXAyrSBo
         Svl31FGSHwUv/D6PW7STgWqEnPEchegCGeDS/U7S8Sj0h0KkKhX3+JDkQKY+GgdaOHBR
         FD/cILG/3QmsVmWRMEu5lRWyxneerslU2cx0kngpbx9qxxbkl9IAfOPk3cSpg+XS8EcC
         NZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054772; x=1700659572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nt2T8hFAjLmgHSngsHSDlYKnML3bGcTd893eMdZpbL4=;
        b=dh8oOmFvh5Nquymb78Nx0wYvCy2eQywppftJweNJmtnp3h5FTXz69znoxRg79WmjlE
         SSqQog7wYM3AfNVtt48iAj7Nnv+nTrkrch7TiVzwDh8sId2b7eIbNwrj4qR7fxYvEjfX
         C9FR8LZ3waA1ObgZbhT1PA2ibYt0Apcl5BylzqHtrv9p6ysCAcCINxVTIIsQoMsd/tyZ
         sJN7jGfQa1Peq4m7EnVB3NZp3TiLRJQcx8F+xSWHEERMrkPl/cLLqUwydsrcWZEnQTKg
         /5xRZgpyWcLnolCpUf3J969gp3Sl1YKfBq+uGiwAm7q0A2/6EaL48aITv1ryC4TzhQr/
         +/FA==
X-Gm-Message-State: AOJu0YwhCb8RgYK1GHsvJAvkirYD1RpRjGpa7UALEJ4SVSdLrZjcA7U4
	BBlwHDjPo5lj2M6wKckSsbZEEVOsnUA=
X-Google-Smtp-Source: AGHT+IHbQQtQtqEM9tDbh6OY5V3am6rGhXDhpX+hGUdcXTj58a95pXCc8wg7Q1UyuswORpxHV2gATA==
X-Received: by 2002:a0d:eb49:0:b0:5a8:1bc6:352 with SMTP id u70-20020a0deb49000000b005a81bc60352mr4322566ywe.20.1700054772336;
        Wed, 15 Nov 2023 05:26:12 -0800 (PST)
Received: from keaua.. ([12.110.163.194])
        by smtp.gmail.com with ESMTPSA id r68-20020a818147000000b0059a34cfa2a5sm365846ywf.67.2023.11.15.05.26.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:26:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 0/3] Drop netkit pkgs
Date: Wed, 15 Nov 2023 08:26:08 -0500
Message-Id: <20231115132611.16589-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 13:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106756

The netkit packages don't have an upstream. Some are in-secure and
have more modern and maintained alt replacements.  If someone needs 
one of these pkgs, please submit a patch to add it back in.

Armin Kuster (3):
  netkit: Drop old and no upstream
  MAINTANERS: drop netkit
  README: drop netkit maintainer

 meta-networking/MAINTAINERS                   |    4 -
 meta-networking/README.md                     |    1 -
 ...1-ftp-include-sys-types.h-for-u_long.patch |   32 -
 .../netkit-ftp/Add_ARG_MAX_define.patch       |   27 -
 .../netkit-ftp/netkit-ftp_0.17.bb             |   50 -
 .../0001-rpcgen-Fix-printf-formats.patch      |   53 -
 .../netkit-rpc/netkit-rpc/gcc4.patch          |   39 -
 .../netkit-rpc/netkit-rpc_0.17.bb             |   51 -
 .../CVE-2019-7282-and-CVE-2019-7283.patch     |   35 -
 .../netkit-rsh/fix-host-variable.patch        |   27 -
 .../netkit-rsh/fixup_wait3_api_change.patch   |   34 -
 .../netkit-rsh-0.17-rexec-ipv6.patch          |   30 -
 .../netkit-rsh/no_pam_build_fix.patch         |   39 -
 .../netkit-rsh/netkit-rsh/rexec.pam           |   10 -
 .../netkit-rsh/netkit-rsh/rexec.xinetd.netkit |   20 -
 .../netkit-rsh/netkit-rsh/rlogin.pam          |   12 -
 .../netkit-rsh/rlogin.xinetd.netkit           |   23 -
 .../rsh-redone_link_order_file.patch          |   77 --
 .../netkit-rsh/netkit-rsh/rsh.pam             |   10 -
 .../netkit-rsh/netkit-rsh/rsh.xinetd.netkit   |   21 -
 .../netkit-rsh/netkit-rsh_0.17.bb             |  105 --
 .../0001-Link-with-libtirpc.patch             |  120 --
 ...sd-Makefile-fix-parallel-build-issue.patch |   30 -
 .../netkit-rusers/netkit-rusers_0.17.bb       |   72 -
 ...dd-missing-include-path-to-I-options.patch |   46 -
 ...002-Fix-build-issues-found-with-musl.patch |   72 -
 .../netkit-rwho/netkit-rwho/rwhod             |   71 -
 .../netkit-rwho/netkit-rwho/rwhod.default     |    2 -
 .../netkit-rwho/netkit-rwho_0.17.bb           |  108 --
 .../0001-Drop-using-register-keyword.patch    |  457 -------
 ...lnet-telnetd-Fix-deadlock-on-cleanup.patch |  116 --
 ...net-telnetd-Fix-print-format-strings.patch |   68 -
 ....c-Fix-buffer-overflow-in-netoprintf.patch |   56 -
 ...time.h-form-time-and-strftime-protot.patch |   27 -
 .../netkit-telnet/files/CVE-2020-10188.patch  |  112 --
 .../netkit-telnet/files/CVE-2022-39028.patch  |   53 -
 .../To-aviod-buffer-overflow-in-telnet.patch  | 1217 -----------------
 .../Warning-fix-in-the-step-of-install.patch  |   41 -
 .../netkit-telnet/files/cross-compile.patch   |   48 -
 .../netkit-telnet/files/telnet-xinetd         |   14 -
 .../netkit-telnet/netkit-telnet_0.17.bb       |   74 -
 .../0001-tftp-Include-missing-fcntl.h.patch   |   27 -
 .../netkit-tftp/netkit-tftp/tftp.conf         |   11 -
 .../netkit-tftp/netkit-tftp_0.17.bb           |   59 -
 44 files changed, 3601 deletions(-)
 delete mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/Add_ARG_MAX_define.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
 delete mode 100644 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fix-host-variable.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.pam
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
 delete mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
 delete mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
 delete mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
 delete mode 100755 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/rwhod
 delete mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/rwhod.default
 delete mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-Drop-using-register-keyword.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-utility-Include-time.h-form-time-and-strftime-protot.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2020-10188.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/To-aviod-buffer-overflow-in-telnet.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/Warning-fix-in-the-step-of-install.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/cross-compile.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/telnet-xinetd
 delete mode 100644 meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
 delete mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
 delete mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
 delete mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb

-- 
2.34.1


