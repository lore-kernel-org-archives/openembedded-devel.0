Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.682.1794204039928302466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=osAEtIZR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IN3F6TpW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KXcm3900636
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D6AaJnZGmbYGmvll/bKmmIJzS5KHfhAvYgo
	ZX83Exvg=; b=osAEtIZRPWmqbPBKp73GdfNb+FX6kZhELcdZEAChYtZtk3f352Y
	seG5Xs0Ghd24zk4oTYL/gS1ph/GtgNUkuVeYNoLHr1HX1q9I62DI/L/opzsCg+ok
	IbOOMvFi8zg+CP04vX6yvOfoRjKJxdbSuCajj/zOnNMdbYGU8azwJDKO5IsFiZd/
	HWYWMz6mAycS7+5DyNp2c8Oa2rd0yg7nzT7hVV2TJ4j+QxKXkbbaz+RhN1wGZhmj
	zJYcMDWw4jDqtxWwrxDeX57C5Z2ygSAIBjqxXezo1KTJHnAlpcMVqOHdWddFKPFJ
	l0nUOgPMKdC9LtJYqHju5cifvnvpvE8+dUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxcy9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so979631eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204037; x=1794808837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6AaJnZGmbYGmvll/bKmmIJzS5KHfhAvYgoZX83Exvg=;
        b=IN3F6TpWKVGWi4XzjNB8RWWQcQRCiVQSkRvUlvajcLvMvy8Mzn0Bup49ZI9l9pUGMc
         ZGNm7KEGicbeTx9lXOJu/EGRv+haL5P2qDFDWtlBBf0xfa7szkOncNhodTtIPIdFWEr+
         AJxyRADmcd/IbUdoa1TkzECjQUWOHO1Po/tCcGcgTX1MklRNdS+NWodO5TPSj9V9DE6W
         DgcpId2PmrHS2aMhMC8CWHHI4wtbSAA88mMKwxt1zk+pl5YGsOJCao8AhO6ysu03gK3E
         JseJZl7TqkmVYaAPx/XWfFEmr9O3HVNEY0JsHZKlmlBp12ufoyu+ITCj1hJuPP2Lp+ap
         bLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204037; x=1794808837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6AaJnZGmbYGmvll/bKmmIJzS5KHfhAvYgoZX83Exvg=;
        b=gCJyQKzOJqa4TGLDeoXisy89bBR8538bZcwP9trkr+NRpcBLoX9cUhUSW8ycoWxMzY
         5QIxHDBjsyBJwstgnRIc37J88dgtnEVHtFAKeJrQC8gwJ+dNzAUd6aLs2pywlnNjlise
         IhA1ofkHhXbiePB6zv7N80dcGzVT0ESky82oaFCBmqSQUdbFNvamI1A2gTP191ibCO4W
         6oWJ/dwS4itCBwGtkk9Wl3nQ1scKEjXLx+uzbP1ewqTnZ+X1MOMj5Er1aHtj+bBwWto7
         tndDhim6Wo29C0Rqb7UgLGZmVzerd6WkeS+qfB7p/NnfCcf3Ib2oxZGYoRMJrIwJJq7U
         +WaA==
X-Gm-Message-State: APuU4Z80CRCmlfSfmfY4tMBDm48tElKYDUAEK5hN+BcMkTR+X+xJeVZ+
	zmyEgvJP2kLlGrgpTheL7Nvvu7NdUgRxXGCP3VOMbKvrrsGioG5W0RkEQDFeI9tda+hH3kQV4gj
	H0JdTucUzsN85BM9ZMk4ukuupvIM8k0pXNpcD4ht2WD8IyFVqd5SvRC65FVtttTE4NA7dxDZJVL
	qJk0mCFi4mL0NsD2KkiOwNdw==
X-Gm-Gg: AYBFou0bkZyw5ptnCN7U/TonZnj/bQhsEWZEmet3OCyjZmLvQJphFgdm65dEKJhrpkb
	605rx1esgeW6xzByCVeyJFgEPqnshzQB5CrHcNr+Pm3IuCNjDLBSVpEoXL6i/LErKLwjC/OLzfs
	Y9MLvb7TjP0LEeEKcj3Fzt494SmJDoBoYiA52gDbs6RAegwxEvTSFuzZAX6lANZQGh46mB1h89F
	is0p3QTS9UzxCi1KhGwy29gju2OuOIyVnM7WpMrXALqoEr52zeCz9oKKd3xoEvN/cASXcPjQn0R
	ZAY4SePTfr44uqFgDgyhkzaG3+eTtrZXvyvOR1dmVPWZTVNwVHH2V85oAChaanUuFiJRzH8BkiN
	zvBMYvR+EGXi27RyLu19ftfrrWNr0D0yDA1R6YodAoQVoWaAeYC8JRq4xiSw6H+W6P3hvU2HotI
	gGU+4=
X-Received: by 2002:a05:693c:26c6:b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-3725807c441mr6110623eec.22.1794204036635;
        Sun, 08 Nov 2026 22:00:36 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-3725807c441mr6110552eec.22.1794204035601;
        Sun, 08 Nov 2026 22:00:35 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:34 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 01/10] fwupd-efi: Use the cross linker instead of the host ld.bfd
Date: Mon,  9 Nov 2026 11:30:21 +0530
Message-ID: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ycnkHKBNUXmhkuIo9CcSsThdxQLxcz54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX5XSyKMUQsx5o
 JeyN0kE0cK1rtkkzR0HojdnCnyEcehvVIgiZamXhw+fx57SYJR/MbU9yC1hvuAhqfQext4LzsVv
 6VfAUAfAlmBTMB9Opz7EVuTDv89ev1vRq1v41Nts/qj9MiwDnKOGHljU4DKajipP2UmKV8SR4ZW
 bZ6Up6kFc+Q1Ys0dvh9tS/APqR370K7jFDLfAawRAun32orJ5hSwqvZ+wkrZkLN8IyUWR8DDsgO
 +z9FCGFsaWJu3sQzp4OwV82gQEnGKr8wjSHLIDQ9LTDEc4BblFgVkYbxxZGBKkIG6yrs674333K
 tZS0xjnIjI1XJDypAQDN8kU+HCgzRuGP4rYh8BHz1OLMC7F96Du9nBpbkTDKGNP2l1mbmH1RKxh
 XbevBQlNhQAh1ySKGlceV4Ekc5TvKFvDvOR+dgdgqBZkJiwvoDFzWxuInHKwoYlHW7MiwMWtWhG
 m3yrKKeE07KWBdsEQ0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX2ImqnIC/AJ37
 ANilI/H6gyXu/mLfMNV9guYHgD7ecUQBPhY4coYlfPm4lhQodo0G0Bl8IRP1Rgyn0OWDtOuyTJa
 A4fhCQwdG6lm9r2Zw0vc+h4L3uU7PIo=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af16185 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eKu3O5d1xuPyDHZLTBkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ycnkHKBNUXmhkuIo9CcSsThdxQLxcz54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132038
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

fwupd-efi finds the linker with find_program(cc.get_linker_id()),
which looks for a program named ld.bfd. meson.cross only sets ld, so
meson falls back to PATH and picks up ld.bfd from HOSTTOOLS. That breaks
cross builds on an x86-64 host:

  hosttools/ld.bfd: cannot represent machine `aarch64'

and on x86-64 targets it silently links with the host linker.

Set ld.bfd in an additional cross file

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cfecdc92b34a8dde022b6c117dcf7fb0e905e5e2)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
index 8682d97c06..44d1f1807b 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
@@ -12,6 +12,16 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit meson pkgconfig python3native
 
+# without this meson finds the build host linker in HOSTTOOLS.
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+ld.bfd = '${HOST_PREFIX}ld.bfd'
+EOF
+}
+
+MESON_CROSS_FILE:append = " --cross-file ${WORKDIR}/meson-${PN}.cross"
+
 # These should be configured as needed
 SBAT_DISTRO_ID ?= "${DISTRO}"
 SBAT_DISTRO_SUMMARY ?= "${DISTRO_NAME}"
-- 
2.55.0

