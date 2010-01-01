Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NQgy0-0001Zy-BK
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jan 2010 13:50:59 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A55681B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2010 12:45:57 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 1 Jan 2010 13:48:44 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200912190854.11510.holger+oe@freyther.de>
	<hglsin$2vi$2@ger.gmane.org> <hgt9h8$25m$1@ger.gmane.org>
In-Reply-To: <hgt9h8$25m$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001011348.44168.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Fri, 01 Jan 2010 12:50:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 23 December 2009 15:30:00 Koen Kooi wrote:
> On 20-12-09 20:05, Koen Kooi wrote:

> It looks like it also changes stuff in libQtGui(E) :(

it does, it is compiling the egl and OpenVG part into libQtGui... 


what about something like this? This way one can select qt4-embedded as 
default and switch to the gles variant when ones needs it?



diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embedded-
gles_4.6.0.bb
index f819c66..06cdcc5 100644
--- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
@@ -1,6 +1,7 @@
 require qt4-embedded.inc
 PR = "${INC_PR}.0"
 
+PROVIDES += "qt4-embedded"
 QT_GLFLAGS = "-opengl es2 -openvg"
 
 require qt-4.6.0.inc



