Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LkMVL-0002Q5-R3
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 18:58:07 +0100
Received: by yx-out-1718.google.com with SMTP id 3so452169yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=0h4UJ+oNP4+e7BMBcELA4Nfm1sZ9GRR/l8sMkS6xmn4=;
	b=XOYAIAWmvGSosnLOGTOsVh/czhLVmTHSUB6WtLcvJ6zO3TQxSnxi6TYrF2V56QOxby
	oS4TViEXl/Q1uxVPmZIbiSlRvk68icnV9AMx63ZEq7YR4topa/MGytNjGo3kFJRvbLxL
	XPnXBqA66xZfws7X0FWYLyuiR9vf3urFTM0dU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=OORDE7FZ1wFb7NB1fw5zwbyoiXEIrtYYA9tip7RC0PnlE7CVumOyf7O7yk3venhvI6
	MT8Hht3WrWY8QUfMD6HHv+G7JmhXb6burlg3iBHuAW2QWtxxxYqUk439O++dzYAWDJTV
	NFEiqdkmZOVlZWmOcYI+2/aYiBS78b4kuBX3Y=
Received: by 10.142.77.7 with SMTP id z7mr1041945wfa.230.1237485429032;
	Thu, 19 Mar 2009 10:57:09 -0700 (PDT)
Received: from dorkboy (99-203-159-164.pools.spcsdns.net [99.203.159.164])
	by mx.google.com with ESMTPS id 22sm2143593wfi.1.2009.03.19.10.57.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Mar 2009 10:57:08 -0700 (PDT)
Date: Thu, 19 Mar 2009 10:57:01 -0700 (PDT)
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.DEB.1.00.0903191053260.9107@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] local.conf.sample: Replace packages/ with recipes/.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2009 17:58:08 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


---
 conf/local.conf.sample |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 36407b0..022d65d 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -23,7 +23,7 @@
 DL_DIR = "${HOME}/sources"
 
 # Delete the line below. Then specify which .bb files to consider for
-# your build. Typically this will be something like BBFILES = "/path/to/openembedded/packages/*/*.bb"
+# your build. Typically this will be something like BBFILES = "/path/to/openembedded/recipes/*/*.bb"
 BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
 
 # Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
-- 
1.5.4.3

Signed-off-by: Theodore A. Roth <taroth@gmail.com>


