Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D37446067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 19:27:14 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id x1so110046107qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=7dcT+6rlmvlXIbVf3mdXPG7EHxHcLQhzBfyEQXJ/1kE=;
	b=AJqDDOBq0lWYl0pZ6bP6zgkaQrFDbISHEBAbdGsaAqw4XdXpuvSd29h4/pSUzXspgx
	+B+jt3NwpC+//cqbw3k6M1umGOnRmvL/6hs3+XV6xjng/RjGKJWi9dgc7DsluSCVePs/
	BJnuN3/nFUdZKhkZBgcTV0YfiCByV0KcJk7/yeCLf1aOG5vWmkUNLZH025R4K/eVnbzr
	Yv+NGuZjRD4gOE/1xplKhuHJqpdIUMGQzRwDwygd190l8dibQ2+xYi8ZOlop/SwK6KFy
	Ju/2qhpIO/tSsRREeEZ76NbliyGAB4IuVNvBKBMD6UbBT5nAm3QqPGlLeZIAq4hF+BcE
	V0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=7dcT+6rlmvlXIbVf3mdXPG7EHxHcLQhzBfyEQXJ/1kE=;
	b=K3P2cmm1sMfXdYfC3e1GodLjAu8GfcXBWExfQx271TQXxjDjnSESr6TuJHXz2BCK5i
	Gg66plf0rVPv7GlNHXeVYvA+bueDO4HkqkTAUtCzQ2STD4w94rKDYgQR1uRDdRC0N/Du
	gzXaHzhDfk8K0y8460dNKzQDziZNNhZpIZKx1xE9eUL8ckHdKrRC5S4JecDqgqjsr1hh
	jnmE52cpEvO9VW2Gnoj8edciI9MtIXla9zSEsEU6o3LQSdMvj0yKyYBs/KPiIWQ8bsNG
	y74Iws7bUXJK6OGNW+XlgDWC5o+wetgm/4Ka+YiE7geNhbEdjVWzTX5Sz2HoqXZ6toUv
	BUgA==
X-Gm-Message-State: AEkoouvEmtv6+5K0/m0nP815sGFnvYw5QiLcTKAsvTTeSmA4FxnnipLZkP8ZAFBJoOz4dw==
X-Received: by 10.55.80.68 with SMTP id e65mr6451984qkb.156.1469215634875;
	Fri, 22 Jul 2016 12:27:14 -0700 (PDT)
Received: from localhost ([177.100.227.79]) by smtp.gmail.com with ESMTPSA id
	j38sm8146498qtj.35.2016.07.22.12.27.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jul 2016 12:27:14 -0700 (PDT)
Message-ID: <57927392.e928c80a.e0984.b806@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Fri, 22 Jul 2016 16:27:08 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Fri, 22 Jul 2016 16:27:08 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.9
Subject: Updates to meta-qt5 (master) in 2016-07-22
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
X-List-Received-Date: Fri, 22 Jul 2016 19:27:15 -0000

Hello,

I pushed following updates:

commit ecf7db0bd5012162d5fff5cb25f9a07a1a6e084a (HEAD -> pending, m/master, m/krogoth, github/master)
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Fri Jul 8 13:56:10 2016 -0300

    qtwayland: Rework recipe to allow PACKAGECONFIG use
    
    The Qt Wayland uses some modules which can be enabled/disabled
    depending on users needs, however this must be deterministic. So we
    now use PACKAGECONFIG to enable/disable those features. Following
    options are available:
    
     - brcm-egl
     - compositor-api
     - drm-egl
     - glx
     - libhybris-egl
     - wayland-egl
     - xcompositor
     - xkb
    
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
    Acked-by: Tom Hochstein <tom.hochstein@nxp.com>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

