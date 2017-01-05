Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E507C71A6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 11:05:32 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c85so244013620wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=cx2OZjKca9ST/AsWi+VIaKpkp+LA7evhgN6gyuUVqq0=;
	b=Pc4AQWYs/JL/Rm1XtmcNQY9fU14FxtGkipldkLpvHocCaZ3PPsMrz7aShU2hPn8XYp
	OMV/h4HvZDXMIEnW887AzgZg2+5/aFvxINXnnPQQD0DUQ1pFt0C2ecWCL7P5JB0R5yWC
	//3rt9w+Na3xBt8pjdYb7wH4plurf1z7UDX0jl4q36ERHreQbdSC5TDC6ZeVwn+gdrjG
	c3GGklZQl6PnC7+98B8RuRyV5XiMUx9Jlzh01ZUXsmIYl8kRrZa+UEQGColyJ11C6oWJ
	c92zf2WCneS1gU7WW7cOaFEenuy71cIXnQmKGEJDNJzMyn4lHDabDWTWl/3aJM3p2hrh
	3JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cx2OZjKca9ST/AsWi+VIaKpkp+LA7evhgN6gyuUVqq0=;
	b=fTrhCkMsTcbIoZkIzCmdg+EfjFCHDyJwx/vwKGSraXyD0/+nLkfy329DFBHMFeRIWm
	K0y9jevb4tuc+lzMuKR+f6cq6idCje4xXllAyKpghw7o9Jv0OI6PIMbceT6NpZY2NG8V
	KDR/peohoWQlM826zhf9JnUZJ1tOxHBHF/UVv+eYrz58Zx2AApWupeoX5O+cV35VrJLf
	GkyFiamdtkgz5ivcISDzaJSiKH0HAj0xYA84BndsbUun6R6Lel95fd7Qjvpxvj1ifdv6
	j//30mvOpOPIyLei4sunbuG98JwTgyVJ2hiH9GU/cFTGNmszydVwAPaPTs7iB9pHckt9
	Ijkw==
X-Gm-Message-State: AIkVDXLd59WTc93QZaI01NfRYzfeOe+LQZu6ogkpYYlMDTS4yL4HkNfQdYTGtqf3HzQQRQ==
X-Received: by 10.28.174.76 with SMTP id x73mr64760777wme.25.1483614332560;
	Thu, 05 Jan 2017 03:05:32 -0800 (PST)
Received: from piotr-ideapad.elnet (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	w18sm99851787wme.9.2017.01.05.03.05.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 03:05:32 -0800 (PST)
From: Piotr Lewicki <piotr.lewicki@elfin.de>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu,  5 Jan 2017 12:05:25 +0100
Message-Id: <1483614326-25468-1-git-send-email-piotr.lewicki@elfin.de>
X-Mailer: git-send-email 2.7.4
Subject: [OE-core][morty][PATCH 0/1] Fix building apache2 on morty branch
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
X-List-Received-Date: Thu, 05 Jan 2017 11:05:33 -0000

Patch from master that fixes building of apache2 on morty.

Derek Straka (1):
  apache2: always use the archive.apache.org to ensure older releases
    are always available

 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


