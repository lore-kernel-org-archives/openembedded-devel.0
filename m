Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA284CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:05:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.5206.1758164699606569807
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CW/Xav38;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGLMen027077
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nVHsj3EiKld
	pWcjVwDqHdbdntKc9TbngL5XRLwvgfyQ=; b=CW/Xav38n4IhIAapySK5wNJTKER
	7NX9MAIlAAUjvX5jF0D11Js5T9kVKQ2kGmcuolGXorLhQ3YXW5gHPuXQMQtLxS5G
	t4m7oKk5azJiJTAB7I/NC27GS8sa7vyUImEKsX6OhmSUP1iFoBK8wIQpKWTyvYnK
	ANX60fCkti8eshXJkTNnqRAh4UZ9kCCQl3plEt9KoIhA5px2DQUe6zi54fiHMow8
	dEQ33fJQJ3T+ibjSpsrIbswTWqeIcCGOBl6ORLLvvPlAtjiVmNhm9Pmtx5/KqRCn
	GwTLHgdKPDx/8Omb6t2i+xi/RaefYqTXS7a5OvVEiGvEm32lRfnuK2Tkb/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt4qmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso31188591cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164698; x=1758769498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVHsj3EiKldpWcjVwDqHdbdntKc9TbngL5XRLwvgfyQ=;
        b=oooG3p+OZOITmd6hvq/mMroR7fIBVzCzX7nXQg2/AubCSzu8lCg4wZNHFNpmB1+HX3
         40f23QYtigz8E3lbpyXJgvOwXn8/a38GNk39cKNa8yBWONRJpWwWie5Lmu7Pl4sBqmex
         /LIFY7ak9Z/GCKiYmUf6sOcXWiILKe4ZqadYO6Klk20SS/BZK2mzeAsiV52rkl8aB5em
         LqVkGpX69CMXB/edk7/Y3py6AKdSlIEJLs46cePslllmUApJWuYDahUsdnb5Q4a7AhaC
         4VWL5V5dH3kDga9iupiys4i8jGIxxK7Y6SPUGRIou4MGnpjPcgiNMbDZo4Cmyukx1Bsu
         /EWw==
X-Gm-Message-State: AOJu0YxucpgExhjrrs/Pf8yW1FfYHVo0HPsdf3lccvYNi5qR7uaOa5t3
	LP2gAwcwAuY/1pXIUGWKHX1SVhRjyW4BjzivbuUvD+HuXquccshfkZB3aTsE/9rZ4HrydUpROLa
	NL/Ilkszhx8u0HJGfn019KqnPs0TbWvpGAKKs39EfnhvX5Y3ln56aKb+zMcx/3sCFxU7MJykPBa
	w5n6QvCDID0/O3OYGg
X-Gm-Gg: ASbGncvYbmvGrj/LfGdIwgEp/PGa1IJ74a7Uax08I7E1bqI1xRnpO3tYpnv2mEDgX7i
	q7klH6lFU5f6g+BgwEjf3tl3OAUhmbLPScnwQpG6Cs9D4jMupHs+xJ5oALOvbqxfhGAhArEecaN
	/ibvlErGgRiJWE6af3MxXFiIJlRCJSZe/a7nV50fbXLAqj33GhIDWVOTCnsjghrHzpomC50t4Cv
	pAL5EUqrfK24rV0sVyjjzUO413Ekofn7n4xlDa8rP07lFYimaTWT6cLVC1wlSNnhUpKFx+FoOrj
	W84+u3SJDqLvSnqeIoAJquXk+cvZQzoZI/N233BiSsLmFgzR7fhdLNNQXSe3WxFSj4R3vteQMqV
	oFsItnw6lmsVH+3kaCj9SjnBmN4EetPb3W42dMqRwdsPxbR1tvx7Y
X-Received: by 2002:ac8:574e:0:b0:4b7:8d1c:10bb with SMTP id d75a77b69052e-4bdabc051b4mr24780821cf.34.1758164697660;
        Wed, 17 Sep 2025 20:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXwNEVW7SW4Zi3asfMgNCbMnNJFGGnJjFSKgK688x4vPYuyXP1EwXhW9ftkpwG4A2Rob585w==
X-Received: by 2002:ac8:574e:0:b0:4b7:8d1c:10bb with SMTP id d75a77b69052e-4bdabc051b4mr24780481cf.34.1758164696942;
        Wed, 17 Sep 2025 20:04:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d3asm315572e87.141.2025.09.17.20.04.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:04:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 4/6] freerdp3: depend on virtual/libopencl1 instead of opencl-icd-loader
Date: Thu, 18 Sep 2025 06:04:48 +0300
Message-ID: <20250918030450.1507801-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N0vmBYRVuaWsvAMpBBw6dXAY_cXNNCkS
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cb76db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=VVGE9-2lz7OYba4OEIwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3qPpjV3wXF+X
 XDC/NAoYj2Y1HzO7lXKUCOaboT46y4C6TUyWDa/KeOL5ejsLwG+77GPfFqweDikphn7qM8PyapX
 yfm6s0R0T6avOFY2R3BtqZKyvcLZEGxRgU85cIuG4CWrJ4PssyD81Nn2KCO+flcngVHjngs06U3
 uKmg1/u/n+pZR0cLWVqKDYF90++sSzA/YVo9E+uqyzy+gqQJdMc0E/bQQ0cbiNETZR0C9GsYhIl
 4xUVVyaV1DNDzaYG53pwTWLcrN0jL9h0fGaXzobKjD3fiKpg3cOm5dLNjHt92s+uBTRFl7bEnS4
 IueFAtwkvM0GHn60ggqMZBuu/O/MECmmrZQZD09E3VLU2tCcwzfozoN+a7SfXgQO6AQ5TIC60AW
 0AUzo8Un
X-Proofpoint-ORIG-GUID: N0vmBYRVuaWsvAMpBBw6dXAY_cXNNCkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119510

Make the package depend on the OpenCL virtual package rather than
the exact implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
index 93a9d15aa7a9..a46eb4d32c1f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[manpages] = "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, libxslt-nativ
 PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON -DWITH_SWSCALE=ON, -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF -DWITH_SWSCALE=OFF,ffmpeg"
 PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON -DWITH_KRB5_NO_NTLM_FALLBACK=OFF,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[openh264] = "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-icd-loader"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,virtual/libopencl1"
 PACKAGECONFIG[lame] = "-DWITH_LAME=ON,-DWITH_LAME=OFF,lame"
 PACKAGECONFIG[faad] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faad2"
 PACKAGECONFIG[faac] = "-DWITH_FAAC=ON,-DWITH_FAAC=OFF,faac"
-- 
2.47.3


