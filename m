Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Systd-0004pi-Sr
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 01:09:05 +0200
Received: by wibhq4 with SMTP id hq4so2909481wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=5Nw5gMDQQN/WXb8OAn3vo/cMIuuZF7yPhtaSYwQZ4wE=;
	b=iHH2LFyVG6wrVrhHxRP1MB0gP8aCTl1rgXrvkr3y3RfWzE2lONsB4KiXh9nUVHyp+M
	EsK9xGNQCav8qEtc5kHh9xlq23nWul8gU9Y33JExhC7amRgkxeXOoAbaD4ofqOjd6iZj
	9pGcnkKwMdXujdyfMaRPLZFmvZw94v3+SwwU2YPo1vuAoywFdLMDwL0YNZSY4VWvPLlH
	664hPHwQoCv8/UYQ3/dJ1jrWUlRUmfDOhj0ncMvoWrhb0ZcxGBIwvyeqeYoWm/ZOpOUi
	A3Y91Kl+KgiH9kn+tPmRU9K4X7mi9gypeEUdR72XDxh+8fGbsR1Nw1O4ZZU7k4lTyJyy
	7WDA==
Received: by 10.216.243.203 with SMTP id k53mr8498216wer.91.1344380239419;
	Tue, 07 Aug 2012 15:57:19 -0700 (PDT)
Received: from localhost.localdomain (p5B0A309E.dip.t-dialin.net.
	[91.10.48.158])
	by mx.google.com with ESMTPS id l6sm1882009wiz.4.2012.08.07.15.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 15:57:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Aug 2012 01:04:23 +0200
Message-Id: <1344380665-3759-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-systemd 0/2] ALIAS
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
X-List-Received-Date: Tue, 07 Aug 2012 23:09:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series takes ALIAS tag into account when setting up rootfs and as
'example' fixes systemd's search for  display-manager.service when using gdm.
The first patch makes [1] work and needs [2] and [3] to apply. During tests
also [4] was applied. Buildhistory results for an image using lxdm (will be
sent when all issues are fixed) were:

$ git show
commit 3fe6b508a3a461fbf8d7682e6d170a55d301c6c0
Author: buildhistory <buildhistory@angstrom>
Date:   Tue Aug 7 23:51:38 2012 +0200

    images: Build Angstrom v2012.08-core of angstrom v2012.08-core for machine overo on localhost.localdomain

diff --git a/images/overo/eglibc/xfce-full-image/files-in-image.txt b/images/overo/eglibc/xfce-full-image/files-in-image.txt
index 9c178b0..1af496d 100644
--- a/images/overo/eglibc/xfce-full-image/files-in-image.txt
+++ b/images/overo/eglibc/xfce-full-image/files-in-image.txt
@@ -558,6 +558,8 @@ drwxr-xr-x root       root             4096 ./etc/systemd/system
 drwxr-xr-x root       root             4096 ./etc/systemd/system/basic.target.wants  
 lrwxrwxrwx root       root               37 ./etc/systemd/system/basic.target.wants/timestamp.service -> /lib/systemd/system/timestamp.service
 lrwxrwxrwx root       root                9 ./etc/systemd/system/busybox-udhcpc.service -> /dev/null
+lrwxrwxrwx root       root               42 ./etc/systemd/system/dbus-org.freedesktop.NetworkManager.service -> /lib/systemd/system/NetworkManager.service
+lrwxrwxrwx root       root               32 ./etc/systemd/system/display-manager.service -> /lib/systemd/system/lxdm.service
 lrwxrwxrwx root       root                9 ./etc/systemd/system/dnsmasq.service -> /dev/null
 drwxr-xr-x root       root             4096 ./etc/systemd/system/getty.target.wants  
 lrwxrwxrwx root       root               34 ./etc/systemd/system/getty.target.wants/getty@tty1.service -> /lib/systemd/system/getty@.service
@@ -576,7 +578,7 @@ drwxr-xr-x root       root             4096 ./etc/systemd/system/sockets.target.
 lrwxrwxrwx root       root               35 ./etc/systemd/system/sockets.target.wants/dropbear.socket -> /lib/systemd/system/dropbear.socket
 drwxr-xr-x root       root             4096 ./etc/systemd/system/sysinit.target.wants  
 lrwxrwxrwx root       root                9 ./etc/systemd/system/syslog.busybox.service -> /dev/null
-lrwxrwxrwx root       root                9 ./etc/systemd/system/syslog.service -> /dev/null
+lrwxrwxrwx root       root               42 ./etc/systemd/system/syslog.service -> /lib/systemd/system/busybox-syslog.service
 drwxr-xr-x root       root             4096 ./etc/systemd/user  
 -rw-r--r-- root       root              487 ./etc/systemd/user.conf  
 drwxr-xr-x root       root             4096 ./etc/terminfo  

[1] http://patches.openembedded.org/patch/33791/
[2] http://patches.openembedded.org/patch/33999/
[3] http://patches.openembedded.org/patch/33997/
[4] http://patches.openembedded.org/patch/33793/


Andreas Müller (2):
  systemd-systemctl-native: handle ALIAS tag
  gdm: replace 'WantedBy=graphical.target' by
    'Alias=display-manager.service'

 .../meta-gnome/recipes-gnome/gdm/gdm/gdm.service   |    2 +-
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    2 +-
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   17 +++++++++++++++++
 4 files changed, 20 insertions(+), 3 deletions(-)

-- 
1.7.4.4



