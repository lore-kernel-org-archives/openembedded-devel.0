Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27C5178681
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:33:04 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id z197so16789795qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mYP2OqjsGdS9vm5Z3cJ78/P4RgG4LVttA04SsQ79VyA=;
	b=QxYjCf9P7vMUtJKlaH68jaAxWquUTv/JuZhpig+hK2ED1uMTg7Uf9/0Ppo4MRboFkp
	TTcaNqLLHXm5Zq4FO/ZpPy8DYEEXGUymE4MVOHTz7+CpskrBgTRzyWLtYQHEd8+cNM3a
	cJfaCSaWl0ZSAnrJuBus0TlrMsexZW4d2sz2enmvX5mOmTePLTZbjD4saK8GvS7ySETG
	RHGlfG/t6PGgCmvUc+bDhNayr5499P0P+wlh3nd+PTahXbRsDmW1N714Vt0QHiLyryxY
	b6akp30qa7W9RISy+Thym9mKAI0LZmIbiFN3FshBQSRLYbz2fMT02OGgwH/uTfZWhLEK
	2HSQ==
X-Gm-Message-State: APf1xPA4HjRRtVUnmyLeTU9nxmxuow8K7PO8FjFty0PBZ+Ib+FLqP7Tp
	LW8NPZWyMktLzjrog+SpXR5U2Rxr
X-Google-Smtp-Source: AG47ELuE5UfDhbxl6UAIP57YPXuFg1UqsQDCCBdCrXC+WC0LyGYmgvgeSZkPX/Q0lL66F8zB9SQ2JQ==
X-Received: by 10.55.212.150 with SMTP id s22mr12833352qks.85.1519590785638;
	Sun, 25 Feb 2018 12:33:05 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b184sm3729168qkg.90.2018.02.25.12.33.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:33:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:32:58 -0500
Message-Id: <1519590778-17662-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.4.1
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
X-List-Received-Date: Sun, 25 Feb 2018 20:33:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.4.0.bb => python-pytest_3.4.1.bb}         | 0
 .../python/{python3-pytest_3.4.0.bb => python3-pytest_3.4.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.4.0.bb => python-pytest_3.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.4.0.bb => python3-pytest_3.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index a09aec4..ecb7293 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "6f402b2115c2dc97bbf69739990a1d79"
-SRC_URI[sha256sum] = "6074ea3b9c999bd6d0df5fa9d12dd95ccd23550df2a582f5f5b848331d2e82ca"
+SRC_URI[md5sum] = "6768537cbb150022387c565051904a1c"
+SRC_URI[sha256sum] = "9ddcb879c8cc859d2540204b5399011f842e5e8823674bf429f70ada281b3cc6"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.4.0.bb b/meta-python/recipes-devtools/python/python-pytest_3.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.4.0.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest_3.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.4.1.bb
-- 
2.7.4


