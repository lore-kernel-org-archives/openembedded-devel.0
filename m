Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE18978873
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:06 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m136so1363996pga.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HfUxk3zfQowBB+4nYj/pqKtXtFSEtgF7PoucgQ8atKw=;
	b=og5RkraMJ5wzpgPkq3eM6SXexX+bJepne8yfVhEjhaqYKX2u2sX0Nbe0EuwvAYZgZB
	S0bukSKGN+BfTqMPg/ChPQAQnweZCszy+bpuJxJ5f+PuCgAmo3FnMNhHHBkBQ1HQnbwc
	OmSU+uFw95CzAs4D1BdqLaQvVm4RbEih0Rxb35OB4QmowAzxTocvSh/fNQHkPV6GByl0
	+iXzYUkyKmTrrIi17CbGYCm+MyCPMjdxkZFD8NaTvb1RA9B0JltSGJK090qKu71CMR7A
	LY01oY0WLKVnq3rDJWup35IsmszHME9mV8bcW8FLUhlEcLQi4aIRh4G79OSo7+sPE9VD
	YFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HfUxk3zfQowBB+4nYj/pqKtXtFSEtgF7PoucgQ8atKw=;
	b=qTiKEFJ1vvhS7jYXB4K3xIlTltJ8GR1EqAJ5Q5rxeRJe31H7eci4uMncRsDyP5DW4N
	yct6drxrwlyEJdneL0u/j4E2gajjXN5r0uz1zC2rjXTBWkxutoDWL7UWhghgV4gbq28m
	d8bztHHx4jB+teC4Py82sSkORdtsZlh1/UOIqNwtzMdp0MHl3zoWyEkXku5QVsJdUoc8
	dVX8mBSKXX8mlcE9xEznGqtyEHG56AhEQ1VCuOzzgVcs9tjeed0IXZc0FOIShoZ3cMl2
	+mJ/jDfka47kqvbUxRFZbgoONpuWlcCE/GWPkRVZd/lUn2nlXh8+5PrMdIBCOCXsv4rA
	rHBQ==
X-Gm-Message-State: AKwxytfHSSgm0+DuXwkPgD4gWGSt3zgquZuKAPcbcnb5z5Sr2sp95ghy
	KsnXf/ttoiqCMzpl5a94IvY=
X-Google-Smtp-Source: AH8x225rnHSMAwAx+yFEhUe3AvWgu2XMTUdY61iCNbkmSmnFIHzh+gmyxk/u/6MhKZO4EQ4wp+JYDQ==
X-Received: by 10.98.134.206 with SMTP id x197mr9202714pfd.82.1517023508174;
	Fri, 26 Jan 2018 19:25:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:30 -0800
Message-Id: <083bef011a3ebac67b4a5d56ec10d8430ab3d6c0.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 30/36] dnsmasq: update SRC_URI for versions 2.69 and earlier
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:07 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Versions 2.16 to 2.69 have now also moved into the archives folder.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit d338d219dfbcbbdd133c7d4364bc8a1b19835e0b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index ef79c5f..4f4bbf1 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -6,8 +6,8 @@ LICENSE = "GPLv2 | GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
-#at least versions 2.15 and prior are moved to the archive folder on the server
-SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
+#at least versions 2.69 and prior are moved to the archive folder on the server
+SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
-- 
2.7.4


