Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Inm-0004qz-4G
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:30 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214309bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nRVS2nYtYRRO8gVBSrs5QL/3P2hlNJnA73U638dhrUs=;
	b=Ybq4GMhFWP0r4zZKIHPXDBaV2eBiVDLhRkRJ5IHRdz0jtDOYWOvp8HmTapbmgnfl/G
	cQY5qbEZlayTKJXTjb9GpL/Af6VNtN+oM3VLfha7ls/vfTfhUnEbRcUMPCjsqHc9EwNT
	nEX/tOndqdbtcu6si6MlyW4ju4bw7QbauXC2I=
Received: by 10.204.129.194 with SMTP id p2mr3746055bks.233.1315404210030;
	Wed, 07 Sep 2011 07:03:30 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:29 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:04 +0400
Message-Id: <1315404187-18176-10-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 09/12] linux.inc: drop OABI-only support
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:30 -0000

It's not logical to support OABI-only config with current kernel/userspace. Drop support
for OABI configurations. If necessary one can enable OABI compat.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 03b9811..a31669f 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -38,17 +38,12 @@ do_configure_prepend() {
         #
         # oabi / eabi support
         #
-        if [ "${TARGET_OS}" = "linux-gnueabi" -o  "${TARGET_OS}" = "linux-uclibceabi" ]; then
-                echo "CONFIG_AEABI=y"                   >> ${S}/.config
-                if [ "${ARM_KEEP_OABI}" = "1" ] ; then
-                        echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
-                else
-                        echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config
-                fi
-        else
-                echo "# CONFIG_AEABI is not set"        >> ${S}/.config
-                echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config
-        fi
+	echo "CONFIG_AEABI=y"                   >> ${S}/.config
+	if [ "${ARM_KEEP_OABI}" = "1" ] ; then
+		echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
+	else
+		echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config
+	fi
 
         # When enabling thumb for userspace we also need thumb support in the kernel
         if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
-- 
1.7.2.5



