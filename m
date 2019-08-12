Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0585D6004D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:06:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j16so2234828wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=n/ICl+XiV0E91fghku5FAhMKk7F2fM2qXhLgNpPHr3k=;
	b=IQvADkCLfEx8RUWhKfwZvCdzRfeMlmFTvMGXLzYt4iMQjVIMASfJyY1KZaTh4RzALD
	NeXmC7WjCaO6boVNnnEQ8iuro9Ij1qFmv7A39jXbuksI6tsCxEHPhZCjy27f4Z6CKaNH
	7UZKOfM+/Vx/q95nQfsAAI52FfE4fhZDwNbIvCqXiGrVFUqKXlDbVPoAESr+mKhwsPcQ
	HJQ4B5YcOlPiKlYfH25M1XDisHImTptKHpR75Yauj3agBbhGXdjT02K81vbFcLPALuAq
	aRhoHK+aBwTZzWCqGvQLnPuedaqK8UIK/Naur1quCzAidPyE75pfAmRodn+Wqwd1fN1o
	6Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n/ICl+XiV0E91fghku5FAhMKk7F2fM2qXhLgNpPHr3k=;
	b=aU6VhSjH+zYgf3EQdzAF1J3e9tkMp/4z8V1dkYD6xLf1rlcQtGF8bwtZ0y3fDG2H4P
	rYrvbfxmQZxVQrg0u2xcULDxP9oHsg1gp8z3XttFUC8SJk0PYyy0fMqxP5PpOw6LKZlO
	+CVt2d8xqVAhjwPsVBBnpRqbrLCzHLT5BDM2jHdAHcnDOiRaHyU9iHMtjtt4XGe7wLF9
	CiVRSmxUfKCBBMS5HgiLeJWBmekA/My/iVkXrwJl47Etp8PIkb31l5ddMmL8h3j/dgUV
	El/hqXGnMoNQw433jOOJlGllou/PiwVqOklN3eBFM6HyOgFG353x8AEZHtLtfN/EuNNK
	D/rw==
X-Gm-Message-State: APjAAAVEv1BIxiwBRIQioudp/HAGltumh5pZ1k5pvGnVXSxFwbln96NB
	Wg0kre5J9UDfOkXBaNuPrkcjKdAL
X-Google-Smtp-Source: APXvYqwfY6Eh/hHD3qx2/F+UU5HkePPfSRthRpV3TIsEUyJ5vOGxYF7pz85+XtbMHorgCVSh9YhehA==
X-Received: by 2002:adf:c7c7:: with SMTP id y7mr40121627wrg.44.1565615191256; 
	Mon, 12 Aug 2019 06:06:31 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	h12sm10390415wrq.73.2019.08.12.06.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 06:06:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 13:06:30 +0000
Message-Id: <20190812130630.877-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] kernel-selftest: skip -Werror=format-security and fortify
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
X-List-Received-Date: Mon, 12 Aug 2019 13:06:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-kernel/kernel-selftest/kernel-selftest.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 181e97cac9..7370f9fb41 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -121,3 +121,14 @@ FILES_${PN} += "/usr/kernel-selftest"
 RDEPENDS_${PN} += "python3"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
 INSANE_SKIP_${PN} += "ldflags"
+
+# userfaultfd.c:126:2: error: format not a string literal and no format arguments [-Werror=format-security]
+#  fprintf(stderr, examples);
+#  ^~~~~~~
+SECURITY_STRINGFORMAT = ""
+
+# https://errors.yoctoproject.org/Errors/Details/261657/
+# kernel-selftest/1.0-r0/recipe-sysroot/usr/include/bits/fcntl2.h:50:4: error: call to '__open_missing_mode' declared with attribute error: open with O_CREAT or O_TMPFILE in second argument needs 3 arguments
+#     __open_missing_mode ();
+#     ^~~~~~~~~~~~~~~~~~~~~~
+lcl_maybe_fortify = ""
-- 
2.17.1


