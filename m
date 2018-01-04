Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D481A787C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g75so3492191wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BpC7nFPiyyiQ+ea2afDyi7+wFZklT4SPAKRbqeJgqOM=;
	b=Ip4KFwHwSLxiursdwSLYF3cwbH6iN6Ug+h6OiQBErPL8DyDH4Bbsqbl5lu2lYKr2Pw
	U2uD4VVSbuO3FFJDMVfGqT2rlGOyibQpvda88PcmK2nWmolCehFb4NrSN1BkRlrK3kxr
	R7v6WgQ0yVOD2YGgCFc4f1ZqfbOAff7hog5xNZNrtAo3UU3rhMD9LrFhfC/9izUOcYZH
	Qms9za6hdueWrAQ9oDhUsjKukCDfMNk4yEE4vzK1vUWaubgU3f4tnqPjUaBz9QA4F87U
	s18jk/BCkDahssoljV86Y3jEfGlutWY/aX83CXcLKEA6cFpJDvvNUqW1iJ+1LhGAAZWE
	ViEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BpC7nFPiyyiQ+ea2afDyi7+wFZklT4SPAKRbqeJgqOM=;
	b=mOcRo4ISI1lk5891MdwUCAAVl0iKmNEvLvx/jSMLzlVMEIVI5luweyyw2c9DMEuJPF
	9+gkAtSpUlvKACV0WQxjnGLPAnP9NLpAKMdYcrN0OQguLFltdJe25aayf3Fnr0/mR/Py
	dYZropddtWhcXhqb6hoRDsv1lNs1dItVkflzCDnZJX4wSnZ7JHxMj44Jf0lGGcdyyQ8D
	NZLBepK6FgSiG3VisguhJswD6nkZID/eIQLouSi0AGOI0yziUl7F1AelmidVPEAIAOic
	7XZnYKp7WdLxrh5HTP6UDSz1C+Z5e2UCGmAodWoYVUBev2KL9PismUGZQNJSBYOo8QTJ
	HE3w==
X-Gm-Message-State: AKGB3mLe4qMdIBm0Vl7uky4TJyG3fyHJ4ketHyhzDhG0iIcWvQFU7OLb
	g9NMpNB3Xx+pQEfoxFRfRAhRRA==
X-Google-Smtp-Source: ACJfBov5IM8PZZcY7S9XVfAfc4cJmJf8DpKm8of6EJZ+9zm26eUZyW9VNA8f11XSoTmGj7dmdIBO8Q==
X-Received: by 10.80.245.26 with SMTP id t26mr7269586edm.301.1515071985730;
	Thu, 04 Jan 2018 05:19:45 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:45 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:09 +0100
Message-Id: <1515071950-15401-7-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
References: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 6/7] jamvm: avoid checking x11 distro feature for native build
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
X-List-Received-Date: Thu, 04 Jan 2018 13:19:45 -0000

From: Ming Liu <liu.ming50@gmail.com>

x11 is not a mandatory distro feature for building jamvm-native, so
avoid checking it for native build, or else it would lead parsing
errors.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jamvm/jamvm.inc    | 3 ++-
 recipes-core/jamvm/jamvm_git.bb | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index da1ca29..7a6b6b6 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -15,8 +15,9 @@ RPROVIDES_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
+inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
 
-inherit java autotools update-alternatives pkgconfig relative_symlinks
+REQUIRED_DISTRO_FEATURES_class-target = "x11"
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 6bbfa52..1762ade 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -3,10 +3,6 @@
 
 require jamvm.inc
 
-inherit distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
 SRCREV = "6cef41d859fbc9ce7868a97cb2cb5dd2b10b9103"
 PV = "2.0.0-devel+git${SRCPV}"
 
-- 
2.7.4


