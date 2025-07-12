Return-Path: <eric.smith@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC25C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 19:02:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42347.1752346976083338562
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 12:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZK1An7Y4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: eric.smith@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56CHRFN7017425
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 19:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ef5RnIbRs7lR0Pb+KrwRQc
	kjq2S4Gjzosz0iqWPEF08=; b=ZK1An7Y45puv0yCKdHaBFMwPGHvvAdsbnYzqVF
	cEgv+54TyqymEyWxY3XrAwtsQa2a49X3ztXuz87bbL27+4wZ3sU2yq9T61QPbzu8
	8s2tAheUTZzP3J05MwlvjCPqgoBZIPMlq/SkUekvIq1fONeuQjtFgzQ5yH0ee591
	DBw3TUs1Fl179YEYJarne9G+6aFNrJdm9U4t6HE6e9anv34L/O8WZfrvkrxfi5LD
	MSg9FzMSP74RDG+MMfOasRZgsWm++Nt60HqJxIUHo9kskBTTFY71/6DhoEYZenMq
	ehRwzX0/FxVjCBDeMJOt39bR/MSFgGvJAowbKMvKmp2BP3hg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftm91fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 19:02:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-312df02acf5so3410277a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 12:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752346973; x=1752951773;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ef5RnIbRs7lR0Pb+KrwRQckjq2S4Gjzosz0iqWPEF08=;
        b=wwRPIGEdn1SG0Obehr6AjhJns7MKYEQhc6rGZbd3Da0CA2q8oYkGfhM/G9SAC8tz+V
         0kEGrHfl4v2FxL3WZMmG7t9VS1zmq+70h+xpIy8IW0AqlUUrqj2J6EaAT7tNBCm/mIay
         ZvN3ZDMOZ1vrtmC90p+YW+ZYs2LAAwrr99hFsTV6q3V3tlyabBhquexPL+UkegowuJY7
         C22FKHNjmZ1aJNaHaf1B5eHpDLzNYSaJk/tmAkgIK38GKgtU+Ztgq7VcpvQ9FO0aONJm
         4uwcHdnyyWx0Wh8a7ZgHvaWQ7Y4G2vb/QrBTh/8usvAHvI4Qz+CFXV6l3MOm9DurSrov
         +S1A==
X-Gm-Message-State: AOJu0YwO1RVfuXCMurQZW2sV/esUURvZUTWRaPcmJBLhWuV5R9+u3Ezn
	3J6J2fGsDjYCU0XQoSh7M4f0Mf41U47LoUDEgfWfrEJW387VNaqmFR49b2o0R521BykcUW0pIFy
	vlvDCsYNwxYOMvLsFMzbLNvkG4jAAweLFi6n4JnkPoKn+Kmc5SKrD3dDTS+2GK+3zoxtJnQ+zhR
	mCxv9diWV+MKUfHjF/
X-Gm-Gg: ASbGncsl0Cunw83nAo6oqd6Ztb5R3bOcMiHl/gpJkz0y6QLz0j5WJzHaZbTNPMNQTSz
	4TlaRZ71dLf/QYLgWz9nc9MNwW2ibiuEQoPXiIt6rUxRtZ9cxA+m5ZC0X5R4lkSeRXNyllKWdPB
	C/y+igvHkHPSqekTb0oo/W4OyZxBFw+qg+6MVlH58ywMBciSNbwhsMx/YHJoSotjxS3uty4zJJ9
	DnXjJ4ANSPDbPvCbbsnFNpuyjOaQ6XRKr8VVgO86Q0p3FMdVnIN2//S8y81brmJLrz/PDR4lsUs
	BZ+bT1kZ7gcCZbLho4phly8sgqaKNfF/yZA5w5XfiYGba3dIPfoKlIal504PrqeISjlVUchxaDK
	vwZtj0C1FL/DJjkeTxfz+A2G975VW
X-Received: by 2002:a17:90b:5486:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-31c3ce231c4mr19258057a91.0.1752346973528;
        Sat, 12 Jul 2025 12:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfF+5KjjPVt6F1ZjtpIPo/kcVH9xvx1pu1CKkfXzWRDgDVIfrSqcXQA5XwjKfXnH18dWEHmQ==
X-Received: by 2002:a17:90b:5486:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-31c3ce231c4mr19257995a91.0.1752346972785;
        Sat, 12 Jul 2025 12:02:52 -0700 (PDT)
Received: from [192.168.68.122] (syn-172-088-074-054.res.spectrum.com. [172.88.74.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de434d5a7sm65454745ad.204.2025.07.12.12.02.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jul 2025 12:02:52 -0700 (PDT)
Message-ID: <3e08e7ed-396c-42d5-b23f-c5c4640f5785@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 12:02:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Eric Smith <eric.smith@oss.qualcomm.com>
Subject: Tools for gathering system info on target
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=6872b15f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IL2Eezqh0HFIyQ1nAhLbwA==:17
 a=5j3fZMvRnAL0m63a:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8
 a=3GY0IdL10QuXOPOcHVMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: O5fgHHeCT2wnLNzGApeKejexotuUng3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDE0NyBTYWx0ZWRfX+6Ivc7wASF1u
 GzYzxzsC1RJIY6CrPm5uvPcapW4LWiZRmD4MU5bh4Av1BIL+BmatCMkKwBEHSNnFqI3hGbKtAj+
 CIYydPxS5gGgGTGONW0gtlkBBVccqVA3DEsw06cugt11bl2G408ESFaS+urZIpn4ijQf1qXmRyL
 qnh2wXH5ilQnydmzFbRF+uEK7BFM2AA+9c546c/MYd7cmMTvK+bFPBcUAcZ0LecZXNMJ+27g1Xm
 AdnmCMuOTPd6/HvuuqkmmEjjgKZhRzo2qdVsXlLqF5nk+4th1oh4s9VkUopJvKHxGpc2ZUH6Soe
 e9Yk+W2jzsthnKPLwL/sB8F6H+KDy9pDTVgAFdIMoF/TxbP35z7XSDxGV4E3tt0p7bUpJ11idNn
 LoHlO65FCVySHjapjVM71PNbcYy2ItsoxhzAcRaqsopSnitLAHexRsKUCIqU1f+YQO/qUCpI
X-Proofpoint-GUID: O5fgHHeCT2wnLNzGApeKejexotuUng3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-12_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=996 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120147
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 19:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118487

Hello,

What methods / tools do you use to gather system information on target for easier troubleshooting? System info like procFS & sysFS files, and output of various helpful commands like systemctl --status. Is there some tool or infra that's already available in OpenEmbedded layers?

I was thinking of porting sos report to Yocto to leverage the sos python framework for gathering system info. sos report has a --batch option that creates an archive containing many system files and outputs of many commands. sos provides many plugins that can be leveraged in Yocto targets like a systemd plugin which saves /etc/systemd/system.conf and other config files and collects the output of many systemctl & journalctl commands. https://github.com/sosreport/sos/blob/4.9.2/sos/report/plugins/systemd.py#L26-L57

Thank you,
Eric

