Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7460.1795735512266832939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mBC8bKIb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=f2mVYcpF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvrLN1010042
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zGw1JAymUc58fX/tnQquOm0RxLrfKq1uOXn
	FRwqaPNk=; b=mBC8bKIbGGsHNmcMU6p0mNCH3FmjkIjjg5T8s6mXNK96zeGxSgI
	h50GaSdfjO9HOMnJBA/N5IyvZltnlZkxKFCAXGpxJGAhlPR4SpDzee4rVqTvAjhw
	+yJ4hPlHIZACR/ljuLCc6z/FCkSdRnj3hBARzcthsyDE2DSdADRKlEluAXtrAn53
	R4qdqjRmJyMGtbApnuhF9BLZ6oXji2RnxezPU9muRum3+lhOj6W20rmL84pnyIQm
	5Q+Q6ZlPPYoCVuPgh2FUT7F6n9EvLzEvBVrdpM/MhWTm1NmtJv1z8NSvwNNKM9nf
	yXinfq6b2MGoFf6VAfVppdZkOG9TAGsXAGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90yjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:25:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f045e399acso64821155ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 15:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795735511; x=1796340311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zGw1JAymUc58fX/tnQquOm0RxLrfKq1uOXnFRwqaPNk=;
        b=f2mVYcpF2fX/SZnCD/a/jvLYbzHrKJF6KpzW6yHMlDUjSBf2FmPCU2A1TeZsjNl42v
         KVk7Rfj7/Djjbxa4Ze5wWWIPNOmArtC/xvSqe0EEnLlBmDkdsxwpXDswoqCCH7N7z9yM
         bRkpxvtr0sgyj5DUmTcPGCxhRGCDCfqEBe+sHrWT7UpkI86H1GvaTGDjIwjs9Us82NNB
         TFBxT+JX4yz+wQ5mr4EkwRXHXWW5J+cVxABa71Q04hRvvlywyX8TG8uQK25Nll9dmXIA
         cpbP45i1w/q9IQl+flnq8Avxw/NGqgLryTNYgjhT2bGuxq83O6/4YJSy6JW7oDmRQnNb
         49ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735511; x=1796340311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGw1JAymUc58fX/tnQquOm0RxLrfKq1uOXnFRwqaPNk=;
        b=vzWpDFj6XLfwjoxYc1DU5FNrSc3I+tm6sdQAphABE8/ck+0ILTHwK3cP9ldSfufvl0
         G3gYe9BIaIogA9p9VK/9FFuGAMJn0g2AD9wPMm5ddatJGwPlK5KjYVCL7HNU0Y9pfyxK
         UukZwBsjfYoTe12YfHtmghfOk/P1RDmJrZlQdyaUKNxnC8kG8WEexrMFt4QxB4aFlhYA
         Hbo0UP3cxxEjxGt2q3dbA6L7wc0/kDH5rYDUvweA8Lym9CExN6/ky7iuXxwPyA5QpClQ
         NuXrNo+1TvTCeGL5XWiXGVd1vMjG3ClVyMn8mp/hGW/Rdkaxxf/alNKPitAHihw7oEf0
         RU5g==
X-Gm-Message-State: APuU4Z+Yeg8t5w0sja2yBWIS533WDQAdk67L3PS2ey9Q23f4s0TQqYty
	qbilhnFfi97EG5birDveDJoOwEP3NaZvvqAG/KJKdBjXdRgNrxzwVNJi1wkUB0hAGd8ZTjL4bum
	68RtHNCngrLnBO1IxrBL6AGGFxDWSZhgaUVHX7ZFS5qk/mVNlpQir2f2ns2w/RhpqC482s3VhK/
	yjCTH2VADoMP8jpFj0
X-Gm-Gg: AZFdTZe8zcYb4OsiNNhexrrLUrNyKdE0AxeyrHdbqHytOAcBowXC7Jm43tRiTsN4UtF
	QC20uFONwWDAaSDPugVOQE7etoF+1xH8QT8bKFsXtJq5iXy5pwdhtRH2Sy8OWzKy649lm7jMx76
	tVMf6kGLl1acEWCSkxseC13EyIVxqKvrpNDyHhbj73zxB/Uglq7k0x25JTg6KFClYGxLbN10BKM
	30MhLYs9ED8kXIWnbCK3PNDEWDFMTdlquvTOO8TfSeyyYGMm98SGDtvWyu8sKoNcW+XXPjeJeaB
	4249Vmt44PWhVaT//a4Esj4NEce/k4zbci7q24lGPO0UxS6lPEQpVfmXSOptGtypqk6WbKysdsk
	MEx7Y1Qf/h62/XX6NGYjIc+Olb1+R3jh5wEl1mMoB/Ozr2xRT3NCerX+62yKpoHQPoIvmAJL5Cd
	TpK0+PQwqamvbV+02rppU32gGrOOohLxE/zBjUNqmD8Fbkb9QhqhWur1MGVlONCdOMGNHxNEPJS
	HQ3DXatyD82uTQY
X-Received: by 2002:a17:903:228e:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2f03f1cfe41mr229067925ad.18.1795735510559;
        Thu, 26 Nov 2026 15:25:10 -0800 (PST)
X-Received: by 2002:a17:903:228e:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2f03f1cfe41mr229067725ad.18.1795735510038;
        Thu, 26 Nov 2026 15:25:10 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm110310505ad.51.2026.11.26.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:25:09 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] rsyslog: enable journal forwarding to syslog.socket
Date: Thu, 26 Nov 2026 23:24:44 +0000
Message-ID: <20261126232444.2165603-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mA4-ySS6i9g6jXr8Qj-RKTg3xbc_t-G5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MiBTYWx0ZWRfXwniw6PZgSOta
 QD7THd/3JQc0WCZA8kQ3YZixwoXwC5tKyQeDR2NrSyz2qBuIa7TxY6TxQczL2ycXAixBXaCQl0J
 LyoMRFar/2z2oCTeop3Nq6CgRLAgIqeoNUtbVlV+CS3Hi/w1Wg2mV+kQL+5kVqvpl4smnh0qx7J
 vuppAXDC0e6DywWNTXKGEsxHv4ic3ZxxTuiZO/tUodcqTrmbfzlOaqMiV0fRUf9RyBn6/uv/AGq
 wxWYzCGC/nNmSzm54yacUsCjaQI5bTow5sYlhA6aki1j7WkRXXSTjAy/vmw5FJIhnI5FffneZFp
 MjzwVRf59gVCVCCqyZQyF9ZcnbdMnB44H8vbv3jgIBTPqjx0fd14McXQoZxz6peBgD7M4cBsBOQ
 z0RnSeCSLSPYe11WkCUrUdqDTaiChJwo9e0V4MQ8qDXI7413ABaMcaTsLDpxthBRvMqfzF/nja7
 8n7GXeRXMgi3lbzSQfQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b08bfd7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=l1wGsfgFAAAA:8
 a=EUspDBNiAAAA:8 a=VfmqU6mz583qdcKXhToA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=CI21Z8RBj5jRF4K-G4xJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MiBTYWx0ZWRfX1ot2EZ26M8pR
 tbsExt20NeKozwzO3Rrp6m/2jPnVaQF1r6olIqVEj/VMGzLg42XA7wXqieFu5GWluQ7HozxK2TK
 rouYaRm2hAnqkNahZWY1neC3vy9WrZY=
X-Proofpoint-GUID: mA4-ySS6i9g6jXr8Qj-RKTg3xbc_t-G5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133098
Content-Type: text/plain; charset="utf-8"

OE-Core 63d049fc71 ("systemd-conf: stop forwarding journal to syslog by
default") dropped ForwardToSyslog=yes from the default journald
configuration. rsyslog.service requires syslog.socket and imuxsock
listens on /run/systemd/journal/syslog, which journald only feeds when
forwarding is enabled, so rsyslog stopped receiving userspace messages.

Install a journald drop-in enabling it, as OE-Core 6791afe5de did for
sysklogd. Skip it with the imjournal PACKAGECONFIG, where rsyslog reads
the journal itself and forwarding would log every message twice.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/50-rsyslog.conf | 2 ++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb     | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/50-rsyslog.conf

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/50-rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/50-rsyslog.conf
new file mode 100644
index 0000000000..29a7331b3c
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/50-rsyslog.conf
@@ -0,0 +1,2 @@
+[Journal]
+ForwardToSyslog=yes
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
index eb46ef086a..66ff14e746 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
            file://rsyslog.service \
+           file://50-rsyslog.conf \
            file://run-ptest \
            file://0001-tests-disable-the-check-for-inotify.patch \
            file://0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch \
@@ -168,10 +169,15 @@ do_install:append() {
         install -d ${D}${systemd_system_unitdir}
         install -m 644 ${UNPACKDIR}/rsyslog.service ${D}${systemd_system_unitdir}
         sed -i -e "s,@sbindir@,${sbindir},g" ${D}${systemd_system_unitdir}/rsyslog.service
+        # rsyslog.service reads syslog.socket, which journald only feeds
+        # when ForwardToSyslog is enabled. imjournal reads the journal itself.
+        if ${@bb.utils.contains('PACKAGECONFIG', 'imjournal', 'false', 'true', d)}; then
+            install -D -m 0644 ${UNPACKDIR}/50-rsyslog.conf ${D}${systemd_unitdir}/journald.conf.d/50-rsyslog.conf
+        fi
     fi
 }
 
-FILES:${PN} += "${bindir}"
+FILES:${PN} += "${bindir} ${systemd_unitdir}/journald.conf.d/50-rsyslog.conf"
 
 INITSCRIPT_NAME = "syslog"
 INITSCRIPT_PARAMS = "defaults"
-- 
2.43.0

