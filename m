Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 22DDC796C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id s13-v6so5614624pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=chLzINZvPqJTLFu0oX21uVqwIxLVB4rSzAYnXZOqHOQ=;
	b=b7IGPX6qFHp3aTCkrBWQZCI+fP5A4gUBIpxdqOlrEf+L/h7xrNI0X75dM2zWiZ/aZV
	jxfZgzq31lzVeQwoZHDBI10q0ZiRJ6zUdHvoCGgDXT+SkKmL4i/4IBaa0AkoxCzJBQu2
	fuACrJXcmZLxMh/aRfSvA2hlPlmtuTEtQnce4k4/SyELHXQV+UNM8Gc3MR1vyHXHYlRv
	NXaxzuOTdG/YAR4NTl/0Fo3Qe9GcbE/q+Xh9N4CUGhEiG15CSL++yPJJ/C8Jc53Hsa3P
	KiGPBdhmMliXE3oJqjgruw0oltViYDMpXr+5Vvn94WgIkHf/hbA7J0nchDkezrPB+hUM
	JdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=chLzINZvPqJTLFu0oX21uVqwIxLVB4rSzAYnXZOqHOQ=;
	b=E55DciomVwUi3j3tHFQ99Pn+drrRv5p53uVN3vvzDxozziOKHoZvzhpgX21LVvpH17
	d8ENvtwAtNYV3DC6O0pNHjhN219u8R0lP78ppgq1cgclb/ISiQawAEClHYZxlV5sEArI
	GPsrUQKv1XrvKbcFSmlFaAt1S3tyFMEh8ijP+oLhql6APP4JmNDzxtXZOuvHU3QExEC/
	eFnNw3ih0tlEwSFeybPdkHV5O4bNjItxp3RmAxESdCxtGU1lgBkfEJzEPvc3SXXGkiD6
	MQ6H1AGBp3ofHIQRDL/ZO0IfycSTnOzZ+hErDnWfxxrrfWtvhNAH3PepXSWa70wjQYvT
	5XXQ==
X-Gm-Message-State: APzg51DCgx/TliK9oV2SH/mmeQHMVPR9F0jD5/5DS2luWYH6TUsYwlNt
	4uS9oJgy2wkXUB+89ccDH7F8aOTY
X-Google-Smtp-Source: ANB0VdYV2GoSUJIokZIShirHuOTJXO+FNhX9i7dtD71dn1pKXbb2hoieiWRPZpyZuVXelCq746LHBQ==
X-Received: by 2002:a62:438f:: with SMTP id
	l15-v6mr4094768pfi.196.1536254553925; 
	Thu, 06 Sep 2018 10:22:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:05 -0700
Message-Id: <20180906172210.42551-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 12/17] ipsec-tools: Depend on openssl10
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 020903d82f..37d7def8f4 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
 
-DEPENDS = "virtual/kernel openssl readline flex-native bison-native"
+DEPENDS = "virtual/kernel openssl10 readline flex-native bison-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.18.0


