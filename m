Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q4HIj-0005H2-P4
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 20:36:29 +0200
Received: by eye27 with SMTP id 27so1173668eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 11:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=tnBsn7Q2GEa7kLkwVFPF2CW8bG0pYopKEcSBfigAxKg=;
	b=nd1nceANNmvK7tWV38GweLZW1f5vMI1twVWDQdVthXiisj57Hz7SXrT3VDMuR3yJ/x
	e+YsnPBTDUQFEJOcGkDOeEXdaZnmGkER0lHW4TRCC1pX5wArNucHa3SMYvoncxSCJDnu
	/gBPUtyQoCl6oHK73t3pMLJhLAO3QCY/MipuM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tT1N6aGTPzoRN6spFwigGhhYkhFku26qaqm7nSci11VChB17k0uVIMFj0ocKZXS0Xm
	CJEodrZfeAvzJACNGLlcs22mEvfNbVbG2rTx6QR1gEVRbJy0SldIHeewCjgKtrFxFou8
	cX4a1I/7hce48y+tNjaxdCUPjyWyhOWyg+n4E=
Received: by 10.14.125.137 with SMTP id z9mr1933892eeh.1.1301337269934;
	Mon, 28 Mar 2011 11:34:29 -0700 (PDT)
Received: from localhost.localdomain (85-156-4-183.elisa-mobile.fi
	[85.156.4.183])
	by mx.google.com with ESMTPS id q53sm2974922eeh.25.2011.03.28.11.34.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2011 11:34:29 -0700 (PDT)
From: phdeswer <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Mar 2011 21:33:26 +0300
Message-Id: <1301337206-24526-1-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH: poppler] Remove default_preference game as everybody wants to use the latest version, but the default_prefernce is -1 so this fails building packages that depend on poppler if not used with a distro that has a preferred version or default_preference bump
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
X-List-Received-Date: Mon, 28 Mar 2011 18:36:29 -0000

Signed-off-by: phdeswer <philippedeswert@gmail.com>
---
 recipes/poppler/poppler_0.12.3.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/recipes/poppler/poppler_0.12.3.bb b/recipes/poppler/poppler_0.12.3.bb
index 8b9fcca..ce1952e 100644
--- a/recipes/poppler/poppler_0.12.3.bb
+++ b/recipes/poppler/poppler_0.12.3.bb
@@ -2,11 +2,6 @@ require poppler.inc
 
 DEPENDS += "lcms"
 
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "1"
-DEFAULT_PREFERENCE_minimal = "1"
-DEFAULT_PREFERENCE_minimal-uclibc = "1"
-
 EXTRA_OECONF_append = " --disable-abiword-output "
 
 RDEPENDS_${PN} = "poppler-data"
-- 
1.7.2.5



