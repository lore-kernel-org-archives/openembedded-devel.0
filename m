Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4380CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:08:05 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14628.1792123683282914314
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EHjGiBMa;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso18588025ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123683; x=1792728483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8NQny8DtIExJsMhNMpHX1uiWFRt6+EEd4lXjVubjLQ=;
        b=EHjGiBMav/S7Mz/H03//YMNzQqpyN8R9DuEw1Z9A+OxF6tdT/S+KFy+CpKrayl7w6j
         RzNFKGL6aDPvr8Dg67m5QvgeCFG2N0kuz9NYhTqrrHwr3wmV/vuM48IXN3uQAlLOInLn
         glKHPI/LqAe/e55R5IpL8ZVUZfKO1kEHuqJQFpeqEe5Yun/1lUscGBACcHVfRv5bV5Rw
         ED/0BI7iZvx95yuQyNqKJqrrPkF0crgyzydBJWSv++pb2y0tjE9m+KGhQaWayiDK7+Zm
         HqrZ4rKZFDPjVT/aRwzrkcMrfRJ4F07VM/3xWVd7Hvicdp3d+T2Ph7VAIdRv2SZogEAV
         x7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123683; x=1792728483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8NQny8DtIExJsMhNMpHX1uiWFRt6+EEd4lXjVubjLQ=;
        b=B4O4snVjvsArx6hhhpG2aKIoMKQVffllx36tagLjGw4ZJabxHamdT4c7Yx/eQqNo6j
         hBbAHNeVrR9fmoW82nTmDVt2mZFBUTnjF+9UG5jjQNog6EmfucO6Ys1kOqt93a+mrkDf
         N6rW3nGARmyw6mhyirSROu7e1TW38wM9j5Y3yMZEc+lIIXp11gGCOwJvM+fkFhyBNfFg
         eg2YJXU1W6mBILHsv3fVNusO6OoVWsVul3812g/fTYyOr7JPrPNm5CNJyhYy4qapzVMT
         8sKjL75jQWDNnD1NvByqUmgzIovak2zIIVvgwmDpYExudS0wlBSnLkPWjQ4emxHylO6B
         PAqA==
X-Gm-Message-State: AFq9FYInUi6Ru8UTMi9AbH497TDpwVed2lAWIUIQGpj//+LRorKkFPWJ
	D+ED+5F/e38hDwP3c/OJg1gzNzSavSARZ0l4pdUncwRwa+dLWE6wb61SONg1Vw==
X-Gm-Gg: AYBFou19D9gVu5UXr11QFLJEdsDhHpAFei0yAq6M42f8Z8dQngnrCkQMQNBkKKryClN
	Hh8pCptFMKalAljLji0h9hjewplLGk0jtj/3/H52xo0Tf+yUecS8LH+qkX41SWykDUCQ2sviaL+
	U0UB8BI7MhVhC35PgQUFt1JanOmgjFJ8HUB101usWtWIjb0R6YxKqVV0/AtxDhKl9wuoyQiK9BT
	DyD+LpApp9KF8M66JH3rGgKQXONSv2Fktf2ZtlUFQ6/iVhWEJPas4nEl4Ihlk0ymdmxjF45zB1G
	/aBUrZeTJZPKjzBA9By56HxFIcsPG75te4LCTLujetEKltt0roIXs0QB5sg4BGOtoyEIB1Bhhtw
	wkGY6ISsHp7R7zQO4YxtRjJkZddbR6z++CMj8nb203gYysmdZlap84tuCJ10GdXohWFLK7Czc+s
	/gAI5rJLRg+VAdMV+YvsrFH0gTdfSewFzUqtkQH7+eVVl5II9er40E18GT75WTUxGBFqQF/Kmh6
	5mmwYqpcmtL3zApRy6MlrtVvHI6NI0RQpcZPYI=
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr181085725ad.59.1792123682506;
        Thu, 15 Oct 2026 21:08:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:08:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 10/10] python3-simpleeval: upgrade 1.0.7 -> 1.0.8
Date: Fri, 16 Oct 2026 17:07:34 +1300
Message-ID: <20261016040734.1499287-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131046

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/danthedeckie/simpleeval/releases/tag/1.0.8

PTEST pass:

root@qemux86-64:~# ptest-runner python3-simpleeval
START: ptest-runner
2026-10-16T03:38
BEGIN: /usr/lib/python3-simpleeval/ptest
...
Testsuite summary
# TOTAL: 164
# PASS: 164
# SKIP: 0
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 12
END: /usr/lib/python3-simpleeval/ptest
2026-10-16T03:38
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...thon3-simpleeval_1.0.7.bb => python3-simpleeval_1.0.8.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simpleeval_1.0.7.bb => python3-simpleeval_1.0.8.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.8.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
rename to meta-python/recipes-devtools/python/python3-simpleeval_1.0.8.bb
index a4fa42ba28..9af99be801 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/simpleeval/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=aed013161b2a0bfa75e69eeb4e8a89e7"
 
-SRC_URI[sha256sum] = "1e10e5f9fec597814444e20c0892ed15162fa214c8a88f434b5b077cf2fef85b"
+SRC_URI[sha256sum] = "b417f869c11f2de034eb919820a825f35d12ce99f63a43971947ce73679eb9ba"
 
 CVE_PRODUCT = "danthedeckie:simpleeval"
 
@@ -16,5 +16,6 @@ RDEPENDS:${PN} += " \
 "
 
 do_install_ptest:append() {
-	cp -f ${S}/test_simpleeval.py ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }

