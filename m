Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 128407F22D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 06:46:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n2so15354473wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ysJgCZVLkeiEM24zhEnAcZC2a4yc3SG14p1vVRnWpL0=;
	b=ghZuLYFS1BuqYMxc4egeORg1j+Ks010OZWxZaqJLimWGkVmUZkiYFgBKCXxDhUMFEr
	PHnQvMSZdgEximJLCJzAzm+MIcFmj4qS1ehAUu8iWoOKcRD7X5znYIKmNREWAeZKLD5f
	PpvEEUlO6WUDpxJsPUCDDdZ1nEjhtqRVuxK9xTbs50MN1BdXhgi2s1RV6f21tLnsArsm
	+K41vDvmwu0fbIJx6vMgT2Bxifo4u7T9LABD+z1ZMKS/CuyRXLxNPwQzQTTQ53XSmJBZ
	w95cSvLssqu/Gf+/Kdu6shVcYp8qcoY48hYUuBMda3N3x6v9WrTZNHLooU3UYaxp+D9x
	axLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ysJgCZVLkeiEM24zhEnAcZC2a4yc3SG14p1vVRnWpL0=;
	b=rXzwYypfFJzi3dIxaMGa9WAFfAlyweXuHw7UEN+aUsHbsMvX3ETsPhosYQwRvtkF2d
	IG+GiuKmngz672i7xHSQkaotF9eQ0wD4I8EFT41F4DNtmJ23ahD5IjAKD25iPvJYoQ1M
	DffLWgK8XM5FHIaU/rf+qruLDnEedizJ6x6ZD+S5WKb0y9U8fPlCWPbLgo/u+a67nSzd
	jZpNyuZvvNoXREB9G575qnjtWmlm5dQBaQ3WoOMnYWotrSFcq1wQD4XMRoBNESodoCmL
	QlbM8lDDZ5iL56xx14HLJmG6kup8FqJxZF6CghKqMfkwspdigN37t/wwEGO7M8S1//nJ
	KtKQ==
X-Gm-Message-State: APjAAAVNJUCazrc1eS98H18DbsxbBuf9cMPd6/+snkx3GZYVs7t2yoMm
	cUCuewNh2y5sPVS3YcLXW0cfb7qn
X-Google-Smtp-Source: APXvYqwl6eO8Lg9bjwhphqNKImTRO/HSd5GReHh6/Y65jpyykdVW7hXH58TFFS2X+9XHmOFzMIKqDQ==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr7534216wmh.116.1567493173156; 
	Mon, 02 Sep 2019 23:46:13 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02A21973D945F5DCDB0D0E.dip0.t-ipconnect.de.
	[2003:f0:7f02:a219:73d9:45f5:dcdb:d0e])
	by smtp.gmail.com with ESMTPSA id
	f143sm9121245wme.40.2019.09.02.23.46.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 23:46:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 08:46:00 +0200
Message-Id: <20190903064603.17637-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH V2 0/3] meta-xfce upgrades
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
X-List-Received-Date: Tue, 03 Sep 2019 06:46:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: imsettings dbus-glib from deps

Andreas Müller (3):
  imsettings: upgrade 1.7.3 -> 1.8.1 and rework recipe
  xfce4-settings: upgrade 4.14.0 -> 4.14.1
  xfce4-screenshooter: upgrade 1.9.5 -> 1.9.6

 ..._1.9.5.bb => xfce4-screenshooter_1.9.6.bb} |  6 ++---
 ...msettings_1.7.3.bb => imsettings_1.8.1.bb} | 22 ++++++++++---------
 ...ngs_4.14.0.bb => xfce4-settings_4.14.1.bb} |  4 ++--
 3 files changed, 17 insertions(+), 15 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.5.bb => xfce4-screenshooter_1.9.6.bb} (76%)
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.3.bb => imsettings_1.8.1.bb} (64%)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.0.bb => xfce4-settings_4.14.1.bb} (89%)

-- 
2.21.0


