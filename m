Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 291E77C420
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:35:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i12so5714245wrw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PC5PS6HQa7TGjN09A059ub7rS/Od4Gyf/cCINxjWP5M=;
	b=oUFFgAI7KmKaZiQm5dRmY+waGQOtjSGZ3OEpaYwX9kluRwLSMV+aZJqk5bsRC5/QZ9
	xjyl8F3XpRh5lxj9A4xG4t2YfUKn5Cs2fMqFI4HlTH8mQcxKiZ6wK3QvkhVPyBy3Mr61
	1i66be+XGlEDNLJ1uSjBR8aP3pYWSQFT3ZPlz3NHYk6ILjTMGn1Hl1j0pE1OqObPWTLf
	fmh5IgpqLJc8gDx8vAjpBJYmgeEMuCAIFicwOvSbNkXdgqjLX+qxDNsb/lod6LDspEUs
	E2kl8SEy340iqxAfo0JUXFoNmOGQP6H5lUzlIqTm1h/u40k8rslRsfi5/pRgjf9s+fPq
	zLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PC5PS6HQa7TGjN09A059ub7rS/Od4Gyf/cCINxjWP5M=;
	b=iGr714o9SPkKzjW4YRVDMsxI1ezRPKHkMusnTPsYVG5WD4YrHy3trt0p+a3+CUO1XL
	IOwCjlQTreY/5woPL4RN4ffK6q23TvEXR4QxlOy8xlJYzadSNUKgyYe0kLUafxpF+H1r
	XaZG+hPcWg0R2UVaIjDjsP1UPDzMNun3DC3r1l88AwqqU9Xt/j3QrdqBueW5A5OQSivW
	JD9MMoXERqfKM6FKnAWJQRBzzACSf6XRNLJEoNJkObnQYxI8xlUaB9ieWq3U3Z2QMDuu
	Na+5QAnR3sc9fJbyQbc0aa4TojAueVpaGT1JV5ntLCCCSh16vXOZytBfWXUwFWEnW6gk
	0obQ==
X-Gm-Message-State: AHQUAuaHSkmkS6yrdBx02R6sSRJ68kh/5vAEd/zXS6mz4M+VEae2bibo
	BbeU95b62qMpehrRK7xvwyqk2lmH
X-Google-Smtp-Source: AHgI3IZSRg9q3mJdfHYCdl+IY3jFDpKs0aRTAp+GmroGM+fEpSUlZq15eh//NwVUvEf+sBBzfBGBqw==
X-Received: by 2002:adf:eb85:: with SMTP id t5mr1922667wrn.157.1550136952707; 
	Thu, 14 Feb 2019 01:35:52 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id e6sm1258232wrt.14.2019.02.14.01.35.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 01:35:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2019 10:35:34 +0100
Message-Id: <20190214093534.10835-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214093534.10835-1-schnitzeltony@gmail.com>
References: <20190214093534.10835-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sassc: initial add 3.5.0
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
X-List-Received-Date: Thu, 14 Feb 2019 09:35:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* kde plasma's breeze-gtk needs native since 5.15
* there were attempts to land similar for gnome3-desktop [1]. So just in case
  somebody comes back to it...

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2018-October/197228.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/sass/sassc_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/sass/sassc_git.bb

diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
new file mode 100644
index 000000000..044c0c7fc
--- /dev/null
+++ b/meta-oe/recipes-support/sass/sassc_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "libsass command line driver "
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2f8a76980411a3f1f1480b141ce06744"
+
+DEPENDS = "libsass"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://github.com/sass/sassc.git"
+SRCREV = "aa6d5c635ea8faf44d542a23aaf85d27e5777d48"
+S = "${WORKDIR}/git"
+PV = "3.5.0"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


