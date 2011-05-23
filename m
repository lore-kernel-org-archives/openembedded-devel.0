Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOVGO-0000ky-Kp
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 15:33:41 +0200
Received: by yia13 with SMTP id 13so2200538yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=oXFIl1lk6Xl1viZammkKnjF309AoPBwfVyhrIDOYng0=;
	b=VcWnji+OHR2/01wblP1ueywfl+g27VbveWQggQVwbGH1eM2S84p3Vk8pLVelmcly8y
	9QjcsXaOcZxLKkTUui4m9xdZUKW5Lz7c6FS/5aA4DTcivdQedvjWxgFkfktDfahTk0Z+
	HfiwZFelVXjcTKBAuYaLOzLUD2yDAtLidAOFo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=p9UFz1vqbYv58+9n9w8yqrnPI4LN6gDRTKYP1o+c2Hlro4J0iVk3trFii80lenSRzq
	6n7489TMTtY6CvVTjxZyao+6QYuIu4xCTJrNBc51OKzjq3i9mf3Ge2f/ON2lLk3SxMf2
	pwxyw3drIMIHXiaX8NFlvNlaBk6zEKOQSrjDY=
Received: by 10.150.239.11 with SMTP id m11mr2964160ybh.424.1306157439968;
	Mon, 23 May 2011 06:30:39 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q29sm2723749yba.17.2011.05.23.06.30.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 06:30:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 13:30:21 +0000
Message-Id: <d71b62e25f631afc7fc9a26ff34a7e5274c07cc5.1306157341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/4] udev: fix init script indenting
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
X-List-Received-Date: Mon, 23 May 2011 13:33:41 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/udev/udev/init |   44 +++++++++++++++++-----------------
 1 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev/init b/meta-oe/recipes-core/udev/udev/init
index c0ecdfc..808d9e9 100644
--- a/meta-oe/recipes-core/udev/udev/init
+++ b/meta-oe/recipes-core/udev/udev/init
@@ -18,10 +18,10 @@ export TZ=/etc/localtime
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
-        if [ -x /sbin/pidof ]; then
-                pid=`/sbin/pidof -x udevd`
-                [ -n "$pid" ] && kill $pid
-        fi
+	if [ -x /sbin/pidof ]; then
+		pid=`/sbin/pidof -x udevd`
+		[ -n "$pid" ] && kill $pid
+	fi
 }
 
 export ACTION=add
@@ -30,9 +30,9 @@ echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
 LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
-        mount -n -o mode=0755 -t tmpfs none "/dev"
-        mkdir -m 0755 /dev/pts
-        mkdir -m 1777 /dev/shm
+	mount -n -o mode=0755 -t tmpfs none "/dev"
+	mkdir -m 0755 /dev/pts
+	mkdir -m 1777 /dev/shm
 }
 
 if [ "$DEVCACHE" != "" ]; then
@@ -42,10 +42,10 @@ if [ "$DEVCACHE" != "" ]; then
 	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
 	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
 	if [ -e $DEVCACHE ] && \
-	   cmp -s /tmp/uname /etc/udev/saved.uname && \
-	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
-	   cmp -s /tmp/devices /etc/udev/saved.devices && \
-	   cmp -s /tmp/atags /etc/udev/saved.atags; then
+		cmp -s /tmp/uname /etc/udev/saved.uname && \
+		cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+		cmp -s /tmp/devices /etc/udev/saved.devices && \
+		cmp -s /tmp/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
 	fi
@@ -59,17 +59,17 @@ fi
 # make_extra_nodes
 kill_udevd > "/dev/null" 2>&1
 
-        # trigger the sorted events
-        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-        /sbin/udevd -d
+# trigger the sorted events
+echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+/sbin/udevd -d
 
-        /sbin/udevadm control --env STARTUP=1
-		if [ "$not_first_boot" != "" ];then
-			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
-			(/sbin/udevadm settle --timeout=8; /sbin/udevadm control --env STARTUP=)&
-		else
-			/sbin/udevadm trigger
-			/sbin/udevadm settle
-		fi
+/sbin/udevadm control --env STARTUP=1
+if [ "$not_first_boot" != "" ];then
+	/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	--subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
+	(/sbin/udevadm settle --timeout=8; /sbin/udevadm control --env STARTUP=)&
+else
+	/sbin/udevadm trigger
+	/sbin/udevadm settle
+fi
 
 exit 0
-- 
1.7.2.5



