Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oxq24-0002Y1-Hd
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 01:44:39 +0200
Received: by pwj1 with SMTP id 1so1507437pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 16:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=UcKzjH74wwbM565caPntIuu/OVPsS3wZDTiJUEfUE9M=;
	b=u0Pp5k/ebFho57LP6c1L+oLUHH1TsP5AlDtFnT+9IaJz5zAfuVOHDL+3Ie4o+q0jSY
	qXFQ/XbIjjvXRz6GAsEuidzd1l5SlZuRakwXAdcR2czkkx1XBjP0JcK1UyMNN5cKfVNx
	lKF9MpHPKhQnbO/N4mseuYVQxe9UQtNV3zbL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=FeZZWxRAVWVlbK1VFVs+O9JOT/2QRazOEJb/+JOsp51UAdEGogI+aAEsQDF++mE2mt
	C5STmF3JDi199i+ZtaFu60hM1XC8VDd+TRG6HKYSaTOX8QIn8c6aoFjdHzURG7rLfzju
	kt+8WBA4CPrB6qaDQdXeODWLoAwgr32AnjZu8=
Received: by 10.142.239.21 with SMTP id m21mr8315191wfh.290.1285026259992;
	Mon, 20 Sep 2010 16:44:19 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	i20sm9252801wff.17.2010.09.20.16.44.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Sep 2010 16:44:18 -0700 (PDT)
Message-ID: <4C97F1CD.4070804@gmail.com>
Date: Tue, 21 Sep 2010 09:14:13 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opkg: disable GPLv3 code.
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
X-List-Received-Date: Mon, 20 Sep 2010 23:44:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The sha256 code is GPLv3 licensed. This was not obvious and the license clause
in opkg recipes was not updated when the sha256 code was added.

All other files in opkg remain licensed GPLv2 (or later).

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/opkg/opkg.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 3f94506..ae1622a 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPLv2"
 SRCREV = ${OPKG_SRCREV}
 PV = "0.1.8+svnr${SRCPV}"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 	   file://configure \
@@ -22,4 +22,5 @@ do_install_prepend() {
 EXTRA_OECONF += " --disable-gpg \ 
                   --disable-openssl \ 
                   --disable-ssl-curl \
-                  --disable-curl"
+                  --disable-curl \
+                  --disable-sha256"
-- 
1.7.1




