Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3E7C38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 16:54:00 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.20607.1674579231590842884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 08:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=guFY7Jbs;
 spf=pass (domain: linaro.org, ip: 209.85.208.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ed1-f43.google.com with SMTP id x36so18899015ede.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 08:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GayVrc9di85ShPfErbdt3vXxNaMcAkOblXvwDDe7qQo=;
        b=guFY7JbsEUv5jYcaRT6ua1yu7H0GNZSP1QumtllG97UI2Vbgh7RA84wsi5iSE8CJFD
         AZnQj3rZpmQPhWIn5ErHE76AHnZz5EtoEEonrHR787Eim8xmf+hbgrfSL9G0W5nv/aYH
         RmLfYrBSVPJMguB3UJxpXU3iMiV0+VwdG/iDn1M/y6mf1VT/J438/6meKE9dM5Mz3dIb
         0lb6S2IzfSFXwWpr4LVNTD3uMi3M31KrQhywactkfLg+e1Y3H84Vd/3yy7EUMiqP8bsm
         P17r/+bOwCIoFkILazfCmoIxn7BMVha/+NL74Md1A7Wfrg3nYRl8cDJUQ3QEOYa/wo9F
         74yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GayVrc9di85ShPfErbdt3vXxNaMcAkOblXvwDDe7qQo=;
        b=0l3tniXc3lyh/ceLSmrajw8iutx9IAb1wNOlu5Zw3+ErX56HKyQswbJ+lz2n5Fa25U
         V6WinOKtn3Fo99dcc6qc6EcnVJfA7s+7/1FoNNxDqZS/VZ+8OkktA+nUbzKYV4opOEST
         219XRg8ErCVhr471u4jfNyWhqGNcpYKFlVst7HJkdGjOKO2ZwSU0M9mF4GAczgsyWUWu
         vHROnZDOsiOE6iolymn2X7XIkCrLCFHp+3LlwbayxdTekGZ5q62Kab/N3SeEpLu4vcYs
         AVmuR4nCNkdji6XEJ1cYCHmtgKKuVC9S9J0Fr505EhcMjJFzwNMqk3aouB61V1fxxJGP
         Bq0w==
X-Gm-Message-State: AFqh2kqaBYdzeQPcR1GoG6AH6uMhegoi+bngyt0//eeedc7nbwg9jylL
	QMvGZhDNBjiOD5JKipmVsmiL48UZ2rUu/g3s
X-Google-Smtp-Source: AMrXdXs/5Qs3YlLt1r2HXB+yxymQTrR4f0T1NZGEQ/LjKtnHIZqwdaJaRqulQAyUrvmjjTKfwkZU1Q==
X-Received: by 2002:a05:6402:27d3:b0:499:b3db:6aa3 with SMTP id c19-20020a05640227d300b00499b3db6aa3mr38096701ede.1.1674579229583;
        Tue, 24 Jan 2023 08:53:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020aa7d315000000b0049b58744f93sm1243980edq.81.2023.01.24.08.53.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 08:53:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] edid-decode: an utility to parse EDID information
Date: Tue, 24 Jan 2023 19:53:48 +0300
Message-Id: <20230124165348.739245-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 16:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100727

While parse-edid serves it's right to dump the xorg.conf style data, it
lacks the ability to display most of the information found in the EDID.
Add another utility to parse EDID information.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../edid-decode/edid-decode_git.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/edid-decode/edid-decode_git.bb

diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
new file mode 100644
index 000000000000..91570b6f350a
--- /dev/null
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Decode EDID data in human-readable format"
+DESCRIPTION = "edid-decode decodes EDID monitor description data in human-readable format."
+AUTHOR = "Hans Verkuil <hverkuil-cisco@xs4all.nl>"
+HOMEPAGE = "https://hverkuil.home.xs4all.nl/edid-decode/edid-decode.html"
+
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ef696d66c156139232201f223c22592"
+
+SRC_URI= "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
+SRCREV = "e052f5f9fdf74ca11aa1a8edfa62eff8d0aa3d0d"
+PV = "0.0+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
-- 
2.30.2


