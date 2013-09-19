Return-Path: <eu@felipetonello.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 70AA96A564
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 19:09:26 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id ii20so402665qab.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zv+LVVPVk6PIVJDX+UDojb/AXRremevIs2/xIfjGWhM=;
	b=QZ2w0vxnNzNetsG6bQZKV9DkD9FPLwif5Uzw5xBaLek0SFkoZOJvExYjYw19WLVYnw
	n+XFbzotGRvJQgy0L44fzOP7bfSW2+TT51vhTFyKduMoxUmnSYOv2TBwIYhLeDS6Gpv8
	uRw4edJVB2/gvIDFI1Gyz3B2bhDl/IKGX0aGLazBEMGVlS+vnzkYaOtrZi0kQkskIxqG
	7uKZb1LidYkC74At1dBUqjMPz0vf0NzeGsHf595bulM12HcZ7SWRnftMcclne3ITa4e1
	ZgxPdzvCubZMvtIUhe6Qv6R7xYQiOm2VeC+CTYbXv/TZf+6QqLYE/FHJk9ChhIgi6eoy
	3/UA==
X-Gm-Message-State: ALoCoQl98wDKtotLjRfRoSJe7C0pZLmaiCPgjdyjni4Rff5v++CYqHmqS7q6SydWb48An2XKmda9
X-Received: by 10.224.51.199 with SMTP id e7mr390199qag.41.1379617767885;
	Thu, 19 Sep 2013 12:09:27 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id k3sm13345014qaz.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 12:09:27 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2013 12:09:12 -0700
Message-Id: <1379617754-6342-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/2] Improvements in gypsy recipes
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
X-List-Received-Date: Thu, 19 Sep 2013 19:09:27 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Felipe F. Tonello (2):
  gypsy: Improvements in recipes
  gypsy: Added init script

 .../gypsy/files/gypsy-initscript                   | 61 ++++++++++++++++++++++
 meta-oe/recipes-navigation/gypsy/gypsy.inc         | 29 ++++++++--
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      | 21 ++------
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      | 12 +++--
 4 files changed, 99 insertions(+), 24 deletions(-)
 create mode 100755 meta-oe/recipes-navigation/gypsy/files/gypsy-initscript

-- 
1.8.3.1


