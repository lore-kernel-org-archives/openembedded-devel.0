Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.36177.1600670007544470258
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 23:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A7PCtk8M;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id u21so16103266eja.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 23:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=QRlF8mu0PbjCF1L4W1cJuY+/MKsRg+7/pYyRGzKy8K0=;
        b=A7PCtk8MzLfLvXIKlS140x9hbQZ9FKtIyUoLaqic0AdtnzROE/Y/1AX0v/4SIAn9C+
         l8z+Yd+sRks7w0EldlTa64cJyOoZZJp9JV6Mx809vkQEwrngSiIB1KrBvJAuTrmbx973
         SzYqOvNMFMq5zraGBB01P0W+z0WAqjsxaO3DnEhnkRwc7XTk93j/g1bY83xv+Ikaz1uB
         mUJT0tij+SQOtKZ6/GVp7o71YmWjdLvF8JRoyaFBftlhF6csvVnUNL1q1rpVHhvGudUO
         yVUmldxdNpFT/4AGsnO6Gag90zI1XPcwzSsm0zU1ICJbtKM8zG+Tb7EwHYUGlqK6ouzU
         iGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QRlF8mu0PbjCF1L4W1cJuY+/MKsRg+7/pYyRGzKy8K0=;
        b=riaTTvG4t4trqArqk4bX0EbA1w/mlcZgEC5VtPLUVpHp+tNiXG/e/OmYfnVhJkgpB8
         XFdZr1qY2d+Ashcvbp7SaMRxdrnRSCXnWpVteCjRBuJTmACMEpaoLZe26njrwozYT5OP
         37QtemIN0U8fSSS0Pl8EtSpJd/ArjAC+K1T6Oqo2nk9OQxJ/LyAJi3eNlqKMzzvTutbI
         7LOEPYNIRI7mkpNeqNSwKhZCT7IiPq/r5Mhx3XJxOOxrNQcejR8du9lr75irjkdnvk2a
         n9JcqiShse2NJqCzHW5cZenyEnBrizk93QHBpETtOEu+X4+rMc7xfMGASui+TgjVXcTB
         HI3g==
X-Gm-Message-State: AOAM533tmBx1BPHfLl2jsmvnCU5U5V7ceXf/EgonxNManMIGmV/mzezF
	SFsKjmrkE0+K+X8SU6ifck6/WB4Gc/cP7EagH9g4UbkwK2iVsQ==
X-Google-Smtp-Source: ABdhPJyrUKmLCuKAjbC481lRI/cMcZ3YuZtNxI0MWiarnXl5Y0ZT1FJSdIUZ5gXozjoFQEs2rR9gqn6czjraaZZEMtE=
X-Received: by 2002:a17:906:54e:: with SMTP id k14mr48360948eja.59.1600670005323;
 Sun, 20 Sep 2020 23:33:25 -0700 (PDT)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Mon, 21 Sep 2020 08:33:14 +0200
Message-ID: <CAAfyv35EHVpu64e8pYG9qrMSGCFBZewXD2dZ+c9aM_mJfxidhw@mail.gmail.com>
Subject: wireguard-module broken in dunfell
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm facing an issue when added wireguard-tools package to my final image.
wireguard-tools depends on wireguard-module and both seem to be built
fine. I'm hitting an issue during do_rootfs stage when got this error:
Collected errors:
 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - package wireguard-tools-1.0.20200319-r0.armv7vet2hf-neon
requires wireguard-module, but none of the providers can be installed
 *
 * Solution 1:
 *   - do not ask to install a package providing wireguard-tools

When checked build directory for wireguard module there exists  files:

-rw-r--r-- 3 marek marek   882 sep 18 11:25
kernel-module-wireguard_1.0.20200401-r0_orange_pi_zero.ipk
-rw-r--r-- 3 marek marek 51472 sep 18 11:25
kernel-module-wireguard-5.4.18_1.0.20200401-r0_orange_pi_zero.ipk
-rw-r--r-- 3 marek marek   898 sep 18 11:25
wireguard-module-dbg_1.0.20200401-r0_orange_pi_zero.ipk
-rw-r--r-- 3 marek marek   978 sep 18 11:25
wireguard-module-dev_1.0.20200401-r0_orange_pi_zero.ipk
and there seems to be conflict that kernel-module-wireguard exists 2
times with different version (5.4.18 is kernel version from
meta-sunxi). Ideas?

Thanks and BR,

marek
-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
