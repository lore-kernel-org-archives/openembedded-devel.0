Received: from [131.111.8.131] (helo=ppsw-1.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N5lyi-0007QN-5O
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 20:57:15 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:54843)
	by ppsw-1.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.151]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N5lxZ-0005ew-5s (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 04 Nov 2009 19:56:01 +0000
Message-ID: <4AF1DC6C.4020405@cam.ac.uk>
Date: Wed, 04 Nov 2009 19:56:28 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.131
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] IMote2 specific network config
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
X-List-Received-Date: Wed, 04 Nov 2009 19:57:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
Simple default config. Equivalent of that in imote2-linux distros
as available form imote2-linux.sourceforge.net
(pre moving to openembedded)

 recipes/netbase/netbase/imote2/interfaces |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/recipes/netbase/netbase/imote2/interfaces b/recipes/netbase/netbase/imote2/interfaces
new file mode 100644
index 0000000..32faf27
--- /dev/null
+++ b/recipes/netbase/netbase/imote2/interfaces
@@ -0,0 +1,12 @@
+auto lo
+iface lo inet loopback
+
+auto usb0
+iface usb0 inet static 
+      address 192.168.99.101
+      netmask 255.255.255.0
+
+auto wlan0
+iface wlan0 inet static
+      address 10.0.0.201
+      netmask 255.255.255.0  
-- 
1.6.0.4


