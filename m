Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F47CCED602
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:42:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9528.1763462531921512422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IFUlYqj2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EuzcDoZe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6VwL9623967
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t6nZJDhL+b3hqBmix1XTUMYSlxyijckm2XP
	wS9IOLjs=; b=IFUlYqj2acX2o+cI4sNnpf4kz5pUI0NQdMd83HJygkrmOOl7HpS
	ulWGLypK38AZ5aqxFcGF4eE8AKZKyceNZm2wLFVVASsa5VpRl4ncLBsDBtswhyL/
	m8l0mrhqOqEki13eKabdepDvBEhRZS8N5kQv87a3fj9OiChE9AKrhvKvNyDk3Scr
	APob0kfpkkGa7eRpQJ4XYDYFO6bcw4CKq3E9Qm8jmRwypBE1LInBNTmd2M5s9vTT
	/HTwztz4ONIMbFs9Db2LQy2xy7i1H9hYMXkXHqar59qC0REdQqjtiL2hy30AKscq
	GJFlXyo5HTKX9A8HNFkxlcUKBPFpN4fFKHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfa54c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:42:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-345b4f2a8e8so571852a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763462530; x=1764067330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6nZJDhL+b3hqBmix1XTUMYSlxyijckm2XPwS9IOLjs=;
        b=EuzcDoZe+BG3bTkzU21rrc/OHylr3w9JNJpC65caUT9rsBV0UD4Ugf8Sj3fZbQzhD2
         F9hK712v6xyxExbTin7xKWYpWpWfqH8N5peNPqNnOJCXKmSeBxG638Tpe96EQSiq3zH8
         IMrXL6HnZH5Lx19vo8N3DkXZ5J+ID/avdbdF1AJ74TkCgygxcOtXkvA827VDIShUTuYk
         YBMq2falDunRoJuPz4PjMVYGDW71hNqYNXrBzzrGr6wNSf+QbBtgBoOl04GLROczudP9
         AJO3g1Ba9Wa0Im23zJtw8DIg+DZnH7CaMYGAKkgXL8CLokh/6rN4gzi3OWR81VIrtF+K
         s2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462530; x=1764067330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6nZJDhL+b3hqBmix1XTUMYSlxyijckm2XPwS9IOLjs=;
        b=EDt2HGxYbjOr9pPWeT1Mw9Ofr/BISXvbVvIsK42+6ek8k4wyoS24MOReOSGtT667Kq
         I8w6IY+eVODaaR/X0su8TZpgINDG1ovh8rbbQVgIKDhcMB9kK4A4QpKmo6P/rqw5woge
         OxjgjE/7QrZy8pPShugO90OnOnMDGNtrHcKlXI9AqZw2PGpxebbgrCge+5MdNDQBG1ix
         cROTXdiIfBGJpka3w4ocxz5y114P5Hj1Q9qpBmVjoGqNZb3xm+Vf4tdtJRHXkuBAchJz
         cgrkg+3GV+3V6wjS2900N64qNge5GPA2EWStU5c86WJG3TirBGHcoDa01Y3Ow7ovUnkR
         +icA==
X-Gm-Message-State: AOJu0Yw90wdVcRUiIz31BmbLMtILoWPNhzCOcfTsuElKA+onZMmntMkp
	hsP2MBy8V+5DanILiaf63dWfkwrqPlTExguZANlnguL8YPCJmzWfKqb2JyjP2lOm+LVw14KrbGZ
	eJGYTtSOhMMpmkA5AuXvekzmqmZ7zCVvj4jHYc2RtZfzLIX2Oe/KiSF5Wky1M/h+EtFnuBJkJYn
	Ygb5o1ufq0Ss3DrT31chg=
X-Gm-Gg: ASbGncs7N9Q/EWv2tz5VVjKLBoR3ro5KUYlNhLR7FckJrCVXvN5GmdhWiOmp+3NYhMS
	hwAKgWM1LHhIK4bUtrHZe2vnM3VRFkBSgkFBMf7CARqLIqpDiLqL+lCgEUZVs0MZ1T57+aqBHpc
	u4StGdQN+m63DLfy0DM5nTSJ5yJYtXTjSOTlEOj576zLEPQ+WzuCdEIqmQPnDguOiwTIxeMo0sD
	8wfDNiqEsJh9glb/1DzLqKLvysuUywT4MHdpPDCVzNyBlLvLd89H4Gziqa2+TjWHbXoSU72bjBE
	1vDWqYZouLLjzcdBHvdWabeqQDgjcfLQ2+XO1SaAWwtysJ9F3+OjH+CyfXliWCgE1kLinMisXJ/
	2ZObV+s2nXR1cxysYKiW4wgarAxLxaaRJhjxksDzc
X-Received: by 2002:a17:90b:1c04:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-343f9ed32bcmr16562957a91.15.1763462530489;
        Tue, 18 Nov 2025 02:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbyJ8g75R6luCZmGbvZFCikccHxpgtL2LfnqU1C41le2uGWwcJXgg/o+ZLAeiC5+gJXJjv+g==
X-Received: by 2002:a17:90b:1c04:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-343f9ed32bcmr16562859a91.15.1763462527497;
        Tue, 18 Nov 2025 02:42:07 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794e56sm21680725a91.10.2025.11.18.02.42.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:42:05 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/2] pcp: Fix contains reference to TMPDIR [buildpaths] warnings
Date: Tue, 18 Nov 2025 16:11:56 +0530
Message-ID: <20251118104157.529919-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NSBTYWx0ZWRfX/nJnLR0TquDu
 455tOMMckh9ckYjDM4uPnT29/MacI4uya5LczodYLf6uyI1WMnAidM/RjWS0y3XV/wrxJn0CDII
 1eMUCLL6u/CCcf/mzhDcrlwn/2nR+OSiQwuoAaPv5+pc+1xbmTsvLZGydjRUTY7n39LEYNKPGvz
 f0xlMF5BpRoewQxao8vq/ojguh4Pb702xJYTFB2EvCHy4jl9sbn2600Mp0BmQm/tSp2I8DHXQeV
 ynjMPSXwfPyCY63sV6TYd79sGxxtPmWYHi6o/gTOorRWYtsUKtz0iRiTaU0/o25WLgmmeormN7q
 RcMg7ur2B2s2zfS/EmEbiTVftw//gqWiv72zf1zBe3b9Vs/so44qNZYd0kfN3H39Nv0WB9PuKH+
 Lkva8dLGS2bgIa5Ag4rAFl7k/cu8AA==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c4d83 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Zm9fJi3mXHLsRbfmGd8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nQZDmdXchZccWGODSFvtEKVLIFJgeCDt
X-Proofpoint-GUID: nQZDmdXchZccWGODSFvtEKVLIFJgeCDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121849

From: alperak <alperyasinak1@gmail.com>

WARNING: pcp-6.0.5-r0 do_package_qa: QA Issue: File /etc/pcp.conf in package pcp contains reference to TMPDIR [buildpaths]
WARNING: pcp-6.0.5-r0 do_package_qa: QA Issue: File /usr/include/pcp/builddefs in package pcp-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7053ca6b6790dd4de11fb0e9fa10b1fb4801dbf)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
index 6a93b2ec90..92d6bee89c 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
@@ -93,6 +93,10 @@ do_install () {
 	sed -i "s#PCP_SORT_PROG=.*#PCP_SORT_PROG=sort#" ${D}/${sysconfdir}/pcp.conf
 	sed -i "s#PCP_ECHO_PROG=.*#PCP_ECHO_PROG=echo#" ${D}/${sysconfdir}/pcp.conf
 	sed -i "s#PCP_WHICH_PROG=.*#PCP_WHICH_PROG=which#" ${D}/${sysconfdir}/pcp.conf
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}/${sysconfdir}/pcp.conf
+	sed -i -e 's#${RECIPE_SYSROOT}##g' \
+		-e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+		-e 's#${TMPDIR}##g' ${D}${includedir}/pcp/builddefs
 }
 
 PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
-- 
2.51.2


