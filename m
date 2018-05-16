Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF3D6FF80
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 17:06:36 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id q4-v6so3814905ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XsMWkG5bVxbA3egDuEeA/5PtxttREmDbMH0fU+iunYk=;
	b=YiZaB3lyEEuj6Ia+aRCWHtd+x5h75X6AwTn7ewNWh19d3RU2lQYXRsYvQcMQM1gST4
	xIaFnsNGZGNPPOjpfifUi6LJ6RDGs5jfmI485Cu8tCD0e2zv2hj4Ta4cBdCk4vCxTL5k
	65a7/szy8XIGpkFJORx03WQ4udxaUT7H/c6GQfezX5JCMgJVLzGSPT8mRl6VfDYVPZDh
	slvnTWliaDlhUi+sJsMGRJVm9J2qd23oZfo0P/l/irP+j1+g7TnnrGretmWnCpneJd2U
	TUd9jirUF+W0WdC4zTgO5bIdEkyqHCL0qMROiMaI+/lqRGn/jFppDEYwzWU06OgRwaWS
	9f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XsMWkG5bVxbA3egDuEeA/5PtxttREmDbMH0fU+iunYk=;
	b=lH6gK9R8PmVjDzdHaz3QPkYCqjXbYO1tPMJ9XBkviI2oBWNxpBReylF1+Zx3xAFTYz
	ky0BCWWnSIuvw1s8iMezDcOeOiXJTAEvRQKOkIYtvnnwnQizadVmNVA+qC0ni2edm20/
	06sADIb4ic2+2uVFUEZ2sMoDU4lrncQxtwtQWfGCYYkdnZe51++8qFDxNYS8BF1tlHzi
	jEQ18s4hovJoYHvDedMDo0V7DiDy1WGf0O7B3ukxlxfpgeVyBIbs5TspHMjwylUAtXzs
	60jpViaqk7UoWIbkpXojGg6QoXdZim+vVRlw0XmFG7HfQDvn8hte1280ggBMoKgLmk9m
	72TQ==
X-Gm-Message-State: ALKqPwcfhBQNadwGl7wluM6/VmU0xuSwG9RQQT1AOodkX0ykzwubKyJ6
	8b288NbKp072Y5BLbmQ+PSpKVpCp
X-Google-Smtp-Source: AB8JxZoVT/Mc8Y3PDMYyV7yeQdalOowF42634il/TR242y7b+0HR6XccqL4NIu5kEsFDM+dTbs2UNQ==
X-Received: by 2002:a24:8093:: with SMTP id
	g141-v6mr2096029itd.118.1526490397734; 
	Wed, 16 May 2018 10:06:37 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	r67-v6sm1573330iod.27.2018.05.16.10.06.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 10:06:36 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 13:06:32 -0400
Message-Id: <20180516170632.15614-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180516170632.15614-1-twoerner@gmail.com>
References: <20180516170632.15614-1-twoerner@gmail.com>
Subject: [meta-multimedia][PATCH v2 2/2] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 17:06:37 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes since v1
- none. the only change is to introduce the fix for qemux86 builds (patch 1/2)
  which isn't related to this patch and has no effect on it
---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index d77de2876b..44c46f81e8 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -10,9 +10,10 @@ LICENSE = "BSD-2-Clause"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
-SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
-SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
+S = "${WORKDIR}/git"
+SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
+BRANCH = "openh264v1.7"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH};"
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
-- 
2.17.0.rc2.3.gc2a499e6c


