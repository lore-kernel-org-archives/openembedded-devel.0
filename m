Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4587FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 14:40:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id g1so2294259wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 06:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NVb0ZxtFKe7WaXOYhRzSW30MapLgttOJHX0TlGu/Mu4=;
	b=UNT2F51cmrjNR/Ka5KksvTJ9VMrfCqoF8tAEynzR/wGTMG/U1smesvGFEedf7CYbB/
	4S58/a/FXRyZUnl+FyIAgHT7V9j5fnxENYZcFBSKuFckP6BxQXb3hwqC7bdG0nHplWte
	I9KD9Pvett/bOeUQrtYAYV0ELfOFlA/7pOvRPrNsfiYCNWTxX5Zw+yAq8ToggEUjFkVe
	8fVh1kzb5jqAQ19NTxMITR5Z0Vv7JdxhkgWGmKTNKwVS1GPlnI1e0Oz2CsPtUN+V2oVx
	ktkAkveL9n9rCuJ3nY5eMnV+GIoGiiiQBQQttQaDNSHKEAsQbvF5oO2WcxCPJCP2q+04
	Sr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NVb0ZxtFKe7WaXOYhRzSW30MapLgttOJHX0TlGu/Mu4=;
	b=uMyrxvHYHzmQU3kJJijigjRthlFoVf4l8MeChCBzWMMXL9oXP1cNOYlyCKf1Z65ml0
	UILGOZovJvfl5MFXJHyr+WLLwjyFYxSOftFbBnYXznlYf+wvAawxnwUfdJPS6p4SEMEm
	vRHuDb7Rgw66r0iQf5L2ZrHa3mqpnC12itchhAUoDZXzsXmMXajG54ZYSj22CV/v2Zla
	MemH1Jmn6C8BbTa1t1wtCPuqEIgYKb160g3xHWKtXldVxtXM7gPy5b9UN3EfAdw0h4Qb
	7wIZ+jQV8QSIOayX7CMHAdRvkkyKzJHbj8qj+I3zw0khpeh90D95BjphpDX1uiR9a208
	LjDw==
X-Gm-Message-State: APjAAAV5B6kTBnZozJ6JZA5XMSjCv19Hw5f/WUeduojDhe/YYvpycbL5
	2Q6ceNr2Hh96iOtWAp6RRZSyVB8o
X-Google-Smtp-Source: APXvYqxYAAEeuqjfw0qvSbEAFiRXGSiQMNF1Rdme0/djbsZ9LP9eHBUTTHNJr8RCUvdI+5ZJgsK4pQ==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr4463267wmk.1.1579963246704;
	Sat, 25 Jan 2020 06:40:46 -0800 (PST)
Received: from localhost.localdomain ([93.68.129.122])
	by smtp.gmail.com with ESMTPSA id
	f1sm10606984wmc.45.2020.01.25.06.40.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 06:40:45 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 15:40:42 +0100
Message-Id: <20200125144043.18259-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 1/2] boinc: update recipe to version 7.16.4
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
X-List-Received-Date: Sat, 25 Jan 2020 14:40:47 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
index 1b0af5549..0780993db 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
@@ -29,7 +29,7 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "a432e1ccbf864f99c7b29a1645de38056915f944"
+SRCREV = "bc3269f77f570ea0ffd31766ed83846ebb043938"
 BRANCH = "client_release/7/${PV}"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-- 
2.17.1


