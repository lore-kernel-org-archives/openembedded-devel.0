Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id E837072A78
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 15:08:02 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so81987533wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 08:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=4vLxxvsQWZssGpGJbW+cwqMlNod+iIHK9EGc1srOeHU=;
	b=sMamCB2ZXyRohYa5gT+jzXqOu5DzxsfDcb4wtvHjEUZQ3Xko687wh+QNbUn3jsfVfD
	5pb6sYWZL/H/+MTp2+Zrd46zLnGHM9d/g4B3uWbzN6QFFaMgHs+/rvrg/soejDlVkE2E
	NKaBQI7PRtt+lFsjfkhXk+ZDu8ItgWYZbuGTem9xU+z7hnHcmUorn8skK+t1/mQ1s9dx
	NNOyYDFzxZIVNkYbvEG25v/Xqg5KURMVQb/XwKBLsL/hbaEydrhIFVQGwMjqWMe7vZkn
	k+CvySHr3wRNlIJk2svIKbopx6L5co5fIgl4d1a0TEEykM/TBMr/bI5WGuYo2odbR1bv
	KYHQ==
X-Received: by 10.180.90.33 with SMTP id bt1mr8262340wib.59.1442761682812;
	Sun, 20 Sep 2015 08:08:02 -0700 (PDT)
Received: from localhost.localdomain (p54AA5F54.dip0.t-ipconnect.de.
	[84.170.95.84]) by smtp.googlemail.com with ESMTPSA id
	pb4sm19390833wjb.8.2015.09.20.08.08.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Sep 2015 08:08:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Sep 2015 17:07:52 +0200
Message-Id: <1442761673-22041-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] plymouth fix
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
X-List-Received-Date: Sun, 20 Sep 2015 15:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Plymouth was not yet applied to master so the patch should be applied to master-next.

Andreas Müller (1):
  plymouth: building documatation sometimes fails to download so disable
    it

 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


