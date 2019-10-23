Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 53B977F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:17:04 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s1so14870799wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wu7MRan2mMS2ix0Xn1wZU9EKhMQZK9jmjLXuKKm66a8=;
	b=MpM31G3qw//eGvEv/EjFBidoraFKBYBGLB/3yGS2ABAkYV3/nYaOcFYsCJMSgNCeKE
	sE+8KTgX/B20Uofvv5FgTPIbYFZzqIIXZR2pSKubltZSvt219CKlQbIgdCauX1Zeewj9
	Hk53XWFPbFD0Ja6Hd6SANftVTmd2wkeTcQpZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wu7MRan2mMS2ix0Xn1wZU9EKhMQZK9jmjLXuKKm66a8=;
	b=l4KYhy3uo4StlttGl9C3teqdZG/JF29X2yORLrOaiECGn7hKWyYVb0bFUcSLzDFYhG
	zevi45jkOyBmu0/IhhZ9RmM1iwhV9UKdP1pVSFisHN0EhdKyX88Nh5A1maoSixsRw64i
	DuW+YMsmDQokRTs8wwCocS4OpjxLv1iT/fu/FgHJ7WKyzsaDOLaPhGYpd29xcmMXQBZj
	nDaaErbTFRQAUGi9HfkmTDMXKgEYPhxwtqFAihzuz4VzPnp68iLd+S84fKc4z6u5gTbW
	1Je/ZVi64hO8FpTVdnCEvgo2rH9GhJnEx/sA4u7/TacmJz+RUCcp3lbq+nm74qjc7uba
	Bpsg==
X-Gm-Message-State: APjAAAXpjCFu7rlUytD8nkpRflBVU10uI+K2bWLwU8ZsJdAGtzyasF/z
	iC1BZB1Ti/B5MoasJIMHcO9PL0OzkpY=
X-Google-Smtp-Source: APXvYqw0Bye8aqYeIcpJNZw3yMFbKhr6D4RXrG2dvb6L0I6eSCn4USUPnCNB8RUweUKKTCl4smCV2Q==
X-Received: by 2002:a5d:62c5:: with SMTP id o5mr706902wrv.388.1571865424697;
	Wed, 23 Oct 2019 14:17:04 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a9sm614899wmf.14.2019.10.23.14.17.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 14:17:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 22:17:02 +0100
Message-Id: <20191023211702.15125-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023211702.15125-1-richard.purdie@linuxfoundation.org>
References: <20191023211702.15125-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3-astor: Fix issue with new version of setuptools
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
X-List-Received-Date: Wed, 23 Oct 2019 21:17:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-astor/fix-new-setuptools.patch     | 18 ++++++++++++++++++
 .../python/python3-astor_0.8.0.bb              |  3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch b/meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch
new file mode 100644
index 000000000..90defe25c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astor/fix-new-setuptools.patch
@@ -0,0 +1,18 @@
+New versions of setuptools can't parse this expression. We know our python versions
+match so just remove it until upstream fixes it.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/setup.cfg
+===================================================================
+--- git.orig/setup.cfg
++++ git/setup.cfg
+@@ -34,7 +34,6 @@ classifiers =
+ zip_safe = True
+ include_package_data = True
+ packages = find:
+-python_requires = >=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*
+ 
+ [options.packages.find]
+ exclude = tests
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
index c2dc9245c..97dbdbbea 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
@@ -4,7 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
 
-SRC_URI = "git://github.com/berkerpeksag/astor.git"
+SRC_URI = "git://github.com/berkerpeksag/astor.git \
+           file://fix-new-setuptools.patch"
 SRCREV ?= "4ca3a26e52f08678854c2841cd0fdf223461e47d"
 
 inherit setuptools3
-- 
2.20.1


