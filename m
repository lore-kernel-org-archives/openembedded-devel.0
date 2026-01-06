Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA12CC47BE6
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 10:42:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87386.1767696129676628124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 02:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZjvGRFF1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=D1AGiBcr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t49H3295004
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jan 2026 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2K+N7TMbH3GSlSeGgmeOu5YWBB0+LKbsJtk
	azJ0eV2g=; b=ZjvGRFF1VU8mDA5DWUEVRs/0GnCtu0nSh3QweFqvX6LI3OYKTUo
	F57d6+7wnjSJYLYb1uxTNtOLrpGakBiNK8VQyQC5gKXvWjNP8Rxm8ItLnKZhpOnT
	MNvIw075g9GncOAIrv7MzY5ejLpQQHFy7674DAs7DubO3cO5h5w0srZ99v9AEU51
	B3ENZ/or7THd2Y6i/sMgiM4kOE2xKIks7qd9ZcghDgPERJuRjpDlD0vHeU2Uuikh
	2aoGWdZQWpuCeZRzD77N6jtdBGm5CJKJRDXkNasTXj/tROgCq5svLxP+Wg3iKkhw
	LyWWDzhvK8FjdulBqIdC0NM/GQTwGQWQxUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00ny7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 10:42:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso26717075ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696128; x=1768300928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2K+N7TMbH3GSlSeGgmeOu5YWBB0+LKbsJtkazJ0eV2g=;
        b=D1AGiBcrIneQMeBaTLF+GHt/wuadjbZ2XMpkmH/naag8s4GhSN4GalM6QTieOJ0wfu
         1qDRSoJQCn3829tTgnmzihpjKCTX9ww3JQCTmTGn+NWdyeh0zuCSt8miS49jsza6dQ4D
         MDGXEAdc9v98r9CGrKwfGBplLpakDnZoqANmFAnyDuefFZMrneYbnMTI9WWFUWZ9KGTP
         4zJu2TZfAOVsI+QTSSZnXPcY3SkxjJe+n+3t48CLv/auJWECGVTWmXc3UKOBrAzBR9nb
         kVsp5CyKyc8Xdp1b+OxdGeh+AgAMTOeeSZKvS8FRPIZLwTtvTZE6yMONZO9/81AyAVV2
         GSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696128; x=1768300928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K+N7TMbH3GSlSeGgmeOu5YWBB0+LKbsJtkazJ0eV2g=;
        b=ClNq8+wxbJtlGuwkRQ5BHZ38l+wMrTtuvioZgsUIyYqruKNDFRroZX6k//gXvxIHZC
         SFDx7Q8YsGDCFg9BLjNgqrtlS4sLYm1jWY6NleGwMv0QhZOAHpaBv90R+Zu4mX+wdDN2
         bVe5ufHaGBGGzq4oMiBHErb6IoCBLQ28BSibd8KSM7KBE7Z9F+5D5Woca7hcnncn7djl
         3adZNwJJbAtB0jkuxod6C/4KDZY0Gi3OwkZRXU7Z8ei6ZXxPyZuZxNl8bAMlDyVx5wzu
         mNQjaHM6liFur/WXj7aX9VESIZsi5PuDATpZiiWGa9Ty0TIKtmOlwY3jot7AV6C8IUQd
         PYtA==
X-Gm-Message-State: AOJu0Yxi7evuPBQUJBRm1v2TDB6ypoJ9Hny/2rEsewwLK4W+GVpOd9H2
	8MuN9Nr6RT00s2LL1NbgLHEna+p9rJndz2p/l5rTpAOxJZ+WT67sYfxCe1rDBSrHkfwMiYhHUs1
	lDgtnywJxo0/7KT5MO7Yc8D3cTfq3YbyuONx6k6OwY/p6hCIUY5EEoccVn8cy5ZsgVFHQYodml9
	kNtsDu5CsbC4o/uexl
X-Gm-Gg: AY/fxX7r5j3WeGu7oehJrqcvAsoc9ygQ4oZoUVWLVYLi3WzBJn2HWcPdzIN1vB5Ic5D
	a6pK7PHAwElJP4bGYOgdCMB3m4WXp64hhZvZRCSZ8nvUHaFTfEDe9pamlAPri5jMGjrdyl4aoco
	JXa48UWf9Or10C9ud2dSbBPV/f4C833vFDOJOUzIIHc9HzKQN84oJxVf+wji3UAJgsIwqSwbXt5
	igGfYyhW2sT5Utn+osQWQtjEHN9kAVU9wpzk9sazE9d6ra7Ms7a8+ZrcXTrUM0AS4pF7AYkvtCW
	Jp10Oz/9jRHhl4PiJ0VgTh2V4hfUJV3MG9XvhpRBkjg1MUS9iERn/kLfiU33OQHs1MOikAieqaF
	cirHswWjr/juIVDqiunX4mFc1a9a3u4nKujtSthTgobcY4pwS
X-Received: by 2002:a17:902:d547:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a3e2da7892mr26034255ad.24.1767696128390;
        Tue, 06 Jan 2026 02:42:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFECPOStjm4gSaWKIZVO/SjFbUAnL3IT9KGP2I0ZNHDT/dkjlerINRjvIo83DzIr2SRJILRRg==
X-Received: by 2002:a17:902:d547:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a3e2da7892mr26034015ad.24.1767696127887;
        Tue, 06 Jan 2026 02:42:07 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd469dsm19102145ad.94.2026.01.06.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:42:07 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 1/2] libqmi: upgrade 1.34.0 -> 1.38.0
Date: Tue,  6 Jan 2026 16:11:50 +0530
Message-Id: <20260106104151.2027936-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MSBTYWx0ZWRfXzGFc6iw6Yiju
 nTwXzfXmoSzfaUZjMHsSlHQBqPHLfaYqLKc4qj7gEm7v3iw3UP8HVrTB7fz6V/REktTmGU5H+s5
 pEFUHCKqqst8kGDGb+a98qYjwJbzCKXd8Qx1YXqVIo9Z1FDD39hdmvB2POefVeNtBrAbQEL9tzX
 WnT8H20a6Rpc4l0IW/LSE+U5uxpVHfeaFCmO7lxJHg4cpTowCWqOBl32knxmuLfGjnA4tLHHzwS
 aSRDZFvME8L9xXReMTs8YwNXVA6B/bVE5OHU7JFAmkIdxjFknGJQgRhtF1APIW0Nlw7uKTgbC2d
 sqxVPrere6eYikLIuX3GHUq8uALVk7jSHGx4o/ETwboX54t1YXTIZVGCicMRxReoivroG5lpBPC
 nWKeHVQxZthITNIku9T/jERGTxmjhDXryQyDCi87sMej1iOKr/qpCGEM8LpCduZctVWI7OqSxln
 2/suKKl6avBi3094kbQ==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695ce701 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QFtB4FFVfBaHzDooPqsA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: zJA4R4TdVVL8HzSJlYCzUJLjtAYY0kBA
X-Proofpoint-GUID: zJA4R4TdVVL8HzSJlYCzUJLjtAYY0kBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123176

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-38/NEWS

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../libqmi/{libqmi_1.34.0.bb => libqmi_1.38.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.34.0.bb => libqmi_1.38.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
index 8dc7ec3773..6bd02a2d54 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "3f07d6e5b4677558543b3b4484ea88ad92257e92"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-34"
+SRCREV = "e3d79ed3f7fdc6a7fa8b374860b1c23a8f172812"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-38"
 
 
 PACKAGECONFIG ??= "udev mbim"

