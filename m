Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43460CD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20193.1779006243033558131
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XtLjbAmb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HWb0HurI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H0kFwo2419202
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8IC+S7frFo
	Ap/nvkMZPWr0NtjClvzZ6XSup1BqS1yA=; b=XtLjbAmbzQP0kvznV0KnebKvRLj
	b6hMHhcW0h/RLgsIgRCuoCNB2NsnAwwLowWCzIYO3AVyq7w9Znt8xUrbBPOZmusf
	GxCILS+GkIS66Wt1S9hpn3qscf6TKmQPZRuI8ACgGpem6Lt6Il4mWitlUhopUSCT
	AVwZZk9FP6SIbhsHmecIvYPRFy8JaTl9kD5UjBvLW99Ucy1VSbRPJ8q4JrQlemdd
	fMRo7ZohfnV+cYvYnqNavE74qN264yaYyFt1UeSTo2bptIHpSzZEBn8QN0EQxXM4
	RP1bSIyaOuZM5/GStooFJPWSdRDtkTeVDV/0T1pX4+JqAnp0fNpX36/154Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchcau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so958647a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006242; x=1779611042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8IC+S7frFoAp/nvkMZPWr0NtjClvzZ6XSup1BqS1yA=;
        b=HWb0HurIoggM0xWZ160X9XDkmMnrnKdojJZk9rRd1YcNklWkqMNmlo03dEn2zDoF8h
         nuqHvbkpcxEDYJ/xPdnkYWjJUuVYgHS/lH4nIoIBG5DBKipYXN4Je1AMSUNbcmcH4fqN
         GtUZ9P06Q5Y4SUs6PHuF8DB0bue28EQO424e67DCi0kErgBKQRU7z1nqbuIgUk4BEKpu
         Xtf2c1PbIxfajpRqJK+RhgORWt/lyKa8WvTqmKjU/Ic12kUVqGcYzDfwZsQhDp1SriQQ
         zfqxfEHmDAfHVddoXr86axj9Ey9MevRNPgqiF+qv1R0hgl2NT5Bi6M5eM8pU6uESMvXL
         ScPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006242; x=1779611042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E8IC+S7frFoAp/nvkMZPWr0NtjClvzZ6XSup1BqS1yA=;
        b=TxVHCiG/9CE+Pdwu69y1EUGtdG8aah8+2ptZhkqFYQI8XJYI56PpMx3GVXwrpcjY3y
         6N+zQ8YE6QZk2Tz3Ien0ENyDFY5e6RYTtkDdwFodzCV3/w2k5vF4vsx2zfNE8Nl2OUpv
         rN7wKC6bdpqDhW9yiTSHUGHi1HdautVqNNqLqN5jwsPTO2RnsXl6uCpm7ugctmSfzwqR
         OTEvWua+VEHXS/HP5c3/mGfcgN/qDgEbJaYuwElIb0erQQaNktdmEHkmt6pNICKa0DPO
         76RxHTfcfx0dLmVAJ2b011+uHvrtWkskLHd26/tQzPrvyF9QLG2e1qT84b3GvL2mARaK
         PZnA==
X-Gm-Message-State: AOJu0Yzf7+7SruPs7YCUJPfn7ocwxwiJXMs0E+/t+lMl6BW/uupA3j+S
	uh/ObAre//8n/qCUBpPMTAw7qNUYFjN+bXouMGgzpLMy48alRyB4FJkhIX3/Kh1Cwr7ZSit+xQ1
	8aldTwc2ePyxyUgwsdyWMH8qWk9mHk5ZaVe00GczkLhtyPNWgi6Mj2FJybSBKd3ejOL3Xkv+D/O
	py2hEqChl8x5Pi2jJWli63pQ==
X-Gm-Gg: Acq92OFWWbv7cjuBzOnB84AqiVkv9R6cJRH/UMBuV8lKkFKQOZWtlKme0tXvOAJ6cbK
	HRwO/1ikXdZIcIDpAGyxvXcFzHRk6NWftl5m9X/8eff68i6NX0/DqLCm8n+bl2CO4yal0FoGLKr
	QWe+mK6RCIGB4q+KaaaZP/p/FvqUvvTW2r+yU9w5EX5fxtbbTu1SgvdrO0RSJgoB5j5AwpSNYr0
	nfKKJh8BpYC+15qj8IBM4TrZYlCXbCN34UdVMWvibOyv7hKrlifetb8GHp4WJtlfmvmI7LEOSl2
	1kpSviRKiqwT8ARy1B2soAbgsOLWe4DqGN3h+SHzZLmY6sLAZa2hbZgLyebVyieXGrv4jPpqZ/T
	QEb7AX3Kw4QQQlQ5l4l9AgeJEEimXS88HFlNqp6y+GS2au3heq+Sm
X-Received: by 2002:a17:90b:5290:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36951a02b73mr10831855a91.10.1779006241643;
        Sun, 17 May 2026 01:24:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36951a02b73mr10831846a91.10.1779006241138;
        Sun, 17 May 2026 01:24:01 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:00 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 01/29] libcoap: mark CVE-2026-29013 patched
Date: Sun, 17 May 2026 13:49:29 +0530
Message-ID: <9c27658068eb7ffdfce193cfb3be8ac9b93115d7.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n9puvvDmOqSHmn_WlR1iUS89UxR4rF-B
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a097b22 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=PYnjg3YJAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pmH_3OVCfluR75PazbgA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: n9puvvDmOqSHmn_WlR1iUS89UxR4rF-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX4MX+G/bIb0NP
 UC6rnj9lH8UNzTyJ1/z6CNULXfB9BMpgHQPb3HL7t9yJIc6j2JPDKi/CABWycDaNOHwx/7fkiUS
 dkNyEKaZQpLtuopcYIpQxxG9bP0pSbYi3W51wYKj5NT/tRTqgdEwwu/Tnn+U7xjA6Mu+aL6kaoh
 PRSeSWZ5vXzjPDRgzK/gFHlbnaatjl0qBougzVhY5OalhOU/SVnjGLL2yiPDtnUL0Rv4MJWQSwO
 C2YsXhOSrqIKmqnyoozncuol5QF7SJBLA7IAcFqvaPw9Q4PZvIs5P+PL6CWLOUr43inExnM7Jsf
 e5u7FUDUL5oYtz9csgh8TOiUII9myMnfQa81V8avVGsbPW2nDU0ArZh3uqVCFTQYmX/SxB283Di
 ar9kExUrwRfdUWYrnumGwX9aN92EsHd+q0iCfc5AeRhaVYXGg/8v9Zt6fFR9DlBu/d/wKB5Isdf
 xd1I12nipGuqkNDVsFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127014

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-29013

The current recipe version contains the fix referenced by the
NVD report. Mark the CVE as patched, because NVD tracks it without
version info.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 39e99ad532807f99eecb8f80fc3415ec5a9d773e)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index e7279013ed..7ea3eba1b0 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -64,3 +64,4 @@ FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
 
 CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"
+CVE_STATUS[CVE-2026-29013] = "fixed-version: fixed in 4.3.5b"
-- 
2.53.0


