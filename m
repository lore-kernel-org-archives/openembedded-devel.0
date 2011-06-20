Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QYmnj-00016B-Ku
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 00:18:36 +0200
Received: by iwn19 with SMTP id 19so4502398iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2011 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=KNZk/p30DPWlHXH/1/kjsCR75Ip6W6Ld55QvUJ9b3x8=;
	b=I0oZtOeWPM6siOc/0pLNO+Nse8Lg5Tei5NqPEZL+QDAAazuw1dQ+ielJ3EvgyBMU/Q
	99bXDd4EZxr0kjuZgH9jvSupkEmsdchXYri8t7xIGIEDAC7c9ZqtYmHYp0GfHMt/sMUQ
	kcVOLXQk/mV1lKyUZnfXMYGwkXLVds9/KRLNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xkER3gU6a/M1lCv+AoJW94B1qJJZpneJf4+gSpDEH6VbrDHSTCf/jeuBJSI19cxM8K
	jhT9hciKiJH6foQunGikUimC/YTmfrF+st0br7U733Wg7vpp3ZNkM3IKX6OSDT0Baxyw
	tYbtAHcU+t7bIVnBJYpAR2TXaF/bXX2QgL/w8=
MIME-Version: 1.0
Received: by 10.42.157.73 with SMTP id c9mr6670564icx.135.1308608101603; Mon,
	20 Jun 2011 15:15:01 -0700 (PDT)
Received: by 10.231.40.11 with HTTP; Mon, 20 Jun 2011 15:15:01 -0700 (PDT)
In-Reply-To: <1308258789-9959-1-git-send-email-j-lance1@ti.com>
References: <1308258789-9959-1-git-send-email-j-lance1@ti.com>
Date: Mon, 20 Jun 2011 17:15:01 -0500
Message-ID: <BANLkTimvWcWiGSChFpbKZ7OEc+isoFTLEA@mail.gmail.com>
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH 1/2] matrix_gui: Update SRCREV to revision 265
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
X-List-Received-Date: Mon, 20 Jun 2011 22:18:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ping on these 2 patches.

Thanks,

Jeff Lance

---------- Forwarded message ----------
From: Jeff Lance <jefflance01@gmail.com>
Date: Thu, Jun 16, 2011 at 4:13 PM
Subject: [PATCH 1/2] matrix_gui: Update SRCREV to revision 265
To: openembedded-devel@lists.openembedded.org
Cc: Jeff Lance <j-lance1@ti.com>


* ti816x - Rework runOMTB script
* am3517 - Remove Can and WIFI apps
* am3715 - Add four new power apps
* Add Oprofile apps to all am platforms
* Remove LMBench app "write throughput" from all am platforms
* Add beagle board platform support

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/
matrix-gui-common_1.4.bb
index 0b4b25b..c241e85 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"

-SRCREV = "257"
-PR = "${INC_PR}.11"
+SRCREV = "265"
+PR = "${INC_PR}.12"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index a6eb17f..87a79fb 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc

-SRCREV = "257"
-PR = "${INC_PR}.10"
+SRCREV = "265"
+PR = "${INC_PR}.11"

diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index 51678df..4dc4021 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc

-SRCREV = "257"
-PR = "${INC_PR}.6"
+SRCREV = "265"
+PR = "${INC_PR}.7"
--
1.7.0.4

