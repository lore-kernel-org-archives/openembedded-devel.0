Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 400CE7D034
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 12:49:41 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 10so7455351lfr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+XGhLIlWz60oewUkoFo0iV0TNzZCrauGMFdJXzhkssg=;
	b=avXzaWJPlcyHqR/6WBG2TRpLujBwU+3eL/0gJyxZpZ6anl31VpOplp1RkXmKJocXKL
	+xlBslD1nbq04GaN+FsOkCHFhB8DUz/hKPvq0x9ioNpjREXLipavAViGluVVSbwo1Kbp
	0XGCdoeNXQRr1QTHzAB5C9aYXsX/vM84BUKBAk8MbPN35oJHY0lcgy+8UvJqNp7n8HR9
	R2UjgEUFDmaBvW6IuakYy7kgC+LZMx0NXjQDV6dfHAvvveb4+DhKCsarkAd4fcnPpKKT
	Xdx6CHsg1LSRn/jg4yFflavUxotZ2j57zCk6pkMTL0jT5g6Oos+oG6kmrW6+PLdEJ3Vw
	lH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+XGhLIlWz60oewUkoFo0iV0TNzZCrauGMFdJXzhkssg=;
	b=MlcLoT6vKPFoCumRZ297qHCiMSxeuZDbNGVWmI1LqK2A6cGnaKHNhRYSYciLcCO/DW
	M6iTIqWiNaoEhSX5QCs03Oo010ktwJYBu3G/+lZFbQiIYAsssMqXcCR1wI1O4hlqI9L2
	LtvNxrGrCL2ysFKizQ459evmgxmABPcyCi4U9nofvAlwmO6Qih/Dd4WjebDWmj9ylsB2
	iS4smQsiC9fDfeCkmCXIBzSpuCuFwzuCf6nqv1RH+oynE0QdYafu6XyJZxjSAptjGOts
	UeQhXlHxra58tQsGgs/XfRgJoy27zaiXI5fGGrvwQpmt4xVqpcvsgIeqzhlTFjnukAbS
	srDA==
X-Gm-Message-State: APjAAAXzDoUANnSksQKw1F2v97KwzMBHz7WEk/TMCgAMmmqXueU0fqIq
	Govh9Wl5956EuQy+aOvYHIsMW4iWqzo=
X-Google-Smtp-Source: APXvYqyuiKSvzcUA5nSfPnCVvQFfwX8UGoW++fLcqKNEILGmxXk0VnkSWPyV1z/YXvJLqi4jjIPdug==
X-Received: by 2002:ac2:43b9:: with SMTP id t25mr3586437lfl.22.1554641381461; 
	Sun, 07 Apr 2019 05:49:41 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id r3sm5862594ljr.7.2019.04.07.05.49.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 05:49:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 14:49:29 +0200
Message-Id: <20190407124929.14918-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] smcroute: update to 2.4.4
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
X-List-Received-Date: Sun, 07 Apr 2019 12:49:41 -0000

COPYING md5sum updated to to minor cleanup (see @0ae4003f714218c371).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../smcroute/{smcroute_2.0.0.bb => smcroute_2.4.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.0.0.bb => smcroute_2.4.4.bb} (75%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb b/meta-networking/recipes-support/smcroute/smcroute_2.4.4.bb
similarity index 75%
rename from meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.4.4.bb
index 9b6fc2f38..0b63f79ac 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.0.0.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.4.4.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "SMCRoute is a daemon and command line tool to manipulate the mult
 HOMEPAGE = "http://troglobit.github.io/smcroute.html"
 SECTION = "net"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "d6280e64b27d5a4bd7f37dac36b455f4ae5f9ab3"
+SRCREV = "a8e5847e5f7e411be424f9b52a6cdf9d2ed4aeb5"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


