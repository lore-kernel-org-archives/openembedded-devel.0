Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q23HS-00032z-OJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:13:58 +0100
Received: by gwb11 with SMTP id 11so2903578gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ypNzEjEzOlml0KisURPEqRhQhbUFRVcRbBU658KzEbw=;
	b=SxSbVer+O4m5nZNtcnHOS5ATom5mFNqUg3F/Jpvo+kMl/P4o0jrh83HMBLh0EEtz9T
	Ajdsh6buDioQlAr6HYvLz/QeIqScqNkWPdRSWY1QloKfe/Diq/olqbUkt6OvgdNIYQZw
	p+EzLGi0utsJce/E74ZittD+TOZ2a6Sx17TQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=HR3lZAN2C02u1eCJgaAJ6HNKcYsWJmaKbjSYZ54Nkap5i3/f+Ts5jWobv3Cy37IzrQ
	kkXropf4LdkIn66ABvcP3MJ/Qoud5SSM73XQw8b5Qd+DEGP52UHJqi6weT/q2RfGadqc
	VAXhNDSt8TREklpVEhebV4I0h0+LHvG+6JhZg=
Received: by 10.151.61.4 with SMTP id o4mr5453349ybk.266.1300806728189;
	Tue, 22 Mar 2011 08:12:08 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o2sm1732487ybn.21.2011.03.22.08.12.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 08:12:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:11:20 +0000
Message-Id: <1300806683-17244-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] wrapper/install: add -t support
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
X-List-Received-Date: Tue, 22 Mar 2011 15:13:59 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 bin/install |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bin/install b/bin/install
index ab316f6..5cb4071 100755
--- a/bin/install
+++ b/bin/install
@@ -3,12 +3,12 @@
 . $(dirname $0)/wrapper.sh
 
 saved=""
-while getopts dbCcMpSsvB:f:g:m:o:D opt; do
+while getopts dbCcMpSsvB:f:g:m:o:t:D opt; do
     case "$opt" in
         s)
             # Ignore strip argument
             ;;
-        B|f|g|m|o)
+        B|f|g|m|o|t)
             save "-$opt"
             save "$OPTARG"
             ;;
-- 
1.7.2.3



