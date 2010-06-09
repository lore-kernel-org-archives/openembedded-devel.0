Received: from mail.asoft.ru ([91.205.86.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OMFqo-0002BD-Av
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 09:37:27 +0200
Received: from lighthouse.office.asoft.ru (office.asoft.ru [62.205.175.245])
	(authenticated bits=0)
	by mail.asoft.ru (8.14.3/8.14.3) with ESMTP id o597X3bU007448
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Jun 2010 11:33:04 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 11:32:59 +0400
Message-Id: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.7.1
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.3
	(mail.asoft.ru [91.205.86.207]);
	Wed, 09 Jun 2010 11:33:04 +0400 (MSD)
X-SA-Exim-Connect-IP: 91.205.86.207
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] Recipe for MuPDF
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
X-List-Received-Date: Wed, 09 Jun 2010 07:37:27 -0000

Hi!

Here's recipe for MuPDF (X11 pdf viewer and toolkit) and its dependencies.
Viewer doesn't have any fancy GUI - just a plain window with rendered PDF,
but it's a good thing on small screens embedded devices usually have,
as no screen space is wasted on buttons, etc. Viewer is perfectly
controllable from keyboard (and keyboardless devices like PDAs usually
have some joystick which is enough to navigate through pages, and other
tasks can be performed from on-screen keyboard). Also pdf contents is
scrollable by finger/stylus/mouse. And last, but not least - viewer is
VERY fast, much faster than poppler/xpdf-based solutions. I never thought
I can get such a speed of PDF-rendering on ARM-based machine.

Build tested for armv4(h3600), armv5(hx4700), armv7(beagleboard), x86(qemux86)
Run tested on armv5 machine (hx4700)

Dmitry Artamonow (3):
  openjpeg-1.3: new recipe
  jbig2dec-0.11: new recipe
  mupdf-0.6: new recipe

 recipes/jpeg/jbig2dec_0.11.bb                      |   19 ++++++
 recipes/jpeg/openjpeg-1.3/fix_installdir.patch     |   19 ++++++
 recipes/jpeg/openjpeg_1.3.bb                       |   24 ++++++++
 recipes/mupdf/mupdf-0.6/Makerules                  |    8 +++
 .../mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch  |   12 ++++
 recipes/mupdf/mupdf_0.6.bb                         |   59 ++++++++++++++++++++
 6 files changed, 141 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jpeg/jbig2dec_0.11.bb
 create mode 100644 recipes/jpeg/openjpeg-1.3/fix_installdir.patch
 create mode 100644 recipes/jpeg/openjpeg_1.3.bb
 create mode 100644 recipes/mupdf/mupdf-0.6/Makerules
 create mode 100644 recipes/mupdf/mupdf-0.6/mupdf_fix_16bit_display.patch
 create mode 100644 recipes/mupdf/mupdf_0.6.bb



