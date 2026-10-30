Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8937.1793358206875681072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T+ePG1jN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e04773687so170918f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358205; x=1793963005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2+NRVyFXkTihCbf8Zg5FW/GdFNlL9ykqVU3c1IiMrM=;
        b=T+ePG1jNsg79EgZ2PWdpjHk+yqO7REO4HABu36pV9ULSdIgSObUgvRgAnK2vwAoSJH
         lSRT03+QYd33SNX5D8zb7iNNB1WeKIfMptcvLhEZOSvRYM4lLvUSApc3wi/RuKfZ//x1
         3IrjUllXsgSEbL7B1SmmHwomLT+Cb+hJAkk7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358205; x=1793963005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2+NRVyFXkTihCbf8Zg5FW/GdFNlL9ykqVU3c1IiMrM=;
        b=lVPHnmAyrpa6ZnMqQuFYfdQy2DgSkuBzwwYuS3icfk+7CQoZAdcu4aG/LosuGM0Kux
         A0lRZntCESniRIxVsFbl0oP9pgE/NcLTdBI2UaDyeLGE39d563W6jUsqAfFjr5CztGW2
         +tsfUk2XjCW7UEWPC8lmJXewMVy/ph/8OdgjazcVCV7a9N/1Pb9dXwRf4QVuoXFiyzjW
         Zey8gAvJ0dkWAl9gnlsVEWhfxS5xEagyHPiaQvQRRHCoKV90kty5Xv5Puc2Or6Kqc1eO
         zDZ6BLhcDtFlu/NZU4xkgKmas6qmLwaJ3WS/4l6Ftgw3gGsRj8YeiF+x4nZJWbMMYofn
         MemA==
X-Gm-Message-State: AFq9FYI6KekViYzF421f/tkzZ5LBfPQjn6+lNDAI8sGx2Fi0XISdrPr+
	3GP1THtZ8sgY0+Dh9rTqPRQBSFzi3yNXJVEk8dzDvsP1bnjffnNcjZDU7HyD0paTTr2Ucgtxk0f
	alNfM
X-Gm-Gg: AYBFou3rwKg4gv1PgytroxmqWQFlfeLH2RGeLinaVOXdy9ZBYc8ZY3ssXjZNdmIRqcA
	+z0zB968Q5DwMHvNTalCufszffzfZxXW+j1dr/UX+Yi0XyVNdYA4oD+eQfO2GUAG2YBf1tt0NHn
	bhAJ/DI7UlUuirOZPUSOtlJcxrNrLRBlioal+cxBGZHk01bq4kUBVWAG7oq9M2Dz7IeF/m4Na19
	m/QrmAAZ41U/3ob8Z1JNtQ/YiBhZlCo71u6cw5pL//KGM6KqfK4N7/QMq5YkiY2snQ+bB/ykPIa
	qr55WTx2jnSyraS15azwQ3N2EpjbhDXD+wSGDylNzsiGSLVuIdFxsafd4h8U3jV5NsaSyTWdzYK
	AKHlFSuFx/XA8tMMGI0IXXuUnK2MlF+vqKH7vXCRnXZNAu/HM2qrrXIl6ZsJEY72bFfktHseS5P
	h903Q0vgixl+nXNw/E0GbSiNZH7AzPVwonTQWdpgttJssKIj3yxwTa/VSKWq7uyG44V/MwDdDQA
	KXCb8HwgynKRcY1D+aZYFqC9vkGoXZ3ZBC+lWddeGeAZvgSi4y7EVyHOWpGr64VXMcHRIDHvtuo
	rwxZ+k4pcjbbeFvNkabcmzIhTbOyHEEuUEIbQUzKBt7MmP5JHPzcu4EgESxmtQSmEaUL00bnlST
	4sExc2g2+bTJoA0MLzKMuaFhCF+jUT9iRQHbNJC+dOqD4Fmi/eNjrxA==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr94829f8f.2.1793358204482;
        Fri, 30 Oct 2026 04:03:24 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/25] python3-msgpack: Upgrade 1.2.3 -> 1.2.4
Date: Fri, 30 Oct 2026 13:02:54 +0200
Message-ID: <20261030110309.1124614-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131692
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.4:

- fallback: pass object_pairs_hook a list of pairs
- fallback: leave the object unread when a header type does not
  match
- fallback: return bytes from Unpacker.read_bytes
- Run tracemalloc tests sequentially

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-msgpack_1.2.3.bb => python3-msgpack_1.2.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.2.3.bb => python3-msgpack_1.2.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.2.3.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.2.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.2.4.bb
index 09e1180635..80deffd937 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.2.4.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "32edb81a2b5eb7cd7c9d941b2bfbbb082fd2cd09e0e725930316af6b708db186"
+SRC_URI[sha256sum] = "475c44e12f2a5de766a8448783f149c9b33f3f49b88953c6cd739a77d93c732c"
 
 RDEPENDS:${PN}:append:class-target = " \
     python3-io \
-- 
2.47.3

