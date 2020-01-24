Return-Path: <kraaggorim@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8BB7FD7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 16:22:28 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id 192so1108485ywy.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bqNvvyvyPk5vz8za6jSIRpJeBPaI5F3ZEioBlvmIuzc=;
	b=Zh2BDpu7DqqDxfpNyfXNHZjGSlDivvGBTqz+EwpxdReArQnMgroOqzyGHOM9xt99es
	bLG30f21u19MP2LtoIbxHW9lRkXaMijJZQVC+hLEQqXeaQMFhKELMWwMwxjkRMXqS4ud
	zOBA/mFBRPIFxKT42FJh3OBHDPqsstNnGjEY8/se63wctrXh4DPXGYB/QTDDcw2JLBo/
	V8iEdiUoDTo0Z121xDTlWHxJELCtLFjRXMMPMgl6CPiWduNH+23CnYThRGGuiXKUWzu1
	+SxgWeZ+rtDRSDAbz0iYMvxZIbs7hZuvcSI8iZesD6oSFIvOM7K+jCHjnYEpa97NHKLB
	TxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bqNvvyvyPk5vz8za6jSIRpJeBPaI5F3ZEioBlvmIuzc=;
	b=RIXwxY0netJAtA7bA/iYdZUsEcev4/Fus0CYhB17/GkkofinHCjQPKTGDTQWmlZWTY
	dDz+2KuXFmbarVPpTtLaOlUKwWMloHh88afkQ9dacECKEyb3RgSZkNzJyryoHmwxZa0H
	9ByhfwV4IcpCSnmzzni/82LyA2q1W9lqQUVTkf6Sdd2RQQ92yH0YaapZFBmQs+SlMRSh
	z+hy3e95vfMEw7Rr+HbzkuvLPv/PRWquC34LhH5B33EV0ZWqhjL3Hb0IuBl+lGAOlcS6
	Y99IOulbMMTJLI8/QCldcLFL/Yh2n00KKKXgTi7PPwAatLcODe+dJJcpdpVGTeCRXjr1
	Rodg==
X-Gm-Message-State: APjAAAXNIvJevKgDOIAlxBdar3Y4CN1/1+RHprtVi5dnHCiihYAc3ahK
	Yuy5/b5Qa158w/XUjH0PMdfbHm+ZhkKRVk+Fi173ZxQKgMk=
X-Google-Smtp-Source: APXvYqzQWfvSCLnO0tZQ9wMGebyEme6N+5iK2WBa5QbJs2bmVd1/bX8jbxgiWCR1yJHH6Qq8dLzhKtTG4Gp9Rq0GqwM=
X-Received: by 2002:a81:b548:: with SMTP id c8mr2612105ywk.465.1579882949267; 
	Fri, 24 Jan 2020 08:22:29 -0800 (PST)
MIME-Version: 1.0
From: Kraag Gorim <kraaggorim@gmail.com>
Date: Fri, 24 Jan 2020 17:22:18 +0100
Message-ID: <CACc3Zv6GF8UTJK4=v22np2vZoSgkBtWr-1VSG22LDkhnky65xA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH v2 2/2] [meta-java] icedtea7-native: inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 16:22:28 -0000
Content-Type: text/plain; charset="UTF-8"

icedtea7-native relys on python to enable building it. Therefor it
should inherit python instead of assuming python being part of
HOSTTOOLS.

Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc
b/recipes-core/icedtea/icedtea7-native.inc
index b578cb2..41da925 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -30,6 +30,7 @@ CFLAGS_append = " -Wno-error=stringop-overflow
-Wno-error=return-type"

 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
+inherit python3native

 JAVA_HOME[unexport] = "1"

-- 
2.24.0

