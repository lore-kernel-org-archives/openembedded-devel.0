Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 29EA173172
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:54:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so2070044wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NMxy+uczKSuHGaE5Rr4SO1xjSbHTj9aQke5naroj1hc=;
	b=aGyrOKYb+9kJ98YrjOO7NKhW0qQuTdJwxWaAcwEulmUo+l2L7uvOK7rO59jjBxvYCU
	sdivqbEOOdCXS/84pYzWjEDcN02pcYiTQzT7hQylU5KH4Kbo+qut7r47bFSWX53FrShm
	XfbhFfYHDDCxkfNBooB60Dfew6LMrgZlVie5BTUYx896yXBROu17LbdkwEzmrpGWPt7O
	dJFcstU/RopRWhgnEpweRVgPkI7gKv4DJ3rBIsZfNa92mm/qLWiLILBurY5b02xBO3Uv
	SfrL2C+ntlbLRKnAwkEmvPid/m4STopdl8T1UHMCVYiv4ZPZY38teyEEdk7mDjvvKCKH
	P1Jw==
X-Gm-Message-State: ALyK8tL0SZiTeKsTJVfn08OEBzwi2WSE04k1ezt6TpwAJZpk0+ZbJ6wa0mkKjbiZKmV5fw==
X-Received: by 10.28.191.193 with SMTP id o62mr37854223wmi.64.1468587275561;
	Fri, 15 Jul 2016 05:54:35 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id z18sm398277wmz.6.2016.07.15.05.54.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 05:54:34 -0700 (PDT)
From: git@andred.net
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:54:32 +0100
Message-Id: <1468587272-18225-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] contrib: add MIPS_INSTRUCTION_SET
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
X-List-Received-Date: Fri, 15 Jul 2016 12:54:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

which is similar to ARM_INSTRUCTION_SET, hence we place
it nearby.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 contrib/oe-stylize.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index db8a363..ba4b87a 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -102,6 +102,7 @@ OE_vars = [
     'AR',
     'ARCH',
     'ARM_INSTRUCTION_SET',
+    'MIPS_INSTRUCTION_SET',
     'ARM_MUTEX',
     'ART_CONFIG',
     'B',
-- 
2.8.1


