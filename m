Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
	[209.85.161.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7001378DD2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:41 +0000 (UTC)
Received: by mail-yw1-f54.google.com with SMTP id j68-v6so13154570ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CjQ5c5Te5WEjmiBuh79qqlm6Raeekz+8cQOTePymyyQ=;
	b=OMxrkRGdXgx6LOFRVpxyLh7KA9iI+obI8JWaa+Fmn5L1yIpmyd1sJcrZy5cGiMcTqB
	Pl6TELf2XB7DonDjXV9MBHJXDy4kGBYtweankw/ARIqIUjkcT37F+ne2Pqpx6irJWCcW
	g1d0a0SW4q/z13AYxo3uLfMM34Lce7JKgwIwLGSsQ4cCnD5tTn2mAHV6a7fidk1ZOPBx
	n/ZrHaOlGqGPU6+7L2K/pxMxffIi0VNR2f0z+RXIAdufN0DPi7KFgWEVqxplQ7qLq5U7
	h8tbZZQg8nJsirdpIpfPLsN4B8wgnIoplt+M6uIirf3QETkQ9ORmd6lrwParrsULklJE
	I2mA==
X-Gm-Message-State: AOUpUlH3+W9Dg4CUII8MC/JqpRJojyjIyRuZ/6bzZ0oIqybUX346SArr
	CnuY71Q8XDSLhiD198taF6waeLe9
X-Google-Smtp-Source: AA+uWPxSy0YXnr7lEqA9gHnebGxs5ad1gmSZFRq4nCZk9xtXkVeokqwsJQssaGqiFqwmpHASMChJ2A==
X-Received: by 2002:a25:4103:: with SMTP id o3-v6mr8540799yba.48.1534154982039;
	Mon, 13 Aug 2018 03:09:42 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:41 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:27 +0100
Message-Id: <20180813100936.23663-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java] OpenJDK-8 fixes and updates
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series addresses a few OpenJDK-8 issues:

Highlights are:
* compilation on gcc < v7 host compilers was broken
* compilation on gcc v8 (cross) compilers produced non-working binaries
* update  to the latest 8u172b11 release

This series was tested on:
* qemux86-64 (with & without security flags, host gcc 6.3.0, target gcc 8)
* qemuarm64 (with & without security flags, host gcc 4.8.4 & 6.3.0, target gcc 8)
* qemuarm64 (host gcc 7.3.0, target gcc 7.3.0)

Note that yocto's gcc 8 update completely broke qemuarm support, but I'll
hopefully address this by importing the aarch32 openjdk port into this layer.



