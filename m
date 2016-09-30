Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AB2436E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 20:22:43 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p138so44758912wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0nxVtAke5NasVgFR54dWWwR9zZ7UOdFladHflD+olos=;
	b=TiZqhUn3tXQqVjaWm5QfHvLFa6h9sibfjcmgD6QkUxSh46+E9+2xCAGhNKaugpmnY1
	wjYj3jL9khE4gP9pybY47vvEsTnH7PgkxiGXFYxZBt+fNrdvRgNvc5Z39ox9+8v8lFEP
	qjv18I62VUbZIiF7dAZwLwS7LPONQwn1JW4VNVxTKnvf849tIvbJyQcxS183Se0dV3FR
	KnIq7jREY4NhPIUmHoxnZ+uZHM4TUOVH7pR8Jf0Oe3fRVxMUCETmcFw3yTttynrZX3k6
	vQsEWCpd2xYYcprgT2juLqYvdfK2EmItXF+Vur6B5M5tFIGF6ORC5YArgIdodkaoGT+A
	do/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0nxVtAke5NasVgFR54dWWwR9zZ7UOdFladHflD+olos=;
	b=UFvqLcUnMlVzsgL7bakSBlRMR5QGxVcQjz0r22o8u3pMMlVTv6C2JjHuK/N9k/wRJ2
	x5ehSGwLccRtSwTTT8qVOWzvUyi9s2p+QP//SuPBq/L2FuIGer+hQXcWtAPhF7GU+9kf
	yyiLydPVFJKaP0Z4YFpr1LvZ0+IfbwZrVjRt7ucpLePCdZZiNgqVyZ5mHHFzn6UnRjrM
	CKB1xfZuIe9seE8JpKr97AOejF1D6WNM7pkHa2a+bjEBmHfaGO3qxXxfb4rVWVz8d+B4
	dy+0av2e6q1FaaHarIrNSCIAU3P9IDQDUht1BoMp04LZR/E/A9V9vz5lIXN6meki1rgC
	xw2g==
X-Gm-Message-State: AA6/9Rm8PMsusn12tSr0CtrQo7SuXbEui+G4amkFFRYlQyJBK7vStyzyit6MAhWQ3GCaAA==
X-Received: by 10.28.230.88 with SMTP id d85mr5781614wmh.52.1475266963905;
	Fri, 30 Sep 2016 13:22:43 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D54.dip0.t-ipconnect.de.
	[79.223.13.84]) by smtp.googlemail.com with ESMTPSA id
	w138sm6111590wmd.1.2016.09.30.13.22.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 13:22:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 22:22:29 +0200
Message-Id: <1475266951-25848-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/2] physfs fixup -> master-next / mpd: enhancement
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
X-List-Received-Date: Fri, 30 Sep 2016 20:22:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andreas Müller (2):
  physfs: fix LICENSE checksum
  mpd: disable automatic start at boot - service is activated on demand
    by socket

 meta-filesystems/recipes-support/physfs/physfs_git.bb     | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.5.5


