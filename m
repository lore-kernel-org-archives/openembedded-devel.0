Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 129A27820E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 18:13:30 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d15so1079048qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=hIUNuUQVm4TGJeGVJEwJl7ryX93h6T3c8O9JD7g0RSA=;
	b=uc43AUecjneZbNW+T+1KB1FyuMGHSB+ZcKU9cFNLYRzTeBBOCMKo/uIU4zB3WtZThy
	poaLLC9hpkd+Xve5zI3BKRsbIz+GPB+Q8TZfRw4jYd2ozrGe1e5Ocm0wORH7lYbsTYCq
	CGJ4ZRtzm3LYTwxNqBBjyd/EXh/NS2a929qVnH604+d94RfndtTlTV3Eb9VMtMLSrgVC
	oHcEwVs4gmWvvtuPiFzL0jwikLWCHQFjVxDBP96yKitsgud893cHBiw20c7uDuCOCDID
	0cGhUv4mYVOlHtyJhXVUed2UvFBPRyd92p2F50i3UcEdbIUemq+zSoa7van+Up0RYXn0
	oDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=hIUNuUQVm4TGJeGVJEwJl7ryX93h6T3c8O9JD7g0RSA=;
	b=J5WBi+hnKmGQMBNGZaY3zz2+H416lD1YhgGPRobiGMT9mo+8C0QmP7DJ2ZzP+gvq3t
	lrrupUx2QFJzG9Yr4iqjLW11MI8R+e7huYI20Scgd34Uk2egRC5zEagIKjKha8GnFwEg
	Pp5+MUq07XT0Vlt4SS6jOZDtcIMttX28FUIJuQxtpAEmaBEHrF3+kHdtKbuQjFQsGBvp
	posHRjjR4ec8cmUzpZR9kTyg0neGsZv7APQQqm4ejhPKTu7w4C+YnbmAkFkWI6CawCNP
	W20dxP7sJbZ+sAaA2Csqh5Z6HKHkVc+ynhSExs0Q2bq1Nwsgi5Vlt8sXEO1QaXSHiEEN
	hgMQ==
X-Gm-Message-State: AHYfb5ioGhIhcLVrj7xBb87sdjEo9B055vh/U0NCUGBUbDXSbuE8gCD9
	EuSiI/Ttg9ftXOIl/e4=
X-Received: by 10.237.62.92 with SMTP id m28mr1977284qtf.235.1503944011883;
	Mon, 28 Aug 2017 11:13:31 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d187sm621072qkg.91.2017.08.28.11.13.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 11:13:31 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2017 15:13:15 -0300
Message-Id: <20170828181315.8179-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] iproute2: Move append to meta-networking layer
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
X-List-Received-Date: Mon, 28 Aug 2017 18:13:31 -0000

meta-openembedded commit eb8994f44a080d9c7fd2c87b6b6935ad0a55eb27 added
iproute2 append to enable tipc PACKAGECONFIG that install libmnl
package. libmnl recipe is in meta-networking layer and this layer
needs to be added to bblayers.conf file to build libmnl. Move
iproute2 append to meta-networking to allow build iproute2 without add
meta-networking layer to bblayers.conf.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-connectivity/iproute2/iproute2_%.bbappend                     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/iproute2/iproute2_%.bbappend (100%)

diff --git a/meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
similarity index 100%
rename from meta-oe/recipes-connectivity/iproute2/iproute2_%.bbappend
rename to meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
-- 
2.11.0


