Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F061C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.17974.1635592561704104012
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=osNTXzhd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id p18so5230313plf.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tUGrrIpezi50Y9Z0DgQ5+bkW8QJvDlj/wHGmXmgYjRg=;
        b=osNTXzhdQNp4JwqPla6JYQFDddnvIUpxOCB2vsL80pbCrT38jKy47rvHtm1DFkKxJN
         8GQHMzbAvvYphytfpBYGsvnIiP2BmM+ODI+FQoX5nRUonAIR7IJaTc9h60b0/jJBfv4n
         RW2Teg9wfFmkY1b78PoD02zoowKoGzy+3823jnoqtXBwJuyjmbzgmMqF8+sdR9vZMaXf
         s5FqNE1HlerDRLq+yYqVPLiEDSQA0AjqneUnF5MLWADdmwRkPznoZKGrBTZkny68LUkZ
         yPoeDSVBJrpynPzrZvs4fIpDTmr8UsuhCgD5ClfzQqykI5Gjmd5sdA6n9hxGXIPNlLTV
         +S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tUGrrIpezi50Y9Z0DgQ5+bkW8QJvDlj/wHGmXmgYjRg=;
        b=ioM36x8ivfxjX1fWFlATG/hgHbk8NZBIpp4ZFS66iz/DjI7TQEu1wg+TyqaR5Vn2dU
         YIvK6aeXUYqzQGOvjB4LmsRCoa128JzoobcgT8yj5b7IhbFDedf/aDCMs9YijE8+y7I8
         JJBHKhRTCtOhfXnacmqemlEowxNxaTFQMffp6JVH+uBAfqsmtmNOOUginLPfvc3jghaf
         vi4nQISAfqyXw0UnCgSgiEmXdlSSOnxcINsff5XBwtxTiI57dFc+tRgLehMQn/QqcE2g
         AMfRxV7iE9NJLwMUQ4KvG6Zxr12wcNnAnB8Jl7HucmjFUeSMxYJeJYUCRVApcGZH5rdK
         03vg==
X-Gm-Message-State: AOAM532z7lzKzQxKAZz7CSuC0UrKTNiMXqvn1SjKVb90aceUruaRRms+
	tkqzm3DOvwjoWizTXzUzF54caoneExA=
X-Google-Smtp-Source: 
 ABdhPJxmNDQ6RNiR0TdmOMylu1WnZWAEuZ1XEPXb7KHvGeXrCkk5Zmfv5beaA4PMungVC++KF6lqeA==
X-Received: by 2002:a17:902:be0c:b0:13e:2b53:d3 with SMTP id
 r12-20020a170902be0c00b0013e2b5300d3mr14815466pls.86.1635592561117;
        Sat, 30 Oct 2021 04:16:01 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 03/14] python3-openpyxl: upgrade 3.0.8 -> 3.0.9
Date: Sat, 30 Oct 2021 04:15:40 -0700
Message-Id: 
 <d9d48625ef192f459fafa6f5045e88828c988c45.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93660

From: zangrc <zangrc.fnst@fujitsu.com>

Bugfixes
Ignore blank ignored in existing Data Validations
Add support for cell protection for merged cell ranges
Timezone-aware datetimes raise an Exception
Improved normalisation of chart series
Catch OverflowError for out of range datetimes
Alignment.relativeIndent can be negative
Incorrect default value groupBy attribute

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 18f4c0b5e8aba27edd5758b7dce5e632ce924aee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-openpyxl_3.0.8.bb => python3-openpyxl_3.0.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.8.bb => python3-openpyxl_3.0.9.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
index 3d1f46e50b..4dfd4490ab 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4f2770348c029ce9433316ced8f91ed37d2a605e654f8bfdc93a3524561a8ce2"
+SRC_URI[sha256sum] = "40f568b9829bf9e446acfffce30250ac1fa39035124d55fc024025c41481c90f"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-compression \
-- 
2.25.1


