Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA2560272
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:13:34 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j11so13434219pgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PZsgLvfpdTWdrX/pYhcKJDEpe3vNA6qzwI44TpN67qM=;
	b=WqJ696TaNIE41Tlt/2ZbkBp7IOB3GK4Tz391D2bGyQhRbXleqAE6XHxEJL+gLn5lo5
	A7Yq72VHcYEPCybcGo70EISDVd+9EZ9EmBBsqpZ8ZNHLyTNRDaRxMVlT9q3Xrfh9mKWj
	QA801xWRzBG0OGYA6CiFfZb3affC3k09E9i3cBCeXT+mb3WsMtJ2HLwVYPjwfLfvg5v9
	4Ix3YsMUfbQ+lvL/1tWpX4iMPztb8dPMcOt3sG8TRP6+v77UGn5iB6lvIwLJdzHA69iK
	IubNfDkWeSqMZBJ9QnrGqem4m1cTYJOziRxgYRY0lZtuaj+mC+7lQiRKXdmFeKOhQmyy
	Nq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PZsgLvfpdTWdrX/pYhcKJDEpe3vNA6qzwI44TpN67qM=;
	b=iGpG91/M085LbTUbpu1vMFsBSNsByn4z7iVj+UWf6xPFYQBY40YtxCtIRNSYLa5kG3
	Jyj8jjcb5T3bgiRAwRNnEJhLQJV8lJJv0i8HbwceGeS0+nnxW5fmSrO2kZqYYFtnfKmu
	7Vp9JR8o/KgiC48WZGGmIqH0umwzvNqBUGrSpLSeST2szP1uxNF6jQ5Lt3p0zjGREF+q
	bM1BuaRbre5I1hLA0Kj5mGoaSZrPceSy/aDNlyctl8AmlxFftj8+UYDYU19ayV9y3vDF
	/DGwFCKh3wAZHY21ayq/I0VqB2sGSnL5B8gaZXYfzTbcVc95Szu2ts5MVwt7+QHFF/1F
	zK7w==
X-Gm-Message-State: ALQs6tAQeENXtLLsIiaXA+QqQdofwM/OPf0EdLQqkVom3fMdJtWlWwtn
	ZGFGD+rqHoxZ0ns1lP81wD4=
X-Google-Smtp-Source: AIpwx48CjpwVWMEf2V5MelgAtP6m0+fDsvX3tCN+CNAFjz7l84uO5UMPO07on77xcNMN8rpayUmAGg==
X-Received: by 2002:a17:902:6041:: with SMTP id
	a1-v6mr27681412plt.59.1524665614937; 
	Wed, 25 Apr 2018 07:13:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	e4sm35563566pfa.128.2018.04.25.07.13.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 07:13:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 07:13:26 -0700
Message-Id: <1524665609-7709-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/6] libdc1294: refresh patch
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
X-List-Received-Date: Wed, 25 Apr 2018 14:13:34 -0000

Applying patch install_examples.patch
patching file examples/Makefile.am
Hunk #1 succeeded at 36 with fuzz 1.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/libdc1394/files/install_examples.patch     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
index 89133ad..df0c235 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
+++ b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
@@ -1,9 +1,9 @@
 Index: libdc1394/examples/Makefile.am
 ===================================================================
---- libdc1394.orig/examples/Makefile.am	2012-06-30 17:50:46.000000000 -0700
-+++ libdc1394/examples/Makefile.am	2012-06-30 19:02:13.822646430 -0700
-@@ -36,8 +36,7 @@
- AM_LDFLAGS = -framework CoreFoundation -framework Carbon
+--- libdc1394.orig/examples/Makefile.am
++++ libdc1394/examples/Makefile.am
+@@ -36,8 +36,7 @@ if HAVE_MACOSX
+ AM_LDFLAGS = -framework CoreFoundation $(FRAMEWORK_IOKIT)
  endif
  
 -noinst_PROGRAMS = $(A)
-- 
2.7.4


