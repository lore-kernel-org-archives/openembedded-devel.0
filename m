Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DCACDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:43:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39534.1782121412173291630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 02:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GHfVld/d;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NY5r+9dK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59TmF3850866
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 09:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XexM6m/EiJ9iC4ZUjN408CJugaYPSy8J0mH
	UFTjM7E0=; b=GHfVld/dHHBAbSGVtCKfuOhYhhgEF790xcByDZuoOpo/bJHYqFa
	pInKDy8/k7HgKGj+uZYh3HIjxHxDN5Rg2BXiPo8b+g3Tg1lEf0emN7sIttzifJwA
	qANUztM/1HVf4cYVzXLlT7j2JiE8QvxsR4PvPKClwC0TNxrVNCVgFfVyJicl5slD
	Q13cemUwyI7vJMTTcqyywcTUoB3kGMA22jb7qDHVPxpL8EgTx6Xj0nCMljjNoH27
	et/WfZV1Oabm2r1GwihlkDqf8NHQHOE9goIXKhnGCLwo3wDm7xFbprBDZR8rDyxY
	BVk6Hg7X5f7411nx1jBVT1EGD//Mte/91Cw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm585ptt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 09:43:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so4730872a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782121411; x=1782726211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XexM6m/EiJ9iC4ZUjN408CJugaYPSy8J0mHUFTjM7E0=;
        b=NY5r+9dKKtyBul4Qljte04fEMCGvnuBV0u3YFjXt1k6yhOzxfb8iVAdQ7P38JJc5Fk
         9AJlAMtObfMn30bXdQsQ0WTC6TJWDTAUCCbMbPnMNsQwnJ6f1IKkMhwIgTRNG8pc0RxI
         n4ohDzxIIUy6Q/s46l/C4kK6JV84eQyqFJw/nfaesHErOC+xQLn49qegQF+29lr+snqv
         Ew44S2C8XjwaGNZHFdOjM64F9AGvVQH+v5H+ExPd43Oza2SmX/t4gmbJo77SdXMPMXlB
         mLN30nRLcORQbs741qQ6raO/dMK6aMFYdkec6yZg0YriuNQwpsqFTBmfSNf53J+gydXk
         ArTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121411; x=1782726211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XexM6m/EiJ9iC4ZUjN408CJugaYPSy8J0mHUFTjM7E0=;
        b=XgJfxxzzYW7DhThr1OgC+KwNymmx54F/R9aGKJK5JHjxPJmhCwfFioWHf1Tin/XiPb
         s1S0mlDVFUtUt8mNg+Nm/Th3lQGGB3CnPaYNoVoJ+tCepio4JFm025R83BRa8/Ly/lZA
         IryNU8KFr0j2jfSURgul8AzogoIKSZgyOqYya9DQ83Jk4VZAffMd7PMG1EMl0Gd1XAHm
         IkBSeP4t4YZ7kVl0bPETOLanGNyXwrApRLoM7xlOqeEP+2Hc+h0yI3SlQavZ6rYspDP/
         Q4HmeiH4u0QwXYmNhNPV9jnSVuPBsi3pVtxef+GjKmVs+fqULJKsfoHb00Hzo32UBUwz
         z7pg==
X-Gm-Message-State: AOJu0YzPwuaFtkfgzpU8fFMIklnxX8qtUeDy8x/MZjR7xmziw6T2AaYo
	QeSQk3aM6BCg7iokPIg81DvPd0VO9uRi1AZ4+KDnaBhmUh2BFg2z4vlH7jGLj/gZWh4CS7Df0yD
	IFuCahBvyUCstWE9yMEf7HnnykpHiVxOPE/ImAGVpT60N9CRcYrt/yRaHDq+5D8+bo/jPKIzplv
	arM+siwFL4xvLl+anHG08=
X-Gm-Gg: AfdE7ckjQ8AjauFfLuZ2uLjMU+zKmWp1k1tGdNs/ZyUD9/OxAmOEgHFL40337z81Tpj
	qvanzO68voFk3BqXn2hif9ORI0oNKVg7KI44EHiGOo9uUwk9Xnz58y+9da32VLDL8Lj9nokCbUR
	fsO6M37Rz8C120lE+ZaZEKbla67lQGqqrGg1M3vTgfilZJ0HYMWOYSsxYjNpVorXq4pxhxhSimc
	HfMo3AvXd5MSatvn/4k5r74q/UQ2vjLYsBEGkmF2JEgBX2TCJLdE94tRM7z/48qBconhHwyWB1o
	qCJoeGiU13325KAJhWHyz4QnGBY1ARW70pl7tFvEd8dd85n3nhvaSDhzDkG5fF2AiqBdeohH6uo
	NHvPHxD2yeh/YRT/ZBv/ye5Ei0Dxa7es5jGlojncTnQ==
X-Received: by 2002:a17:90b:1d49:b0:374:d67b:4048 with SMTP id 98e67ed59e1d1-37d4da3ae5dmr8378321a91.11.1782121410688;
        Mon, 22 Jun 2026 02:43:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:374:d67b:4048 with SMTP id 98e67ed59e1d1-37d4da3ae5dmr8378300a91.11.1782121410092;
        Mon, 22 Jun 2026 02:43:30 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af305sm80445465ad.6.2026.06.22.02.43.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:43:29 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/25] Wrynose pull request
Date: Mon, 22 Jun 2026 15:13:24 +0530
Message-ID: <cover.1782121023.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CId2A__owfthCQoyZrbNJM0jR55kLyfs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NSBTYWx0ZWRfXzyZRU0DVTK3+
 9dvk84Ig56erbX8ZfOnPlEb+Ajbku0apN/zCJnu5wi/+ychV2caIv+2P1yn0ykYLN3C04XQY9wd
 Yb/JkNkzSPm/DB7G+xtgkRRTLp6iABs=
X-Proofpoint-GUID: CId2A__owfthCQoyZrbNJM0jR55kLyfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NSBTYWx0ZWRfXzWB572IdfUMG
 rykHRi0PD8+EnsDKA53QTF6QojoE7nqAXXAwNda/jlbb/AnLIMm2M9pImSUP7L4FwSYb4piCIHu
 debm6JnJtHFRJ/MnhxR3OrRf8TV36teYoRvyBLvajiWct8Rvn+RrV4b3fQISFu3UcefwqFTIZR4
 bBrPCZWShUVlzNpZKeQHFNHBT78oC7gs8T1uxBGHT98WAfwCh+79x0CkJG0qD0v+SJj16PF+sxI
 p62ggXMKXzZNbVcep7GZb1wQlnRtDS3MrLDltnXYZvpUMtUx5o2AWjMwI3CL7Cel1q8hQQSQYLo
 OFFK7Gq2lMzgLnNI70lIsgD7iHAh+RPwcp9a+Y0KLji0BfR4AON+TTVtUPsUMNbfDhygzT5aONz
 wMsqP9Fr7qwP5aFUxiwIuabF6l3SqUu2mt4jTFZIi849NCPAyVfjjaRGaKOpn620FNDBUK+4W15
 IcCtl+1m9SRaPnBulsQ==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a3903c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=VV45L3uDhhvSp9b-ImwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 09:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127689

Please merge these changes in wrynose. Changes tested on autobuilder and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1561

The following changes since commit a43f0d532c399458cae44ce66f3799a220fbb497:

  README: update listed maintainer (2026-05-29 09:29:32 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to 100027977216601000cbefc42c2ff6cf667e7b5e:

  hostapd: Fix clearing settings for color switch (2026-06-18 13:11:20 +0530)

----------------------------------------------------------------

Abhishek Bachiphale (1):
  dnsmasq: upgrade 2.92 -> 2.93

Andrej Kozemcak (1):
  poco: fix timezone and data time parser issue

Ankur Tyagi (4):
  libjs-jquery-cookie: patch CVE-2026-46625
  postfix: upgrade 3.10.9 -> 3.10.10
  python3-django: upgrade 5.2.14 -> 5.2.15
  python3-django: upgrade 6.0.5 -> 6.0.6

Anton Skorup (1):
  jq: patch CVE-2026-47770

Dmitry Baryshkov (1):
  mariadb: fix building for the ARMv8.3-A and later systems

Jason Schonberg (2):
  php: upgrade 8.5.5 -> 8.5.6
  php: upgrade 8.5.6 -> 8.5.7

Li Zhou (1):
  haveged: upgrade 1.9.19 -> 1.9.20

Markus Volk (1):
  pipewire: update 1.6.5 -> 1.6.6

Max Krummenacher (1):
  fio: fix build with musl

Mingli Yu (1):
  mariadb: Upgrade 11.4.10 -> 11.4.12

Naman Jain (1):
  nftables: Conditionally add ${PN}-python as RDEPENDS for ptest

Peter Kjellerstedt (2):
  php: Correct the license to PHP-3.01
  ttf-dejavu: Use "Bitstream-Vera" instead of "BitstreamVera" as license

Wang Mingyu (7):
  haveged: upgrade 1.9.20 -> 1.9.22
  imagemagick: upgrade 7.1.2-23 -> 7.1.2-24
  memcached: upgrade 1.6.41 -> 1.6.42
  gdm: upgrade 50.0 -> 50.1
  python3-vector: upgrade 1.8.0 -> 1.8.1
  python3-soupsieve: upgrade 2.8.3 -> 2.8.4
  proftpd: upgrade 1.3.9a -> 1.3.9b

Wei Zhang (1):
  hostapd: Fix clearing settings for color switch

 .../gdm/{gdm_50.0.bb => gdm_50.1.bb}          |   2 +-
 .../{pipewire_1.6.5.bb => pipewire_1.6.6.bb}  |   8 +-
 .../files/0001-Fix-build-with-musl.patch      |  50 --
 .../{postfix_3.10.9.bb => postfix_3.10.10.bb} |   3 +-
 .../{proftpd_1.3.9a.bb => proftpd_1.3.9b.bb}  |   2 +-
 .../recipes-filter/nftables/nftables_1.1.6.bb |   5 +-
 .../{dnsmasq_2.92.bb => dnsmasq_2.93.bb}      |   6 +-
 .../dnsmasq/files/CVE-2026-4891.patch         |  40 --
 .../dnsmasq/files/CVE-2026-4892.patch         |  36 --
 .../dnsmasq/files/CVE-2026-4893.patch         |  34 --
 .../dnsmasq/files/CVE-2026-5172.patch         |  34 --
 ...emcached_1.6.41.bb => memcached_1.6.42.bb} |   2 +-
 ...inux-prctl.h-include-to-fix-musl-con.patch |  33 ++
 meta-oe/recipes-benchmark/fio/fio_3.42.bb     |   1 +
 ...learing-up-settings-for-color-switch.patch |  34 ++
 .../hostapd/hostapd_2.11.bb                   |   1 +
 ...e_11.4.10.bb => mariadb-native_11.4.12.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
 ...b11be28ae9b2432b2a661bf38a197cf9514d.patch |  52 ++
 ...{mariadb_11.4.10.bb => mariadb_11.4.12.bb} |   0
 .../jq/jq/CVE-2026-47770.patch                | 484 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 .../php/{php_8.5.5.bb => php_8.5.7.bb}        |   4 +-
 .../{haveged_1.9.19.bb => haveged_1.9.22.bb}  |   4 +-
 .../ttf-fonts/ttf-dejavu_2.37.bb              |   2 +-
 ...ck_7.1.2-23.bb => imagemagick_7.1.2-24.bb} |   2 +-
 .../libjs-jquery-cookie/CVE-2026-46625.patch  |  63 +++
 .../libjs/libjs-jquery-cookie_3.0.5.bb        |   4 +-
 ...er-trailing-timezone-designators-Tim.patch | 240 +++++++++
 meta-oe/recipes-support/poco/poco_1.15.2.bb   |   1 +
 ...ngo_5.2.14.bb => python3-django_5.2.15.bb} |   2 +-
 ...jango_6.0.5.bb => python3-django_6.0.6.bb} |   2 +-
 ...ve_2.8.3.bb => python3-soupsieve_2.8.4.bb} |   2 +-
 ...ector_1.8.0.bb => python3-vector_1.8.1.bb} |   2 +-
 34 files changed, 939 insertions(+), 220 deletions(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.0.bb => gdm_50.1.bb} (96%)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.5.bb => pipewire_1.6.6.bb} (99%)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb => postfix_3.10.10.bb} (98%)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9a.bb => proftpd_1.3.9b.bb} (99%)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.92.bb => dnsmasq_2.93.bb} (95%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb} (95%)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.10.bb => mariadb-native_11.4.12.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.10.bb => mariadb_11.4.12.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
 rename meta-oe/recipes-devtools/php/{php_8.5.5.bb => php_8.5.7.bb} (99%)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb => haveged_1.9.22.bb} (91%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-23.bb => imagemagick_7.1.2-24.bb} (99%)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-cookie/CVE-2026-46625.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch
 rename meta-python/recipes-devtools/python/{python3-django_5.2.14.bb => python3-django_5.2.15.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.5.bb => python3-django_6.0.6.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.3.bb => python3-soupsieve_2.8.4.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-vector_1.8.0.bb => python3-vector_1.8.1.bb} (88%)

-- 
2.54.0


