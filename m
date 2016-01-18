Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 19A5571957
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:45:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u188so19332119wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u9gik7bm5Q/Z6ArSKYWaVZxleBAQdzfiwzDIjFkbmuk=;
	b=GREIdkmFH3dNukuI8cbWgL9v5QjD7g/XyR70RH7lwC80L+p/HbDyTq92ts/aacsHcr
	fppY1Npke8mOis5JAP10FsNrWZfSRa6ffzT0UCSLPdvddrhydlC9TL8OtcPunCrWSxF1
	xw2qYkE3lCRpo/zkKQwiUE1tuv9B1SMXeKQ097/LNLHBCm9KWBsbN3GKJfzH7LCtsckW
	PqzWL4HfSncAK9QJ8NUWdRGnTII0+qqDuRM2CuYeGL0FsYgGZe+5Kc+FLT6+D7VuoJhz
	9qfhjF/QRX8GiRsYuU6HcZkYNl72ltfFj29fB8AA940ev7aIDXDVkHLgNyMHxNpXnzE9
	MjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u9gik7bm5Q/Z6ArSKYWaVZxleBAQdzfiwzDIjFkbmuk=;
	b=SVKwSYVyeUEOC8eX0tqR+IDerxFMW17WKjqNqeAkRONMU+ChTqIrki0JmWfvFAvhS5
	1mS6CnC53aAqITpgRlRsWMF6lR01PfybEzL8h8iFV/OU26xgZKg8hVKM5iz4YDDiqix0
	lGMw2E7Yw2pbZzpM4ewfJWY51QJOdnhazgaHx6N7BS8Qap+XKVBR6UOTuLwcSjVWUtXT
	RlkI+qv4YgXwSP0P0RI/6QnydVm6uqeMzN/+yoVboYgWNTuAJmVodb+BaR/htWExxJA/
	KWIyhidj3E/sHBb1EXE0eE09DMLBAtHmnZeZJi0foPtaQvyLgQEsB+/5fe8h0KhwdkVs
	9XMg==
X-Gm-Message-State: AG10YOQ3A53Xo5u7z6eE0oQiWL0KpkvsW/5jJkp9HMiOpn+883LV+1fLjO6Cln+1WbOmQQ==
X-Received: by 10.28.50.193 with SMTP id y184mr16112218wmy.103.1453157101849; 
	Mon, 18 Jan 2016 14:45:01 -0800 (PST)
Received: from wsadrian.local (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	df10sm25734738wjb.44.2016.01.18.14.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 14:45:01 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 23:44:04 +0100
Message-Id: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH v4 0/3] networkmanager: 1.0.6 -> 1.0.10
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
X-List-Received-Date: Mon, 18 Jan 2016 22:45:02 -0000

Hi Martin 
Thank you for applying the patches. The problem was in the header files
of latest NetworkManager. The patch "add patches" contains now one more
patch to address this issue. If you replace just the "add patches" patch
v3 with v4 gnome-panel will build again. The other patches did not change.
Thank you in advance.
Regards Adrian

Adrian Freihofer (2):
  networkmanager: add patches
  networkmanager-openvpn: Update to 1.0.8

Dai Caiyun (1):
  networkmanager: 1.0.6 -> 1.0.10

 ...pn_1.0.6.bb => networkmanager-openvpn_1.0.8.bb} |  4 +-
 ...ilure-to-configure-routes-due-to-wrong-de.patch | 54 ++++++++++++++++++++
 ...-clear-ppp_watch_id-upon-pppd-termination.patch | 29 +++++++++++
 ...date-ip_iface-only-if-IP-interface-exists.patch | 45 +++++++++++++++++
 .../0006-Fix-nm-version-macro-includes.patch       | 58 ++++++++++++++++++++++
 ...rkmanager_1.0.6.bb => networkmanager_1.0.10.bb} | 10 ++--
 6 files changed, 195 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.0.6.bb => networkmanager-openvpn_1.0.8.bb} (83%)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.6.bb => networkmanager_1.0.10.bb} (88%)

-- 
2.5.0


