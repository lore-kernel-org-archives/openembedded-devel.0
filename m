Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tt5Xh-0004vz-0p
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 00:58:45 +0100
Received: by mail-ea0-f181.google.com with SMTP id k14so885559eaa.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 15:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Z/ApN+05D4YuESf7UCySV4Z2bQE0HfRT9s12+oH2Z/c=;
	b=uIzMPk/+vNVJwRCwTt7W9q8ycd2KJd8rOgGNq7Q6vxmBpUzvk822z/SxLGwWNYiU6Q
	4+iLxXQQjv0b+SR9HNDzlcrm3FqbL3+mkTdXagR/OE8RDKTvErF0p24ADvM93S7sjE5p
	3yHKcS9ClLaFfJtJWncL0+KeY8ka9dAaYR0JNVcW997S+uFteiWGJ/JxB3hu4gU1IXCx
	XNUKd+7voeb+rlgNXXYbDSUwtC/wxItkdUIqUCeDNyCrIn4akaGMYm80/ZFnkd2mMzYj
	gWoBYVpqaqaiKYO/UYhYCuyY/14ohPUCqjMDLWGb0c5L5FcOdnLw+TRJ7R42FXkV8O1G
	m8Dg==
X-Received: by 10.14.221.65 with SMTP id q41mr186165922eep.30.1357775012699;
	Wed, 09 Jan 2013 15:43:32 -0800 (PST)
Received: from localhost.localdomain (p5B0A280F.dip.t-dialin.net.
	[91.10.40.15])
	by mx.google.com with ESMTPS id e2sm144302197eeo.8.2013.01.09.15.43.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 15:43:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 00:43:15 +0100
Message-Id: <1357774995-1104-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-multimedia/meta-oe/meta-systemd 3/3] bluez4: add systemd support
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
X-List-Received-Date: Wed, 09 Jan 2013 23:58:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

makes bluetooth work for me and fixes the following errors:
Jan 01 20:02:02 overo NetworkManager[158]: <warn> bluez error getting default adapter: Unit dbus-org.bluez.service failed to load: No such file or directory. See system logs and 'systemctl status dbus-org.bluez.service' for details.
Jan 01 20:02:12 overo NetworkManager[158]: NetworkManager[158]: <warn> bluez error getting default adapter: Unit dbus-org.bluez.service failed to load: No such file or directory. See system logs and 'systemctl status dbus-org.bluez.service' for details.
Jan 01 20:02:12 overo dbus-daemon[172]: dbus[172]: [system] Activating via systemd: service name='org.bluez' unit='dbus-org.bluez.service'
Jan 01 20:02:12 overo dbus-daemon[172]: dbus[172]: [system] Activation via systemd failed for unit 'dbus-org.bluez.service': Unit dbus-org.bluez.service failed to load: No such file or directory. See system logs and 'systemctl status dbus-org.bluez.service' for details.
Jan 01 20:02:52 overo dbus-daemon[172]: dbus[172]: [system] Activating via systemd: service name='org.bluez' unit='dbus-org.bluez.service'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../bluez/bluez4_4.101.bbappend                    |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
new file mode 100644
index 0000000..36cc8e0
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -0,0 +1,8 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "bluetooth.service"
-- 
1.7.4.4



