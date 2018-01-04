Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 250327878C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f206so3354273wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RW0In6FdkwtsBXoi4q32+IAPUyHN0t9YNjNdQO661EY=;
	b=rHX6vc9AK8sm2zosAWFvnsewDI0eQjKBl/jmyyQ/IPl/TSpHNgbnGUa/r04hmN+KK5
	foObVzE/tOtiROQ3P03R9SOKVkHDPnBWVM30VVnEO7ob4NWLgVhgd1yNTebFGjN9fsRk
	5dsZ3jz/XAN5YMPH5sIzwsOtW8jt0nHzKjKX4UlFaGRDx5ttrKoYgsMcO5PyZManBehu
	6JlC5OAtve+yX9VbqkQN2BGEuA/M8HMjKAjiF7Ei84u3IV0h2Elt/vtZ3Gg9DJEUdzdu
	bHv/LgFTDa3O/AHjfw9jM7SIDjqZ4DgbTALnFhtniqNxtIJ7H4aI1igQDEA9fqpITuGZ
	dDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RW0In6FdkwtsBXoi4q32+IAPUyHN0t9YNjNdQO661EY=;
	b=puxNmtC2sQkY8TB+i8C77XhxBtxOhvYsd/vCVeoPraDVLTIx5vC/VS+QfreGtO0UEO
	3W+gMEIfvkLKMQqnEhH7fObsopMeUyG60eBs3g/lvRgFAFs6rnAt0cIKcVZMI+2UV0hS
	uM7NwMF75zPE4lJSpoA5Cu0l4VLOgzpTlywPhts4AFgV8oMv06NSOiplDZPQnpCQIDVV
	UIG93ZZ2CKOiKkBfYjUjwCHfvlS6kixC4aYpEQS4HOyr+dO1LWdeN+lKSl6QyUlfufsp
	AA9AUeGCo2pfy70gi72+EiRXpT+4WDpUfe/SvKXdJvkAEe7NP21SZG6tFVnyGuXvUJuk
	YWsw==
X-Gm-Message-State: AKGB3mLUVb7bNeRITIvvF6JJKqopjGmkzNkzY6YW4tD0dN4zXgg0yreK
	gSnUxazaE5uLc61ymZjzwKHy0w==
X-Google-Smtp-Source: ACJfBos8e7Cl9gW5NbLI+WwWwBdxOf6X61sT2fk5bSbR1QGc0ERks6eSyQh494WeonoYk3/Us4wyPw==
X-Received: by 10.80.170.70 with SMTP id p6mr7341329edc.203.1515071981711;
	Thu, 04 Jan 2018 05:19:41 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:41 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:08 +0100
Message-Id: <1515071950-15401-6-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
References: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 5/7] commons-httpclient: extend native bbclass
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
X-List-Received-Date: Thu, 04 Jan 2018 13:19:42 -0000

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jakarta-commons/commons-httpclient_3.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
index dffa9a0..8daed1b 100644
--- a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
+++ b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
@@ -11,9 +11,11 @@ S = "${WORKDIR}/${BP}"
 
 DEPENDS += "commons-logging commons-codec"
 RDEPENDS_${PN} = "libcommons-logging-java libcommons-codec-java"
+RDEPENDS_${PN}_class-native = ""
 
 CP = "commons-logging commons-codec"
 
-
 SRC_URI[md5sum] = "2c9b0f83ed5890af02c0df1c1776f39b"
 SRC_URI[sha256sum] = "f9a496d3418b0e15894fb351652cd4fa5ca434ebfc3ce3bb8da40defd8b097f2"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


