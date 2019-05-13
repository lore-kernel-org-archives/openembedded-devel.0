Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDE66B073
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 09:18:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v11so14359897wru.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7D0tmwU2hihV3KnnKfoJiVuOLn2ketbVNzXcZbAhOlE=;
	b=ZMGHsEId0QmfbUWJUcaWlCBhzSG/t90zRxiAz76vKZSXN5Q+HvE7Qg2ETGmXyeWpOO
	CL+AwYJVraaZBNVtePf/iRICYbgQtw2eUyBjbEbPwkds3sudMPiVXabG5wNzJ7icr9gz
	1puVjTjNyuYBjYizfUawSN4CPcij4xv4/uHJYklkO+OAGd0qYjCWbO9ueEcc/vXDPTKP
	uMCHaafouqh8XCzNXwjLl4IWg0a2vANjany0Z0fAnuuehmneMk11lxrEcNjwZJ4hXX9b
	EdIA3n1kc6GromfVaFHxzmq+UnUHVfkOQUJdT2pC8tLW27Qoo51lNHzPSXykgbxLlPyv
	NYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7D0tmwU2hihV3KnnKfoJiVuOLn2ketbVNzXcZbAhOlE=;
	b=Kc99GLk4a5ERx7f6u1WliutqUD8zgNwX4FtKQ4zTnPULfVtdRQx0JTk1iPyxqe/Crm
	hvPK4AlluSNG5UHHLYRQHZSEA5l02JFlWQEHlcJF2RcF52ocvB+JFrEbQzA1sekpktty
	Cek3QiqFG2Ionb8APIdVmGHSCqvDpj9Dt+5YQLI6geKXtZC5lTEc9h8b3FIm/N90aM0E
	5mBx+Q2JWHuaL4v7d5jyuAOvFPp/U5CYzCRtWAwrPx+YIjQ1xIMCcNFmzI3aW+fDwb87
	X21A6CnJ/Mlu/cAQOWqr035tLkF4Cj8zyU6zVtcX/8QVX8eSlbV6Ipcbu1YqeawrDGgU
	r1Kg==
X-Gm-Message-State: APjAAAWPJnXamaVqD1V77+Shyb1aWvHr6fVh9NiCTF+/FQpsSD8qLsGz
	usKbjx8Cukcvw0laPCD1NZl/0b4Ef4c=
X-Google-Smtp-Source: APXvYqy4pKtxZnm4H3c/OcBdW+LhHAic6cOOjwRh5luNt1CYjot0QRIIDrZdTAdDXmaz/mXzccJWTg==
X-Received: by 2002:a5d:67cb:: with SMTP id n11mr16613180wrw.3.1557739097711; 
	Mon, 13 May 2019 02:18:17 -0700 (PDT)
Received: from localhost.localdomain (91-167-84-221.subs.proxad.net.
	[91.167.84.221])
	by smtp.gmail.com with ESMTPSA id l8sm2900177wrw.56.2019.05.13.02.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 02:18:16 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2019 11:17:53 +0200
Message-Id: <20190513091753.24046-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] cannelloni: move from meta-oe to meta-networking
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
X-List-Received-Date: Mon, 13 May 2019 09:18:17 -0000
Content-Transfer-Encoding: 8bit

It has a dependency on lksctp-tools which is available in
meta-networking. Move the recipe to avoid dependency from meta-oe onto
meta-networking.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../recipes-connectivity/cannelloni/cannelloni_git.bb             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/cannelloni/cannelloni_git.bb (100%)

diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
-- 
2.20.1


