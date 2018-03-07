Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 282E178A2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:38 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i133so427306pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9hcn6X89md89M23GsPoT866mZxZ9UAaglX5TXoO6mn4=;
	b=ZsZ8Z9yQ6J6JaDk8X/T/6vkmwFOAZ1n1uwl6Ut3CFNQ8rmTAlJQ7stZZsnKqGoWnMD
	zPXrjxqYCjBLzhCbLjDrbuu87Gt1OnXqpnIeJgTlmZcEHRoM32V/xsn33W7NKLlLybdE
	9eGRDoVX+XRhpcclBdpxyXBayEYk/EZHKEFKJiM3Sw8lFgFsg+C7r1dJpVER3cuLau1V
	iQ0sQLBGRGWocOW4Mu3sDPjepwWqxwM5srfDzXXmbRB1DP1CtDyhaORlJIsMI/Dd/YAG
	7ayEpinyX/jVALFiI/pJPS55viBU0TRz8qIFPl1tdCvyG5+K8pGPy+jaJC3le4l+ypw6
	qeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9hcn6X89md89M23GsPoT866mZxZ9UAaglX5TXoO6mn4=;
	b=LPn7oI1852PQHZNEGohBIhdrzOoioAxaTXWNcdR8qQelbbAX/C/6uFj8Mngb9/9xIN
	29DzZfmUiWGhLM0OUmONybfZYGQ5U1nDzyARuacX1EzRkw+O4ey9Rn/bhDUnuDuK+PeV
	pwbqidnSKN1HCoPNSDshTjzqODkUlZoMfdlwNZ+F4pvQAYhH/wrZLWi6PrtL8RspXtST
	ceukUK4rXaha2e2SmF0j8+HoPLifoxhog5kNU61dmmxUoefzNns0jjjiQW3jhHGEKzUR
	pq2HfoGap+bMFrgG+uiFwcF040AZ4x8qCciA+gTSMla/Grm74Z9Sn2I84KYR9RsTZ3hL
	XyIg==
X-Gm-Message-State: AElRT7EwML+p6fWe7hA7fSdegSSyLNFvRRmjyjwBOSDQgF0y2h6p9MaJ
	itsMiOK9Tfn4rwKBaB18kuA=
X-Google-Smtp-Source: AG47ELs740hqg8DeFBSJ4FouuvKabtFjq9qTTp+Pp4qC/oWeZ0yzEN78ScTMCPFpqNeDI2WJYVl1TQ==
X-Received: by 10.99.61.204 with SMTP id k195mr4877556pga.312.1520395420627;
	Tue, 06 Mar 2018 20:03:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:15 -0800
Message-Id: <1520395408-19266-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 12/25] libvncserver: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:39 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
index 457d721..38dac06 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
@@ -12,7 +12,9 @@ PACKAGECONFIG[systemd] = ",,systemd"
 
 RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
 
-inherit autotools binconfig pkgconfig
+inherit distro_features_check autotools binconfig pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.tar.gz"
 SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
-- 
2.7.4


