Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.7333.1625583207900092917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GTjx4IoN;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso2032138pjp.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+rEdLTrk6nUl+o98WjWyZpmEQZhZ82LYbxmh16PkeLI=;
        b=GTjx4IoNTwkG4rdmIAIGM/Dn5UpqAyOLrbfgslg1qx2eq5h6YgdFTmxTGPIhQVYwIg
         DHVBbijrpGXcEJPcT1DU+iAsKBvYQk31aKOB5iZeVtF8oVuYmfynYkDCyv3+3pXwWKBg
         lvpHIMWqtjSSE4CXhIu19txIPU+mQiOStODjVYbiPnCF0yemKY8U5DRZD9ZgUFdEn81S
         sZ1+3MN+P3TM38SzYIXTnsAtLUgvJ5ATZYDFk/bbG8HDC/PE7b36F6o5ftPpiX+m1HZS
         7DFx/beYr/quMirJxJT4nB8bHRicYdwoucKAu+smZsEhwk1YIpwulLn2IFdGNCFNqcah
         4gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rEdLTrk6nUl+o98WjWyZpmEQZhZ82LYbxmh16PkeLI=;
        b=gsQkIXM1dgZGzAVmxt5xm2OGkt212GvzmzMqYF+0EqiLBz9mrDfi4NusCvQyAru+hA
         dOAieXMQdhtzccqxLnKuxgT0rAIFGuQn4q/1h2DiW1e+0R1EBDriJQkMIG/bOEU0FMGN
         Rp/eVxa/xbzK8aRFGTMKqrD3Gh0yigSZo8IjesGpOvktIjVL7QkM2USN+juLksXiCphk
         4XbuypVwu3MF90GcjE4g/dL4wLO7QuYPkGYkY+fjqEr7HuAiShsJM/xD4osQ7xauTgDl
         Q6EuungLIKb5xRPWceFPzjaFpL93IH63eHVsQ1BjGuiAmeDUUcQcYKWmtWxkauQneles
         qPWA==
X-Gm-Message-State: AOAM531O5SIEZPz7RewjaWzVOhKHMsU8ANLN0uFoMsbaz3YP6s24Mbdk
	x43UV5IPDXU9hO59L6hrI6GuUPI8IxeUcg==
X-Google-Smtp-Source: ABdhPJz36iu8K5XG2uslB/6oOg5zKxkCHM/RKLmj0gLaSB4nU0h1atPxCda8vxJbkoIoRCzbTs4zxA==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id mi15mr887532pjb.220.1625583207355;
        Tue, 06 Jul 2021 07:53:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:27 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/11] dovecot: add CVE-2016-4983 to allowlist
Date: Tue,  6 Jul 2021 07:53:16 -0700
Message-Id: <7bd47ef6c98323c95a9e527129dca98c9a65ee08.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CVE-2016-4983 affects only postinstall script on specific distribution, so add it to allowlist.

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3613b50a84559ce771866cd1eef1141fa3e6d238)
[mkcert.sh does mask 077 first]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit  d1fb027f894921ea02c984eb581ee1500c613470)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index 0f7fad2b24..e21a94ad64 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -67,3 +67,6 @@ FILES_${PN} += "${libdir}/dovecot/*plugin.so \
 FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES_${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
+
+# CVE-2016-4983 affects only postinstall script on specific distribution
+CVE_CHECK_WHITELIST += "CVE-2016-4983"
-- 
2.25.1

