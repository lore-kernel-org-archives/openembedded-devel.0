Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PfDLR-0006Ej-Bs
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 16:19:41 +0100
Received: by ywi6 with SMTP id 6so2119265ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NFbr09fPZq5Vawt6lwdXPwnHoIFDpqp9ZcNS/jNLH4k=;
	b=QJb7sAjp27D2UL3PxQ58vLvGu75jgyw4clSKSEvF1WUqc8yM0KsigxzTwLbtjTbpmg
	tsA6SIei4uirA3dNRkYmDqx3YgT0NSx7or4YVnkx++gjnsBATioWyZqxvZr390butP+a
	QQangfog1pRjGwtVjpvaVS1x4eretPZyNA55A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AIEr2NIPvMP0rxxP3fpYJWKYEZY+/Lq0OCVO9gRjzpejgt9+MeX9Yga0TcHCDZjRiY
	/NyO9U9/lXsYUmUVQ20zTqKFwu4rfnpQno9IWbKaihc2PgOV+L1jLwfzp1HmOhZduQnl
	5UDQHwhIuwGoDmSdiVRIsJ/IL/nuI1QGGui8g=
Received: by 10.42.173.10 with SMTP id p10mr1712885icz.142.1295363942022;
	Tue, 18 Jan 2011 07:19:02 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id f5sm4564018icu.16.2011.01.18.07.19.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 07:19:01 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jan 2011 08:18:49 -0700
Message-Id: <1295363929-13246-4-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] bin/install: implement -D internally
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
X-List-Received-Date: Tue, 18 Jan 2011 15:19:41 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 bin/install |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/bin/install b/bin/install
index 4ad8172..1c938755 100755
--- a/bin/install
+++ b/bin/install
@@ -1,9 +1,13 @@
 #!/bin/sh
+#
+# Portability notes:
+# - We allow what SuSv3 defines
+# - We implement -D internally
 
 source $(dirname $0)/wrapper.sh
 
 saved=""
-while getopts dbCcMpSsvB:f:g:m:o: opt; do
+while getopts dbCcMpSsvB:f:g:m:o:D opt; do
     case "$opt" in
         s)
             # Ignore strip argument
@@ -12,6 +16,9 @@ while getopts dbCcMpSsvB:f:g:m:o: opt; do
             save "-$opt"
             save "$OPTARG"
             ;;
+        D)
+            createleading="1"
+            ;;
         \?)
             exit 1
             ;;
@@ -25,4 +32,8 @@ for arg; do
     save "$arg"
 done
 
+if [ $# == 2 -a -n "$createleading" ]; then
+    install -d $(dirname $2)
+fi
+
 exec_real
-- 
1.7.2.3



