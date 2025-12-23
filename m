Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4622E6F07A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 09:34:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97968.1766482455033560044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 01:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ylvpw5Wh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V6zQ4ir+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN36mnN1528931
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 09:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJ3eqoJm82ijoqs33S8aHRlnA6fWE2epyYrLX85EPP8=; b=Ylvpw5Whf/kqw00D
	qjkNnqQImeTMRIHJg6Heelh4QOCrN4IRAgaldw1J0iRGPTwS7xsGPZYvjlQoUpIB
	Xq4q0IhgP4c34u92cWGtuDe7lCkdMEiyVJ+/Hnqvv9HpK+0bxXMxbb2mAibJKAez
	LLO7ScKNNMtidYeG894gmIF9b2IJhqNpw/yEfZLSaTWZ7Ka5JKPpq2F60zI/yXtC
	n0S3GYUNrtPUCDO8qjjMVSLx6ufXQ6lUkCbzIrCqPv+LdOO3hEKioy4QzLhD0GQv
	dp1MDNFOUziM//I5lDwqdD1U6ou3MsghwJw63sAjgGs1xjbzs1xnGtvETmj5ZMYf
	Vy0/JQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3cyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 09:34:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a366fa140so225429596d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 01:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482453; x=1767087253; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ3eqoJm82ijoqs33S8aHRlnA6fWE2epyYrLX85EPP8=;
        b=V6zQ4ir+4RH29rg4S8Ctv7fc9pC3i5gAbTsH7xDiiHLpkntNEL0a2qURTJUCyUpOt0
         230YV0NB1xcpeowLlYMQIuv2eF+l8bkg0UExl9YptZ6aoGa2ZVBqx6UsabzPFeA4x9I4
         clpwONgAEGi6wezx03wicQqwqlTQaBnyvS1BANGdI0daGuEWCFubb+1Oq1MjCKjr+nNn
         ciTu8fetELrVLUu1ujFvkQ70ukuq2pT2CSYjFWKRJbJBWHwNxJvdlAcCWMbk52zyvr5z
         obYGnHSLvL984NbgWDOuQ7LNLkm+cOcQ2vvTMiJos5afFYkgRE4jLgQeYfJ/zgRCmbEa
         /1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482453; x=1767087253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ3eqoJm82ijoqs33S8aHRlnA6fWE2epyYrLX85EPP8=;
        b=Hg/jyABXATPWYXZo9l83BwTm7cCjNoRVNtnbv3voELc1cDU+2dmZR5JQqYVTpJX+OP
         6aB4gaTLknS24dqP8Igbd7HXT1/s1a8tSfLn70aGut2FD4ZpBnW1oTG+V1yrDNR+dJ/Q
         zonHTfrAaJsTaRA3yLprnWtjlSu9hJ6+6t6I20+c1qjHkN3bcbOdG5XL+wQtvT7HyFKs
         rNbohKMetdPLoxJzbZ+Crig2SA/4NZr++AvWe+SO5uIyjwaKBI3UxSiV9x72lswuVm11
         b5eopxQmKdg6JLyRZK09SxE3RsKmGQBfRJyDTQa6EYRHKLrfDgI66OSSv1Dgr9SJFXCj
         Jl1Q==
X-Gm-Message-State: AOJu0YzE/IXcL8SGbfoAzlITaqhUoACaljNFbPnKC1laJtH0VBMCElv3
	qDWgPrbvjuqlTwqrN8w2k2hHmGZkWvv/OtPtjkan+Zra6k6Cuf7GOC4wyKT3c3+brb99S7DmKX7
	KVVwY0wmkBVmysG6PnxlsvP6pMbrBuoGYHGEqMRp/8fjKqTHnOtMCnS2rrBE3Q2YunxmI2j4XMW
	Va+RRYMB3U92JkXmBIiqHDyB+QjyxKQpMEHQfNMpGEUw8z2qPiHVxkkwhsJx3VTc+UXLY=
X-Gm-Gg: AY/fxX5D+2oXE9sSoBqt2HvuTN3g5x0ftb3g78AXJ67U2JchDrgKbdWvtNvRJN7gi/B
	vclithEJoFNBtGIl6/cpQVRvA+HBUNeF9dq3hUuI3A8hufXq83qg9dYua6pwp4WVi20C+LhSwc/
	hdub5r97ht3RT5KjAboJAAZ0TufqCpQv4uYOKK01hwwFFax1W1W8vUzvS3o2bL3n8P
X-Received: by 2002:a05:6214:43c8:b0:888:858a:b05c with SMTP id 6a1803df08f44-88d82339194mr236307846d6.29.1766482453335;
        Tue, 23 Dec 2025 01:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0Ye99cLVyqH9PBA7jNJe1lK+cUiGLyN0aHr/akt06OOlfy03s7b3sUpf1jJP35YjgZMc6upmnFauryKTHt7Y=
X-Received: by 2002:a05:6214:43c8:b0:888:858a:b05c with SMTP id
 6a1803df08f44-88d82339194mr236307686d6.29.1766482452953; Tue, 23 Dec 2025
 01:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20251211113342.3552509-1-vdabhi@cisco.com> <48f91861-0626-44b3-9848-8c512d95d8af@gmail.com>
 <CA+s=J=zdy9B7U_-xoi819StBDTJgox-hnHDPcnE1E-6CEb5Pww@mail.gmail.com> <SA1PR11MB6893D3FC19A2705E48C3E5AED0B5A@SA1PR11MB6893.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB6893D3FC19A2705E48C3E5AED0B5A@SA1PR11MB6893.namprd11.prod.outlook.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 17:34:01 +0800
X-Gm-Features: AQt7F2p447zbNmK_nlL9peOBV5uUjgnxeQtbQWL9AgcjodhjrAU-lEsjnRKKVeE
Message-ID: <CA+s=J=zYVMeK+=C2p4KtWWG3BNV0nuqEgA7GojJ+aJQVUzjiww@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [Scarthgap] [PATCH] p7zip 16.02: Fix CVE-2022-47069
To: "Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE LIMITED at Cisco)" <vdabhi@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a6216 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KSb9T-wMAAAA:8 a=FP58Ms26AAAA:8
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=iox4zFpeAAAA:8 a=AUd_NHdVAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=G1Mv0tJT5_ve20Nty_YA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=KF4VuIdXkMyp4E_ug72i:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 2pBY5Wf1EQA13gX0dpxSfjasG95SRKMX
X-Proofpoint-GUID: 2pBY5Wf1EQA13gX0dpxSfjasG95SRKMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NSBTYWx0ZWRfXyJevSd5kCzQQ
 0cIN4puQzyQboxd0mqYTNzOaD1Jh9C5Uw6lpaq8HtHc1yQEkantKqGKn81cb7XoTfYkdQtl2If9
 zFcniZeEwP3UCcB/5yQupVVdcf1cDUT4c7XbKfOoNP0peAd4wSx1DnkNZkgxVXhO/RJoCpOYNbu
 DhZWS2zJzgVAvgn/1+XTZorn7YNIHB/OhLf5fLS14FGmOqDw+khnVgjxjopOl88P9a0PPXAhdUD
 z58l0ter4b5B+VDIFqi/9eG3gBM01e8zfanUEMl4f/0Hxew8KJsDxXSwxvJ8hnN4jbFapmXgPDs
 /0avVGUUrf3wT1gC9r/NTuxA/02puOnXZdNU0N4GteCB3tsTdVnXbdi3tQ+QueDtQzfyY6IDcC/
 IUwGMwi+e8iRVkYiZqo/kX/KxJT/t6eLJ2BkYdJqiMqFwZBoQGoGfSAzU/PTGzloaAAyAG4Da+T
 WlSdhhLk3s+3pCrMOcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 09:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122833

On Tue, Dec 23, 2025 at 4:40=E2=80=AFPM Vrushti Dabhi -X (vdabhi - E INFOCH=
IPS
PRIVATE LIMITED at Cisco) <vdabhi@cisco.com> wrote:
>
> Hi Anuj,
>
> As per p7zip / Bugs / #241 Heap-buffer-overflow in ZipIn.cpp:1116 ([3]) t=
he trace points to FindCd() and the proposed patch for the same was mention=
ed in 1209648 =E2=80=93 (CVE-2022-47069, CVE-2023-1576) VUL-0: CVE-2022-470=
69: p7zip: Heap buffer overflow in ZipIn.cpp ([4])
> - git history of p7zip has no individual commit that has fixes this CVE, =
but the changes mentioned in proposed patch are part of the latest version =
via commit update zip archive file =C2=B7 p7zip-project/p7zip@d7a903f([1])
> - Compared the source code and tried adding similar changes as the propos=
ed patch.
> - The proposed patch in 1209648 =E2=80=93 (CVE-2022-47069, CVE-2023-1576)=
 VUL-0: CVE-2022-47069: p7zip: Heap buffer overflow in ZipIn.cpp ([4]) has =
incomplete changes, therefore modified source code with the additional requ=
ired changes.

Thank you for explaining. The patch that was finally applied for that
bug is here: https://build.opensuse.org/projects/SUSE:SLE-15-SP6:Update/pac=
kages/p7zip/files/CVE-2023-1576.patch?expand=3D1

I will take the change in next series.



> - With the added changes also confirmed that, there is no trace observed =
as mentioned in bug p7zip / Bugs / #241 Heap-buffer-overflow in ZipIn.cpp:1=
116 ([3])
>
> Regards,
> Vrushti
> ________________________________
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> on behalf of Anuj Mittal via lists.openembedded.org <anu=
j.mittal=3Doss.qualcomm.com@lists.openembedded.org>
> Sent: Tuesday, December 23, 2025 5:22 AM
> To: Gyorgy Sarvari <skandigraun@gmail.com>
> Cc: Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE LIMITED at Cisco) <vda=
bhi@cisco.com>; openembedded-devel@lists.openembedded.org <openembedded-dev=
el@lists.openembedded.org>
> Subject: Re: [oe] [meta-openembedded] [Scarthgap] [PATCH] p7zip 16.02: Fi=
x CVE-2022-47069
>
> Hi,
>
> On Mon, Dec 22, 2025 at 11:53=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmai=
l.com> wrote:
> >
> > Anuj,
> >
> > Do you see showstopper issues with this patch? Or did it just fell
> > through the cracks accidentally?
>
> Sorry, I did have questions on this patch so didn't include it but
> forgot to respond. Thank you for reminding.
>
> >
> > On 12/11/25 12:33, Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE
> > LIMITED at Cisco) via lists.openembedded.org wrote:
> > > From: Vrushti Dabhi <vdabhi@cisco.com>
> > >
> > > Upstream Repository: https://sourceforge.net/projects/p7zip/
> > >
> > > Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
> > > Type: Security Fix
> > > CVE: CVE-2022-47069
> > > Score: 7.8
> > >
> > > Note:
> > > - Commit [1] updates complete p7zip archive source for v17 and includ=
es changes
> > > that fixes CVE-2022-47609, adapted fix related changes in current p7z=
ip v16.02.
> > > - Similar changes via [2] have been integrated into the upstream 7zip=
 package,
> > > which replaced p7zip 16.02 in OE-Core master.
> > > For the testing:
> > > - Verified fix using steps mentioned at [3], trace not observed.
> > > - Validated against known malicious ZIP samples [3]
> > >
> > > References:
> > > [1] https://github.com/p7zip-project/p7zip/commit/d7a903ff13c2
> > > [2] https://github.com/ip7z/7zip/commit/f19f813537c7
> > > [3] https://sourceforge.net/p/p7zip/bugs/241/
> > > [4] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2022-47069
>
> It looks like the patch attached in this bug is different from the
> changes below. It's not clear to me how the fix was derived from [1]
> and [2] and how is [4] relevant.
>
> Thanks,
>
> Anuj

