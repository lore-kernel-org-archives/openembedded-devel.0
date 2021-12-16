Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6B6C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.11882.1639668220381422069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GrhGzB2V;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso1213977pjc.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dibHPr2t8BYo2ElJ0Zo4lJ2Qfe7tyb2n/cIrdPZk9Rg=;
        b=GrhGzB2V/QZ+hA7rCQYFzGAXKUOkk4D1x1uJrPladahY6hdi9G33KCV4CER6wjHL7A
         3kiJKWRW/6+HttAIBK/MTY7X3jIyyMFL2OA9RptOZL2Yva4HnW9aaTunp1+hfZ4+ONGT
         wnzl/rnYwD7A1b2xxo7kuC5m7DhMEKPeb1HaAEgOGjtnlTKUm0uy8x/N/DEIENgX/b9+
         D9wHTZnw4hDF0EmXDB3XTHBKLURsvO0asll1EIgRj5MRoQTmrhv4J/NYg9/WSdw35BDm
         Rq5cv6MOL2376vSu4Naq+bzNH+aMmQvcd43RB8rHhVjT0MaSIibJf334UkeNdCgpY3je
         10Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dibHPr2t8BYo2ElJ0Zo4lJ2Qfe7tyb2n/cIrdPZk9Rg=;
        b=PxVZkUqun4f89RR6kVcjYKenBq46DLVaDbuuyx5Ps5RCNOowZMg0cXh4J4W2LoUSJq
         DhusLvlPO7u7lmXIrqSEiqn0s1bQiiM4SvSD7luTW2koIFzdjxLbfoim8MHLX9uuTuDT
         sFNW4FXc3ZS/RwVsgPlMTKuw3YYXJUUlYsxBqLBUmbP5hxK8e2kd59lev/BK/DzY2AEL
         VAUHq/DIE3hjXOEttBnwAtPkfFb6WLZl+UMtfqe+wVB0lpZpQvsMR5LfZO2zB5YTW8N6
         uwsdDO1RGSzOVu+8tfiDoDfN0907tmUi28cPlWCWo9Cakxx9J61oEmuw3/r6j9O+FFWY
         bM/w==
X-Gm-Message-State: AOAM5336KNIgofL+Z0GnDSkzm3WvRSrJyHG6IAy02+xZXu40froGQF7J
	wZPpdKvBWNuUtafoRwNMkeAP3Nojxkg=
X-Google-Smtp-Source: 
 ABdhPJxge/ut+6QOf6JdR4Rw0AWdLQMW4FT28+Y/+0sLT5TmnfcNzwZCyIqKXckuPcqmO4IvWykCYg==
X-Received: by 2002:a17:903:230d:b0:141:e3ce:2738 with SMTP id
 d13-20020a170903230d00b00141e3ce2738mr16612706plh.57.1639668219759;
        Thu, 16 Dec 2021 07:23:39 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 15/18] python3-posix-ipc: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:20 -0800
Message-Id: 
 <2def8912aabde1433175e414ef18ef1a50eb02aa.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94400

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 4b526f42ed8db2c45bdfa7d1ba0a37e444676e1f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
index 2377bd5258..c46881cd47 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
 HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc089fb2f37e90799a54c19a20c9880f"
 
 PYPI_PACKAGE = "posix_ipc"
-- 
2.25.1


