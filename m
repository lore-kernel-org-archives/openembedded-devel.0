Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8235671BA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 18:21:41 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a7so754467pfj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QuRHxBiyYk+nmnKXkZ0kEwjFm+0WR134yWmW8VZ2w2Y=;
	b=aIxBpqR8pDRNg+e33iSP8P761qcqswEZnyYbRp2xFLcNZOdCJY37xJV1fZJySBv6Jn
	QFJaNQ20yPYiiIWnHFo1HoSeWvVlsnF14YQmKCfSwVMuOU0MbX+WDT0BH2ALypcaoJUb
	CiA7vBiXL90MwPE/+p895Z+LbtzblkcUl28L9gPtBbThld5I06kEd9+WiIg0KfEc3bEk
	dU8zvLO96faasryLAQpkPx71kPjTNbPHzqi2Ki2rp6Yokcvb6AMTKB6LdWYnahNSpuAk
	NscY+y0ykYWzcARpMqiQij9feKmhZNrJIxgYKpwm9yyvpNQsbaUozitmdpqCTW+ZI4AR
	Advg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QuRHxBiyYk+nmnKXkZ0kEwjFm+0WR134yWmW8VZ2w2Y=;
	b=KciJdN/qGvD6TKE00lGbClKWDx5ll4Gm3e13wfBNhdoeFgEd1by/22ks7UrMUJuJZr
	1hzKPIhEExy0yaILASWKLQK+2ScKFu/lmrL4Htr7YQgDBK5523jN3kRu2W5b1JmYNEyy
	buPj34RXq3t43eWMQUlEB0waBtsY0HPn3fLr1fQ/QafaAxsb2VdSl/2MGbOZd9Wyje4H
	cI0o2rgks8AWKKSDjD2rlB2EyKGc3P7kKgfx56l4ugAD1sn/MDlAKTTLb7upJs29jNhL
	hRkPNHAPyOu/bcSiMBzN1xCb/yB7Tu/lRk9JevD+4mUFZk1qDQHWGbDbVSMPKj/YcEvE
	8nlg==
X-Gm-Message-State: AHPjjUjze2mHd34SPub1kKdMXIw1P+2oqdMK67eHrKENZfeWv33FM2x6
	gibxdubB+LjmgjQsFQonjsi0zw==
X-Google-Smtp-Source: AOwi7QBUWRnNbskF256jHmHnKa+oFcCRpSAvmH2yRqKcC83TqvqkZJAiICwsDEdrFudOtC6f6kMMeQ==
X-Received: by 10.84.131.97 with SMTP id 88mr43089pld.280.1506104502624;
	Fri, 22 Sep 2017 11:21:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id x19sm642020pfa.16.2017.09.22.11.21.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 11:21:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 11:21:33 -0700
Message-Id: <20170922182133.36154-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH V2] mongodb: Pass computed endian variable
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
X-List-Received-Date: Fri, 22 Sep 2017 18:21:41 -0000

If not passed to SCon, it will try to guess it
and do it by poking at build host, which wont
work in cross environment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Use SITEINFO_ENDIANNESS

 meta-oe/recipes-support/mongodb/mongodb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index d44d8d3c7..418d447d7 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -58,6 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --use-system-zlib \
                  --js-engine=none \
                  --nostrip \
+                 --endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
                  ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
 
-- 
2.14.1


