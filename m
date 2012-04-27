Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SNmHH-0000Q0-2h
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 16:36:07 +0200
Received: by wibhj13 with SMTP id hj13so588166wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=S/B86i+ILfUZsFJ8Glf9wNGZP8+UQVpDhR9/oWpcgow=;
	b=Zk9cu2pYmNoUhhEocnSJD61+SQRUIHnEZ+fUvvemJ5qSxTyPNeeynonodAn42RVZY7
	zx37s5X/EWW1PBhMn6+9nHynE7rzwkbjV1mEq0LGVhPP1yXUr4S/LOvNqnVSTE4gbXm+
	7Tr4f8L92epUmANRRJREk9WySpk0ilVt5Ysg6GrzNvSpbS1oxfD5IU4r96bNsQrRKzf3
	uzEqhWqjRBL7+GIf+ctX/eISzVslPdziIDDBHOKuIi5xhGYM8mJAOmMJrAwlE6HujVuz
	1S+mQOZ+P8qQxmN4XZSigYQZGUsR4dgFypeSJbJ6Ly/vEubQjqZ3jf2+dB3NifMK7ACE
	6dSg==
Received: by 10.180.92.71 with SMTP id ck7mr443211wib.21.1335536788996;
	Fri, 27 Apr 2012 07:26:28 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id ev10sm4837323wid.10.2012.04.27.07.26.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 07:26:28 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SNm7v-0000QB-0a; Fri, 27 Apr 2012 16:26:27 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 16:26:23 +0200
Message-Id: <1335536785-1585-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
References: <1335536785-1585-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 3/5] runqemu: simplify process_filename()
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
X-List-Received-Date: Fri, 27 Apr 2012 14:36:07 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 18fd691..dfa7f4b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -62,28 +62,31 @@ process_filename() {
 
     # Extract the filename extension
     EXT=`echo $filename | awk -F . '{ print \$NF }'`
-    # A file ending in .bin is a kernel
-    if [ "x$EXT" = "xbin" ]; then
-        if [ -z "$KERNEL" ]; then
-            KERNEL=$filename
-        else
-            echo "Error: conflicting KERNEL args [$KERNEL] and [$filename]"
-            usage
-        fi
-    elif [ "x$EXT" = "xext2" -o "x$EXT" = "xext3" -o \
-            "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" ]; then
-        # A file ending in a supportted fs type is a rootfs image
-        if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
-            FSTYPE=$EXT
-            ROOTFS=$filename
-        else
-            echo "Error: conflicting FSTYPE types [$FSTYPE] and [$EXT]"
-            usage
-        fi
-    else
-       echo "Error: unknown file arg [$filename]"
-       usage
-    fi
+    case /$EXT/ in
+	/bin/)
+		# A file ending in .bin is a kernel
+		if [ -z "$KERNEL" ]; then
+		    KERNEL=$filename
+		else
+		    echo "Error: conflicting KERNEL args [$KERNEL] and [$filename]"
+		    usage
+		fi
+		;;
+	/ext[234]/|/jffs2/|/btrfs/)
+		# A file ending in a supportted fs type is a rootfs image
+		if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
+		    FSTYPE=$EXT
+		    ROOTFS=$filename
+		else
+		    echo "Error: conflicting FSTYPE types [$FSTYPE] and [$EXT]"
+		    usage
+		fi
+		;;
+	*)
+		echo "Error: unknown file arg [$filename]"
+		usage
+		;;
+    esac
 }
 
 # Parse command line args without requiring specific ordering. It's a
-- 
1.7.10



