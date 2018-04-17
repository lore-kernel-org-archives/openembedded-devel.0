Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id EE87C74502
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 16:17:02 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id h3so24502136wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=38TH619AJgXKqKqdBcJ1LP4BIi2sVVCDwEkuu2iU4nw=;
	b=mnq6mJYqHvWXYIXjsYd5uigfK0gtiubM8tAtIruS5cfiV+sl3RQkc36qt/R3vU5Rc2
	lD1/LOCcVWCJc1VogKQjbhMMv3qiQlybHO9NcwW6eP6qQoYwSWKadPbl8905mCOnVl/e
	dT74vqCeDHXZFZ3WD2a/Q1hJrUl4W6gViZg+lyhwBhdO5CeEUcrd6ZNNNFFzspEkI4YW
	y1/R2aQOhsbGxhb7Z30yHXQy+Yh+xhFHJsQI1IsBC65kwyuUdxFm140gGbjSJF3Bgudf
	yqpSboFTY4l/QTpQJ/fOV0Iphxm+37ed5raCtdKVlhtem2Ltza1DOFowaTYn/lvWJumF
	P1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=38TH619AJgXKqKqdBcJ1LP4BIi2sVVCDwEkuu2iU4nw=;
	b=U0vQU53+MlJc1zdffv1r4oOTzsMbK1d3CHFBBJ3IK8Ru4ssemCkAmfrWgY8e0iuQgk
	r6EgmzP5ZFYIdqc5/fEzLxrd7dIlEXgkkhPMrqDu91TkNyuYh9vOJASU37Nhk0jA9SU+
	Fj1xn06UyszodA7Kor8HoRzjAAK9RTyexFLecELM0Fc1Aaym9gj40YNwgI1xyI7NKW9R
	gBMT2FG8KukJbIObpf13NPvNnAEIA28HScNCmXLVlEp3vAMIpml4VscxkE10PwBWGhrl
	BAJxdqjT3nr87NVxkQ13+BWuUd9L/dMk1wN6RVbiMsslW5jCKDyyBIIN/QKS7fDKBOkB
	qlGA==
X-Gm-Message-State: ALQs6tDUF11fYyA7FFe7/yR89plQy0mlkwiXU6VwHSxDFDJlNkkVX+5y
	K/gexm3C4Npfu9juf+i2Gj5pFQ==
X-Google-Smtp-Source: AIpwx49BadevstOqTl7BnSn8uqVpEoaYQDpwtwwgX4U6LK8wslq2L3gFRg8wpSHNJTLoIuL8qKN4bQ==
X-Received: by 10.28.7.76 with SMTP id 73mr1531492wmh.128.1523981822955;
	Tue, 17 Apr 2018 09:17:02 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BD150941E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bd1:5094:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	m62sm2280034wmc.41.2018.04.17.09.17.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Apr 2018 09:17:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 18:16:48 +0200
Message-Id: <20180417161648.14722-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180417161648.14722-1-schnitzeltony@gmail.com>
References: <20180417161648.14722-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libtevent: add libtirpc to DEPENDS
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
X-List-Received-Date: Tue, 17 Apr 2018 16:17:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

musl build fails with:

| Checking for header rpc/rpc.h                                : no
| Checking for header rpc/nettype.h                            : no
| Checking for libtirpc headers                                : not found
| Checking for libntirpc headers                               : not found
| ERROR: No rpc/rpc.h header found, tirpc or libntirpc missing?

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
index a83851ea4..c91b221b1 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPLv3+"
 
-DEPENDS += "libtalloc"
+DEPENDS += "libtalloc libtirpc"
 RDEPENDS_python-tevent = "python"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
-- 
2.14.3


