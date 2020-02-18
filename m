Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id C2BFE61341
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:26:08 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 70so10346812pgf.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 21:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=QJ3CoXoVnC7M0lqx+WdnleeNw9j+a21qa1F5cwPKVno=;
	b=TOfdnZhhvbAZ0TLEWRT/FlbXBFZUiKqPlqTYpiQAMSaoxHAkb17QT32brk1dDd3bSu
	gf6iohoUR96OjLh0wJ1aMeUj2MjlB050GPo1UJSV3XaJra0O952bn1Xxo7gVZ8+maCoP
	jBB4VOJs6yj6f2b3RaSGC+PE/TIQ7DG+zIPwrnxbc3YjK7WbTpixkD84lxR6uXrKI4uz
	wXGxPzQ66xWvxxPLJS56Ct3bgJpeGcOTfXBmkUHjSN+7WXb1AiKNvu2KyQOsb+K9Ad/W
	PD7spAdY3mpe39FcDJ1aZ1chEw/L+AsLJ6skLPUm17+IqFSEqxKcK7Tv9dtq5Tt1N4Kc
	F8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QJ3CoXoVnC7M0lqx+WdnleeNw9j+a21qa1F5cwPKVno=;
	b=pSD9KNVxdUigqdmS4A2LdJyawacxeSzU3jRL4bh/JYv5dsSmT5Wd7j7zYVlw2IOmZ/
	JR/ONHao+76iY4EzMnAnuQ+YZ6ZR8rhASjUEvsdsljXebquxhKnhtayg+e76YuH2Y6n2
	PhePRYyA8kX2hF5ArCCEICshIwSRK3iZ8FFNl5l0I4dsVIt91nfRpawsZdzuesbIHrsN
	kpDghSMQkLDmVs0rN16rS7C87I+STOexeu0kiFadaNyk8JiJBC2yGcZ+aABFc7f9sosa
	fEPCLQKEUeYUGDJAX1cXhY0l1EAq0mO3wykUT+pX1/l6y4uzPvuvlCMhi0TxLuqrrNN8
	VTTg==
X-Gm-Message-State: APjAAAVPOiT/VD3u6ozdlrWnLp5aOjvxVo+E3Ur0wnA+ph8jByBzQ8bq
	/53NmRkXi3IkgcwzCYIwyPKjEkjxNk7QxQ==
X-Google-Smtp-Source: APXvYqw01mwORpBgMNny/lfGHf1TWTJz0UYK9owy64E4hsR7BOlkUubbgp28w17htHyITAO0NU5H6w==
X-Received: by 2002:a63:d344:: with SMTP id u4mr194403pgi.153.1582003569636;
	Mon, 17 Feb 2020 21:26:09 -0800 (PST)
Received: from localhost.localdomain (li1441-214.members.linode.com.
	[45.118.134.214])
	by smtp.gmail.com with ESMTPSA id z4sm2214427pfn.42.2020.02.17.21.26.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 21:26:09 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 18 Feb 2020 13:25:40 +0800
Message-Id: <20200218052544.9467-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v1 0/4] eBPF tools: Add recipes
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
X-List-Received-Date: Tue, 18 Feb 2020 05:26:08 -0000

This patch series add recipes for three eBPF tools into OpenEmbedded:
Ply, BCC and bpftrace; BCC is dependent on luajit so also adds a recipe
for luajit 2.1.0-beta3 building.

These tools have been tested with MACHINE=qemuarm64 building.

Leo Yan (2):
  Ply: Add recipe for git version
  luajit: Add luajit 2.1.0-beta3 recipe

Sumit Garg (2):
  BCC: Add build recipe
  bpftrace: Add build recipe

 ...-with-OE-LLVM-cross-compiled-package.patch | 32 +++++++
 meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb    | 37 ++++++++
 ...ith-OE-llvm-clang-cross-compiled-pac.patch | 65 +++++++++++++
 .../bpftrace/bpftrace_0.9.4.bb                | 34 +++++++
 .../recipes-devtools/luajit/luajit_2.1.0.bb   | 92 +++++++++++++++++++
 meta-oe/recipes-devtools/ply/ply_git.bb       | 27 ++++++
 6 files changed, 287 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
 create mode 100644 meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb
 create mode 100644 meta-oe/recipes-devtools/bpftrace/bpftrace/0001-Allow-to-build-with-OE-llvm-clang-cross-compiled-pac.patch
 create mode 100644 meta-oe/recipes-devtools/bpftrace/bpftrace_0.9.4.bb
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.1.0.bb
 create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb

-- 
2.17.1


