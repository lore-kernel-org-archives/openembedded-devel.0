Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B8FCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:36:56 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.web10.4967.1761165408322232648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 13:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=V2ZVpzmw;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AB3BD6A3229
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 20:36:47 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (100-118-36-55.trex-nlb.outbound.svc.cluster.local [100.118.36.55])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 04DFB6A21B3
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 20:36:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761165403; a=rsa-sha256;
	cv=none;
	b=bpbwo6as46R7EX7MeYeC5czFBxxUBvdBMoGxW1NtS9pOaXhxxbOiVxtlSJSXnaxvsx3ff+
	nvG+gFMpukvsynxVcBKWfQYCJXh1dEBKEBX1p96B8PWMHELsE/5yPgTBLvgGyArHyETKKx
	DCiPxbvFZSB7F2zplf048aGcuczneS3rlBEOOXLEQ0OpkClLuoORxVtwgj1cajNq19CwAe
	x/dFp6JzNwkie+bzsyCQOAtqYLrWI/8ySJ51afbn3frT+WEmxVFkeFu4Is1S7vHByhcwhK
	XzGMk+2iKIMc9+yR7o8G5yBYMj/SuvhzGKrRQiYAaJsE25C4YPtpY5DSjmYo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761165403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=svzZjVWPRy9BiF0LNtM3UseyPD6xyMItkpyqoFzy9sk=;
	b=AfvIWrFjSCEeJBkgQ0KMlF9eEH8ILqh+BBwnwPYFUmIWBU46ERk2JAKf2WihfInzVsE8rR
	mzeCOSuDNwjgT1EaXeRL7ktez18Gl/Ysbwr20f0MyrJMkuCTaURv7dneBp2Fij/73tgBX3
	oxX0/wF2Cd9ocdjWrfIFxP9hPzDxxrRYA2l0WhLSzzOjkJQp2fp6k8rv6Br89Ay+8oBrUg
	TXsCm5y4B5NpFbGF+NIMOmzz02ZnQ1WxZNLMU6ABtl76ICl45poahSTdrnyCZezjy/8dNk
	WPqkC7EWdIvpNoM3MclkNaLQrml/HzDC0vSnNzV0U0DaCInjY1TdTEtiVV9dgw==
ARC-Authentication-Results: i=1;
	rspamd-6d88cf848b-44rw8;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Left-Spot: 1e5db2fd022c568f_1761165407555_144873409
X-MC-Loop-Signature: 1761165407555:1969249707
X-MC-Ingress-Time: 1761165407555
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.118.36.55 (trex/7.1.3);
	Wed, 22 Oct 2025 20:36:47 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:df8b:aa61:9538:1b7a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4csLYP1Ph5z3wnb;
	Wed, 22 Oct 2025 20:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761165401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=svzZjVWPRy9BiF0LNtM3UseyPD6xyMItkpyqoFzy9sk=;
	b=V2ZVpzmwGT9cVg2P1MjG0EyzIWUVrVpdk9WkcH2Ef3eVUP3bBFtA/aEoqllDV4LpftwIJF
	yDLC/pxA8mUP8FMi4AGwpCJpdnVt/8FsFtwCKDUYpZs3vxPiQ7Lml/htZ8E3/QtPXhTAxy
	SSyYF2jfgC7VLu7Mv8Xdt5EXUYY7ZIiqRLG6TCRnQi+fDFIaBpVnSVQVM7TtmAVkEVuAtb
	1DiFLIf2IgW5Cz0S4/+/OLbUb74gftFbMzL918YnFm03jFE2PgiCzhJ9TNbGwYAdKSGHE9
	ZoH4P+bfwr7G+63RJC+jyb8mDIwrrYh2H00/k5cvJtnXefFuWO1HtFKQGN4dEw==
From: michael.opdenacker@rootcommit.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [meta-oe][PATCH] iperf3: add missing "libgcc" RDEPENDS
Message-ID: <20251022203617.1488734-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Wed, 22 Oct 2025 20:36:41 +0000 (UTC)
X-CM-Envelope: MS4xfE5hX85sFEsVkknIgRoySI17C4sq9YGJc+kw7yFKTBCT/+3VWiaMyaNTu+5SR4brLYcBImV4F0UcbOWb22sWqCKMiNB+vpidQDgool/KJNhAD13kUmJH +OD1fJlfDiEC3dnzPvlJB8C1/pGBupeATW1c6uXbGlX4xnVE1xR3bnP4rMM74fYuW5yHBGCzPTFQZQrNHX4vX+f+VoFlsiRPSMPkTbgp2d4IA+f0uQHnZGnL Q7wBFa9XA5qamGjzyjC7+b+HvQso265ylCoaBYXynyNPgcX2h8tBV6AVYUs6OrEDIUpDQAZerJYHkgqrbMNi5Jg3IiK7RpgHxz/Yd6QZQoSITE9BlBU4RL60 fADDSxJP
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=68f94059 a=XzW6OEp4kASjoDH3AA+DzQ==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=NEAV23lmAAAA:8 a=Hqg2z-3JD8Yy6xYuSbkA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 20:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120900

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

This fixes an issue observed with iperf3 added to core-image-minimal.
The executable starts fine but at the end of a test, issues this error:

iperf3 -c 172.24.0.1
Connecting to host 172.24.0.1, port 5201
[ 5] local 172.24.0.2 port 55444 connected to 172.24.0.1 port 5201
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-1.00 sec 113 MBytes 945 Mbits/sec 0 396 KBytes
[ 5] 1.00-2.00 sec 112 MBytes 941 Mbits/sec 0 396 KBytes
[ 5] 2.00-3.00 sec 113 MBytes 946 Mbits/sec 0 417 KBytes
[ 5] 3.00-4.00 sec 112 MBytes 937 Mbits/sec 1 417 KBytes
[ 5] 4.00-5.00 sec 113 MBytes 946 Mbits/sec 0 424 KBytes
[ 5] 5.00-6.00 sec 112 MBytes 938 Mbits/sec 0 424 KBytes
[ 5] 6.00-7.00 sec 112 MBytes 943 Mbits/sec 0 428 KBytes
[ 5] 7.00-8.00 sec 112 MBytes 942 Mbits/sec 0 445 KBytes
[ 5] 8.00-9.00 sec 112 MBytes 944 Mbits/sec 0 457 KBytes
libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.18.bb
index 91d266a2d5..a8c74c1b45 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3D=
master;protocol=3Dhttps \
=20
 SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
=20
+RDEPENDS:${PN} =3D "libgcc"
=20
 inherit autotools
=20

