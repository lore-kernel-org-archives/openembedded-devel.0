Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96369E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:30:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14377.1771428336928791638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hF/x4eJ+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=W6CiLfKp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBUoof4060324
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	plB+HA0gcPbU5xtzqMy98RHo/H40FanKr3BIshkpMlU=; b=hF/x4eJ+M3cCc5qo
	aCIk5ZWB++IH95KZUWdsuax29c1OYTdsZuVS9pMZSht6fietjPakH7WQh6DbZIQb
	t6qRc9wH+aooMP6C8QQfqdI0GWeqS4fpjPe/U3Yx1x9is0zKLL5xVDcQfP1ilT8Q
	K26aoepdctL+q5QrMUWdOFkemCd3de5+M/XEN1iNvOgAykWb4IkDGMaYQN81pVwE
	HIVkT1wnHC03lsucVzcCYB6hG/H5mOF/UeoywElB2eEsqGoxkKTsV/qTddDs4ecj
	lMeAhSGDYYz4w2ndL50YvCBcOXo483qmCjds+nxevAnJWeW3et2Y5tEKPFKZ92JG
	MrdgUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1qx25se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:15:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so595073285a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771427724; x=1772032524; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plB+HA0gcPbU5xtzqMy98RHo/H40FanKr3BIshkpMlU=;
        b=W6CiLfKpRLeogJ81jv1kgh+C8LiUKC7tBCPUwd3EiDgxbCDSkcDqQSV4V8YpqDVxZv
         egGMX9qNuVSEP7n072t6eoQVTS8HNcMNkjjo0NaYi47z8gEdFJqUNFxSJx1Wd/17b1G0
         gKEO1bTmekohZIAFyMTy0nKYLzPTvfSI0EIzVCH55XyvCsJst+hxwNJsOJ+N628d9oyq
         WIKINynd3C3gBHX/8RBjXYTaCWBm02tU0bEeaERitb12Gf3TojnTHyII26FUAF8ca6gc
         9gH/cHnI68OdKR8itWSA46Nk9XCOFYmvOY/+SXreTxIRLjsrGu76GcB588qMHG0G0jYV
         R/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427724; x=1772032524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=plB+HA0gcPbU5xtzqMy98RHo/H40FanKr3BIshkpMlU=;
        b=Eas7TQsYuo9uL7VWOYS+/EK9P7zc/R35bRXhDayjFq4K1rFv3KPcNJv3NDxd2pf4Lv
         YQdY268VB/Ri95GgipnqDRvzYv5qgCMn2nEcRhfMLrgUfaqTb7EGp8m4jXLwzLEtmv/2
         1QIX/bWTUyWV4RJGZMKTZ1z8++K6gk8xOrWq9XhasNcyKnrY2PIaPpNUAem2jp5M+S+P
         48spGHK7j7KfNQCkrWWArOMtDXtFVNEXEI2yb+RVpxgXwTTpXjE9GQQLFIdHQ483Ix85
         vj6rwsirizolYxy2/No61oN3v20sYQ9FyCYN9ChtyBWaUlCMfHwo6Q7xshZ3eepquojy
         2F/Q==
X-Gm-Message-State: AOJu0Yz7oF/sVEgwsxru7XBsO+qMizmUTMoJe1rWyCeQoQV0D0vfPeSX
	qeWvcjiv4uHUH8ZDCZPgN6meRou4CMEn8iH+7eH81QVrzgMZQC176qNOnId3TIh+xl7qfqFamYk
	BLNlpSFy2JFJh254oS5wULHwnx2nrHpKPolqkDW++B1Ol6Ok/zqjOMLf4mvyCuAcn62sCcsoCag
	xhE0gE5hxI
X-Gm-Gg: AZuq6aJQ/SQjdb2yHvpKnkwxMZGvovVyUKzuhnCaX+/FTffK+zioJtr8Y1dAWc5Quqk
	lsUADgwbCQP4F6WzXoyM51fLxcVCRi7G9LWI562oGIbxYk6xtLs1JDfVg/4Px/Ro42qMv0iZDQT
	bWpEt0q4/YdsPsl1dGw37marL8ggRIpmf09Ndkx0Ttfojz1+wy5H3eajxDI8bhNfeMchWcQyVyg
	pHxYUC98TZKmQ6Ik92uRjX7bJ8Q6dLSq+HytvY28syPp4cNmDlNBASECXDF9Rk3oqUOIsAQ6v3L
	Uoc9xlLryeHryP8a33hwqSjluGEp06cuSr1dY2EIH50TAECzqlDcG9aKwBCINACMQx5hbsuquNE
	+8OsoQ+WOyi7zneYQaIQDcbKPkP7iApStPg5hDTYGvWuoWtWjfQkC
X-Received: by 2002:a05:620a:4107:b0:8c0:af6c:fdfa with SMTP id af79cd13be357-8cb7401ca8cmr241561985a.3.1771427724146;
        Wed, 18 Feb 2026 07:15:24 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:8c0:af6c:fdfa with SMTP id af79cd13be357-8cb7401ca8cmr241555785a.3.1771427723539;
        Wed, 18 Feb 2026 07:15:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1503:4cda:107b:9e15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm912573265e9.9.2026.02.18.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:15:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 16:15:04 +0100
Subject: [PATCH meta-filesystems/meta-python 1/2] python3-multiprocess: new package
MIME-Version: 1.0
Message-Id: <20260218-gpiod-sysfs-proxy-update-v1-1-55ccdc46b0e8@oss.qualcomm.com>
References: <20260218-gpiod-sysfs-proxy-update-v1-0-55ccdc46b0e8@oss.qualcomm.com>
In-Reply-To: <20260218-gpiod-sysfs-proxy-update-v1-0-55ccdc46b0e8@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tC2A165ScrNxIp800BYBfMjuB4wkBCaSOL9NY0D5Q5A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpldeGQ6mJKuL2rbQtlCH2LcVg/PHZMZ+e5oJXo
 6I6EklXU32JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZXXhgAKCRAFnS7L/zaE
 wyclD/9jJDKlUEAqdyXiN5IlMT3JW9jHuILi8wC9V6dJmlxcJ3RArLdW/EZ14gN30fWODI2+cpO
 hLzUk48LVC5MJ/IaYuY+JkWUBpn8w9GJnJ/4HYds1+h6jaJXNUSsp/3MBSs3e+dOglya+O68rKN
 tD3y6i9adZppJXDkxJvmuAXOSLHc/muYITrinyID5szwNVwk5HAChPAhamn4+k8l3vkOr7ska7z
 Jk7x7BxddDii7kcX7RcbbrlnNoisem4Oj2q2XEiPr+CEsprhDrpkBnm0I8QtnZH1taF4bGQBDYC
 bzTND+4fVtgCkn8gI76z2sesrEKnN6gkuI048u883rFNc0K1dU0rzOTLk6zSNbotGWcqtgQLcT7
 DM6n1jrsEsyr8ZnC8OGWSQt/GM5nA+F8pUIoDDtFvQ6SGw7f9RGr+11c4l0ZS5MkcmcjsuR/q0D
 zpofbktkmUO6B9S0mJVIJh8Xtg+AJQm3AAskEzSrzzljHw2/1dKesYg1K24PWS89VPF/DzjvtIX
 Rcw4+I88IJ5D0Z1vZR4aLc5wbgTBjoQKYxNFpVHKpNcF9Ng2MxYsuG7pGW8zLOAJ3aL58GbkWCG
 PJ3NvKaZBZsNGJ5Q4E76orTD7T/9tTgWjeDlIgRa23/WIH3d8Sl7KKBXsTuiLSGZgeLEQ+8F6Ah
 38Lci1v3wdrCn1A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: O4rvmbM3N0CDLLNowA8HoMJWcd27TUnO
X-Authority-Analysis: v=2.4 cv=R7oO2NRX c=1 sm=1 tr=0 ts=6995d78c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=BZ10MoEx0nvxIEMsPNoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEyOSBTYWx0ZWRfXyf1Y1epfwxZX
 KLhwAu7UsdbtEL0eEj/dhGEi10ZoDiZgg+1UIGopfTbtYLW1gPSFcfnNF6d5nhUByup7miM7sIs
 dfrarN749V6DhObM2XHDulaRosnWnEOuahSdpDOfsrGlR1jCKclTjHr87Wn4iKWnbx8bUmNun7+
 1j7IFsQioBVTWSa6kLeQfvFsLB9Els9sK7IiFXnUQXY6kLXbvtEST7y8ymOaDVj/+4pWwQX7FJL
 VYgXzz2v+IkQPpjZ4Nb3wn/ld7B61QOZb4tPVBQz8jWSpB2wo2+IFaDHkaeUVYRuJTXDrqk7aZj
 OpudJpRD2uBQsZ74SsUFszIG3+MBpS33TUumf3kgg7WuqpN+BshPE90qleThYw7+jX0ybAz+qTo
 CLZayM5cwS8L08mfr7oDm1UOGOyZth1PTeghV8fNOkySvxTAxGpFXerP9gk8zinU02Jc5fFu9h6
 8uwV60vmMF+jRpJkUog==
X-Proofpoint-ORIG-GUID: O4rvmbM3N0CDLLNowA8HoMJWcd27TUnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180129
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124484

Add a recipe for a for of python's multiprocessing package that uses
dill for data marshalling.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-multiprocess_0.70.19.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-multiprocess_0.70.19.bb b/meta-python/recipes-devtools/python/python3-multiprocess_0.70.19.bb
new file mode 100644
index 0000000000000000000000000000000000000000..394945df1b679772b3112374a53a16cc6dc363b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multiprocess_0.70.19.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Multiprocess extends multiprocessing to provide enhanced serialization, using dill."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4e77a25170a36f151649917fe8d2858e"
+
+SRC_URI[sha256sum] = "952021e0e6c55a4a9fe4cd787895b86e239a40e76802a789d6305398d3975897"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "python3-dill"

-- 
2.47.3


