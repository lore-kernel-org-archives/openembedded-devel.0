Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75A327317E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:32:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b14so2487220wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 00:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=REDinIAVJXrW0ij1nRw3QlqfsRg6VrahmGQ801QJO8Y=;
	b=pGCeBwz3S+RCcx9HI+nZvnze/oVmQBEfOrfY2jye4BfFNmbHQpy5As303EBe8RTBQT
	CO1s0bUSLtDdS6pMxig3GYQtlca/4j1+NBjmf+p3O/nypKP0fwI1ZzRN4/465JPvJZSv
	TNMu5kqUR2O1CzDsMTdpFN52dy0T80ip7ggry4RF6GuHByQeTReDX5Egl4QvyXVvKvim
	0E1FGtw3NvknDxSt0OV5+V7DdXy8IGNKYUrrB+CUaUsRcu7qmbfn1EZ4Q/VfdhELoRbR
	YrDUWYJ44307A70T9oUN9qaTMSv1CSEfOS0peLT7y7VOvBaddE+x0JLUOfZcIw1sGreC
	SrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=REDinIAVJXrW0ij1nRw3QlqfsRg6VrahmGQ801QJO8Y=;
	b=IN+y/Y52jo9lduRglP1/nEAycMZ3W85Elf/CKnlPnerTXM7Qru4+gjJ5YIJYnShNyx
	A+MaAlqz4RYm1sOsQhlmfk2hN677YuMyqeGig9FGbhFt96MTOqMg1biAgWI2sjYUIDFF
	974Bs8cwovj0/s1GQDEZr2yP2uaVZmhX4+w4e2yVarcTnZ7ptwMjQNwn57EiCmRdbFb8
	kzu4+HJjC8FHYcQ78PKSeyrX6Tbpn+o/dXCM6AQabbo2JwWEL77ixoLwOp+k1K+OSkEe
	auV1yv45YhJEQowVHZrqeuqA4zfPFwuFXLSzl8Ho65mvWzfWaOGzohXz3847PW+UCkD4
	l2ug==
X-Gm-Message-State: ALoCoQlY1R5XZvVSdo92WbP76ts34L5gTAhCtqByIU09ucYPkNb9RK3ekdX1uqEJCecqCSoFdqUO+Cwq8TxgdJbi7VE3sSl+dw==
X-Received: by 10.194.58.235 with SMTP id u11mr34758796wjq.52.1453278776059;
	Wed, 20 Jan 2016 00:32:56 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	p9sm31982342wjy.41.2016.01.20.00.32.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jan 2016 00:32:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2016 09:32:25 +0100
Message-Id: <1453278746-22646-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/1] gvfs: disable build of documentation to fix build in some
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
X-List-Received-Date: Wed, 20 Jan 2016 08:32:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should apply on master-next.

Andreas Müller (1):
  gvfs: disable build of documentation to fix build in some
    envirionments

 meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
2.5.0


