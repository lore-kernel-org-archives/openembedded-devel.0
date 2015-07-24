Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 72BDB60962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 13:18:23 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so28704136wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 06:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=JmxuEt7AulZGJnlrNVVaixYkCcwd0YeO7kDB/WfMJas=;
	b=LbXuQ4rA0ayNgh1EDWJzZwnQJ+AmNZDLHdr+rsMrA25SYe+V919JllMl4zkjgyqzqP
	ijFn8UCgfeVvePFzEqmkyueA53L42+F4OH5IjgupHZ6N9XMSfGFD6pfpHqYCew2bcWPn
	j5xML5ilgQ0VkZJJTuQLStyG70UCQiNp4PEW30QnkJKjDDKEV2TwvwB40wKDu+8UKBMz
	MoRfICSzwbDSsNvWvh+U7YcF0pIYyCqJcpRlol2XVEXudEc1VwmUfu2oMFPN7yG73RKo
	M1TjBHOzxo5PfyQDMm5wY28oLV8ejpHalxCsy79H81qCF0SiFHYTcwjLDjcklXcuaKYA
	bxjw==
X-Gm-Message-State: ALoCoQkpYZglLOaXvx7D66rpBt4c69yQrzCQn3Niu48iOlWaDGiOur7rhKQlsIafhG9XH6zzq0NI
X-Received: by 10.194.184.140 with SMTP id eu12mr26059327wjc.78.1437743903040; 
	Fri, 24 Jul 2015 06:18:23 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	ju2sm3510778wid.12.2015.07.24.06.18.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 06:18:22 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jul 2015 14:18:21 +0100
Message-Id: <1437743901-28008-1-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsnapshot: make this an allarch package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2015 13:18:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

rsnapshot is just some perl script(s), no machine specific binaries.
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index d680511..0593eef 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -29,7 +29,7 @@ SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit allarch autotools
 
 # Fix rsnapshot.conf.default:
 # don't inject the host path into target configs.
-- 
2.1.4


