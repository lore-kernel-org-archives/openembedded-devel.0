Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SARw1-0000Pg-DA
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 21:15:05 +0100
Received: by wera1 with SMTP id a1so1281738wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Uf0+h1BtqjQpLiTuR50n8u3UmECPgynNbMOD6o5TaqQ=;
	b=hdWadNOjQMrSdI9fgCQ68zbCq/qxhafEG7gLjhpQwXFCliIpuEu6Nyd6rxg7zQ0biq
	WsK5EZxqJNnF02JplHkJ/Fy/lCi8fnCqtNdKVKTO+BkYijbpHfgoip1M4aHiPqagdO6g
	b/f1RiOM5Nfn9YVuOCx3SRUn1YGv6VwVWJq1kNY957nL7CBPZSLmy2aAEROwmfD+w8QX
	TWs+CgduXTb2dwaH5ONojyVRQ78Qo6RswWXRuuLcsR6/TeBKDnnqxcy3BrabmwnZbm5n
	W0wloQGk+vXdlVeoRfpdhng6TYtM/38lF7tLreqZnb5lFfW4fwNApUAGyU6j2OD9SZm9
	yIJQ==
Received: by 10.216.150.148 with SMTP id z20mr3184536wej.22.1332360371470;
	Wed, 21 Mar 2012 13:06:11 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1EA7.dip.t-dialin.net.
	[79.223.30.167])
	by mx.google.com with ESMTPS id l5sm7021769wia.11.2012.03.21.13.06.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 13:06:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 21:10:17 +0100
Message-Id: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe 0/2] midori: cleanup
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
X-List-Received-Date: Wed, 21 Mar 2012 20:15:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2:
change order variables/functions as suggested in [1]

v2 -> v3
change order variables/functions as suggested in [2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/038650.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/038684.html

Andreas Müller (2):
  midori: remove midori.inc and oe-stylize
  midori: add librsvg-native to DEPENDS

 meta-oe/recipes-connectivity/midori/midori.inc     |   39 -------------------
 .../recipes-connectivity/midori/midori_0.4.4.bb    |   41 +++++++++++++++++++-
 2 files changed, 39 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori.inc

-- 
1.7.4.4



