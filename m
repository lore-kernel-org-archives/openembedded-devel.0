Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OEWW8-0006k3-HG
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 01:48:09 +0200
Received: by gwj19 with SMTP id 19so595118gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 16:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=gwdyX0w8HZepgF80vVOL7UtmtG1ahGK4+iR2JSP5GvI=;
	b=Mi3ZuP3lAI7lhSgBTy+1xugUqyDIDoXmZT2cMW872mIdanPe4XKaeRsICiPDrvjw80
	v40Y1K3qbRUNMSbEl66cWo/ZUeJh390809fKCkxhcP1ODAhpDO1iFcUBOxCK6Fq1gYLU
	OPvFBh/7X11on4kRZiAUNqF0J7ri49VfhEufo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=mSYpE76GR/w8RbopOHsg8lNmAOYe7nURorqGk9Wtn9rk7eCeSIWyGx0JB+I5U+Nov9
	zJ08uJXO5LB/z9f9PJTiJ50vtRzaE+fW2hQnerC1R3awxfyicvr6UTyyEiA79vS06+3B
	NNoBTHUQgk30DjX7Nn02XXEp2RwA+OJNeC0Ro=
MIME-Version: 1.0
Received: by 10.101.28.39 with SMTP id f39mr7721830anj.69.1274226247325; Tue, 
	18 May 2010 16:44:07 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Tue, 18 May 2010 16:44:07 -0700 (PDT)
Date: Wed, 19 May 2010 01:44:07 +0200
Message-ID: <AANLkTimqvGPoCByYUUUSaFSYLcbA_e7CrZKg-GtIyVzG@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [oe-commits]: linux-kexecboot: sed out conflicting getline in scripts/ unifdef.c
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
X-List-Received-Date: Tue, 18 May 2010 23:48:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

We are discussing about moving this sed to linux.inc in order to fix
the issue once for all.
Opinions?

Andrea


---------- Forwarded message ----------
From: git version control <git@git.openembedded.org>
Date: Wed, May 19, 2010 at 12:47 AM
Subject: [oe-commits] Andrea Adami : linux-kexecboot: sed out
conflicting getline in scripts/ unifdef.c
To: openembedded-commits@openembedded.org


Module: openembedded.git
Branch: org.openembedded.dev
Commit: 06fff17991cf5105cb29d3cec2640995ace329b5
URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit=
;h=3D06fff17991cf5105cb29d3cec2640995ace329b5

Author: Andrea Adami <andrea.adami@gmail.com>
Date: =A0 Wed May 19 00:40:47 2010 +0200

linux-kexecboot: sed out conflicting getline in scripts/unifdef.c

* mainline since 2.6.29-rc8

---

=A0recipes/kexecboot/linux-kexecboot.inc | =A0 =A09 +++++++++
=A01 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes/kexecboot/linux-kexecboot.inc
b/recipes/kexecboot/linux-kexecboot.inc
index 5621e69..2751126 100644
--- a/recipes/kexecboot/linux-kexecboot.inc
+++ b/recipes/kexecboot/linux-kexecboot.inc
@@ -71,6 +71,15 @@ sed -i -e /CONFIG_BLK_DEV_INITRD/d \
=A0sed -i -e /CONFIG_CMDLINE/s/quiet/loglevel=3D3/1 ${S}/.config
=A0sed -i -e /CONFIG_CMDLINE/s/debug/loglevel=3D3/1 ${S}/.config

+# Rename getline in ./scripts/unifdef.c
+# with 2.6.2x builds are currently failing to build unifdef.c,
+# clashing with exposed getline() from <stdio.h>
+# see https://patchwork.kernel.org/patch/11166/
+# committed in 2.6.29 (harmless for newer kernels)
+
+sed -i -e 's/getline/parseline/g' ${S}/scripts/unifdef.c
+
+
=A0echo 'CONFIG_BLK_DEV_INITRD=3Dy
=A0CONFIG_KEXEC=3Dy
=A0${KERNEL_COMPRESSION}


_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits


