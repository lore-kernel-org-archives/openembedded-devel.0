Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C35FC97FE
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37384.1774820334860231597
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bvn+kLpL;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b98133bdc4bso459497066b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820333; x=1775425133; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9BF3W8OIyLlJsq9PZ9LifBl8+G41q24vtl56qGwXJE=;
        b=bvn+kLpLdfLhN+BfYKm36YGaRsd1+xpZggfH8OctDpF3/yzQTThke67x3i50PSfEyw
         j8gvfgw4R1cQ1v9CQe0s7gexQvPzZHDJIMDgxmuNyHJKU/d52PibOh3oCoBjnAcqaf+7
         wRAhKQZ0BEekza38ZHQzd83G7nR/ysS3u2dPiBOEk0KQLvlR/EtBCKhTKtr42+BB7/en
         9UxOrzQkdIpSMeXxB/YaX+JdrXMgnGXHbp2eONXq9pakHkyanrPEFO6N7uJdG6G0pyAs
         JWMEYUr+lIA6Cm79l7anwsEibXRcuIoOIlJ3MURGOsvUgzE2AFnqTiI846NJCEJD3HOS
         h4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820333; x=1775425133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9BF3W8OIyLlJsq9PZ9LifBl8+G41q24vtl56qGwXJE=;
        b=ZXFGds2H5ICxJWr2moRzcr940caeRMptVUks4/qf8xsa3Si8BO2G7xrp7arkBIsSO9
         rU03XJ00CxRz9hdmaY/A7QN7skKYO1xr7B3AWkcs8+46E190KejgQYiclyiwYQvpKJDZ
         fD4945ZXdKoEj5gbp/+ytQ0vW7udUlYfGDO6waLp8ok5zh1ejriJ8AtAW3ipIFboVWnr
         tqXdaMKrZrUBxWDb5ELvRBm5BTmn3AWcMYKlIskxiaanHSXMK3Kqe8c6SyMFJAXtKN8L
         qahInfxo1NHw3HRGzS2T093VHPRzmN/McaOx0nbCCtjPyv3WArlFip4bh+q5MW+633do
         tuew==
X-Gm-Message-State: AOJu0Yw3uKsHHuK7kNd0Fo65Qigj4gl5twEmgIGpHe5l07iMBOwzKX+l
	NZ35qHI7leCtVfN+AaOMMB/Xlp8H+gaNrDzKMKckhnfC7tcX4hfQ4jb8
X-Gm-Gg: ATEYQzzNRTvriulSJutU0UiAuEnG+3AanYdupP+9IpOr5g1IKg/9q9Hzg9FtTV0+72y
	XvGjd/viygXdwrbpmb8za2gB+4eTfYzet0r4NYoGZjKZEdBlMo/2ZU1wWP7fg5cNrQXsjn4+7uE
	BFG2ikVNOA4Owk4Z8K/x29UO+ku7Ck2THBUEFuqxrkRvE+DCLbzSrS66aNpCJcpXYtABiM+gCPW
	ebD1ogGIfRccJz58Ndj7YSHWX3Mbtap5ry7uJRWw+7JGTJcf2XBwv7SzMCz7JJyZfePpV+CHtDH
	+aPXECmFWV1+OdzbA2FwzIIsu5w1tWNt7vuiUr9iO1Wyfwib0jAPuLNNTBQ5tmzZQc+tLk9sjoD
	grXzWag1MNgS/LDmBjpfqH1gJRkubJ9VvhW/Pvw+4wgcOvDFRfLyeqqJwMa/3vdLwJUYfA5qJcF
	Roe91RCp1GrNRyeacvu4RlS3D6iT4G5mkfxE/2i0QJoL7CjBXJNQ4oSSLHwCYT
X-Received: by 2002:a17:907:c714:b0:b98:8cc4:4abb with SMTP id a640c23a62f3a-b9b50351b15mr559246166b.23.1774820332983;
        Sun, 29 Mar 2026 14:38:52 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:52 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH 00/13] Confusing and invalid conditional appends
Date: Sun, 29 Mar 2026 23:37:01 +0200
Message-Id: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCQAyE4VcpORuoqwj1VcRDzE5rPKTLxopQ+
 u6uevxg5l8pUA1B526lipeFzd6w33Wkd/EJbLmZUp9O/SENPNqbdfZxCfOJpRR4DoZkSdBB9Cj
 UvqWiDX/dy/XvWG4P6PMbo237ADZ2gsZ5AAAA
X-Change-ID: 20260329-fix-confusing-appends-eada2ec9ac4a
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>, 
 Stefan Wiehler <me@sephalon.net>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125809

This patchset fixes several findings for variable assignments of form:
    A:someoverride += "foo"
and transforms them into:
    A:append:someoverride = " foo"

It is a continuation of similar changes in openembedded-core [1], which
are currently in master-next.

In most of those cases I assume the original intent was to have a
conditional append, but what was actually happening was append to
a conditional override.

Changes I made, which weren't simple syntax conversions:
1. gnome-bluetooth3 - typo fix
2. libgusb - invalid append changed to actual assignment (like libffi in
   openembedded-core)
3. postgresql - here EXTRA_OECONF's value was being overridden
4. graphviz - value was overridden, but shouldn't have impact
5. syzkaller - dropping qemu-system-native dependency

[1]: https://lists.openembedded.org/g/openembedded-core/message/233335

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
Michal Sieron (13):
      meta-python: Convert confusing appends to override syntax
      gnome-bluetooth3: Fix RRECOMMENS typo
      aufs-util: Convert confusing append to override syntax
      accountsservice: Convert confusing append to override syntax
      pipewire: Convert confusing appends to override syntax
      postfix: Convert confusing appends to override syntax
      libgusb: Convert confusing append to assignment
      postgresql: Fix append overriding value
      graphviz: Fix append overriding value
      syzkaller: Drop qemu-system-native dependency
      syzkaller: Fix appends overriding values
      pcsc-lite: Convert confusing append to override syntax
      flatbuffers: Convert confusing append to override syntax

 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb             | 2 +-
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb   | 2 +-
 meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb | 2 +-
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb         | 2 +-
 meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb             | 4 ++--
 meta-oe/recipes-dbs/postgresql/postgresql.inc                         | 2 +-
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb                   | 2 +-
 meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb                  | 2 +-
 meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb                      | 2 +-
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb                  | 2 +-
 meta-oe/recipes-test/syzkaller/syzkaller-licenses.inc                 | 4 ++--
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb                       | 4 ----
 meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb          | 4 ++--
 meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb          | 2 +-
 meta-python/recipes-devtools/python/python3-progress_1.6.1.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb            | 2 +-
 meta-python/recipes-devtools/python/python3-yamlloader_1.6.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb      | 2 +-
 .../recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb       | 2 +-
 meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.bb | 2 +-
 21 files changed, 23 insertions(+), 27 deletions(-)
---
base-commit: c3c094cf8d8df28c7db0f44890e092aee395cb99
change-id: 20260329-fix-confusing-appends-eada2ec9ac4a

Best regards,
--  
Michal Sieron <michalwsieron@gmail.com>


