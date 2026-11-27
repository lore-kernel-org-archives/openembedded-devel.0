Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.882.1795831135736780539
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 17:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=f+BlehRZ;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A44A42222;
	Sat, 28 Nov 2026 01:52:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795830745;
	b=meWv+WSx1R01TqlPr3gT8yBagmcfkkd3ZOT0f5N26AO1ceFE33rbMRRR+xrHPzcmP7wJ
	 pGmndOkx8YbN20lN6FeM+GfHcNJpr+/WkoZuqXY8G0wyO0OVf4rfTSaDN+aSikfZRPmzR
	 Lyc1++rGIXwNvvSItn1LH81rAKOjK15JE3FFtpAPck7XIUSSaYZqigKCkOb09olC31CZ1
	 h2jAte+ZVplKnWWr2Nb8ZvhguefDlmTLa5OWJckCCW0x9rX26MJ+LkQ7nL9hyawyy0qbT
	 jgLyaKmPOIMPEKjM68NJUbexDVExI6cDLWR8meuCeQsgLKPnQXJcWf33BHLgFrVf7hQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795830745;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YkA3AGg4MJDyAY/cA/njmOk1aKto6i83/mKdB2MCZ9E=;
	b=3t37qXl7tYg8X0TL9a3Fj0yIC5nPo3/iLAIopvb7f9GxzfHab0ZP7vnxrkcjkpa2EQuX
	 KWT8/NIt8LqbaiENFVdDBoW8MniRSVY6NQcWXqoz/+tp52gx0htdumqkEysVuKcUeDB+R
	 CKsMPHbM4m2JnBoJxxTT3Skj3k2bb+Q8QBKA8W0/8NN6p77TIDmnCHWwxMXfJxvVrikRG
	 eLKzrO6mm8ysHdLFzbbp/k0QEVwbygJaj5TXIt3pyG1BfFN1dJZrHV/7PfoM1HwzkeFTJ
	 iGjXguPcijSQldzUYbk1xWI2vmgvbTpy5x7QQWyBJlnsvnX54OEmQ94XzX36BtphFmg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 994241F00898;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795830745;
	bh=YkA3AGg4MJDyAY/cA/njmOk1aKto6i83/mKdB2MCZ9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=f+BlehRZybjq3mgV25hEYVaoMQvpRurd/ZSTy6d2H3i1itisK5mdQAa3+XDeLbK+9
	 /BPE8SNIzH2a19ir6SFXT+V8ThZv2uCx8YQupw8FaFcSVQpEi+2ET/wDjiNf1xQWsV
	 uS0tWhzCsD0kfSoW8vMHqIihuBgkC844cOLFo6Ing/nd4zbSCPxD8Ahh5UUBylyUP+
	 1rvRro2qleoYyAtpB8hSMfdVtGuLNJwhIAXr/uFm7zZ+W+F80HS+3ZrnvLl5fhGgIz
	 yE/Wn2KqByDTb2GiqNdg8gSRhO5LMgDLQ2wdZa8S7JhJKiIO21rbC0v1+pP/sN+hN9
	 UTFQrA+qs90aA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2BCFE4DF0E;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261128-pillow-sg-v1-2-cbcff72e5e81@certik.com>
References: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
In-Reply-To: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 10:05:10 +0000
Subject: [meta-python][scarthgap][PATCH 2/4] python3-pillow: patch CVE-2026-112900
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795830619; l=2776;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=16Rh8FWN4l5+tnO/L2TgvGdspo0bZ/e/VtaB726qM/Y=;
 b=hRs4fAAq0lBqyh0N38dY6ZT+tXB31RA1RIk72oQmBDxLTfuIH9Bgdo0hYuyeB/jF1YUlLrjEd
 y70DdJboBEfCGnKqqH+gOydOwnZGPLD0+dEZVJw8NIuZv5kLbRkk3fJ
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 03:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133391

From: Dickson Wu <dickson.wu@certik.com>

Transform EPS file name to an absolute path before invoking Ghostscript
(#10090).

Upstream commit:
https://github.com/python-pillow/Pillow/commit/a2c363141da31a265dd536c945677db4b64f3ec9

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../python3-pillow/CVE-2026-112900.patch      | 28 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112900.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112900.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112900.patch
new file mode 100644
index 000000000..1d50a3097
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112900.patch
@@ -0,0 +1,28 @@
+From a2c363141da31a265dd536c945677db4b64f3ec9 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Thu, 1 Oct 2026 14:44:00 +1000
+Subject: [PATCH] Transform EPS file name to an absolute path before invoking
+ Ghostscript (#10090)
+
+
+CVE: CVE-2026-112900
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/a2c363141da31a265dd536c945677db4b64f3ec9]
+Backport note: Drop the upstream test change in Tests/test_file_eps.py.
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+diff --git a/src/PIL/EpsImagePlugin.py b/src/PIL/EpsImagePlugin.py
+index 5eaefe339a5..a3336894ada 100644
+--- a/src/PIL/EpsImagePlugin.py
++++ b/src/PIL/EpsImagePlugin.py
+@@ -103,7 +103,10 @@ def Ghostscript(
+ 
+     infile_temp = None
+     if hasattr(fp, "name") and os.path.exists(fp.name):
+-        infile = fp.name
++        # Make the path absolute so that a filename beginning with "-" or "@"
++        # can never be interpreted by Ghostscript's argument parser
++        # as an option or an @-file token
++        infile = os.path.abspath(fp.name)
+     else:
+         in_fd, infile_temp = tempfile.mkstemp()
+         os.close(in_fd)
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 844892f0c..5f228b227 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-59204.patch \
            file://CVE-2026-112393.patch \
            file://CVE-2026-112398_CVE-2026-112403.patch \
+           file://CVE-2026-112900.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 

