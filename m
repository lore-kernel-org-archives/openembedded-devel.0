Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8690360D67
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 07:37:31 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3451668eei.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 00:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=crEnDH8tAN1yOLaFyfEZsP7V9cLJB2/oOYGuDxwpHdU=;
	b=A1d3x0bG49WZ9zjTXfz+ZZ11fz/XRcRNR6wQ+WcjDUQa9bvmekc02ABied2+EjFxX2
	c3aGtqi3pw1hf4vMCH7tGESxYmoQTkS0ReE7LygA02/2FvJ16rIPlgf/TY5TWQav0drD
	nA2M+TmPnI4CBA9Hp5XA9IVYIsDX32SalkYasOaIELbtuWqe3fN8sMCwHME3p4gWybOC
	j7rG8If5zroX/P77o6T4vts0joaoa9UGQeUR5BHq9SnTOq6QM3LfEheCUsQMv/4XAIml
	8iHes9Mi1ibhHRs21Qeiru8FEuQyx6iLKkT2q1XwNo/FGX1dam6KvvOUhqQHIx8/S/xe
	c0TQ==
X-Gm-Message-State: ALoCoQlZt+rbsRu5WsP+xWmHBcrFjjl6o7dJvqk2QZsuXR+2M0USKQcgPsPMD+yRspjWnYc2f2nU
X-Received: by 10.14.176.193 with SMTP id b41mr45207943eem.55.1398065852623;
	Mon, 21 Apr 2014 00:37:32 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	y51sm101189266eeu.0.2014.04.21.00.37.31 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 21 Apr 2014 00:37:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Apr 2014 09:37:25 +0200
Message-Id: <1398065845-2064-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] dovecot: add libcap dependency
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
X-List-Received-Date: Mon, 21 Apr 2014 07:37:34 -0000

This fixes:
	dovecot/dovecot/latest lost dependency on  libcap

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
index 426e1c5..8528536 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
 SRC_URI[md5sum] = "037e9c9e07d9dbff54dcff09f280fc8c"
 SRC_URI[sha256sum] = "75592483d40dc4f76cc3b41af40caa4be80478946a699d46846d5d03e4d2e09b"
 
-DEPENDS = "openssl xz zlib bzip2"
+DEPENDS = "openssl xz zlib bzip2 libcap"
 
 inherit autotools
 
-- 
1.9.0


