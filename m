Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com
	[209.85.161.45])
	by mail.openembedded.org (Postfix) with ESMTP id A382778DD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:43 +0000 (UTC)
Received: by mail-yw1-f45.google.com with SMTP id l189-v6so13130096ywb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SHkGVw5urdODyWwuzM4Kk6jORxC5XDUvPoixmQ5Z0uo=;
	b=GmkC4nmSn4GjT0x0zUgTriaaKivqRKOPduPSeDvi5oRQVcmia1q3XaohHnhdUiWVRu
	K0c0dDpz7+xoBA8Ch6DekSkoJRM0C4PdJ6KebiTmmyZO15U7+0cZyfxQMNYstFQFeEQq
	IyZX3LgGVKpK8jp73ldK1sY2FpDddd8Ige4TYW/cj8jcFCDTXP6g/vxn02tn9PhZvuSR
	BPiAFSSbXGzjxuDNEaGZcpFcT9cp6+HAGTQGyClSh5Y0TKRD+O2tEb7v+XeQm+kOVxU2
	lSO+9vcznmJtoSih1D3ecKGFP3Zpxi165/Wsvybv2DpOQu2oQCOWG8uOamR6xagS/sY8
	4btA==
X-Gm-Message-State: AOUpUlFWLSFUYmS78xIuUsP5ypsNjYjuEYUMIZnmc6x0Jcex/hZRp2dx
	+WskW7eG3MpIp6MSoNQtb+Nf0Px7
X-Google-Smtp-Source: AA+uWPznQf0tLydkTS7MasGeTJTm6V4QGC8LGi599h78zIHFzTIrQsj+o6aRPTlJzgeb/eqkdNrUug==
X-Received: by 2002:a25:c506:: with SMTP id
	v6-v6mr8698651ybe.381.1534154984465; 
	Mon, 13 Aug 2018 03:09:44 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:43 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:29 +0100
Message-Id: <20180813100936.23663-3-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/9] openjdk-8: speed-up do_install() (pack200)
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

We run pack200 sequentially on all found archives, but there
doesn't seem to be a reason to do so, the
java_get_parallel_make() apperas to be related to compiling
java itself, running multiple java applications (pack200)
at the same time on the same machine should be possible,
otherwise we have a big problem...

Just run up to BB_NUMBER_THREADS pack200 processes at the same
time to speed up the build.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 03cab11..d0b2ec8 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -77,13 +77,13 @@ do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)} ; then
       if [ -d ${D}${JDK_HOME} ] ; then
         find ${D}${JDK_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${@java_get_parallel_make(d)} sh -c ' \
+          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
       fi
       if [ -d ${D}${JRE_HOME} ] ; then
         find ${D}${JRE_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${@java_get_parallel_make(d)} sh -c ' \
+          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
       fi
-- 
2.18.0


