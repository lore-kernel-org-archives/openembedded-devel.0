Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.740.1794204045086455766
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=jFFEXPpW;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=MO7RgGCk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KDBU3899903
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Inc7jeRflQfb8NhPMLfL1LBNeCnxFnlvQiXQnX9o25I=; b=jFFEXPpWeg8DjZ9T
	Ycd7VECv3foFLD81YS5ph1gPCbGBORJ0JiDUmOiFR1Aq8rMnkitNRkKO/nKx4gno
	gKA2CBcfeH5u0DPhcpd4SMNMQ5muURA0vlow4AcTwfQHm8jx2N5yO4Tv2mCrmrbc
	eVKlOuoFr+4whjbvTiKHj6pcOvS/t3OOY5GKAIKUqSN62/lMHhQS7Ag4YtrE74Ve
	cDXYaP0DEM7hm4a740covzTCrlR83ErWVXYZyFyozGn4B8/aKaFtxowJRMNPq6U6
	F1YBFELVCEHFbFG4HLsAVCEOjYMUir99SEm58+o5X71mimeXISH7+Y6AQFLYkOEU
	dXDaRw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxcya8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso853417eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204043; x=1794808843; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Inc7jeRflQfb8NhPMLfL1LBNeCnxFnlvQiXQnX9o25I=;
        b=MO7RgGCkR+KRsVpfIyQULC6ffnk1AUwpVgAQDxHU5Cij1umDFu7748qj/fbFJsryz6
         JBnP+NbB/bwKPAf3VDRQamzzJowPH3LmW9rw9EDH0x5rqR4Et5t4Cb6cz30yg+5VtGqo
         8bwOLQW9lVEDmjPF+oj+m3/bP5U9obltH292tHJQVywtLQYHRvCRhyo4ecN9mdF2at5m
         gd8n8kaViSM/4a2IPXKUBcNlNVCiJnfIR8jLWBUz7HejdThfqWi/Yst6MuKbJzNe20F4
         SUPe4YsN5koPKoQZQhxeM2ZbxOEoRiTK1uK1uH5YC09vg2rDhNfgVoEksiTIUP/KErDu
         igFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204043; x=1794808843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Inc7jeRflQfb8NhPMLfL1LBNeCnxFnlvQiXQnX9o25I=;
        b=wSvMPK6yktUYspY6EJYEqBMlTCtw9IVgwAGwwLfSGciRZrdvgbLNntRu1Uwr/d9oL8
         DMpGXguB6mXbYzwehnMX3vv11rR7qHBp3XSwOpk4xF4DU42fjiWDI8UFPGnDSu6yvgnU
         6mQqUJOQWKXpJlCRhpHP7nqu325vjTLFcKD9auhp2DgkAL8XvlluJ3/falx3tl1QrKQI
         gdqO2Y3BwL2alJB8+DBHsHcYDoeXBH3U55hC7K6i5p/4YJRZBvnkyUahHrvtAol5wfh6
         Q/6HMxaeN0vJyLSNBJ043bjNjPt12IFiEQje5RJMndzunvXewRZomnumhK5KsKuztwqC
         5UhA==
X-Gm-Message-State: APuU4Z/6hHHAZZkKaBc6/um4szthPUBSAIwsprypcM/fWjMAu0ooyo+n
	p27faR9sGqkf50PmJJn9UYpMUrMB4ptu5BX/7P9uZypFvD0IkV1e6EY9xnjpFmvsNer+LuOslCf
	GsB0a2FalOWSvHARnERy/06bi/svSpHlOibP51caxRxYYtA7DGbk0BanWlWQwsD4DiQ/TUXbJUU
	quQewi7wiSYb/uJH+zdomG0Q==
X-Gm-Gg: AYBFou2WbNdnr7GGOFpBCdJzcSdpK/O3Vo6ateTJM5rjOstN8wn7eAs99Bt4lMDC44E
	Ukq+W+qGlZ38mFLK1F/GCT+8wQEYxaHOsJLLmpDWGF5qb1o+chg95XhQnXM75XlPo7KIqexTWy2
	8vCNY7Tklx0jVgXRyziNmzGZHz8JRnmfRUCmFbYV8uiObn8+jXc3lazlcdpUT6hExEMgsQJNB1i
	9p0sBsIJ74GlyYimQjo3rwUoPWfDLZ2FJRhZyrGtVAggJSCmF3eJDed/sdtSISMVBRaFb/aCWq4
	WuX/aOW6THYS45XlK+Vo8E3cYj2ujqtXB7aR7hG0bRJrNQIWxNSg1VlTwSg3QNkQDHtO+Qv2AGq
	q99HkVtPzH9M9leXwgcoQPVxsXofnNgw24TEa4bElIH4g/z6jcbSPt28kOJEkM4yVYebjpLvjo+
	ZmlHI=
X-Received: by 2002:a05:7301:628a:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-37256612cc6mr5747405eec.7.1794204042685;
        Sun, 08 Nov 2026 22:00:42 -0800 (PST)
X-Received: by 2002:a05:7301:628a:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-37256612cc6mr5747357eec.7.1794204041900;
        Sun, 08 Nov 2026 22:00:41 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:41 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 05/10] mtr: patch CVE-2026-14461
Date: Mon,  9 Nov 2026 11:30:25 +0530
Message-ID: <20261109060030.621745-5-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Proofpoint-GUID: wmNL79CUtirV-odhBKioWiV7xy4QSIbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX/sQWhZ6rALlZ
 38jPG1a2QL6QoI0R+N6IadElmTtiTyAbUV2yreVHwNW33sg1mHxWSwzzBFMayL/sEnr4GuMaJXJ
 Dgipucn0Bim1ijhNVE5UwMQ93iu1vYZFHRuRS/0F/i0Mb5R324N/2/B7IS51jWPkGSkyJWVKqri
 V3omMqjqSC/qGVL2xP5nKrYW+y1zddRNICg4KvDmgWW96KTzdd6Iepwtsqa0+YEhn79nCTpkbSD
 97v03ANB6bH5+MtK3jPuWtNjiuxFlOo5GfTnXhmpBFs7x9ESwmL+x+rPkUdXNNDaITkjC6/RAYX
 vb9Gaad5gRjimyOExlul+ItCJaHaCjT9JW1vMOjIW4dUB+lM44ae7GN3D+iD1Fs6F/giQJHovCJ
 /0d5hMBdl1wF+GNOUNkTI/okORZ0ks6AO2pcWTMX9S19dkKK96K5ihdz8Q3gNclxe5M3nOeLW6d
 niJ80sCsCDzYMKWtD6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX7DGly41wib1a
 GMiIGBN6zUFv/HYcr4u2X9q8wLkD6CJu4yCCSamL8O0SyNVfRodQscANey6+KYcGEyxMKptJnva
 r5quKRQ5YYj9Smb6lK6plmLvvuFsknw=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1618b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=wWpHVF3GAAAA:8 a=LqKLPXsZjyQVp64znIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=gUNmXEcwV8O60nmKb841:22
X-Proofpoint-ORIG-GUID: wmNL79CUtirV-odhBKioWiV7xy4QSIbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6A93KDBU3899903
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132042

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-14461

(cherry picked from commit a5e913980f0107c4fe1ccde6a5e4a10780bd60a9)

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 92c0310db416d01c8ec3b8f51b60a2d792b63de3)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../mtr/mtr/CVE-2026-14461.patch              | 32 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.96.bb           |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-1446=
1.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch=
 b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
new file mode 100644
index 0000000000..6628d9d7be
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
@@ -0,0 +1,32 @@
+From 4c75fae93d9515f3ecdfecc966b8c6471efb7ea5 Mon Sep 17 00:00:00 2001
+From: "R.E. Wolff" <R.E.Wolff@BitWizard.nl>
+Date: Tue, 16 Jun 2026 11:03:39 +0200
+Subject: [PATCH] =3D?UTF-8?q?Fixed=3D20possible=3D20buffer=3D20overrun=3D=
20in=3D20asn?=3D
+ =3D?UTF-8?q?=3D20code--=3D20Micha=3DC5=3D82=3D20Majchrowicz?=3D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 48e1794414d338ce47abc0f27c25ade8788af9c3)
+
+CVE: CVE-2026-14461
+Upstream-Status: Backport [https://github.com/traviscross/mtr/commit/48e=
1794414d338ce47abc0f27c25ade8788af9c3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ui/asn.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ui/asn.c b/ui/asn.c
+index 111c394..487d9e8 100644
+--- a/ui/asn.c
++++ b/ui/asn.c
+@@ -94,6 +94,8 @@ static char *ipinfo_lookup(
+             DEB_syslog(LOG_INFO, "Malloc-txt: %s", UNKN);
+         return xstrdup(UNKN);
+     }
++    // Clip len to PACKETSZ. -- Micha=C5=82 Majchrowicz
++    if (len > PACKETSZ) len =3D PACKETSZ;
+=20
+     pt =3D answer + sizeof(HEADER);
+=20
diff --git a/meta-networking/recipes-support/mtr/mtr_0.96.bb b/meta-netwo=
rking/recipes-support/mtr/mtr_0.96.bb
index 9008223264..2716ca92aa 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.96.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.96.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=3D5;endline=3D16;md5=3D00a=
894a39d53726a27386534d1c4e468"
=20
 SRCREV =3D "f392168771570b0fdc104c38dea6bbc2ce585710"
-SRC_URI =3D "git://github.com/traviscross/mtr;branch=3Dmaster;protocol=3D=
https;tag=3Dv${PV}"
+SRC_URI =3D "git://github.com/traviscross/mtr;branch=3Dmaster;protocol=3D=
https;tag=3Dv${PV} \
+           file://CVE-2026-14461.patch \
+"
=20
=20
 inherit autotools pkgconfig
--=20
2.55.0

