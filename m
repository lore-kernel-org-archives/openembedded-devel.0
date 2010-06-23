Received: from mail.asoft.ru ([91.205.86.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1ORTO4-0006JS-Qr
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:05:48 +0200
Received: from lighthouse.office.asoft.ru (office.asoft.ru [62.205.175.245])
	(authenticated bits=0)
	by mail.asoft.ru (8.14.3/8.14.3) with ESMTP id o5NH0dGF028612
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 21:00:41 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jun 2010 21:00:35 +0400
Message-Id: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.7.1
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.3
	(mail.asoft.ru [91.205.86.207]);
	Wed, 23 Jun 2010 21:00:41 +0400 (MSD)
X-SA-Exim-Connect-IP: 91.205.86.207
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 0/3] Recipe for MuPDF
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
X-List-Received-Date: Wed, 23 Jun 2010 17:06:13 -0000

As there's no more comments on original patch series[1], guess it's time
to send v2. Do whatever you like with these patches :-)

[1] http://patchwork.openembedded.org/bundle/mad_soft/mupdf-0.6-v1/

Changelog v1 => v2:

* removed autotools_stage_all from openjpeg and jbig2dec recipes,
  as suggested by Khem Raj
* used upstream patch fixing endianness issues on 16-bit displays
  instead of custom hack (upstream has been very kind to fix this
  bug so quickly)
* more verbose comment about why we need -O2

Dmitry Artamonow (3):
  openjpeg-1.3: new recipe
  jbig2dec-0.11: new recipe
  mupdf-0.6: new recipe

 recipes/jpeg/jbig2dec_0.11.bb                      |   15 +++
 recipes/jpeg/openjpeg-1.3/fix_installdir.patch     |   19 ++++
 recipes/jpeg/openjpeg_1.3.bb                       |   20 +++++
 recipes/mupdf/mupdf-0.6/Makerules                  |    8 ++
 recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch |   90 ++++++++++++++++++++
 recipes/mupdf/mupdf_0.6.bb                         |   60 +++++++++++++
 6 files changed, 212 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jpeg/jbig2dec_0.11.bb
 create mode 100644 recipes/jpeg/openjpeg-1.3/fix_installdir.patch
 create mode 100644 recipes/jpeg/openjpeg_1.3.bb
 create mode 100644 recipes/mupdf/mupdf-0.6/Makerules
 create mode 100644 recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
 create mode 100644 recipes/mupdf/mupdf_0.6.bb



