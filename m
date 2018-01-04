Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B09717875A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r78so3453381wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vNIX0b8UzBXSu2MWmWQ9p92Afg8tfv/JGi845eEbUSw=;
	b=h1K3+aIty2Pwv1snSFF/L16DFeepb7G91DI4KUGmjOsw8onO/oXIM8xLfaU9YSfbmJ
	R6MYobPLd98vyWy7TKVW6JoEoFnzzO4E9LMmFG7t6VrUa/u5P7prfWizvKEqV0OYoaV5
	6IBB5asABhQEnXYKB+iKEuboLaBz2plj33Dihqcc1eeSgqYoZDff7ee1pAS9A9Egmoyv
	RzGIsr1FFhZmJMiJYvtRSx3ufUzHpnEzytW05uUyh+9w5wvFw/SLWH++XgqpBb029Yj4
	Dh1GzHTilzqyD1OaYosM1euJxIuxD7q7Jrba2uG/H/a4HjY0eEhk2EnUdd+nNuYOcdjt
	eMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vNIX0b8UzBXSu2MWmWQ9p92Afg8tfv/JGi845eEbUSw=;
	b=ePABRssDSIXTSLy/Fp4N1dq13o4oJ1fhV8MFnnaKJE9GC6c4iCFXQs/rNIQarX0TQw
	1zinDQeFZiy3OF3l23o3UKzVqJo1DEHj7FqCbvkpMMyprDK3QIJqI186BvJxJnRviGVI
	FTsfckXbNWFAhmb1pWFStKhtnyDRp8ruZs53sYq6+0+ZwfjXqpaDPDDWm8m9OvwbDQgJ
	BAaV+COm72GcJiqiJaonigF5KvMrl2xT7N8uUN4sXt4zOpHs25bYCo4HrgJZC3TJPdmU
	Qb4efRwp3owEBwpzZ0jisw1/OfD5mC2/ix7xthtA+LmvX/nSt9MVfCnbbEGMuZmvzDIk
	BeFg==
X-Gm-Message-State: AKGB3mLNcTMv6nr5q8qji/7fzas62Tri4bSxrOQkAxMq158vE3V7bg2R
	s2YhrbWM6DXH5eylKg6N4Mlqog==
X-Google-Smtp-Source: ACJfBos9AZ+X9OQa2Jm8sCnVvQc3ntF0AN48bZxWOiy2cvByFn5zZJgPHAsmRiC3K+wLzqbg4fxqjw==
X-Received: by 10.80.245.7 with SMTP id t7mr7483239edm.71.1515071973187;
	Thu, 04 Jan 2018 05:19:33 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:32 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:06 +0100
Message-Id: <1515071950-15401-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
References: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 3/7] commons-cli: extend native bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jan 2018 13:19:32 -0000

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jakarta-commons/commons-cli_1.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jakarta-commons/commons-cli_1.1.bb b/recipes-core/jakarta-commons/commons-cli_1.1.bb
index 52dc0ce..68ba187 100644
--- a/recipes-core/jakarta-commons/commons-cli_1.1.bb
+++ b/recipes-core/jakarta-commons/commons-cli_1.1.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Java argument parsing helper classes"
 
 SRC_URI = "http://archive.apache.org/dist/commons/cli/source/${BP}-src.tar.gz"
 
-
-
 SRC_URI[md5sum] = "ccc1aa194132e2387557bbb7f65391f4"
 SRC_URI[sha256sum] = "929eb140c136673e7f5029cd206c81b3c1f5e66bba0dfdcd021b9dd5596356d2"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


