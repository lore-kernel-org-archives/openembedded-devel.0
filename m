Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D07EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 17:12:50 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.541.1689613968086312856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 10:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cold-front.org header.s=mesmtp header.b=EpYK6ZRv;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26, mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C6575C0136;
	Mon, 17 Jul 2023 13:12:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 17 Jul 2023 13:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1689613967; x=1689700367;
	 bh=wvvwAEq0c0MPpnevUi1kAjceB2vtoHKqN7duFDNauWY=; b=EpYK6ZRv4nkZ
	Ufb4TrBOgEV0I0B+R1NbMajsRLocqNTkQx+3B9PsJz2Eegk2WMih1LIY3WMRH9qr
	iJVEhXmNL8cdyLRCcF5bdjsEkYMs+HZ7coMsIHzHRKIxqXV2g2vyy1zTcZ8qgiAQ
	ZMEYZSloZGFTG2paZJGLFYL1pTP8jV4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689613967; x=1689700367; bh=wvvwAEq0c0MPp
	nevUi1kAjceB2vtoHKqN7duFDNauWY=; b=XZaC7WaXSiGOppMYchQNdoINS4bh4
	QFhheyNaGDmDJssxoAf80B6GCk0tw838SQqHhWDmXRHxFzWZvsOryP6bTfbyYyBT
	myhsA2GEUKoTgi2Ua0+Jd7FFAYxoKoWtNLOO/YYB3y/CAfGfb+/GX2xGFNoSVdKs
	x03cbMkETz1XD2iznqAa2K07k2aWnr+//YLIUmrEC8r6vDDeRsRulapAnO02ik9E
	0Icu+r2gNYxzPPNhZVdpM6GaFxWE3utwute5P24B0xz/DtKRcqBdblLiffJOfyIN
	oqVqkuTLLu7EtFa3/SJVmzhf4TZ+1bw4avdi9tWskiV3GqNfxhpR5DUPQ==
X-ME-Sender: <xms:j3a1ZBkMIa5002no7CZlBLeTzCeJQP_nz1lLVYmNqhmOGLSOR_fQTA>
    <xme:j3a1ZM248vHkSD489Sej-Tc1ibTrL9yeMQH3Tfv8E6nijBW2SpiDLGgLMSd5itzQo
    Lmdk20GJxzz-kh0Og>
X-ME-Received: <xmr:j3a1ZHo1vTBEy1qmLkB81-Nl0yPQ87L959EzbctTEFv671zJ3_uo_WX5ZYmLMuZ4SWfArwVtsAI_pCiLMbp6XGK2eRBdlh-_mVFNkkNeDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepudfghfdvkeeuhe
    duudduhfeuieeikeegfeelhffgfeejgeelheejhfeftdelheegnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:j3a1ZBnN9hv6oKROXgDkE80G76hPYFdBpJWEoTxDefPsHZOrm1Zg6g>
    <xmx:j3a1ZP2NqaHITFAfSsgEbw8PHy7niLOtKlBHqtAxNLUIBrU72oMLmg>
    <xmx:j3a1ZAtf5fYN9kk3dBqgvBRvMOkqA6WcIgnHtgqE5I7y0f0jeVWX9w>
    <xmx:j3a1ZM_HiXU-9dQJe3x0bP9cuaMqsbGUpjBS4_QtxN9CAyr3tvLIig>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jul 2023 13:12:47 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-pytest-asyncio: upgrade 0.16.0 -> 0.21.1
Date: Mon, 17 Jul 2023 13:12:37 -0400
Message-ID: <20230717171236.17924-2-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 17:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103888

0.21.1
- Output a proper error message when an invalid asyncio_mode is selected.
- Extend warning message about unclosed event loops with additional
  possible cause. #531
- Previously, some tests reported "skipped" or "xfailed" as a result.
  Now all tests report a "success" result.

0.21.0
- Drop compatibility with pytest 6.1. Pytest-asyncio now depends on
  pytest 7.0 or newer.
- pytest-asyncio cleans up any stale event loops when setting up and
  tearing down the event_loop fixture. This behavior has been deprecated
  and pytest-asyncio emits a DeprecationWarning when tearing down the
  event_loop fixture and current event loop has not been closed.

0.18.2 (22-03-03)
- Fix asyncio auto mode not marking static methods. #295
- Fix a compatibility issue with Hypothesis 6.39.0. #302

0.18.1 (22-02-10)
- Fixes a regression that prevented async fixtures from working in
  synchronous tests.  #286

0.18.0 (22-02-07)
- Raise a warning if @pytest.mark.asyncio is applied to non-async
  function.  #275
- Support parametrized event_loop fixture.  #278

0.17.2 (22-01-17)
- Require typing-extensions on Python<3.8 only.  #269
- Fix a regression in tests collection introduced by 0.17.1, the plugin
  works fine with non-python tests again.  #267

0.17.1 (22-01-16)
- Fixes a bug that prevents async Hypothesis tests from working without
  explicit asyncio marker when --asyncio-mode=auto is set.  #258
- Fixed a bug that closes the default event loop if the loop doesn't
  exist #257
- Added type annotations.

0.17.0 (22-01-13)
- [pytest-asyncio]{.title-ref} no longer alters existing event loop
  policies.  #168, #188
- Drop support for Python 3.6
- Fixed an issue when pytest-asyncio was used in combination with
  [flaky]{.title-ref} or inherited asynchronous Hypothesis tests.  #178
  #231
- Added flaky to test dependencies
- Added unused_udp_port and unused_udp_port_factory fixtures (similar to
  unused_tcp_port and unused_tcp_port_factory counterparts.  #99
- Added the plugin modes: strict, auto, and legacy. See documentation
  for details.  #125
- Correctly process KeyboardInterrupt during async fixture setup phase
  #219

License-Update: whitespace

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-pytest-asyncio_0.16.0.bb      | 14 --------------
 .../python/python3-pytest-asyncio_0.21.1.bb      | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
deleted file mode 100644
index 1dfeab6332..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-SRC_URI[sha256sum] = "7496c5977ce88c34379df64a66459fe395cd05543f0a2f837016e7144391fcfb"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb
new file mode 100644
index 0000000000..c96c0e0801
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
+
+SRC_URI[sha256sum] = "40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    python3-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


