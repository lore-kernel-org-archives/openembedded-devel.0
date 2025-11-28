Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409C7D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:55:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16369.1764338129437604151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=apCN7T+p;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eGBTZKa3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8ONsv3967509
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 13:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WRT0jFY/iyTvosJUoiZJ67ueJXC6kJCiBN3
	dAjedXh8=; b=apCN7T+pG6Agch4++bPzMzR0uUhkd0z6fR8vvKEr3Nr+MsCr4oB
	233NQ1k582g8fJXVQSoxGMlDjNMNlaBUuVKy6rDgjEiJEn9mS105wq9yuKz86afl
	TjrAwZENAuYYmM/Qk6DehkLqCaDSkxRHAGYEe9tkpAktqbDv1e3MIdAhdH174rZR
	f/3jdnEHOK6XpkAmcl71gGEBPB2t1MP1uIyaPAoCAN6aPtrSWoiPfoulpzaeVsrf
	coLWPB5e0F3m1IeQTQO+CDQGv2rQ3rbnErUMK0cK0Rnzo/2FjPwPLghsJ8d1S5Xt
	s+EY5SbU84n+acEYVvUm/NACXrArxDRSsgg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5kqs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 13:55:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297fbfb4e53so29856765ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764338127; x=1764942927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRT0jFY/iyTvosJUoiZJ67ueJXC6kJCiBN3dAjedXh8=;
        b=eGBTZKa3+XdnJcM2wyKydgoakwJsYYlTwJvuGvm/Dy7srJCsR3ierkiI9+abuzYKLo
         3PlNOn1HskgC0bGoo4NunmfPtn3J+nwhxLaTzhI3hJfHQTJsSKBEfYV49ds51pAFKZOg
         1WN5fN50syg/oeGSXzk1uMdgD8HYBBOqTfJB3JWWVZE7T4HUZrZ2wvfGj0YIoWYZmeCG
         K4+YmBTGDrOfA8MSTYu1hKkf1gz6eymWxBOQTSFLuYd/2go5PSRvcs0ZlyZT3uGmSgoG
         WM+fpnIohEJVTEqYbKOKzqyOwGfL3HkZ9Jcs2KndA67i3KUmh1jp78QYVoZc8BXz4GmI
         hQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764338127; x=1764942927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRT0jFY/iyTvosJUoiZJ67ueJXC6kJCiBN3dAjedXh8=;
        b=sy9QNeleyAcOwWowqOM8r7n/93Q1WaIy/+h6hJMRkfYzI3LoOalKq9SRDtD2Q7c1zl
         rxU//3jjVj76nZH7KwaIin8Zrf2SDHtlVQQng2xLsCiGOPY750SN0bZ7N722IKPkhjYS
         OLBxre04janZcW71kLIgbiqJQjkcadNHkf5id6Cv1KNQnvfvDezjeGcp+mvQ2FeGH9yx
         DBhDi7rZzapUVuNyMaMsHLQ5un4fBE59WpMEpYhWcxnH011EG4E6a/nDD/NXwb+w02gI
         aLlKfI7Xx3Glc/7f+Dq/y4p+cHKPj6Un5XqIHXvbKvfZ+KQVA4jzdjzaVkeozF63jrwL
         Ex5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8ChpMCDihvUGoVrP3dbfMi4MEj86RI6UzF+6zcxwiCrJx0kMTKyqOEmm97jKxhotdRtLUtPya8vGL7ifqGO+p9gs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEOSbv8HwzOJlKbDonO0I7ZqOpFYmH+4zQ8K6C/E7gtDL7vGnI
	Of4MxcmHne/PfYMdFkUFzfXjFNFWzjkB9BZjwGYpZTkSmwZ9cy38QBU2CWix6Aajcv46pa+ai3w
	MZuEKFq4/ujhWmr+lO87H5X0x9TmYHePwJcWBh25W7UtPq1JuDLHT2yR+tdaDr5F2It4OROD/F3
	7jJV+Set2B0IF+BxVYngc=
X-Gm-Gg: ASbGnctXWsH/piZ+Z33uczCIj5Nulom33cdJKQgCuezTPo2I8bBhrcbm69HHKt0EH5n
	4Z3IWFMHpUn6oJ6smkFDiV9oZpcFSRz8/jTyuSQYEEYQDuQwnrYt56Rb5BwJ+//gcfoBZVBsU82
	8XViPLvhSlHDcCpY+yXHRhx/dPsdKdoKAAaZJki8TBXO/ptBsEQXr8YqWvGbsaDlxErD+5nRJCK
	Ti/bhelmSWJEktTExJvu03pCaKaNk18FighWxl8Cfewx8HBF1hrbKEammI0tLSWLlWa8TTRp2OW
	VIm5ZHBj96vvdRV9qE4mah/Kd2LsEAwHx0nBAERS2IaYJ4PyUMQYFzLWpX7C9uxzLWYap8p06ES
	9F1ppAuiubeY9YpzrGtHEF9DaUxdWJgg+Z585WIFA
X-Received: by 2002:a17:902:fc4f:b0:29b:ab3c:83a3 with SMTP id d9443c01a7336-29bab3c8498mr156849705ad.5.1764338127133;
        Fri, 28 Nov 2025 05:55:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfxBdyci/rtGucK7XDRORxFA8+9kcMHBvuL6/P99GDqFHp+zvA1Fm43yIegvngBy9evzr/+Q==
X-Received: by 2002:a17:902:fc4f:b0:29b:ab3c:83a3 with SMTP id d9443c01a7336-29bab3c8498mr156849385ad.5.1764338126633;
        Fri, 28 Nov 2025 05:55:26 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27653sm47904645ad.50.2025.11.28.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 05:55:26 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/9] Scarthgap pull request
Date: Fri, 28 Nov 2025 19:24:51 +0530
Message-ID: <cover.1764335008.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ADNXb2pzJY-fmy4QS-YWkSFwRnOfXVdz
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=6929a9d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=OLWh0nUl10lSuYdzPQAA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwMSBTYWx0ZWRfX4Oa0pXqWb09L
 BRSJlq+LqTAH19CXJ+9EfIPzRoGlkQTo4SmX0ZHae6aY7RmfcFBxM0f8VXZCX84hahEMbXWbDe4
 hnWsPFbJXbi/yHqynPmWV1Z9GWhXaTZE3FuKVCw5J5LGJ0YPSs9LljPilsGmjcy6zsENSyxjpYm
 1kNa83EIfcFoJxIi7PRDpGqGGOLeQl8pecFqFK3qGLiSNTICZdKkOB+hf59He9RGQ7W7tIXGyAK
 boe3Txr9KIGmieN1fF6Ws74FwuZHcNAzYCQSlU+ExbkG1FKuw+gpuBUc5PAx33P4IjY/gUhl+jD
 vKsy8sLgb/jKmRckmze/NkCEFRq4wcjU2ktaavmzjC9cHOz+u9G/hn7qoj3iZDMGd5NLUzz3hZ4
 /Q6JZ8lGL3R96mUquVXLW5CpKwvV2g==
X-Proofpoint-GUID: ADNXb2pzJY-fmy4QS-YWkSFwRnOfXVdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 13:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122122

Please merge these changes for scarthgap. Tested on AB and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1130

The following changes since commit b79cf94b4d53d75ddc4b4f468c1b1ad42a3fffe2:

  grilo: fix buildpaths QA error (2025-11-19 16:56:37 +0530)

are available in the Git repository at:

  https://github.com/anujm1/meta-openembedded anujm/scarthgap
  https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap

Gyorgy Sarvari (1):
  cockpit: set correct CVE_PRODUCT

Gyorgy Sarvari via lists.openembedded.org (1):
  links: set CVE_PRODUCT

Hugo SIMELIERE (2):
  libwebsockets: fix CVE-2025-11677
  libwebsockets: fix CVE-2025-11678

Khem Raj (1):
  ot-br-posix: Define config files explicitly

Pavel Zhukov (1):
  fbida: Require opengl feature for pdf only

Peter Marko (1):
  uw-imap: patch CVE-2018-19518

Yoann Congal (1):
  zfs: fix host-related reproducibility

Zhang Peng (1):
  frr: fix CVE-2024-55553

 .../recipes-filesystems/zfs/zfs_2.2.2.bb      |   6 +
 .../openthread/ot-br-posix_git.bb             |   2 +
 .../frr/frr/CVE-2024-55553.patch              | 253 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
 .../libwebsockets/CVE-2025-11677.patch        | 161 +++++++++++
 .../libwebsockets/CVE-2025-11678.patch        | 128 +++++++++
 .../libwebsockets/libwebsockets_4.3.3.bb      |   5 +-
 .../uw-imap/uw-imap/CVE-2018-19518.patch      |  24 ++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
 meta-oe/recipes-graphics/fbida/fbida_git.bb   |   2 +-
 meta-oe/recipes-support/links/links.inc       |   2 +
 .../recipes-webadmin/cockpit/cockpit_304.bb   |   2 +
 12 files changed, 585 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch

-- 
2.52.0


