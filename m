Return-Path: <prvs=989280226=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCE77D274
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1554282779; x=1585818779;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=qT9yVKKM/iCDwBDIRjHA+p9Tyb/Wu+yZm221ucpNjUQ=;
	b=ElsgaxDpajJffDD8N18AkEndrhNr5BZxfyeHQlrcZzIaU4griT+cCIpp
	EAWOEtKr4kv38oOGfC66rAY2IPcE5cNbulLVukry8Nhn3NhMl+o+W2Plp
	iHZklpgxyt2gjhNeElcSIKOtIzkwHqIaeSB6p4r0dos854qkaMsqEQKEi
	YIjsRiVKTfKBAvpP9KG+u64XybEdqmcr/p7Oik6eE6lxpKF0JYfZhIYrF
	5dT3/2C3Hom0A5njcRjh0f1yreVxNZLwtigqgUTKO2VJhOGZcuK9r3ZvJ
	RCzFYVM18WrjpyBis/TZdppZr3VGrsYCmrOSVlaKXpLhEBXOy+t0EQiUo w==;
IronPort-SDR: iRyaDvV5QHd83m+7OZCS3EwsKtLXUTSWSMOZMUbzk1fBnSPCdED8+n7WIKTMNmTn8qKqMlg29m
	KY9fLaBkljjNsYqSmsB2dAxpHasIO3TwKuXkElJxJUZBpKbreqe+3Shp7vgHQQ/FLm+cmRYMb9
	MK6uCFh0QYxfOxvvfsjabsJEmW6NCLrTxjkUxbcXYbJYezVv1luJQdSLIFX4HzFKTC6WfAFfWW
	fU9a6roRsk3ScnKWXnZBPIhYKiMsXFG/C90GDq+RTPc+mQxlpV+4P2GiEoM5CnZo+km4WYr6Eh
	zkw=
X-IronPort-AV: E=Sophos;i="5.60,304,1549926000"; d="scan'208";a="16171773"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Apr 2019 11:05:39 +0200
Message-ID: <20190403090539.24866-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.22]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] layer.conf: Add warrior to compatible release series
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 09:12:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b03a608..90236be 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "thud"
+LAYERSERIES_COMPAT_meta-java = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.20.1


