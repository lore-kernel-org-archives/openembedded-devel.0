Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E70DC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 13:46:05 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.8185.1646142352603084156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Fe7FJms2;
 spf=pass (domain: qtec.com, ip: 209.85.208.172, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f172.google.com with SMTP id u7so21899309ljk.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/ffSFbB+P/czUIqaWp4EeTnymyi6DrdCVAhLaujQIQ=;
        b=Fe7FJms2tbBRZVVPB3OnvphaR70tWDgnUXUll2YVMLXJa2fMvlVUVBNR/QHRHZ6HTD
         ox7uhSRkFuxXRe6WKX86MNHjsqRjd7ms7dZuZGx0Vik1Oxo7KvMaoVf4/WmUSTE/Do7d
         zCM00FP1wv81vSfZ7z8z18wZUffk3EgE+cITlaqR5/fQLzMJdyOEtybaRsDy3p4qi5YV
         pOLt9fNjPy5XiddqzFQ+/lQDrCXxwlxCIFESNALY7D29qrNbg/8Mlhl0mDItWOmIgokj
         Zt2tufiXcOEW3u1fO+No/ywmpq58/JzPcK07qqlxbUBOgerRjDi3BsIGBOY23VSZ7uKX
         DVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/ffSFbB+P/czUIqaWp4EeTnymyi6DrdCVAhLaujQIQ=;
        b=7Hlf6fpHT9TCc5fVnazoWWCJKsyyTC6/jw6epnUBnZryaujjWSVAchjmEWSYM5gx4n
         a6lvxuGq5GOxBqQ2Gc0RW0KaGyfXDUd8nsSAcy6X0IZoN1LkrBOjwtOYAxhNNRHo6il6
         g6IlHnXx7mjcNwbw65/MX72IIUiuGWB9owYUlDhUkKPUQpLDOO6aSmL5kFCOIx7cJ7K4
         dLfJW5yGLqbM5ug45bZ0UNJdEgfJzpb77trghbI8hyf54gervxuuFkVgkooHJP/gOLoP
         r3Hm8XED4GeJVwSy/wLNxiUxhwXLaeuBnkoWXAm1zUq80ybjUOekWIHrDY12elGTbTV5
         fyfQ==
X-Gm-Message-State: AOAM5328jHY1hpYdfwp/frGsiQeK9S6r5LoBPSWdYRHtNJ5mr/m5hbZa
	XH8Vaud6QyzXVWACtHHAK8LjdlWb68g5UH6Kj9wMrjXuuJQuNE0YF8JVOFQJSbHaLGuDofLBSCk
	VtIl6DmYuIAECbnDc4px7kHlynvwcYFuEEDClpeLfEJcxWIA9OYZcjfMpwKCCCdJ0KehotQslL/
	lO0np2+9SA9B22jA==
X-Google-Smtp-Source: 
 ABdhPJzgOZe8GnJ6RYKPCcK8MJJD1G8NaflOJlisi37B5eSKUwwRJDd2IgTwMvAK0Dfo6zrMdysA7A==
X-Received: by 2002:a2e:9897:0:b0:246:7228:1871 with SMTP id
 b23-20020a2e9897000000b0024672281871mr15028448ljj.371.1646142350337;
        Tue, 01 Mar 2022 05:45:50 -0800 (PST)
Received: from localhost.localdomain (87-52-47-7-cable.dk.customer.tdc.net.
 [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id
 t2-20020a2e2d02000000b00244dc8ba5absm1972302ljt.117.2022.03.01.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 05:45:50 -0800 (PST)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [oe][meta-python][PATCH] python3-flask-versioned: Fix PYPA_WHEEL name
Date: Tue,  1 Mar 2022 14:45:47 +0100
Message-Id: <20220301134547.113525-1-daniel@qtec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 13:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95632

Add function to generate expected PYPA_WHEEL name.

Generated name:
/yp/builds/meta-qtec-distro/tmp/work/dbfp4-poky-linux/python3-flask-versioned/0.9.4-20101221-r0/Flask-Versioned-0.9.4-20101221/dist/
Flask_Versioned-0.9.4.post20101221-py3-none-any.whl

Default (wrong) name:
Flask_Versioned-0.9.4-20101221-*.whl

Error:
WARNING: Requirement '/yp/builds/meta-qtec-distro/tmp/work/dbfp4-poky-linux/python3-flask-versioned/0.9.4-20101221-r0/Flask-Versioned-0.9.4-20101221/dist/Flask_Versioned-0.9.4-20101221-*.whl'
looks like a filename, but the file does not exist
ERROR: Flask_Versioned-0.9.4-20101221-*.whl is not a valid wheel filename.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../python/python3-flask-versioned_0.9.4-20101221.bb       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
index 7aaf439b8..04493b21d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
@@ -7,3 +7,10 @@ PYPI_PACKAGE = "Flask-Versioned"
 SRC_URI[sha256sum] = "516694dc860a1bc4f22ab60b324a85083c0150522be109282a3bed681057fd34"

 inherit pypi setuptools3
+
+def get_pypa_wheel_name(d):
+    return (d.getVar('PIP_INSTALL_DIST_PATH') + '/' + \
+           d.getVar('PIP_INSTALL_PACKAGE') + '-'  + \
+           d.getVar('PV').replace('-', '.post') + '-*.whl')
+
+PYPA_WHEEL = "${@get_pypa_wheel_name(d)}"
--
2.34.1


