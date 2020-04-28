Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.6940.1588079376759720991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=1bAAy1X6;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.68, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f68.google.com with SMTP id di6so10292724qvb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Tj73BlpXQsdrus8PdFcflH94HPSv/bYXYdctIMNh4jU=;
        b=1bAAy1X6ozS92Jv5jH5thbdVfMljF8G0vRbzAFdOGx4ssonp48zJKp7ywjcem4P/5b
         RqwSDu7QqHBCLcHV85rWrbcYvNX6g4mp2EJ36lZWqq0ZbwIYRLtEyYCINGBz1x4jcWC3
         0UGqvf0ot9Cb/frJ0P/G8/VLvFWUvgcXPWT3t3t/gTeOe0fp1OH7AdENDhRWTpiMuANx
         xGUkwCNkeWhGCyAmV3zzeiGBEyzGaIuGzQ5g9U9baDgZTnL+XczbiQ/f/uvG3z8psQZJ
         VYfWACyQEXa+OBXsw4HKyA06t0eu6ODzP7oGMMfwlVNctyTr1MoxD5PTRXp5KK9AWN+D
         eNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Tj73BlpXQsdrus8PdFcflH94HPSv/bYXYdctIMNh4jU=;
        b=SsTqu+6YF+7O3zl3WBD6PzKFqyu3npoXMeJ3t5Oph8ICcgSgBSTAUjyG9p1UOHpuZp
         9H8xB+QfKRUji/aR810OEAXRy/3XzejJhg1lkpvfgKHisEuvBe08fcHo3WZO/BZXG3I/
         B56nknG/jZLOx80blTRyQB2I6BW6jcpNvwUmGf0s8YztzX2fuiGcpL4kAVjN9kX5ehvJ
         AjpNnoTtWKPvWkQpjLF/4uX59POlP8MLtDpgkDTHVo3i1eNGdsD/sIZW7FXrJlmZJHfR
         pqw0o5kQtpVcGxjHqQnRACKKywCShLeHsLUwNQErU7MYMgqpVqAdmt+fVa8873Jphoxa
         rO0Q==
X-Gm-Message-State: AGi0PuZJDYcQhvCtcK47l31QEQg69AGPQqZMRLdKvtv2fGKO18MN7Fum
	iYCHIFeiZTKyPflybywLVSYQjX+Hp3E=
X-Google-Smtp-Source: APiQypKIu2aqmGDSDuqCWoh9VWyDtRiUj0Gtz/eNQJ4f9cu8IsMLknjY9s1K+1YeMEMjmBfqZv4pfg==
X-Received: by 2002:ad4:4e83:: with SMTP id dy3mr28477323qvb.1.1588079375818;
        Tue, 28 Apr 2020 06:09:35 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:35 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 5/8] python3-speedtest-cli: Add recipe version 2.1.2
Date: Tue, 28 Apr 2020 10:09:11 -0300
Message-Id: <20200428130914.17398-5-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-speedtest-cli_2.1.2.bb             | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb
new file mode 100644
index 000000000..a901bbac8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Command line interface for testing internet bandwidth using speedtest.net"
+HOMEPAGE = "https://github.com/sivel/speedtest-cli"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "543d38f8939e1716641cc7c00169ca03"
+SRC_URI[sha256sum] = "cf1d386222f94c324e3125ba9a0d187e46d4a13dca08c023bdb9a23096be2e54"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-misc"
-- 
2.17.1

