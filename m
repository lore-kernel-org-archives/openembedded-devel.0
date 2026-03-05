Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8031DF3D332
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 16:28:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48377.1772728090231998033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 08:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F1GdBUHc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so93968955e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772728089; x=1773332889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/1rUf+hdUlB5biEuC1SXHFIfMLJPxS5v0oio7amd6g=;
        b=F1GdBUHc599TAHkDYVYC+7DRa4iZDRdW+bISxK8SwlI8x28z9RJbjmCWZ0wj3G3pEB
         TU1cFDlTNEuXpLlaYBPLMt5wzb7ZJH+pJaOdKewjGXaeDNMr9a04tywzxW9rR57Z5LWT
         yYt2XB1yvwLTqZG/aZLfHMjytgtKlRlvSCCimvKtqBRc5PQkfW345/FV97PD8iIoe1x6
         0EX3Wshwga17TN/S/GGgQ1EoidypBFt6hZqCKVTn0iv9V7CJlKporXoy1UbOlc5CYsrg
         FtBsaB3doWL/Z91GQ8aWCBPM/UJMAnHNerNhdHTTygVdVDdlzw1iNbZsmRGISV2H+pFj
         y9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728089; x=1773332889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/1rUf+hdUlB5biEuC1SXHFIfMLJPxS5v0oio7amd6g=;
        b=dN4dxZZrNmtu2IUb0uMIHp8RY5yz2kzF4cmbUJVBvEpq3LOTkE5ruQZt4X+/EBgPRt
         RmgDDCdMMbAMOD09TuPEZrymxyncmEck6+HduASP78K4LzBXMEkjgMsdJPiiMKzC4RBb
         51CLkt1E7QqS0sKirrFjEL+cyxpljgEIjy+OYh7vUsfZishFCDBi46xhO5zbuG3pF5Jg
         wWx7Wh5aXAzCjWDUfZtdYwNWm3k2H0lUDVLi6b1Wm5qouqMCLJGw4GwXieh6hiWkNmdA
         LGvSQQn4MNXbZlSKa6at+S7gWqd3WGXlgwDctZdKWuZQStYjw7MypPBmY/7tqGRbbkew
         Q7XQ==
X-Gm-Message-State: AOJu0YwkmiTfmDlRDR7Hn1GeFPTLrZyGXq93YYfphHBkncU5p4W1La3U
	fYNnVxEkK9FwIJZlnpQ54a/4OqkrlmWaLVlBR+YWOuLnWgfx9MW+gdqawrX7Kw==
X-Gm-Gg: ATEYQzzAVdLrMjoEJa9oND+4TdJ95rvYNmAo1yRMCvPe3srAzM7VdMWKbgK7fO6Xbob
	RCyjZA2ATgf/0PAiJUNpO24cH1SsCWbMxt79RZZMQPEMgfBythgpNra0eCVP6SsnQOi7v8BHBS3
	2GAq10tq40IqrBZsF3PQ3GqLAJXUTTaSoLaUJxIx5hfDc4szL7btCoCHhynnqTPl8aHQ0LY7GQ8
	phZPnm5GxQ/UmbBKqqtzO1DcdebXgZ0srajhtcpQq4uiAgBDqUYLby6fS21LMjo8PYQftqS1Z41
	oRYZXmHW1ZnmUPUwTcC31fbbEHTioupdpOxntrVYSBL+QV7PqA+zYSNVk98kTkhugICAxHcsKvl
	itK3p7MlMuTFHWvQyDsf0GQdkWEbznj+7AzJPGdXGFKry6GhwNFo9+VLEjTl8wLLYr8bEPoG/ru
	7Y9TShZGWDZ7uDP3kv0RZ7
X-Received: by 2002:a05:600c:1e8c:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-48523589aedmr1373125e9.3.1772728088493;
        Thu, 05 Mar 2026 08:28:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad02cfsm63860025e9.1.2026.03.05.08.28.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/3] sassc: ignore CVE-2022-43357
Date: Thu,  5 Mar 2026 17:28:05 +0100
Message-ID: <20260305162805.3077054-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305162805.3077054-1-skandigraun@gmail.com>
References: <20260305162805.3077054-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 16:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124887

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in current libsass recipe version.
So wrapper around it will also not show this problem.
It's usual usecase is to be statically linked with libsass which is
probably the reason why this is listed as vulnerable component.

[1] links [2] as issue tracker which points to [3] as fix.
[4] as base repository for the recipe is not involved and files from [3]
    are not present in this repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-43357
[2] https://github.com/sass/libsass/issues/3177
[3] https://github.com/sass/libsass/pull/3184
[4] https://github.com/sass/sassc/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 576b84263bac4dda26d84d116a9e7628a126f866)

Scarthgap has also the fixed libsass version (3.6.6), the CVE can
be considered fixed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/sass/sassc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
index 9bb8c76e87..94d69642a7 100644
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ b/meta-oe/recipes-support/sass/sassc_git.bb
@@ -11,4 +11,6 @@ SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
 PV = "3.6.2"
 
+CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
+
 BBCLASSEXTEND = "native"

