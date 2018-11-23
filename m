Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2764F6C8C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:10:00 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id s5so10871840oth.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DiImRAyQ+WmspBXAAv9pq0HUE928YlqAkaP77aIW49E=;
	b=Ir0egt0v9ld5Ergt+IJdf95HxsbzYf+fUT65k3ATnSvhjLfiLO4NcK3lcfwhVUcuUa
	nZMbAXJkixaB5B4ZzqgJhUzmbwWncRjewQTaD7SmumA7NYbd5GCqycv9rhTodoBYLYyQ
	f12U2ctnp2XgINKClsuSA7Hso3/m9IHp5X7lxDgjIDF1Fzqqw3uLRI4BDT9sdj/50cyT
	xhg8ZFnUWuPjcGHJJERAs4TJy1K0zImgshNCEiT24YskolHHKzgyqPu+09blkRIy+rVw
	8fDpbd7O2RLMDgv3fzVpQTofUb0Fib1+p8Ee4gsy9GFTPWpSq4Xh4O9SmrLKxWm+3Z50
	gi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DiImRAyQ+WmspBXAAv9pq0HUE928YlqAkaP77aIW49E=;
	b=c9vc4x7Ye9Gx0bQHNjTJT7m2vXxx7xbyYcR7dkBfEdxMlS7v3kHxc5DpNbZZbd5VRY
	YriimMNdOgsgIVpvensFpdkXqvDR3PxNqiVpcQo11A+b1Vu3A3zyxB6vC5lOBxtkN3B6
	ZJZybWaXFotKM7gVNCmITxCb96tOVWZz3fuKiFI1TznXDCwuaDohwmXSnxrtJ0LhSHsJ
	3EAV999ArscZZb+tsUXQcnoXdB2J2Qj91axmiShVGXBKByqf+VepJFG03c2w9N4VkV7I
	gUW51zo9PfJxy9oEgvNh1qePwpMQL5poyriPAo0odVD3U+RjZZDE+qGpozPnZnu6eu+V
	No9w==
X-Gm-Message-State: AA+aEWZkhoGsr6QUI/oacP/RdIMkNuBG1NnEVsMV2iWyJCI2+WUob3mc
	B88yJZ8frqHlnpQuBszhOHyBz9DbJsHqKrUzOEd6334T
X-Google-Smtp-Source: AFSGD/XOO8JQNVnz0+q6dumbr5eRl6MzoH+tR1W0lcYJUxznrNC6i4Cfm/Z0BAXPO0Ar+rKKzvP1wsGXHlf53Vvt5RA=
X-Received: by 2002:a9d:600f:: with SMTP id h15mr8708346otj.42.1542985800998; 
	Fri, 23 Nov 2018 07:10:00 -0800 (PST)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Fri, 23 Nov 2018 15:09:49 +0000
Message-ID: <CABPh3UPXB=MzAUwMgmfaKZ100Fqgp7juiv1R61AaYfpFCFeefw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-java][PATCH] java-library: make easy to override jar package name
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
X-List-Received-Date: Fri, 23 Nov 2018 15:10:00 -0000
Content-Type: text/plain; charset="UTF-8"

define JARFILENAME and ALTJARFILENAMES with ?= to make simple
to override them

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
classes/java-library.bbclass | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index ce1cd28..c69cf6b 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -42,10 +42,10 @@ PACKAGES += "${JPN}"
FILES_${JPN} = "${datadir_java}"
# File name of the libraries' main Jar file
-JARFILENAME = "${BP}.jar"
+JARFILENAME ?= "${BP}.jar"
# Space-separated list of alternative file names.
-ALTJARFILENAMES = "${BPN}.jar"
+ALTJARFILENAMES ?= "${BPN}.jar"
# Java "source" distributions often contain precompiled things
# we want to delete first.
-- 
2.19.1

