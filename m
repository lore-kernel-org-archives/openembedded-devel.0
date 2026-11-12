Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6358.1794455833807576231
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 19:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H5mdPl1i;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=e/y7/Qym;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zw0Y904507
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 03:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26NTGg6tNaUXOJQZdS+BmMvPxc7QLPVPOqDMI15rpSg=; b=H5mdPl1iiktBAE49
	a1wmPMg+IuC9Je3y2JZqeXzde0TYkzsL5loyFrIxkorB1c2mi1QMlvcRAY/wesbl
	4xr/3XLmDU4kcZQcgYcba2bUbJVSsnEc9VmLqODXCtOUe5zptSAOluZef2GfHCok
	/qDyoqt+U6KPnVw6a581P0NYdrsIE7biMv+Po6/crhamtaeHhlMpTBNsMUKGf+85
	beGPbxE22o4iKTqfCCDyZ56mrano6x5hmxqSa+WEU4wxqOWOPPSbX29x6zSpvXIf
	1GR4Q+M6i5p8oV6W7Ix3zvBryrsZE9AzT1Z5J9FswkW0WRy8XEiCqoseCV+MCNky
	VvLUEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uaump-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 03:57:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eee6fa56bso33489666d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 19:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794455829; cv=none;
        d=google.com; s=arc-20260327;
        b=g/RoowPqUIBV1l70byUjLqbyXoTAy0UPdnN8vgZrIkzoutGHNFlxcA4x9ei82k3XNi
         lVeVv5nsbz0Oc9vzIfnpJ4GRK24EsVYZGbVdkntEdtXnwmynLKviMdp2zk76jz6I8hnh
         MuvmBcD9hOIpAoQgSawuf96HoCslBhIecGoRpvwK4SvWuRKTVmiMOaoGRv3jPcdBZcg7
         YLKukS66/bye8ivSEVhTwta/88HmHUVM8vN/7BEkfzOUZNij/pGkYZnSDGaLuKUhESZi
         irOCeOIoBwUhRpnt5ovt8CHXAUELmUljEbtsi/5h2Tk43ZwzP6idlxNOVHDXyu5p41/3
         RkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26NTGg6tNaUXOJQZdS+BmMvPxc7QLPVPOqDMI15rpSg=;
        fh=lN7vxPhETxChMSc60P0Vxmn/bh4wLo0yLkkRPuTiq2c=;
        b=RQUVxgiMDClmTdG6g1MRH3OX6hILfW9aUwRglkIJfsz5STsuXYVibLc3gS9Bt+nafH
         5GWtjDnEpjKno4ni4gelt7uihCFz/IQ/Wib6QbtR7aSqLIfgp1riWNXCnOjPakykWH2p
         hgrMmWxce2yD3pUsbcKFc/UAh02DFYev2rmVTwkXVb4BMS6DKIKnMeJjelCefloMA2sA
         NPvyLB6iYpZ3f0IKfZj+0QqWg5UzqxRgiH4oRE+Y2z7jCa1y/+ArKGf8U4Oe8FLboQGZ
         xAK6um1WuiXXwIctIjbZTc2Uo3UmuYwEr1yA8S5NPhq+TR1qp8veckuTB4TJ6YenpP3R
         G+Bg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794455829; x=1795060629; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26NTGg6tNaUXOJQZdS+BmMvPxc7QLPVPOqDMI15rpSg=;
        b=e/y7/QymfHNboKf3vwd7PmO9IxRcyJKa720MBjwKcHR+l5//vLSxDU9He/w7IdBCQ8
         ettltm6NbwdD4PhYk9lp+qWvx/KmqkivOE1rs0GYa+moglrVc0cQU1M5TBi+OGPxKJ4b
         ssgaHa64+P86kPlDQiPovc+szXcj9orRl5AraA5zWQiGOYTF9ZAjLoWMaz154TBy0P1A
         7w7XiWDVrmKKU1RgpsrQOABsF/hjCgwDlI4uNKANqBvK3IGlqbVIQad17A9Qfd4B7tSH
         MEEcFoDKnqNKDW8iEkbE8jfKIJ02e7SPIIGnfzAVjE28Edob7AMSb0iOcOG/mtsw2rlN
         1Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794455829; x=1795060629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26NTGg6tNaUXOJQZdS+BmMvPxc7QLPVPOqDMI15rpSg=;
        b=ZGMR+u00f0LBbmgPXRTfG1vSxSlSMj3UW942dOu4YY08C0+4YViOgOTrFprimp9pwd
         7KpkFvXPw5DhtWpL2wf956oKsj8J3mejbbkf5tz9rYSoq2fpuJtu8mUfkO0gz76+mEl2
         8kY4Uo2+HrDCWuHlXqIyJS/lqUvJX83VBjhhHf2y4xSbRp6yIoL2D713pydOmbGqaFme
         q5Eu3Oil1eIQB97jA8zHoFFSnAOBKdD+txZgZKQ7gWlVC6cvKLjVVjn68J2yqTwtkiTh
         fQrbXNnA0Mx+aAmmQr9KJEsEFvM08F+yc+I6ViLuiwm+8nOXE1GruziLN/o5BS2WA0Nj
         c5FQ==
X-Forwarded-Encrypted: i=1; AL+hErGsfm8SfIdZNCt5AK8nc/13HI8Ef9fDdk0xJYbAoRHuJjPPywNj/sG8v55c1icIde/CSu0Yiiqk6C/GKbvHBEh4ymQ=@lists.openembedded.org
X-Gm-Message-State: APuU4Z/EseBj882ex7i+3PWdHAnnYo42VjomIYCytPr0yBMy3jVCsegL
	x087vc1meevmRrQMUVwg1TDba96p7KWbApNidLgvYL54iZfDMug5YjkVcba1SP6Euq5RSe3KawG
	e6g+ASLgWEYXB5gJT9o3dSbdb4uoRda7t7sAEuKqo5DWZW+hrVsRajxxeugFBdqOFvkoG1JKiUZ
	jSzqLVPXc5VQctYbBD1betiWaxbwOgRyYVDwpFRAaCR/JOaWjKeHR9fh9E/Fs=
X-Gm-Gg: AYBFou0IM3O/3hycnpbt11YZineoNrm72VrkBwAJQv/fyWb2PWSGYiDuOJ245A0W5e5
	3faFL2W0672fPUUbWGEaC2pHpqIg1ejZMNgTrePq17B9J255AKKt1o6jGm38m3+qQDBoKjufRTM
	gZd+GJN+tCpOPsfFTs0H3lBmqA+RVl9CY3M9kmYwqFJtwLulcKbDeJhMZZ4A==
X-Received: by 2002:a05:6214:3bc2:b0:91e:739a:187b with SMTP id 6a1803df08f44-91f04195b7emr76742396d6.51.1794455829071;
        Wed, 11 Nov 2026 19:57:09 -0800 (PST)
X-Received: by 2002:a05:6214:3bc2:b0:91e:739a:187b with SMTP id
 6a1803df08f44-91f04195b7emr76742186d6.51.1794455828471; Wed, 11 Nov 2026
 19:57:08 -0800 (PST)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
 <20261109081800.69803-1-mike.looijmans@topic.nl> <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
 <eedf7b3e-36c7-49b0-bea2-2abbe74026a7@topic.nl> <CAMKF1spaQc--uVEevw2S4vrKJd5wSMSSOYxzv5aOEsb+SqLqKQ@mail.gmail.com>
 <4e85e314-552f-4963-a5c2-0dc79a0b8496@topic.nl>
In-Reply-To: <4e85e314-552f-4963-a5c2-0dc79a0b8496@topic.nl>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:56:57 +0800
X-Gm-Features: AclHuK8GwyAXeCwm51LbNGY9aebxYF9x_aO1VpgX8g0yNCu91tTKg-2kzrOUjhw
Message-ID: <CA+s=J=wxTGnJFwoKiDLo-Apc4Q+KpkZrHeTjX1R5r_9tkO8TaA@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/4] Apply the mongodb patches from the scarthgap
 branch, which is ahead
To: mike.looijmans@topic.nl
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxNSBTYWx0ZWRfX89svKRCG48HH
 ZcX9JTjj/kySycf+RoN7JFMsvD5x3QJqKnzg5ZTemHyM4w3vcb/NsrW4QHOUm3K2jDeq1qfwVMo
 ubrtL7ATfQyNkvEU3UapZ9AcKE8nzpI=
X-Proofpoint-GUID: MVGalJmAcz8DtuE4JMsyQyUce3ClGy0I
X-Proofpoint-ORIG-GUID: MVGalJmAcz8DtuE4JMsyQyUce3ClGy0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxNSBTYWx0ZWRfXzXbL4x6mzwW+
 Cdtw6IN08jYD+Q6siRSyRJIn6pGbfBeNhilVePinzaPwTruCh8miK9EnHWzM23g69yf/vKVVxP5
 RUg31tUF/2RZNplLr90ltT6U/IFNcDxFB2n5GFLzBmqJUc3RwmzoxqIymBakiXrQFuzwNDCz/j6
 Lvopmj6fW4+EFt/c5WMWA/HNvBP9euNx6kV2iJERd00eFZrHdPV/nOckbDvTMzEqIw3W8rkuYuW
 kaQGzjq2MkpcUzRIHOZ3bM+YLF95WRhcEEpNibvfpSvM7Mt8ZGtTrN9RvoyNHMoX+HxvpHdqG4F
 lPBWsvqjU77WhsG2OFhWlsBGlsLh0cDA+/ByNbJQYA1efUwWZIdfy73UUk4x0JHZ3MaeBnFePPJ
 HKbbw8Sy5ChBjBPRc/cWtvWh3l66AgMVC9BLlFOyyK9vrV3pBN7Hk9qGXBD9aIDbJGkQbQuaYq1
 RGPx0E0gj9MuuuoHU6g==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af53916 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Q4-j1AaZAAAA:8 a=cbCWaqvfhR-e-JJluKQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 03:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132151

On Wed, Nov 11, 2026 at 11:33=E2=80=AFPM Mike Looijmans via openembedded-de=
vel
<mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>
> On 10-11-2026 08:47, Khem Raj wrote:
>
>
> On Mon, Nov 9, 2026 at 10:02=E2=80=AFPM Mike Looijmans via openembedded-d=
evel <mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>>
>> I know, I also wrote in the description (second line) that it wouldn't
>> build.
>>
>> But at least this brings it up to the "scarthgap" level. It's weird to
>> have to start several commits behind the previous LTS.
>>
>> I have a workaround for  the pkg_resources error, but that's still not
>> enough...
>
>
> I have sent a patch which addresses bunch of these issues.I wonder if we =
should
> upgrade mongo to latest release as well.
>
> Thanks for that!
>
> Applied them from master-next to wrynose, appears to fix all the build is=
sues. It'd be good to copy them into the wrynose branch, so that at least m=
ongodb compiles again (like in scarthgap).
>

I will include them in the next round of patches I test.

Thanks,

Anuj
