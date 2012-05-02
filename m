Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SPaO6-0007l9-NY
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 16:18:38 +0200
Received: by vcbfl13 with SMTP id fl13so468630vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=cpTVEyDq9mKhdOAUvKYSJQw6hQNOMdERISwoKYcQvKA=;
	b=Fkt17z812oZj/mH9YtE8FNrxnVw/3XnVoJ2WLa2U/Q9YwHLlkRwD2+QLRhgUaVQKMR
	6g1aJykS6o/sl0wcisnWDr5wIhXGTwJ/vncXRpAT0KbXjXLQcInMpalexdkaDAq1gveh
	pdF/qDqIjtiGfc/jyPe3Q4ByP3hUKqOCrPexhqSNdkZ0DwMW0fzt7gfhddMjT6mcHkW7
	5YGbo6MOolT/5naefc3HIL3fo8Wk/leySpDSOu1FCPg3suJKXHO9B9ewPSrN1IxtJC5f
	udc7QPiihjgxWFY5/2uBcwvrzkTg0zcJ+bI6zussRSQ62eNlJyF2vfXQkx+HjYHIVvH+
	VPzw==
Received: by 10.220.150.14 with SMTP id w14mr20842286vcv.59.1335967733865;
	Wed, 02 May 2012 07:08:53 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id fc7sm3086000vdc.13.2012.05.02.07.08.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:08:52 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:08:43 -0300
Message-Id: <1335967723-11333-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe] systemd-systemctl-native: fixed systemctl wrapper's `disable' action
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
X-List-Received-Date: Wed, 02 May 2012 14:18:38 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../systemd/systemd-systemctl-native/systemctl     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
index c4a0a3f..6e7a05d 100755
--- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -68,8 +68,8 @@ for service in $services; do
 			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
 			echo "Enabled $service for $wanted_by."
 		else
-			rm -f $ROOT/etc/systemd/system/$r.wants/$service_file
-			rmdirs -p $ROOT/etc/systemd/system/$r.wants
+			rm -f $ROOT/etc/systemd/system/$r.wants/$service
+			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
 			echo "Disabled $service for $wanted_by."
 		fi
 	done
-- 
1.7.2.5



