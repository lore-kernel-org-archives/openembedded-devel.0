Return-Path: <joe@deserted.net>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id AF1236CEB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 15:08:53 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id ii20so625803qab.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 08:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y8QA/oPP3QmtkGYG2cKUf6MNiyfn22861ZNdztP48Jg=;
	b=FOHvvj8k4fHuTlgLskXwqDCzRPGCb3P0vcMRL1l3lZjSFaLqO//s3vYM+IXeuvlv/y
	/dfHHviHfnBqdEGwOmcG457qdemIBvgBx+bqD/zCvN3V7II6Yril65MK6/wHmBUZtxAk
	GYde23ns9oy0ZyiGUWwDlhNEcFeeRdOU+ppsXDrWffD68Njp/BtLNxqnzabJOeVI7hov
	FyyXu5aP4K+PTdWAQdZbT6AOWH0FZ0CMYuzzcjYnrmzw6Wz8j7dm0s2UpjYoboFLsZ1I
	eH4wzIW/HW+1cgCj1gWa5wBFUBsWAHwp4MQuiUE/pk7Quy/oxtTgJ3ORzxYGV9oBZRNa
	ls0w==
X-Gm-Message-State: ALoCoQmpA3QYHeCqMq6mJApJUJwKvD1ibywlFhfFUiO3/ZtN4wz+6I+mAe/9rhRh7aj1uVzH/qcm
X-Received: by 10.49.95.233 with SMTP id dn9mr11360968qeb.54.1382713735225;
	Fri, 25 Oct 2013 08:08:55 -0700 (PDT)
Received: from burninator.corp.ad.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id l5sm20195968qac.12.2013.10.25.08.08.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2013 08:08:54 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2013 11:08:52 -0400
Message-Id: <1382713732-18896-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] tftpd-hpa: update default tftpboot location
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
X-List-Received-Date: Fri, 25 Oct 2013 15:08:53 -0000

The tftp-hpa package installs /var/lib/tftpboot and tftpd-hpa is
configured to use that directory, but the default points at /svc/tftpboot.
Correct that so the default points to a location that exists when the
package is installed.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-daemons/tftp-hpa/files/default |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/default b/meta-networking/recipes-daemons/tftp-hpa/files/default
index de2ed18..1dce7fd 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/default
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/default
@@ -1,3 +1,3 @@
 #Defaults for tftpd-hpa
 RUN_DAEMON="yes"
-OPTIONS="-l -s /srv/tftpboot"
+OPTIONS="-l -s /var/lib/tftpboot"
-- 
1.7.10.4


