Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.10000.1600425491309139221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBEc30DI;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id r7so7397567ejs.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1L/Yx7gRKGO0R3wOrTpu7U3VW2DdQHFaoQ4bMWUyRVI=;
        b=OBEc30DIj7VAu1mhNlhNAzOXgbGlYyu++ZKYCNi4qtljZ3Hd7DfnoWuF1hcuDXtOXv
         Y/QGSh4tide3NCqTtgURn7oYu35k7t6LKpc0Qcb2nqvTQnKaMFKIhzkHc5dGfWh68a+U
         gwRNTasw9bg+HSwKsl4MoSuXOoCjiIior/cCH6OSyWyub3awPDsVqfpzbO7wCspvxXDZ
         TvkUdsGKbhxf8j+GAwepTQVQmKwHnpcPMOSNqZJlQ7ySL5YxRqZj3WiYyM8NzlHf4G7P
         8cmLAmaNbXPl1sTHT7a4oigXx3J9DdvvGVLFUdsrmdfFzZJLlp6wK3hpgX3UaC+vaK8Y
         N1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1L/Yx7gRKGO0R3wOrTpu7U3VW2DdQHFaoQ4bMWUyRVI=;
        b=Olb49qLMB6kLLD7BUPbqQXOxfIxr3YaP53d3pmILq0j9050nkttOtvX52V+eC+ZHwE
         MDDkot943xSm3y2Eb6jnr+eiiOS49hNmRmBmg93Tw9ewTI6DPQ9k86OewdZf+p1ERRKR
         BcOcqFgQzzlgQoS+cT5AniGCw1tgFZ/FrGtk1325mpBQrNBSo29mjuuDbpqqGEsdvVBD
         dSq+ibu9H2qRAnasspjqSwfDCiNo44KveMRH3kQpfNST8g5MfMkfnQzA7d43riofbrdH
         B+Ib2i0sFAucDqfI/+AdsJDM/Z+hc7vL2ZgGWflD9MiKLbwNPsHSwH1lkEKBwhI/i63Z
         SJAw==
X-Gm-Message-State: AOAM5330EQOHuT+u6SlpUk03s6STi4c+os238kN0TmZ0C7kjfYYo/5AG
	cOoITWvrZVM5xDVVLOshLPzqA9MmGjg=
X-Google-Smtp-Source: ABdhPJwJfr3CxBzQh/oKf45n76XuL2RiwqnlikuJ6kXqajMX6ViCt7/KWh/q0Fv3D6YpjNyecdKNqA==
X-Received: by 2002:a17:906:71cc:: with SMTP id i12mr34900988ejk.507.1600425489457;
        Fri, 18 Sep 2020 03:38:09 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ch29sm1907815edb.74.2020.09.18.03.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:38:08 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH] netkit-rsh: inherit update-alternatives
Date: Fri, 18 Sep 2020 12:38:07 +0200
Message-Id: <20200918103807.373466-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  netkit-rsh-0.17-r0 do_package_qa: QA Issue: netkit-rsh: recipe defines ALTERNATIVE_netkit-rsh-client but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]
  netkit-rsh-0.17-r0 do_package_qa: QA Issue: netkit-rsh: recipe defines ALTERNATIVE_netkit-rsh-server but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index f6c05daa18..70fb4cf5fa 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -31,7 +31,7 @@ PAM_SRC_URI = "file://rexec.pam \
 "
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
-inherit pkgconfig
+inherit pkgconfig update-alternatives
 
 CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
 LDFLAGS += " -L${STAGING_LIBDIR} -lutil -lcrypt"
-- 
2.25.1

