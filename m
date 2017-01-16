Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D79071C14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 23:10:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so1795675wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 15:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s1xG2XTO4lb/5yOHCJrV9qUfeECkVDmmw7/WNdOXax8=;
	b=l8/Vs2PfLifaLQJTTFlm9q0U598DXsQk7HHMc9kKOtPpLClmzc+LSMuwDSldY81t+U
	etlCJq7Ucs4MCm3eSUZV0547Roe5InuyScroZP7hmXHvqWxcjCnbSCDmJFGPfAhRBAI7
	I2XCwk8MzpmAt8tpArLqviQvmtV10JRQ1h/bllOmZCZ9eC3QzetjAEDxMy+MuO3SSYJx
	3tQNFDDoTU83ViCGLPNxN2wrqqNUXcNMh1Tsr3NfTsK2zWVFmOFWP8bFW3sN57tOTI4l
	thRzkqwT053AOawUayI39DSAs0Gg2usQHNXXo1nUI0tWvq5UxvPFSHbfIeVcVZiOweT/
	9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s1xG2XTO4lb/5yOHCJrV9qUfeECkVDmmw7/WNdOXax8=;
	b=n5z328oBCXsCRyG/4OH0U7TGReCuigOKRPna6eNICVX7IxjMwCqiP6pVMbeqjlVcBd
	VrfZqJLspn94xvniiJljTKWSFxlfrhJkj9oB2wyV7CgqlAqlqnAFdKjPafhS6t9byjkq
	SMnjWMhu/6wQYhoqWO9XlikazubVpqzelqbUtdkoYrI5KpiFn1KDuEoBoRXDz+MzxOst
	+p4dHVR3YADnsPEwz3D/sRneeo1MuoU7r/fMNbubO4NpIlOS1csmj1geH4gbDLgldsLR
	APfYlKYlsZ71QrJnrFKuRJOZ0DOSe4TNxUa8QVSRgCkA+PlTkI9odtFTWsDQt8y6erSD
	XBVQ==
X-Gm-Message-State: AIkVDXLOXL5M10r1x9t74Cgi0O+R8NpZMrcfe4aXh+YldgFi0coneX6Nu2UPV1PkVEYNJQ==
X-Received: by 10.223.173.43 with SMTP id p40mr24706495wrc.163.1484608242012; 
	Mon, 16 Jan 2017 15:10:42 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	w18sm32073125wme.9.2017.01.16.15.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jan 2017 15:10:41 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jan 2017 00:09:47 +0100
Message-Id: <1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-browser][PATCH 2/2] README: add -s to git send-email example
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
X-List-Received-Date: Mon, 16 Jan 2017 23:10:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prevent missing Signed-off-by lines.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 647404b..effe2f9 100644
--- a/README
+++ b/README
@@ -26,7 +26,7 @@ Maintainers: Eric Bénard <eric@eukrea.com>
              Otavio Salvador <otavio@ossystems.com.br>
 
 When sending single patches, please use something like :
-git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-browser][PATCH'
+git send-email -1 -s --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-browser][PATCH'
 
 TODO
 ----
-- 
2.6.6


