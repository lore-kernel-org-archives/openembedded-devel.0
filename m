Return-Path: <joe@deserted.net>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id C958A6AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:46:13 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so38869151igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=fXXPJnh/4Bu+Lw6tM0cRYkvEvF/gZp7BBLTBHyHh0eo=;
	b=Lcune0DOFZyRHoKurnVA11H75/4xb5hWBE8/wDjqyBGgUGF5Ma4q6LVqrwAE2SFwr+
	rUuzxR1c+CrhDiMGMblu/3bwLdL9YKVV1yZ7oxYsfqk0GXo5Fv+mqt6teIdd6kmZ465d
	vHyesEhk6dvpqELHrG6TDHW61uqdwwPHDangyNEIMgSb9pNQhUwXL+jkgr4zWFhvUPlG
	M39stwjQXWBM94Ef5fRqVWoUfXeDMgoVQ/7m6j/l/ITo2cW3/Ut1JGUYJjHQdQ6A4/6K
	37T+nv9LwiTgcSohsibxbaX5SmYHWRlfI1sXi++Wpcg7jao+2AgRjZeWtEZ9rtbYGtgw
	T7zg==
X-Gm-Message-State: ALoCoQmaHTpD4QRz4utHy5PgyOhWmhRGfPSpyLxWFbBHz4u1lMJTUH0gWqG1oiqzDAGL6BXRqGFr
X-Received: by 10.50.110.3 with SMTP id hw3mr12365185igb.20.1437144373668;
	Fri, 17 Jul 2015 07:46:13 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id i7sm3790089igt.18.2015.07.17.07.46.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jul 2015 07:46:12 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:46:15 -0400
Message-Id: <1437144377-3538-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH 1/3] ypbind: remove bashisms from initscript
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
X-List-Received-Date: Fri, 17 Jul 2015 14:46:14 -0000

Remove three very minor bashisms, all about redirecting stdout/stderr.
The initscript identifies as /bin/sh, this change ensures that the script
should work with a non-bash /bin/sh as well.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/nis/files/ypbind-yocto.init | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/nis/files/ypbind-yocto.init b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
index 5f50a53..2c50d12 100644
--- a/meta-networking/recipes-support/nis/files/ypbind-yocto.init
+++ b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
@@ -31,13 +31,13 @@ case "$1" in
 	echo -n "Starting ypbind"
 	## If the domainname is not set, skip starting of ypbind
 	## and return with "program not configured"
-        /bin/ypdomainname &> /dev/null
+        /bin/ypdomainname >/dev/null 2>&1
         if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
            if [ -f /etc/defaultdomain ]; then
              XDOMAINNAME=`cat /etc/defaultdomain`
              /bin/ypdomainname "$XDOMAINNAME"
 	   fi
-           /bin/ypdomainname &> /dev/null
+           /bin/ypdomainname >/dev/null 2>&1
            if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
 	     # Tell the user this has skipped
 	     echo -n " . . . . . . . . . . No domainname set"
@@ -66,7 +66,7 @@ case "$1" in
         if [ $? -eq 0 ]; then
             notfound=1
             for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
-                ypwhich &>/dev/null && { notfound=0 ; break; };
+                ypwhich >/dev/null 2>&1 && { notfound=0 ; break; };
                 echo -n " ."
                 sleep 1;
             done
-- 
1.9.1


