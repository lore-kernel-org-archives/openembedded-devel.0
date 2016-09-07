Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id D1A06731DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 15:32:23 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id i204so92671487wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=u90hTaQen4WSohWesxeOh9/SV8FkoGv5dPUHH4RDHnU=;
	b=W9VDe407GOCDL+6kDWBKMS23WK4tRNHfoLwJA+EtlJLc8rjSHPc4I9KkWDNXj4lGJE
	NwiZiylfLQiRAJwu9sAYWKYpr+405Kqyv4X23jubGFwjfERzCFhApfSuyK/dvPlHKL7e
	VMN4u74sk15hezPsw679wKTgySkxd0/aiXdGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u90hTaQen4WSohWesxeOh9/SV8FkoGv5dPUHH4RDHnU=;
	b=matkezP0hM97XW/QRx7h2vtNXW+negezMVRUfVpqWGUH+rFqR4jX4adDQkYddwDjRF
	OS+xbVbWBDrySuVg36mLB+KrtIDaNGWN+69nvTd5qR3Oclt8T6TPVhRYRnpLszOGSbJO
	Ja3XZ1naPH8pP8ezlMRKWA+TD9kybS0phintE6ryOfPEE82WeZ0cZYBgRWhLFzkhkduC
	jd7A72h00NzO+yE5N44N6oIq8+atDloddCm/u3Gt38hLkSsHYQFftb/gPgB6Efqt2LOM
	/LzVKLJpXTzx4pSnNkYeCMhTxAyj+0Xrs4bBDvI/l6IothduNlciI24Pcoaki/is9rB8
	p47A==
X-Gm-Message-State: AE9vXwN+7lEuWxpuxh/lN+0qhzJz7LphC1WBvkNrfWbmHLgk8/QHgOgmJAEYxU6eiui6dfnI
X-Received: by 10.28.20.77 with SMTP id 74mr4309359wmu.1.1473262343472;
	Wed, 07 Sep 2016 08:32:23 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	s184sm4841955wmb.11.2016.09.07.08.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 08:32:22 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 16:32:00 +0100
Message-Id: <1473262322-2821-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 0/2] Fix gpsd builds
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
X-List-Received-Date: Wed, 07 Sep 2016 15:32:27 -0000

gpsd is broken in master since we default to using the wrong linker
hash style in gcc-cross. The purpose of that change was to find broken
recipes, so here we are! Once gpsd is fixed to properly prograge
LDFLAGS we can revert the patch that blacklisted that recipe.

The first patch is probably a good candidate for stable branch, if
that series get merged, i will submit a separate patch for that.

Nicolas Dechesne (2):
  gpsd: make sure the recipe uses LDFLAGS
  Revert "gpsd, foxtrotgps: blacklist, fails to build with new
    binutils-2.27"

 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb | 3 +--
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb              | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.7.0


