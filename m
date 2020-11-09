Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.15134.1604943506092843926
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ht8r49N8;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id i7so7740550pgh.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZg4S5AEVVbC12c/XrVJ7Nvj/kSbgx2VGQSY2WFV8CA=;
        b=ht8r49N8r4Ba0imj+FpokdMb7FYNBPzxG/jkFOvY4aQF4P1z+rFOAhnB1k4Afj+DQT
         otqd2/gQQjYMZmhSW84X6DTRLNOwx/ba4U1LwBv+nYOSBVF7uy5vA4KB6J3P1p4lks4v
         /5FwLtlB+QYF6GqxkP62EjBO5NxteYT6LRlyTlwVlEf2E3fVxM1jsY+5qORDaEPjqGOz
         cFpOpnmcsSVF9egCnhrmDQ+DOXg0KSfJ3K14wErE+xj+2cpjAItIi7+5r3KV66gZZECE
         S/dvEmcwXCI6kvYNN5v+zoVJffux8zr7mQC0nFZ3z9qGZsG2RZPZkaUULr82F4uHhlF7
         nhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZg4S5AEVVbC12c/XrVJ7Nvj/kSbgx2VGQSY2WFV8CA=;
        b=FByIffrD1+nI80z1w45dgkS/emBv4nQZUHhVCyAKbrNr2wRYaqv1EfKIgKajatjeDZ
         fnobHJyx28FHnp5ZdNMGPtM9EV37LMNiXZEM5/A6IrX55QU7kjPjVBSUX51jXow3eeIi
         AU5fWga9kV4rSSGq6KOeXwYV5xH8vfDqITZkal7NXYMP8ZQXYMVoudFmxp+QCtKPf/aq
         P/TYtxW2Gwk40T0+0l2i6czlKyTDWq/50xhDHbHK1ys9lh91f60dLtp5VeGzI5XXvxCs
         Ik6FyVui9Yzgr5t+8MoYojemD16mRaz650uvz+sTypMIhjV3RwnodxIMy6wFv+4XU8fl
         Z+7g==
X-Gm-Message-State: AOAM532KTAqHT9+aKbxaEIPoSNeD0njeM5EwOnbAqyyq/zhiVMlBPUBz
	+Qb7vSXmuFH/lP/MKXCBTDdm/2agSyzz6g==
X-Google-Smtp-Source: ABdhPJyo5GLv5lrEO0C4lojuEz/4LQjotSJNundqcNSrWUfv95jDI25C3Z2P2vkG+Q7RrjYrTdyBYA==
X-Received: by 2002:a17:90a:b797:: with SMTP id m23mr252544pjr.153.1604943505315;
        Mon, 09 Nov 2020 09:38:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] opengl-es-cts: Disable LTO
Date: Mon,  9 Nov 2020 09:38:15 -0800
Message-Id: <20201109173820.3545516-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109173820.3545516-1-raj.khem@gmail.com>
References: <20201109173820.3545516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs upstream support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
index 5e0076b207..801bd05c91 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -27,3 +27,5 @@ do_install() {
 }
 
 SECURITY_CFLAGS_riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+LTO = ""
+
-- 
2.29.2

