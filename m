Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0791970034
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:13 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id e124so6290655qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Ux6kaTZ14CPCwz6inYAv1jAyMH/8z12xaXuweFyFXYY=;
	b=C+bVi4kz31Xw5U1eqsTJc3oPRcRQcZpW1hjEH2OyhCjl5V1+ICrPTKuet0pwgvFY7f
	zTgLuRA0zETBpr/SQMxHAScj+koPYLrLe+356MfuYcqxwU1NoNg/fBgw6Ft057HhOdzF
	omK+7zHLOjzCBMG9DQxf9/mypyGJJUCcsz7Vz/WtKrA9MlmN9Dc/KREjdZ3zC9RL93x+
	mp3ytEjgGgbZwN6DvS/pVCa1ffwDR0pp4qGMmVckcrraaOu9kQyJNGJJO18Un9wz6ABb
	EiHnUVmRS7vYQB3Rng19DCQgCqFsD9NfUG6KQTBjqKGnq9Qk/1gnoyP6uluZxvGKVI5T
	tU2Q==
X-Gm-Message-State: AD7BkJIy/NSAUThwkvRd+ZAwgiWYk8AlamthjKXpiNeL1kP18KS+/13BcVlhyfx85YhaaQ==
X-Received: by 10.55.201.206 with SMTP id m75mr17172464qkl.98.1458997514409;
	Sat, 26 Mar 2016 06:05:14 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:29 -0400
Message-Id: <afec5bf67cf26e07987e2194a2f42c827267142a.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 09/30] python-cmd2: update to 0.6.8
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
index 0ae5c43..f4962d6 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
 
-SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
-SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
+SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
+SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
 
 inherit pypi setuptools
 
-- 
1.9.1


