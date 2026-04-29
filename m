Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B519FF885A
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 02:56:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3693.1777431364750269050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 19:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=b9nts4V6;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=N1Pael6B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2gdrP3184120
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 02:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15oFhs+PW0SbDCwK/+i8BkpT0fBtnFPgu7ZJdIivp/U=; b=b9nts4V6tZfuBWPt
	1aL2Kh83d/0fdgYVYfDW906gMCtn+SvJ5r3AVvg4VyLj1NE03uPVdeWG6liR7YJC
	uflu1pl2Buo+dimi8XrRkimfmdnQqL98WeUs1Tp8tWVRW7oPoLg0sQoCAuF7+zDH
	v+E9fT052kOGQHtTqI+xALRTDo+pxdkWPNjwqAN2JwerAnecNS7mhtH2e785mpm5
	athyOnPuJ65phdFY38JFGi+7nzyPkKMqM5HiXfIZs3hzh1Gl7oHKQ7bLNo4bjMFp
	BuoikP52B5ZQ05a23UUzNtfE8uC9s/PfNm7SjjZ1NbNKFnSSVRTSf2Y+zZcpCoFA
	dZ+nQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em0132-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 02:56:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b0312bb1dcso8803136d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 19:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777431361; cv=none;
        d=google.com; s=arc-20240605;
        b=bcXFGGHoq3MYNzWQXrPHYKrJy57o5AO/Arm5OXMuk1sSLbDLG6a++4jZ1V8OyU9Z53
         MMxm9FL2uQDb8fEb1r0zoU8BPRn2EgtC2jpzCDZJtNtdELZROfZc899e6enMoypWniwx
         dm6MDY5eBHdAmNA52/ovIg3irtoGqCeIzgiNLj5ImcL/MrnYo1msQnf1kjy3+7ckZ/2/
         cUI+CeC7zxgAQaU//9/tRXFVq6vB5sDAe1J3MHIK5QLVj6y3YFEC4F+8Ix7RqBkqNb2W
         oElkz4KUWjCer9DXPkSyJxllocwCJ6WnikuQ93sWoQ0dPyPWbIiVKYL6I8FECPYUXYOU
         0RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15oFhs+PW0SbDCwK/+i8BkpT0fBtnFPgu7ZJdIivp/U=;
        fh=vSNTDZ8oO6q84gBeXcVt/4Hj0Wi4wTGlWjktO6OJJ84=;
        b=PxJl0wFnPnG7vOzmiDU7z8M+RfIyPrwQv0QbqAdGqFPB9A+o+mV4OqxeS90e47HMzG
         rpkgKPKocnoY+n91zobeectq3z89omOxCHWEx6uws8mWoSJWBR4MB2WbO66GSZlJEOuB
         WUyjG6zS+c/XEag3iZb+2fX48+z26ATpP9LOd5aFJ2TMmo0xufrxHY7wYKjZ9cdXuMUT
         hYkCONnJxFMnp48FPX3Qp2PiK7Q6oZmUnqTW8fgKSDWOyC+/ul+cfsJ91A68yNoJbdTU
         CS1ajLWm5WDuAuATvup7c2DDJ+KeYzpsiQiFREvJG0i5WP/rfcqWVhyT1wDVAepQmbp5
         2NOA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777431361; x=1778036161; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15oFhs+PW0SbDCwK/+i8BkpT0fBtnFPgu7ZJdIivp/U=;
        b=N1Pael6BdTWtOYdb59Ig5YQUh1hlHjWGXIapXgRP4KAg6r4XYFcJazpNewOq2QqnIK
         CBGeZCf2gL3dUkgViUBAUWK30eutsLzprQJWGZNrbBfogIdoGK/8EA9Y3vNRnpFWILFM
         egjeMWOubI3ZAjJliRgKJTJRCyxMoDo073kZZ7xk2vJGqWhIgjZjzbKcpMOcRg3wMfvc
         89wBDT4RLTXpujgvGEKoDTL8lq3FfSugnRCCUs03q24hI3Mg8kwXa9TulyBoXwbDJ1xi
         QxWnuSjuoqRS8LRQEFTKtA1hMSTArzhDcoipif5Ic5D3kxRd9Bck/W2Esm5jX0DrZLNx
         L2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777431361; x=1778036161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15oFhs+PW0SbDCwK/+i8BkpT0fBtnFPgu7ZJdIivp/U=;
        b=VaHxavFnz0hWEmowu3xBI6HXkjHoXYseMAKVC4hFkFB1454Ua8+xKaulY2LJORtbXj
         k+ZObQFqRmMCrmx2dCqd+ztRLpM6feljEwi+nXEYrX5VkK6si+LdodxE4RBTpe60JKKH
         WBnIZot9pNkr1DEvpuJdyLRklRoxmrIODU3AayvI9FuNHHrgdQaqiQpjsOgMaCcwSu3Y
         NXfUANoRp+YEr05Cv1lDXr2liPNJY0A4yAtw3xjlMXCK/L68pIzKgG+nB+jBv5XkAM07
         MQxOwn2eVcUMrtc6kRUVeYQlaAYROd7sf6+oVXdUYu15uyncQ4do/a0WKVQQMFHL3y69
         E3SQ==
X-Gm-Message-State: AOJu0Yzr/MkDyP5jkAUFNxLgB4fFmk0eBsVJBfs5H6eheUb+QLd/IB1C
	bVsEQGJCSUYn3sQUztDgBbaWp4cY7kFdBWij6dP7M2yWoTt8Q0BCsBcPeeh5jNTasPDlZzqyVHM
	Ju2hwYXrVRB8MHgUCXSic5vv/L4dO0PJIAfxoUWJO4tXH7d5GPoaZPlOwfyiM1je3oVlkFQ02GN
	8b5CuPDVs2D5yQZTEmddY0IFaRsG0BNItOPJ1X/U9zRuIE0hLq2NkuRzkCtqg=
X-Gm-Gg: AeBDiev4PdCZ6QxPgGX54IiWkwtAVq5oktPVXWnggH/KU1qWbeLoBumlaYC+YO2hb2R
	C+5p2CYmj5oJTN3CbgijhpiIgQFVDWZ8L4uLK7bJneE2nezfQRT+j3seBKIYwTcOzMSSup1jE1J
	2dZK4qrK7qn+y/QW/VC4cwputTWtfnBe2plCYwmgGSpQB8JM9IOlh5PsFKZXO4JOc6Jrf/lRkhn
	sxWDbGm7E5IbsI=
X-Received: by 2002:a05:6214:27e1:b0:8ac:7d7a:56fb with SMTP id 6a1803df08f44-8b3e2fb89d2mr97751966d6.5.1777431361068;
        Tue, 28 Apr 2026 19:56:01 -0700 (PDT)
X-Received: by 2002:a05:6214:27e1:b0:8ac:7d7a:56fb with SMTP id
 6a1803df08f44-8b3e2fb89d2mr97751716d6.5.1777431360468; Tue, 28 Apr 2026
 19:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260422104659.1814004-1-xiangyu.chen@windriver.com>
In-Reply-To: <20260422104659.1814004-1-xiangyu.chen@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:55:49 +0800
X-Gm-Features: AVHnY4KVb0LDnMgfOzeOQH7XkjSLMzbt41vPDbojmIFjqlIcBSE4cvRF1A6vTVM
Message-ID: <CA+s=J=w+Ox9es4DSansjUsd2dFpTsUPYj2gDrKPAv-WZFpxWug@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] pahole: upgrade 1.25 -> 1.29
To: xiangyu.chen@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f17344 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=9XckgDORkSd3oNP3bs0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: epWRfpHu4W32wJniQ9dcomn-HWlJ9VMT
X-Proofpoint-GUID: epWRfpHu4W32wJniQ9dcomn-HWlJ9VMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAyNSBTYWx0ZWRfX1QfN4FRPz4Nz
 mI+fTuLbc6iF7DtlbiBjumGr2r5uzRqkJqcgIS6jleVYGhpAigNtAWKQHMqaRuHY575u5dioepP
 2luObq6NGfO3NeQ3tJJ/ofLqosGeh5vPcRjfa6tDUYmwUILE0zBc+LVYdm+AD+L44dFb00AcMPA
 Ux0DP/HEC4KKmITt5biMZ3ey21lqmkm04eIffARR9njakp5QMWDwGGK6M7mm6CyYV6j+GOro7Bg
 UTBUPHtVyLbG/BOomAdzHqfc0YaxSSzmL3x/e0mqc1vz4GZdg4bbmaBDnuiN0gwlr5NQOBou74C
 G05qTiXlGZP56HMieBJzuLSVeFdhn4AWKzz2n0eOQpIXZjyEg2UNw0r647Uxu1ByZBPp3uD2iTR
 ksA4rBozOJaFmyAgiQtPOZDuR0nUWamXx2Mog2hEwt1qqbp+7n7aIahD0LVqwIAovTBV6p19HAX
 AWEqhI3+/Ots8nrmD4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 02:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126659

On Wed, Apr 22, 2026 at 7:16=E2=80=AFPM Xiangyu Chen via
lists.openembedded.org
<xiangyu.chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
>
> pahole v1.25 in scarthgap non-deterministic BTF type ID ordering when usi=
ng
> its parallel mode (-j).
> The kernel build system (scripts/pahole-flags.sh) automatically passes -j=
 to
> pahole for versions >=3D 1.22. This means two builds from identical sourc=
e produce
> different vmlinux binaries with different .BTF sections, even though the =
bitBake
> task hash is the same.
>
> It was fixed in pahole v1.29 (Jan 2025, commit 4c916259) which made repro=
ducible
> builds always-on by default.
>
> Since Scarthgap is a stable release, the current v1.25 is retained to sup=
port
> users who require the older version. Users can revert to it by setting
> PREFERRED_VERSION_pahole =3D "1.25".

You seem to have sent this 3 times without revisions. Are all patches
same? Also, can't the fix be backported instead?

Thanks,

Anuj

