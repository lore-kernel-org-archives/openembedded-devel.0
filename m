Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CB6CD4F4B
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20205.1779006248529603006
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UTA61Ug6;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DuqnwzoF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2WLuP2332280
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KRTZCYxbXoB
	slArcMgLt7BNCtcE7ykAeecJcGKTX/B4=; b=UTA61Ug6zkC25AsmkLxZcIrmoJg
	3oo2Vf+or5EqaSOtHGA26D6WK5LW6u7IhSoULucFjfAcjjk5JadjNk9xwq7FNUuR
	F/LrgFdLBT01fK1CiE4Dka/s9eJEGjuzcWHwrydYwnhvM9/6KbPSkymiTomw7th/
	m8CFGFOtXrldflwYoRXZvGcIPgJWqm7KW4Wrz+bOeRkHiusQMREF+A+9FQRAYyzY
	wibWb33umlthbBR3IDOh2FOnTW0rqt1edJMnp/09AD8nX4qwtW5vAv2Fnh3ohvSX
	kBEg4FvLS7YUZWGbvwaWxZLb4vtyxevyhzRHquWZ4ErHVjnH1MqzXP3BSGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw2g0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso2469956a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006246; x=1779611046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRTZCYxbXoBslArcMgLt7BNCtcE7ykAeecJcGKTX/B4=;
        b=DuqnwzoFUSckw/jJgR63OEBLvFALUxWFqBFFnSncYtFZ3IdoQioyAnALGDeqzjcV+B
         EomZ7GJbBrxZihnCpxKjV4oS+XVnm6sY8pnsbxieCAxTqQrNnIJL3HyOvjC/nOyWbf7j
         so+CEB7+ZquzFoK3O0UPez7tNq6z8JVFsDTKajoHo+6ZCfj8sNrlSwnd+QgehY7dqgeP
         vcyoDVAgZFmefd4xBjO+PZYfsNataC+DQLeIKqeK2dZE73q/WmZhQ/CPj8GIZmq5ZjT5
         taSCx/eEPfCl8+ld+k4KSL7wPhep8ZGt8JC8YMiNOmZlV7Q4pxYJDFuhoVnhs7PSuxby
         xdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006246; x=1779611046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRTZCYxbXoBslArcMgLt7BNCtcE7ykAeecJcGKTX/B4=;
        b=pBy1Sm277aUP3ofpWB/p6Pa5w8kG5ivtgGJBHW67kpJDyYDjWpE4pIMvKGTpQAcgsk
         wJWIvJQRwrjbnxwVh6UFSskgxnQr+KF0jq81tmcMnEB5eq11dyNgWetUhlNRpLYRdDNt
         CUFua5SHKie6TJK29dyC4ywzkcCyfpGf17fv50b/tmvyWWROtxRmhrnVkHZX8FguyXpL
         FCafrKXieTYFYVxZV4lmvFPX7B2eL/pRzyhfX1sudIWdNMZ6q6doBfCW+dbrhQxLccDH
         ciI3dMjQga8Wu9z6vDvfiXiR+gEzeSntHMBJyj+y18x0V2pY2nT45QMwRr0t5/BN74aO
         CAGw==
X-Gm-Message-State: AOJu0YyHrNLpa1t2uhzVZeI8EID939G4K6xp5ecBJ1v6/FAInbfDYo4f
	Bz1YbpsEwclVrUyGsHjGJn9b4MSSLltSFMKIkhWsLHbY+M99tEzve8wntE86qwnZgDWYOesjugT
	sfpHqGrckiiU3HXSTMaCyF4Euk8+UIZgPIMZNcVOL79K0eHSYJWxE++tUcw3NoeUKPz9lDxFKv0
	pNDnHBkUAXUGYumhxAFIxZ8A==
X-Gm-Gg: Acq92OFFnLmuZEV0Y2+dzxozmOc1HzU9AVpp0gLFAo43tcLB8bX1aZZ9mdRRF5KpnW0
	OhHKIHFiutlcQa97TxGn8QV43hh2MLVC3RMv25Q2x8xIN/k5AmoH+k+/Kl2LUoYgUVV542FqsoY
	4jgpOJAl2iupNXSaeEdm+MFM98a2YZH3MNNB3G+rdf7dDi8P7fVkh/YWBtNgik/OWx/oBDAkJUM
	p+Vl3P0Xv7vNYT5HLTjvtilTRLDB7Xoa+yTr9PVxpEY6yxhM24NUD+eUrQNMXjZ5LtDzAcQpl76
	xw4n1ksXdGERN0XsH1Ce3QJZ2dQI4lZ6v6euDdzLa5udGvnTFYH+MS6TcX73fobS+hN49rEUvbv
	80n113R5kIQu8wo435ZgJ3a6d1JOUjjFwJF90igo9jx6Ow6Jyr0A4UAR0CVFyGyI=
X-Received: by 2002:a17:90a:51e6:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-369932a2fa4mr2268337a91.6.1779006246276;
        Sun, 17 May 2026 01:24:06 -0700 (PDT)
X-Received: by 2002:a17:90a:51e6:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-369932a2fa4mr2268325a91.6.1779006245813;
        Sun, 17 May 2026 01:24:05 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:05 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 04/29] vboxguestdrivers: Upgrade to 7.2.8
Date: Sun, 17 May 2026 13:49:32 +0530
Message-ID: <b3a00b397f2311d0f0fff41739ac1a41fa4deef8.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXy75EJ+WJsCS4
 Xg/FW/aitHyIFGYPuCm+PgrSayMsSsPDOyV6zuQgGbNnOpXd/basAv9/P21Jy1D0McS2DjlIUwH
 TumZ9MFSyPXNf1jwjBAZy60iWlTZ01hdeTfdx82DS0FIWv2c7YjqD7X1xfxLnrm9zPpD9TU00x4
 oLoXJ1ZnoFz0SUN2gUinICs8Lx4N/w5TGeqrroIt/sEw6IoeQkQxskbw0+HmEMpBd3qdQ43Erkt
 tp80rIU3zaTtqlXbRp+Q441RpANSP1VAuJRjAqaTPW6K5Ob6KdCT9A3xE5aCiAE4mDIOnXs+7pe
 kc2ZWre1bJCND4oFUgp2NVGzGCR6BoUwEqqP9oByagTPyZYtDbue7XBl5QRAMeNhWhk/CPyN2Po
 r/WYhRazwh3hzdytY5PI7Wq1UwecHfU2P01smNY4JSshRGxSM1qFODmdpT+qm+vWnz/rkN+2k5x
 SVFtBFgQTRyLobBZmJA==
X-Proofpoint-GUID: _GWnX-nYrqaVK_BES4r6udAhHYFN3KQm
X-Proofpoint-ORIG-GUID: _GWnX-nYrqaVK_BES4r6udAhHYFN3KQm
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a097b27 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p2QsaepqAAAA:8
 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=wqv4qcZ2qqd7q738tdcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127017

From: Gianfranco Costamagna <locutusofborg@debian.org>

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fbe399b23017fd9e7ccb26324f9eb6c3e88e6cc4)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../{vboxguestdrivers_7.2.6.bb => vboxguestdrivers_7.2.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.6.bb => vboxguestdrivers_7.2.8.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
index ac941de811..6b6a2f23ff 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
@@ -15,7 +15,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "c58443a0e6fcc7fc7e84c1011a10823b3540c6a2b8f2e27c4d8971272baf09f7"
+SRC_URI[sha256sum] = "0642ed4a12b7204cd30c0abbc2c10c1cc7ad55ce1756a01e86a16d4b6b066592"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.53.0


