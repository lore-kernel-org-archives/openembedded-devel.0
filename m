Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id B2CC8607A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:37:14 +0000 (UTC)
Received: by lbbck17 with SMTP id ck17so20391829lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 06:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RptlxTQqhIBPBZQ4l/o0ABRiVqsKQAtSXkJXm2h/ZMM=;
	b=f2dVOdJq/DfdpQZZpyAuYOd8wqPAULIOGN2pD9zOjaTELyrCS9O64BasHnb3s81Hgs
	PoCDNDxbxQpSjFnmk6VQAhuSoi24dbRUqueke+VkVF9TtckdLHVn/ZE/XEfMxlL6G1fr
	aPdX/cs6rurRyf0eu8ef5L6e/0WHIPbT7Ge8v2UsuW5mUeOyn3GlLYwIJAiTwEXXsvOK
	SrGARhSHCYBTa7LMrdqh51Sa9eOnnGmSBtAqKE4b7A2ZJ3VTBr0Wxyv+0dIiLIarcs+U
	Vu5wybCtpy3GuHE7HabmntT9UanEJGsDKc99vqKM5PjDELO/iaiFwnkIS59n4KI3Qyfi
	YCtQ==
X-Gm-Message-State: ALoCoQnriwEqzt3e1b9vbvMt5Z1I8uKdLojRFgWh5vINtntIAEMzFr6KqYk6o83srGV+BfMDVNwu
X-Received: by 10.112.150.168 with SMTP id uj8mr7514593lbb.101.1444743432985; 
	Tue, 13 Oct 2015 06:37:12 -0700 (PDT)
Received: from localhost (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id y204sm542122lfd.6.2015.10.13.06.37.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 06:37:11 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Oct 2015 15:37:04 +0200
Message-Id: <cover.1444743350.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.6.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 0/1] Fix host-user-contamination QA warning for webmin
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
X-List-Received-Date: Tue, 13 Oct 2015 13:37:15 -0000

Remove QA warnings for host-user-contamination for webmin.

The following changes since commit f4533380c8a5c1d229f692222ee0c2ef9d187ef8:

  dracut: install modules to /usr/lib (2015-09-23 16:10:57 +0200)

are available in the git repository at:

  git://github.com/darander/meta-openembedded host-user-cont
  https://github.com/darander/meta-openembedded/tree/host-user-cont

Anders Darander (1):
  webmin: fix QA host-user-contaminated

 meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.6.1


