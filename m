Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q2gJg-0008PY-SF
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 09:54:53 +0100
Received: by qwh5 with SMTP id 5so6444535qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 01:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=07RWkWuass4i0tg410MozwsclqtzaT9OJgS2WK0jfyg=;
	b=huA0VSO++ELiwybQWAGFp5P0THCALwq7vF23YSp0rMOPqu5ttfMlNsZssFQGJlp0pp
	Wt+46H6Oo7oy3nf/HQVCNJLlPaHsZP1o2Z/RwLJ6PMQRp6FWXgA8vlD9rARTy6GBi60c
	DEQp9vdykhOy+khhAjxuF5Cj67KckF9IMwXag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lXBwWkpaw0Q8VlTwEta4U5EM15Ms2G/N6tTnwIOVFIrxEm3mSR9ybPqfu35gX20Qg2
	Lv1zBi/UzlCrJoy9MJwvdTLiimAQ/w16u2dS0ayMryW7zWmGk4bbkGxwthdT46DrGudC
	488Lc7l1ZBQSKAsA0JNvciTIcIHQcHWAyG2vs=
MIME-Version: 1.0
Received: by 10.224.71.69 with SMTP id g5mr6898760qaj.305.1300956778373; Thu,
	24 Mar 2011 01:52:58 -0700 (PDT)
Received: by 10.224.134.5 with HTTP; Thu, 24 Mar 2011 01:52:58 -0700 (PDT)
Date: Thu, 24 Mar 2011 14:22:58 +0530
Message-ID: <AANLkTikXA3RfJ2jfnf+ct=eCVmOS4CC1xPg1Q94JDeGT@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] TI IPC: Fixes for license, dependencies and installer unpack
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
X-List-Received-Date: Thu, 24 Mar 2011 08:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

* Correct the license from TI to BSD.
* Fix dependencies
* Update the installer unpack commands for latest releases.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
=A0recipes/ti/ti-ipc.inc |=A0=A0=A0 9 ++++++---
=A01 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
index cd6ad6e..28f8525 100644
--- a/recipes/ti/ti-ipc.inc
+++ b/recipes/ti/ti-ipc.inc
@@ -1,20 +1,23 @@
=A0DESCRIPTION =3D "TI Inter Process Ccommunication (IPC) Mechanisms (for
Uni- and Multi- Processor Configurations)"
=A0HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ipc/index.html"
+
=A0SECTION =3D "devel"
-LICENSE =3D "TI"
+LICENSE =3D "BSD"

=A0require ti-paths.inc
=A0require ti-staging.inc
=A0require ti-eula-unpack.inc

-PR =3D "r2"
+PR =3D "r3"

=A0S =3D "${WORKDIR}/ipc_${PV}"

=A0SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=3Dipcbin"

+DEPENDS =3D "ti-sysbios ti-cgt6x ti-xdctools"
+
=A0BINFILE=3D"ipc_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
+TI_BIN_UNPK_CMDS=3D"Y: q:workdir:Y"

=A0do_install() {
=A0=A0=A0=A0 install -d ${D}${IPC_INSTALL_DIR_RECIPE}
--
1.7.0.4


