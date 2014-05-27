Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f46.google.com (unknown [209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id D12146FA95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 15:09:31 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so9438868pbb.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=onFqJEGHr2+DNFLJ7FDUjYTHv8H7SwO+91vZrN/V71s=;
	b=egguq+ae+nV3Apa0tDGNdPj6B5hF8WfmYv+nlzqgJZNYBUmd01bO7ntnVyoosFIjUe
	rvAJ+UVMsrnvspwh7DR9kQSiQEUOjf3LtSu/xtIpR3PkqJ0hBZvamyudgujt6+SVJSnt
	PLIM4W49qLt5NuuT5fSAPzFGAhi3MnbLevWW+4KsGYxEk+MmuDMTXyU/7u/e3Vu7T2Vj
	uxpXemHkk0I+pohnMl6FEz90Y6zPTdG8PU4huR2TuTHGNmQu/ADhqSDN3NL125NfCQz0
	24X2L2aVaLrxaPBaLuqX6uxHky1G45i5pq5GUor2AQ1t6kBPO/yVvSJqyiiV7pOB2N5j
	tHFQ==
X-Received: by 10.66.232.166 with SMTP id tp6mr36955754pac.127.1401203372339; 
	Tue, 27 May 2014 08:09:32 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ek2sm23809571pbd.30.2014.05.27.08.09.31 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 08:09:31 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 08:12:14 -0700
Message-Id: <1401203534-2598-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] libmikmod: update to 3.3.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 May 2014 15:09:33 -0000

From: Tim Orling <TicoTimo@gmail.com>

* URI for 3.3.3 broken
* COPYING.LESSER License regressed address for FSF:
5c5
<      59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
---
>  51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../mikmod/{libmikmod_3.3.3.bb => libmikmod_3.3.6.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.3.bb => libmikmod_3.3.6.bb} (69%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
similarity index 69%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
index 6a3077f..be06efc 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "libmikmod is a module player library supporting many formats, including mod, s3m, it, and xm."
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "0e0f9bce8f8e598ca292b41e0ae385c8"
-SRC_URI[sha256sum] = "79f02478c5abd8b2af73df4cc5f9d52625aa044327c01563168e270cf79b2437"
+SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
+SRC_URI[sha256sum] = "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
 
 inherit autotools binconfig lib_package
 
-- 
1.8.3.2


