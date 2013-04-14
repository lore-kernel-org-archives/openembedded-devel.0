Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URPEY-0000Cm-Rk
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:52:53 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1811557ead.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=uhOnglOlEqhgYcYoAcxL9qRXgNkwqwUisYmh/0SPyG0=;
	b=M/+2xi4r+OaReogkuEHKX0osM2MIR5oRULfpxhb7gmaDjyjTe3CDJ6d6CxlIx4sYvp
	PJ4vhG3wRODUY1DdhmOjf/b8fWN3k2vf0wOt6gb8xW/yc7X3aE54xhCIsGHl9i+RAof6
	NQ1mpjC2sygZwAdoRmBAb3HSphW5wAsbODwF1k1AmqjMNPap2LjNUN7sCkmDaUsbLEK+
	t14CunytRgpynCZ77xUX+iQuXcJ8QSFfS/OnCgJnrWWJMexECOz0GFG62Nj6AAf8qS6p
	KSBaOe0Nl34RqMVrIU/L+mxbsm0yVZvwYpIszLJ5z1VvN3knN4wOVa5yaS2W6VTTLtGc
	CYOw==
X-Received: by 10.15.41.2 with SMTP id r2mr51906248eev.20.1365953723485;
	Sun, 14 Apr 2013 08:35:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u44sm22068648eel.7.2013.04.14.08.35.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 08:35:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2013 17:35:25 +0200
Message-Id: <1365953726-4464-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH 1/2] systemd: add .bbappend to fix upgrade-path
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
X-List-Received-Date: Sun, 14 Apr 2013 15:53:02 -0000

 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/sysinit.target.wants/systemd-udevd.service
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/sysinit.target.wants/systemd-udev-trigger.service
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/systemd-udevd.service
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/systemd-udev-settle.service
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/systemd-udev-trigger.service
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/sockets.target.wants/systemd-udevd-control.socket
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/sockets.target.wants/systemd-udevd-kernel.socket
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/systemd-udevd-control.socket
        But that file is already provided by package  * udev-systemd
 * check_data_file_clashes: Package udev wants to install file /lib/systemd/system/systemd-udevd-kernel.socket
        But that file is already provided by package  * udev-systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend

diff --git a/meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend b/meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend
new file mode 100644
index 0000000..c530e02
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend
@@ -0,0 +1,5 @@
+PRINC := "${@int(PRINC) + 1}"
+
+RPROVIDES_udev += "udev-systemd"
+RREPLACES_udev += "udev-systemd"
+RCONFLICTS_udev += "udev-systemd"
-- 
1.8.1.5



