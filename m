Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVQ6k-0005fa-JB for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:51:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVQ4c-0005VV-63
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:49:18 +0100
Received: from p5b3b3565.dip.t-dialin.net ([91.59.53.101])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 14:49:18 +0100
Received: from no2spam by p5b3b3565.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 14:49:18 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 14 Jan 2010 14:48:56 +0100
Message-ID: <hin7c8$ter$1@ger.gmane.org>
References: <hill5g$ll0$1@ger.gmane.org>	<1263426466.457.286.camel@lenovo.internal.reciva.com>	<1263427123.15954.6.camel@dax.rpnet.com>	<hilp2s$ag$1@ger.gmane.org>
	<himn94$8ui$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3565.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <himn94$8ui$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 13:51:33 -0000
Content-Type: multipart/mixed; boundary="------------040607030207000304020802"

--------------040607030207000304020802
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> NAK, the needless SPLASH -> BOOTSPLASH will create too much work for
> people to catch up to, and it messes up the docs on the subject.

With respect to "needless", the reasons for the change were given in
this thread.  Please revisit the discussion.

And in any case, the tremendous (LOL) amount of work can be
significantly reduced with the help of sed, as I'm sure you are aware.

With regard to docs:

$ rgrep SPLASH docs/
$

The wiki has nothing on it, either.  Nothing but hot air?

This has become a non-core change, I don't feel bound by your NAK. That
being said, I know of your tendency of "my way or the highway" and have
prepared a new patch that omits the name change but is otherwise
identical.  Since this addresses your "concerns" I await your ACK.

--------------040607030207000304020802
Content-Type: text/x-patch;
 name="bootsplash.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bootsplash.patch"

diff --git a/classes/image.bbclass b/classes/image.bbclass
index ab58031..9dce609 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -17,6 +17,9 @@ IMAGE_INITSCRIPTS ?= "initscripts"
 #
 IMAGE_LOGIN_MANAGER ?= "tinylogin"
 
+# set sane default for the SPLASH variable
+SPLASH ?= ""
+
 IMAGE_KEEPROOTFS ?= ""
 IMAGE_KEEPROOTFS[doc] = "Set to non-empty to keep ${IMAGE_ROOTFS} around after image creation."
 
diff --git a/recipes/images/console-base-image.bb b/recipes/images/console-base-image.bb
index d25a4fc..9bd5031 100644
--- a/recipes/images/console-base-image.bb
+++ b/recipes/images/console-base-image.bb
@@ -4,7 +4,6 @@ IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 ANGSTROM_EXTRA_INSTALL ?= ""
 
-SPLASH ?= ""
 ZZAPSPLASH = ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)}'
 
 DEPENDS = "task-base \
diff --git a/recipes/images/gnuradio-image.bb b/recipes/images/gnuradio-image.bb
index 53e79b8..6bccda0 100644
--- a/recipes/images/gnuradio-image.bb
+++ b/recipes/images/gnuradio-image.bb
@@ -4,7 +4,6 @@ IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 IMAGE_EXTRA_INSTALL ?= ""
 
-SPLASH ?= ""
 ZZAPSPLASH = ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)}'
 
 DEPENDS = "task-base-extended \
diff --git a/recipes/images/minimal-image.bb b/recipes/images/minimal-image.bb
index e9abcb3..0bd8019 100644
--- a/recipes/images/minimal-image.bb
+++ b/recipes/images/minimal-image.bb
@@ -4,8 +4,6 @@
 ANGSTROM_EXTRA_INSTALL ?= ""
 DISTRO_SSH_DAEMON ?= "dropbear"
 
-SPLASH ?= " "
-
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 IMAGE_INSTALL = "task-boot \

--------------040607030207000304020802--
