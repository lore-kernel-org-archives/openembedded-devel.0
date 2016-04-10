Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64812771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y144so16734779wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ihT9Kl1XCkrLRley85CfkEVcq4SQyGB0ZiaWd/j8TNk=;
	b=AWIrNbk+3pvXs4dGIlAo9STAFza3GViaj9bTc3s5koNuc2CpibZB63YbZVusv/118J
	2PGRydEbEqdWz3jilBr9FRE1Ba6yJh0Orvns1n0YLNrh/xO6eBgGmel5C/dsnAx4hFY6
	PYy5U8hs21m4bmd+03wXh2PvjaDp9wRknuPVapTL057kllpio284FXvyTTQz6LYxDlC/
	zSr6zq312ofkFtpQ7WH93KyirO1guvdluBjskm6/sWz7PMpJOIj5bz0VtXduPEPrttpr
	XyBvpgkd68sTIf6x+ZMzrpMWhEbqZbeIa2Ee2SXCG48SS02vg2l9TIYVV4yIbWR+2VE6
	zy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ihT9Kl1XCkrLRley85CfkEVcq4SQyGB0ZiaWd/j8TNk=;
	b=OUv4W36BqLf3afgOrp4qfkvLzIBk90YJ0xF1+lXmVSzmAdqdE5iPqVkkmX+QillKJo
	yQhx4839f9Mt9BWfb5G8uqkJsaQUbV0hNdmDhbXA/nw9BcYvDAxOupJZHCLYmU/NPYrS
	3UX8zqYdVschlxLL5Z8hz3nUUVxu3JmIAELNKfk6Lj8hFlN6JXXfx78iCxShT9P1vEAR
	CUFjTrX8CWkUJr7JrWB/MLROwonDOs5GPUqBZSeNXY36xY6/ZMupQZXvegjdEEzbgUKe
	vCPs9BxQcXai0PbMNWVVzSxA6YKsntcIi+dGxIWIe0n4dlvBvrC/vN+iTRdjGhv5ty6S
	toMg==
X-Gm-Message-State: AD7BkJJHUNyMcmZsd67Egrz1zMj1qXQP4PvJEppDppyoyeF9c8hhLRBQ+zi9AEH2J/2kUw==
X-Received: by 10.28.73.66 with SMTP id w63mr15115700wma.53.1460317308444;
	Sun, 10 Apr 2016 12:41:48 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:01 +0200
Message-Id: <1460317290-4787-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 02/31] qtwayland-native: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b164a67..a094419 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
-- 
2.5.5


