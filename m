Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48068.1795411908196263489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MnNwJRyV;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38587f3de36so3516835eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411908; x=1796016708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iA3eKwO0y6yy3mQi9ieyF+m8BmDptM2+d+vqaEYO33M=;
        b=MnNwJRyVU+HGtQoxLo6u217cjrSGRu1/cL6kNbnxaPP29mTx6+hMFltzjdeMAXcpuE
         hmQSZrMo44b9FQVKjhU/iAJPm0SZ4z08HcmhnqWodjwdlwEy5xhqmGqsK45ZqZwZwj28
         LffevrkZ/q9/ry8lv/A6NgJMUzohIXZuRkKvue6bY4Tb7foU8CobiRki/zjk8piPQ1Bw
         +RyCSSXPg98JST/Hxxzamtz2NVqt9EJlAwsR7IthfjOwcv3qHLsdfKsys91j5ZxUEbJZ
         6NZAQJbpokpZfqCbBvU74stjNcYAi78tpainZG3NzUgv+cJctmnJ+N9HKfc3kdAbofqW
         j7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411908; x=1796016708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iA3eKwO0y6yy3mQi9ieyF+m8BmDptM2+d+vqaEYO33M=;
        b=091nuoUF9P0YolxdHoUdaRI7AJefGjARWF/kRE4c6JAT1e9/ifle9RMetV9HHVGIVY
         llN0IsBnqRXHtZONpfYNs3VIOsfUolZow8GlaqWlw983lrmIW05Bz+/0rZK433RmLpWX
         iFfvvpNQTzXbUUpLjwrvLr1GCsgdp49GEbQWKdrrpTcgWvqd17AdiQQsAA3r4nPA7eBT
         dWDhdX2JSOxBeV2Pbfj/78pDFhSC+ymK2O7aSJzDlbWmttGb67DoGvP1nEoTXVJkjr9p
         RcCNnoXuo0BZjE7uU+KeKXjfq1cn/g+x2aTVHU/OGEk+pyOxFBXXy7jlUDmLYvA8DfN4
         ymIQ==
X-Gm-Message-State: APuU4Z/kgr6wsrgU/upVPS03iv46WEJ8wqqJOb4//2Cp/P9tmAsLxezu
	xd7CYjha1slbRsQO6OjzStFBjI08kWN/QYfYPolO781V4mWoPYdpCKBbaTrXQUVqmxU=
X-Gm-Gg: AZFdTZcSc/zMC+bgLfvPnON4f9BeRA/GilMX131G0+muLUbcp5akjLfLIwcGjDpAgN8
	CNbWtUMRSMWPVYyRKc0VRmZsQVsRPGeU0v+N8peBtBH63jIaipknkQNE7yCCBJmfK8FqGIRcKj9
	OD4LkgzQBiMTNKFtWUd+Dh1I0KPK2Wi94xaF05WHknFF9TDYYFLbx+9Z4zL3wBHLDFYaCG4aaGA
	wJo60c3YRf+5jgAyIsttHx89QLvX6zuHp0FWY1Fyqe/p/+6oPW/PkKTeJw4ImdCPeo0s89W7aUs
	RhnCzaBOu+DAqq3F6yfOhKsvaXjzRUhqspt+kUl5LMPWlWVlNrVdlTUbx+a34JhB/CZgEPU2qfH
	SM7LXbjYg6ZQ7r9IrxjdMzTVfyFLdLd0eG5Sfegdl36TcT2/0kptWWbas3PpX5DVXa2hc+iaxAR
	WChQwNHa3nPiKdROShFYSZvhWPBS8oBK5t4vmlv8nB2VP6t/2tIXXY1+MlVHFVFmczqQy9teDN/
	ZWZlApFqeo4qjbxM7CfpWLz771WNqW4qUiLSvj2ZUl2PNE55XP0F50GSEhxDzjMKPhCzVsBGunU
	NlQeQIHjyYtfdDA7S6II2B8/uJwrbpRbsJEoAk9Xb6yKwSuKsVmfJzCDFYhB7jKA45kIcRUeFG4
	zuczJ09ML7Cr8gM76myNLlYSd0fJ6gyr0a24G54ThDMUtE2sWPIRCYH4QJGCQrlBVZzb5qry1rR
	Bbg8/CDk3qdegpQqjUiR12Qtf73jwaQTRMYI17Ohx9ZrexZFIX/NXmteopwHxH+UGC7DIKYM2uM
	KSTo1DFF0rGcaOT1uY/B7wbcLPevqYy6wowyDma7Y1VrUiKzxG8rGm7vmqlXUasMjm3kwPUgOVG
	pSUN
X-Received: by 2002:a05:693c:65c1:b0:386:9cae:abef with SMTP id 5a478bee46e88-3869caeeec6mr7030706eec.36.1795411907452;
        Sun, 22 Nov 2026 21:31:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 0/3] netdata, swagger-ui and xdebug upgrades
Date: Sun, 22 Nov 2026 21:29:47 -0800
Message-ID: <20261123052953.3658549-91-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132878
Content-Type: text/plain; charset="utf-8"

Upgrade netdata, swagger-ui and xdebug. netdata 2.13.0 replaced
BUILD_FOR_PACKAGING with NETDATA_PACKAGE_KIND and adds Go based plugins, now
tied to the go PACKAGECONFIG. xdebug 3.6.0alpha1 is needed for PHP 8.6 in the
meta-oe series.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (3):
  netdata: upgrade 2.12.3 -> 2.13.0
  swagger-ui: upgrade 5.35.0 -> 5.35.1
  xdebug: upgrade 3.5.3 -> 3.6.0alpha1

 ...gger-ui_5.35.0.bb => swagger-ui_5.35.1.bb} |  2 +-
 ...{xdebug_3.5.3.bb => xdebug_3.6.0alpha1.bb} | 10 ++-
 ...ot-hardcode-systemd-unit-directories.patch | 30 +++----
 ...-configure-command-line-in-the-binar.patch | 16 ++--
 ...low-using-a-local-SQLite-source-tree.patch | 85 -------------------
 .../{netdata_2.12.3.bb => netdata_2.13.0.bb}  |  9 +-
 6 files changed, 35 insertions(+), 117 deletions(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.35.0.bb => swagger-ui_5.35.1.bb} (94%)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.3.bb => xdebug_3.6.0alpha1.bb} (76%)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_2.12.3.bb => netdata_2.13.0.bb} (94%)

