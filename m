Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6287F8B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:17:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q70so449985wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0J0mAYbyxrR6QRmK1y/wfAF7xfm0Tuy0/CMc+PfD3ZU=;
	b=XHebyV6yZRlaK+YTq9IHVf9EN1qqvfH+VANXoaBSrDR2ssTJsqoPyf099SYr/nuWAC
	YEKHxza7mCCJxg8LEmqGiK3yGpu23UbfcFYcN1W4KGPCVU7K/MXT4+IRoc8J6Ukxxb7S
	t3w8WVt9cvdxfBfoW/2aU5u+NwSB2a97CgBSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0J0mAYbyxrR6QRmK1y/wfAF7xfm0Tuy0/CMc+PfD3ZU=;
	b=AwtxetveyKLRBLA1oV2sMkqOEc1ZvcNfGbbyqWzyEE+82hSFpnKdD11AriyPnvMeY6
	cv/k4aaPpw29r4NDzpzQgQe3graDqfV+lfsSI7W3DEl311QC/t79nYOX9iO8AeniM1qw
	IzA1/NfdFDbD47QXqq5AwmsqCugEHsOjpm/YtKq1sSpmm3KjQVEwr+fD012hj3YZT2Au
	yU7fum7hoTtWIjKIf8JMkhKsv2Qb9zSQRyasTglMadi/2t233OUwaFbU7KsRjEcoSdFi
	nR9CAsFM5aValHojRUriQJ09MdZgdgpZAT680OdmQST5OGkJvUJ4ywqN32RIT1dpt0Hb
	o0tA==
X-Gm-Message-State: APjAAAXJ93piw2XFPqiNnkCbd0LV1LYZxr8FwMgE5LTfPtYH0LO0LIsI
	CJETKmyI704Cl7ZvRltNaMh+nUYHJkY=
X-Google-Smtp-Source: APXvYqy48zy9uUAg8tB7OThn+c2qDo8JGHmvZfpjgblIWHZoGGSjINIJDKyReRqQgYbGw4G7CHgMIQ==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr1765407wmd.48.1571865423817; 
	Wed, 23 Oct 2019 14:17:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a9sm614899wmf.14.2019.10.23.14.17.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 14:17:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 22:17:01 +0100
Message-Id: <20191023211702.15125-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] python3-astor: Upgrade 0.7.1->0.8.0
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
X-List-Received-Date: Wed, 23 Oct 2019 21:17:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-astor_0.7.1.bb => python3-astor_0.8.0.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astor_0.7.1.bb => python3-astor_0.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
-- 
2.20.1


