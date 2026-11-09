Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9275.1794189645147861377
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 18:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BzoGYjLV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JL3j+2Jz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H0rC3849931
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 02:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Be/AVELQcGeF8CHLyTa3pkXkxuK8Q9hP0i2VNZY/ONY=; b=BzoGYjLV7aFZxGp+
	nQOp5n9Rh65x66KbKI4iGwPxwA0hmGgm0NnFY+bDd2s9+5ddS/D0u5qxdbP5dDDF
	pdnvFtV9+MBFdS+O68oqPiyrbVlyorpX1ZZGrNwKfuijPf+Bxql4jliaS604uCqz
	VFMXPYftyI8Grx11ie5xzmL0ZiRtVPp94aQ5wLncli9VixU6TH76u5BIg87CGcYm
	7EDN5QU8aRMvJgAAlOZb3FeC2qZCKihQvnQ+rhlryPahkO4/hZv50AZBqE6gtiix
	6NlRJvSUwjxH+on4qbuV+WG+F4qQ7A+6y1XjwI6VjLqIdqdHAI+195LS8LSkPrfo
	BwbJRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf4jru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 02:00:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5364605e74bso14272851cf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 18:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189638; cv=none;
        d=google.com; s=arc-20260327;
        b=B4RpuE8h3TRtwmy6597iY7u/QVRLRJnzTVa2Uz+oFYW2gq+I4bNVuAXIoNCInxMBpg
         WPiGSQcfAIPIlNZyL6Do8xS/smqFGdTm0en4IcApddzhTqBrrq0GmXU2arnUPB7FfqCs
         MLjHl9qj+mIjRwaCuyhuPbjU4Camh2lX4TayLKmFCokutBLc+R5+RJz3rkWIIiNlIvZF
         tYNbxA3fhDwrJJSL3ht/zAbkQNsDz7MsiCDITvOTUo2MIwhngnENG/PtOWf99MKCmc9M
         ltWgAxiTPHRochO4HXzaFhBYqDuHEaCQYSKU9dDnkH6ffR6TIDiu7XyWEHMZZxagpI7A
         lyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Be/AVELQcGeF8CHLyTa3pkXkxuK8Q9hP0i2VNZY/ONY=;
        fh=VD2Xf9JlQuLMcCcvtuDQCLVYdA4ERSFPUZnFrsdABUE=;
        b=RmyaZS+JAEQmnPEZZdJZxDZ8RyW7sP63L5m9KKt6dmvQMF10gVILc9AmTBm7G9mwkV
         k8XQj3VadEfPBod1ckankWazyJNHlANGINRRQpp6/hM/IKm9TzDaKoydEyoFp1D8QVPF
         ddC+z6MbfKEsk2PIUk24DfDm0to8KtBb5M0LzELEtb6sX6UUSsPqfEQ4Wo3H6rVbZeLl
         QMWGQEcZ/Kmw6Tez9bFHuWNUfOqGtUelVFRCYh2bPk7Mnw+CcI55eteuC+lg0FzodNrh
         Cp9AfC8RafHYjoIH0e0KNXK3rG0h8w4NDYdprstXuB4avfyFEuZgvohust9yUQItQAsM
         ywkw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794189638; x=1794794438; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Be/AVELQcGeF8CHLyTa3pkXkxuK8Q9hP0i2VNZY/ONY=;
        b=JL3j+2JzvNNVLQQ+fFLRA2vjny4hg33H9KgdUz6IUGJWgTFc1sT92/GZlarvl0WZE9
         Fd8o3oXE44OlUoxmGXU7PXR3ROCDpUc0fWt/Di5XUYxb9VVtHHiuzoYwHf8x6zXNnhda
         l9k368+YEpnj3zXVwV7ve8wTMOBZgFUKdcsWy9Gnnn+KsXbDCqFvdDJKJMGo1r8v8ylJ
         qQ6Uywmi437JUlASStX62Y6BmakU1BUu09+ju8k5FVED2fYndrdMyxdJ8HiEzsyZtEYC
         ulyyb0LqKcYqLLwyYCuGQZBQsbabnauzjQa8sQIsJEbYLgwNIvcMBPoKw2t9krY3oj8S
         cnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189638; x=1794794438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Be/AVELQcGeF8CHLyTa3pkXkxuK8Q9hP0i2VNZY/ONY=;
        b=n8fUjRs37DKMCZmZWTv7B3C73PPs5J9X13Ra4xV5X9xcEqsl9x2CyeJ2s3DK9ptOLn
         KXZWNFepfFu2GelW5P+SBzedHP8/Qt4pZ8zECUVMdS//Sdidemcpa3nX2HTz92lZrb6O
         sRxRkIh0fR1ki+fGVsPSOs2ysJB8QCTGIPBOhNlaCv7sLd+oJDYBuTNnYPi/WhfqKOyt
         5s1X7EKv5VTSjbIqsLvK5xUGeRJ25aqGcy0k2APN51/7tx9yPELjjw5ykVm1CGUP7kjY
         QCLqALdfy13wDmeZndJSQm90hOKmvYskKlH9btI6K9rkYUMGN7edpE0e9vtaBGLZvCTg
         K0Ng==
X-Gm-Message-State: APuU4Z9DJaPlQNqZ9N9TDFlaVKafEMwn3aOoHdrydRtYBR/0k5bGNitk
	mryPfkEpK76qVkkLXMpppXwygE/esA3VVXUg+EY+RUzMNmvHBL04r+lmNn0429EoI2mz/TrUs0h
	THpAcBuNZSqJHMu9ujy9NNWhh0e0SQFbqkwTe15PAz3hbkGVUMbtNewmpJA7OOGXTyQHKKTauvU
	0dVLqJ+5aMvlF2P1WkCS9zn9bs0+uFP4I7HdQvo7mI2rNWTpvA8TEAe/hOFdo=
X-Gm-Gg: AYBFou2Z3QYKz7XA/Mqx4WkjhG38eij3PDEkASSxuViHiCi8zeS3yLZrVs0l3vKEBCK
	Ope13oCpOiVs3lLHNVNZtzhJOWFhAJNotoHsVb1DG4FZtY3U+mwDbzPMAlsjmdrfPfMtcnae5tA
	uAo2hNyP2xNs0u55sLNuo1UMNztnfIGTCNsu1AENgL3Rd1/IyPxqh7fn+KRA==
X-Received: by 2002:a05:622a:5505:b0:536:9464:6a0a with SMTP id d75a77b69052e-552a5b6edebmr40836001cf.52.1794189638249;
        Sun, 08 Nov 2026 18:00:38 -0800 (PST)
X-Received: by 2002:a05:622a:5505:b0:536:9464:6a0a with SMTP id
 d75a77b69052e-552a5b6edebmr40835341cf.52.1794189637436; Sun, 08 Nov 2026
 18:00:37 -0800 (PST)
MIME-Version: 1.0
References: <7c7e4868-5668-4a1e-bbc3-fc78ad8197ba@topic.nl>
In-Reply-To: <7c7e4868-5668-4a1e-bbc3-fc78ad8197ba@topic.nl>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:00:25 +0800
X-Gm-Features: AclHuK-L-s8_K1sfghMGcTcga9W0KXfiY0mKItKyC1YQB753dknId1Be3gbGSz4
Message-ID: <CA+s=J=z3_XRfN-jSCEt==fBKh+2xkJswWY3+RJ0HXioUtKg54A@mail.gmail.com>
Subject: Re: [oe] [meta-python] mongodb: scarthgap branch has a newer release
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX6fQJhWEt9NbZ
 STF7bkepvtGaNbO6R71Rw9m8ASC5iJ+Kwp6kD1DgVtgreHHL7Jwt/HFvgvac3SqUeecnYOP2U6C
 7dt21FMWPC06/dS7Z5VIuNNOfvVBodM=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af1294c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Q4-j1AaZAAAA:8 a=QV1Ykh1h1aRhq4z_QQkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: H88J7koMVz8dqCFS70uXB083eyJU0zDN
X-Proofpoint-ORIG-GUID: H88J7koMVz8dqCFS70uXB083eyJU0zDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX76+lsyNfecwd
 cG0XqxTcgI3h/vLpZri62CbdkCdVvlh+rKD1h0ZI/zkLuRCH9xE1GUBllcE5dPbaOPiuHY3I3Y6
 WxoEOL52/LEokM+zlswiWBCJ6q/2jkSKc6VG3G2tcVo7KZJv7nkjRl9XzrES8BTup4NoCku2KXE
 98XI/istuseb2omqpiOlqsGDAxnDT/I1AvLjNf7HlNqdxu2utXfkcjKtzMH3ljG9LIHYy1JL8LZ
 Nufg2i2pWgLKzZXpMIerQBboTOfgcawVu3b7Ac47d04dC8i0fX4SjTUGdbCyKOwaAsXoSBQ7sPY
 e7s3pFBCpj1rpdKcOZ2vHsAk9g/hgUU0nNcSI9OwKKMxZ5IbJKkD8Nkz7Quky6z74q23foSc8wo
 WmcYv3T2Pq2nNjzA0/XDGceDB91yDpXwGvHN/M1CazQff11WB/gwdrO4pZ3+flp03fo6yIIYLoY
 /rwfTJft6Mu6hm7w66A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 02:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132036

On Fri, Nov 6, 2026 at 2:50=E2=80=AFPM Mike Looijmans via openembedded-deve=
l
<mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>
> In the process of upgrading from scarthgap to wrynose, I encountered
> that "mongodb" got downgraded.
>
> scarthgap has version 4.4.30
>
> wrynose has version 4.4.24 (and doesn't actually work)
>
> Is there maybe a reason behind that or just oversight?

I think just oversight.

>
> To fix it, should I "forwardport" the scarthgap patches and submit that?

These would need to submitted for master first and then included in
wrynose. The build fix and subsequent upgrades for v4.4 are only in
scarthgap. 256262d469 (packagegroup-meta-oe: remove mongodb) should
also be reverted so it gets built when using that packagegroup.

Thanks,

Anuj
