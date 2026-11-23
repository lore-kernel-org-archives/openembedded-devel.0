Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57546.1795451102463785520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=h5lvCZS6;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=Y9aSJiqe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGu5v2486557
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DDHNvJpnkcJ0c6Q3vbUEi8
	tCvi9og5V3NQLy36b4cz4=; b=h5lvCZS6Y29OwfpU089f78T2ROlOwq3Obl1Vu6
	OTyoanFb+HklepAg7vtXCTmM7PHWczQrcTFkjosUxM32WAw2QL3BcDJ3EZOUxRxy
	SbumUPSMLuK0TTbqhXtVTAJLVHp/fa6lEtS8D7PbBdqCKzwRuiLzGI64Blr+wMZ3
	XGSvQVQFSjUyaUlLSTAE7vON0uT31D0cGlkooKBlMt61dfanFUm4MNKrRWv+GrRW
	z1h2Wpa7csXk1EU0wp4hC6Rl3tCkCnWP/DLWFSkThKZtbVLXbFpzjeUmkIJHs7Fo
	AEvVrXNAVe/khqJcR4KBTuoe6Y1A9j5UZisCs1D/EtY2cKfA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02bun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:25:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso3977762eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451100; x=1796055900; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDHNvJpnkcJ0c6Q3vbUEi8tCvi9og5V3NQLy36b4cz4=;
        b=Y9aSJiqeUlE2b2HxEmw0UBFEnu9biMeOkIIfd/lUKZLkjsncn2yf8ZYD9tBN2t5ZYI
         0QJhZA+yKJyznpEEvoHDjpkLn+hn12SiVPdfKZS90oNW/n3yzKWuVpK3IaE1MROPtdPi
         Cn0tcv53YAuvLLOqdCYiFbESUbm99y/nKbg1FIpwTaqvPKpKIQehFW6MdkiSNEp6dCfg
         rNbpNarGyvQ7Fl9+zZGQB05gCTnWqCLBj8NxOl6fLptoTHD+D33LC3mdNaSplwg7/yAK
         cH+QeVmUHPLgZWHZ4/g0t64vhh19MXte5g4Z98JnzRabO8I2u4o0Q14vPStNM27pF9pf
         yLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451100; x=1796055900;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDHNvJpnkcJ0c6Q3vbUEi8tCvi9og5V3NQLy36b4cz4=;
        b=WlHT4ZH5lyv4qcHpVAS5kVDRktB46Rqg4Zc/vr0PCFEBnUBpow8exeP9FSaC+F2++x
         l+Op2/2j3UwrWREyOZQ5mldnt+LZNBAVb0KIbjBKRvyORA8Xa2tsGMfdooJmYG9x6kL0
         2W4jAakzjBBzou0NNLMaekjDZ8PCYc/jUVd79AfkNM6NUoOJYbrokpEqMNvPHWoVrSSO
         lHO4VtQ7TUp9wGpN5zJuuItSmb8K+bcQ2Xr4jYXXAs4DbvThwisBzCG1d08/oUTAdU+Z
         CGZvfapj9ELU9/CaVhtlRPGLDTg+0tWh8hOn5EPTKPSB0PbKHJq8RDcDby9aMznnlJL5
         wIxw==
X-Gm-Message-State: APuU4Z+l9zED0KOSlZFyexvIfsMqP/22CjePL8nXgtqpwmQNfQRD0/Vw
	65q7EPyFbY5xQ/a+YZIqy4ddoPitChr3hWttAx7s+gLDBqFFy6HC0AT1UxuvHwZa8qgf/L+ELPn
	GMYB4YI3sX0J+HYSoXneYVHh5HXisQAjiFBgywtbLAsx8aTUvPTDVZIIu8xQK+/xfusgDikgrHp
	lhPyiowgwM/VRmH1yjfa8=
X-Gm-Gg: AZFdTZfJzsg4mEcrLEgVtHMxxUXkZnR2ytszi8MEjwElPXDQsIS/oQpKxLuNf5wPCTd
	K+j+NdzBDhj5NRdpVddD6pl5h3KrqxmV9/bEMp0JYTqIqGz3H+2ptarzIhUG6HCpx22FXj21SZ0
	lAvxqrvEHOTzY/hbyBusT54xy50iKOdP3K4CBb4+7oG2gkBan+IFQ+NeM5xSmoamWNzajvUExWQ
	TtUMZJiRwPRGX4J1veOHKhZnPKS5w9lMeLj1/DX96mv6mYKb+IM6NiyvYUBimNSXjOt8NnI9h5w
	7hvLB+8gci+ktgx3k4eRlGoIORotdjKmAY6O1WkEN2A63MV+teRvmwbun5ntg49CTEuba5f71YD
	tNXSZd/fIkPvbpbO/nnIhoFijPSmmKAXqoMSrNBkez4YvgIKnR2MnaOAMb5wKrw26uQDTNz3HoE
	Z/JjK8eA==
X-Received: by 2002:a05:7300:d208:b0:386:99c4:c99f with SMTP id 5a478bee46e88-38699c4f0cemr8885598eec.12.1795451099882;
        Mon, 23 Nov 2026 08:24:59 -0800 (PST)
X-Received: by 2002:a05:7300:d208:b0:386:99c4:c99f with SMTP id 5a478bee46e88-38699c4f0cemr8885573eec.12.1795451099032;
        Mon, 23 Nov 2026 08:24:59 -0800 (PST)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm36684972eec.15.2026.11.23.08.24.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:24:58 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/33] Scarthgap pull request
Date: Mon, 23 Nov 2026 21:54:45 +0530
Message-Id: <cover.1795448297.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX/YWDiVuBM5dm
 6lBJPuTQHTHHDBQayfSxlTtlcrvnPmlzkCZkwNeHvDFa9IVOEMPhf9Z/24bod5wSD/3er1YEQ3Z
 cXyI8mv7XdowvGoLFWg2o+3tKV4IGk/HPMowip6ttWlJ2dGtSrPmHI+vclfxOG5SKjAHqjm+mXK
 /ZMP68110ECMbFGdoYxse9jqNDLAf0Ux5e3aQSAjigtoYQXCIFij8ZIPBItcM9fadwSETs+xj3R
 /xofUFrPBHF5AClQigxDOJKSUZlJF6vGzwW5bsuPzV3evLooir/6qsFVxYR0EfP+p3xsmAeFdpP
 VZOb/I8GemXHzUWBZHnOB4pVvaWP0sUFKCxN0e9xh7BPo6swSqcRnpmdTdVTJ1S/luOuBPtxjb5
 c0q5JqxWIAiRqhoLkYW6l1Fc8IbgWNbkDNsbSWBGv9i+2hA2Yhg71Mwc0lWtEM2iVsGYsmqcaqM
 WCcVsbVYDhJCCzsGzmQ==
X-Proofpoint-ORIG-GUID: kO4R-GPPE826oY2on8XjAZym1UVt9eT9
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0468dd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=vbz120GRKCI3Kq9ZaZsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: kO4R-GPPE826oY2on8XjAZym1UVt9eT9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXzmrX2N9mfKQE
 QFlP3YC6p0ZhyfuYSZgoCcwaWvGVygllkPBjek7gqgbAGsXuPJMqRnZoYbWzBb8dQjjN1hYbBy8
 ytGRxrZgRCMoitfx4HfAdQjTuBzMk1A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6ANGGu5v2486557
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132902

Please merge these changes in scarthgap. Tested on autobuilder and locall=
y.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1996

The following changes since commit 2db6aece32c7f8ebf6015b468e1b4e21de072e=
3b:

  python3-grpcio: update gRPC repo roots (2026-10-26 12:46:49 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap

for you to fetch changes up to 96c2c78e13ff1b954715ff3c6d26bddd50a02509:

  fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE (2026-11-23 19:47:2=
4 +0530)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  strongswan: fix CVE-2026-78135

Ankur Tyagi (2):
  tmate: patch CVE-2026-4751
  ncp: ignore CVE-2025-14577 and CVE-2026-35087

Darsh Kelaiya (2):
  ntfs-3g-ntfsprogs: fix CVE-2026-56135
  ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed

Devansh Patel (1):
  python3-ldap: correct python-ldap CVE_PRODUCT mapping

Gyorgy Sarvari (1):
  net-snmp: fix ptests

Hetvi Thakar (8):
  python3-pyjwt: fix CVE-2026-102269
  python3-pyjwt: fix CVE-2026-102267
  python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
  python3-pyjwt: fix CVE-2026-102271
  python3-pyjwt: fix CVE-2026-101917
  python3-pyjwt: fix CVE-2026-102275
  python3-pyjwt: fix CVE-2026-101918
  python3-pyjwt: fix CVE-2026-32597 test indentation

Hitendra Prajapati (3):
  nodejs: Security fix for CVE-2026-111497
  iscsi-initiator-utils: fix for CVE-2026-44943, CVE-2026-44944
  strongswan: fix for CVE-2026-78130, CVE-2026-78132

Jason Schonberg (1):
  brotli: upgrade 1.1.0 -> 1.1.1

Joao Marcos Costa (1):
  ntpsec: fix CVE-2026-121506

Jo=C3=A3o Marcos Costa (Schneider Electric) (1):
  meta-webserver: nginx: fix CVE-2026-15176

Khem Raj (3):
  frr: Fix build with bison rejecting paths in output directives
  pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
  fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE

Kris Gavvala (1):
  python3-pillow: patch CVE-2026-112393

Peter Marko (5):
  libwebsockets: patch CVE-2026-114550
  net-snmp: patch CVE-2026-89147
  nss: patch CVE-2024-11705
  nss: patch CVE-2024-11706
  nss: patch CVE-2024-7531

Venkata Gariganti (1):
  mariadb: upgrade 10.11.18 -> 10.11.19

Yogita Urade (2):
  python3-pymongo: Fix CVE-2026-88029
  python3-pymongo: Fix CVE-2026-106435

 ...72_CVE-2026-42617_CVE-2026-56136_p1.patch} |   2 +-
 ...72_CVE-2026-42617_CVE-2026-56136_p2.patch} |   2 +-
 ...72_CVE-2026-42617_CVE-2026-56136_p3.patch} |   2 +-
 .../files/CVE-2026-56135_p1.patch             | 141 +++
 .../files/CVE-2026-56135_p2.patch             |  37 +
 .../files/CVE-2026-56135_p3.patch             | 204 +++++
 .../files/CVE-2026-56135_p4.patch             |  95 ++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  10 +-
 .../files/CVE-2026-44943.patch                | 181 ++++
 .../files/CVE-2026-44944.patch                |  41 +
 .../iscsi-initiator-utils_2.1.9.bb            |   2 +
 ...ths-in-bison-output-defines-directiv.patch |  54 ++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
 ...Remove-more-redundant-redeclarations.patch |  26 +
 ...ggested-by-Aisle-Research-to-prevent.patch |  25 +
 ...d-Rename-socket-descriptor-arguments.patch | 240 +++++
 ...dows-Fix-64-bit-compatibility-issues.patch | 619 +++++++++++++
 ...mp-Move-transport-include-directives.patch |  27 +
 ...Enable-TCP_NODELAY-on-TCP-sockets-to.patch | 119 +++
 .../net-snmp/net-snmp/CVE-2026-89147.patch    | 389 ++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |  13 +-
 .../recipes-support/ncp/ncp_1.2.4.bb          |   3 +
 .../ntpsec/ntpsec/CVE-2026-121506.patch       |  52 ++
 .../recipes-support/ntpsec/ntpsec_1.2.2a.bb   |   1 +
 .../strongswan/CVE-2026-78130.patch           |  55 ++
 .../strongswan/CVE-2026-78132.patch           |  77 ++
 .../strongswan/CVE-2026-78135.patch           |  73 ++
 .../strongswan/strongswan_5.9.14.bb           |   3 +
 .../libwebsockets/CVE-2026-114550.patch       |  31 +
 .../libwebsockets/libwebsockets_4.3.10.bb     |   1 +
 ...10.11.18.bb =3D> mariadb-native_10.11.19.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   2 +-
 ...ariadb_10.11.18.bb =3D> mariadb_10.11.19.bb} |   0
 .../nodejs/nodejs/CVE-2026-111497.patch       |  71 ++
 .../recipes-devtools/nodejs/nodejs_20.20.2.bb |   1 +
 .../{brotli_1.1.0.bb =3D> brotli_1.1.1.bb}      |   4 +-
 .../tmate/files/CVE-2026-4751.patch           |  75 ++
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |   1 +
 ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch |  43 +
 meta-oe/recipes-support/fftw/fftw_3.3.10.bb   |   1 +
 .../nss/nss/CVE-2024-11705.patch              |  43 +
 .../nss/nss/CVE-2024-11706.patch              |  35 +
 .../nss/nss/CVE-2024-7531.patch               |  69 ++
 meta-oe/recipes-support/nss/nss_3.98.bb       |   3 +
 .../recipes-support/pcp/pcp-native_6.0.5.bb   |   2 +-
 .../python3-pillow/CVE-2026-112393.patch      | 131 +++
 .../python/python3-pillow_10.3.0.bb           |   1 +
 .../python3-pyjwt/CVE-2026-101917.patch       | 311 +++++++
 .../python3-pyjwt/CVE-2026-101918_p1.patch    | 121 +++
 .../python3-pyjwt/CVE-2026-101918_p2.patch    | 109 +++
 .../python3-pyjwt/CVE-2026-102267.patch       | 223 +++++
 .../CVE-2026-102268_CVE-2026-102270.patch     | 116 +++
 .../python3-pyjwt/CVE-2026-102269_p1.patch    | 138 +++
 .../python3-pyjwt/CVE-2026-102269_p2.patch    | 169 ++++
 .../python3-pyjwt/CVE-2026-102271.patch       | 141 +++
 .../python3-pyjwt/CVE-2026-102275.patch       |  81 ++
 .../python/python3-pyjwt/CVE-2026-32597.patch |   2 +-
 .../python/python3-pyjwt_2.8.0.bb             |   9 +
 .../CVE-2026-106435-regression.patch          |  79 ++
 .../python3-pymongo/CVE-2026-106435.patch     | 134 +++
 .../python3-pymongo/CVE-2026-88029.patch      | 840 ++++++++++++++++++
 .../python/python3-pymongo_4.6.3.bb           |   5 +
 .../python/python3-ldap_3.4.5.bb              |   2 +-
 .../nginx/nginx-1.24.0/CVE-2026-15176.patch   |  52 ++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
 65 files changed, 5528 insertions(+), 13 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE=
-2026-46572_CVE-2026-42617_p1.patch =3D> CVE-2026-46572_CVE-2026-42617_CV=
E-2026-56136_p1.patch} (97%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE=
-2026-46572_CVE-2026-42617_p2.patch =3D> CVE-2026-46572_CVE-2026-42617_CV=
E-2026-56136_p2.patch} (98%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE=
-2026-46572_CVE-2026-42617_p3.patch =3D> CVE-2026-46572_CVE-2026-42617_CV=
E-2026-56136_p3.patch} (96%)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-56135_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-56135_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-56135_p3.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/files/CVE-2026-56135_p4.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils=
/files/CVE-2026-44943.patch
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils=
/files/CVE-2026-44944.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-Do=
n-t-use-paths-in-bison-output-defines-directiv.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
001-CHANGES-Remove-more-redundant-redeclarations.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
004-Windows-Fix-64-bit-compatibility-issues.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
005-libsnmp-Move-transport-include-directives.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/C=
VE-2026-89147.patch
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/CVE-202=
6-121506.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78130.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78132.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-78135.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsock=
ets/CVE-2026-114550.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.18.bb =3D> mariad=
b-native_10.11.19.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.18.bb =3D> mariadb_10.11=
.19.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-11149=
7.patch
 rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb =3D> brotli_1.1.=
1.bb} (80%)
 create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751.pa=
tch
 create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not=
-use-CLOCK_SGI_CYCLE-on-Linux.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11705.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11706.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-7531.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CV=
E-2026-112393.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-101917.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-101918_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-101918_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-102267.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-102268_CVE-2026-102270.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-102269_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-102269_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-102271.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE=
-2026-102275.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/C=
VE-2026-106435-regression.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/C=
VE-2026-106435.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/C=
VE-2026-88029.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-15176.patch

--=20
2.34.1

