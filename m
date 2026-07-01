Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1A3C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 02:27:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36494.1782872822790122232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 19:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cS3UpCMK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JVlSUiwe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNLmKU3495096
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Jul 2026 02:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LG31ZUc+ubtcgyuM2rb9LSES25RyVoAiIpUsJZSniww=; b=cS3UpCMK4FbY7uw4
	9EaVnUN954ch9aabuniOANziie5udfpi+Tg3yzeS0U25BDtJYznIC/P3EAdY0ruG
	CWJ0og4/tG220B1KN9N9j5c1E3BtErLaKXNfzgEbpDHZsVOFNELnxZD1uBZJsC/T
	MgeE7oAjg3hhWjh1n0zBYYQvLv9wWKM1PC5PxZEOPCmW0FU5RCDIC0yS0jymSICO
	4uqJRXD3vQso6NkoAJfcjPMJPWLjPeW4nj2tWAlk4YJNQDOjJpBIQI+eCwY3X201
	eOHtwaIfQkDxePTxl++qnAbzRl6wmgwEZtZ1gBsp+ToLb/BcbAUsD+ZeaIHmXK2l
	PI/6qA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j911vy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 02:27:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso21175661cf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 19:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782872821; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTcVyBkohzh0plJaWMZE8VDpAhme6PiBJNAgv4gOeE9BudXdLUGIyIuJ72jerv52mT
         MSz0uIMIkw2PZcr9NicKmgP+6YzWl3GHQ9n/z00NCdyPLgv5jLZ53XbWdK6yuP4VZrIR
         qyXfzv2Hp+AifI5jfpGeSYcMEVtTqhtHyZumfs4L4Jdx1cWbJMQilz22UIvdukBp7rDq
         UI0EnJvce64PcUdBwCPsiMOKUwwqnH/T6SuZhHITkCl6Ffq/k1Ybc2U2LeRzJJVMrqG5
         V0RcbVBX9mOsYqWiMV0/ayCTEQdO3HoJZqB7M9f1KxBsUxuUg7NZwhXslLvJtpotR0lz
         GtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LG31ZUc+ubtcgyuM2rb9LSES25RyVoAiIpUsJZSniww=;
        fh=m/d9KrVvYA4BbVMqG1tHRdDDRqNWot/wwa013o51EOo=;
        b=lsUvnbm894Ag9RVccOWJaGJSrG97VUYdoaTqvBzAGo+WnSXDME4npvtBeBL0hk+w9M
         9Fp48C5WiP1sNAQYSSU1rpenuIV3UUid/T7Q+ggJ/J1wffsi7S2p7VVJk5TtTYNnMu8R
         uxmlRKnOkFsz2PKURdl5Z0NqeixozU3yenV/fesfNKCcIHH4JyEVlZKy5A815fHwVn74
         m1OWKfOfyFxOMTL69bV2YACRVKELJ1gclHYITUBzA+jvUfEb0azlSH9ImKCbfnevH0Ya
         WDPCBN4WVSvFgJpOTjJzNsImhpSvZ7jc5BMxMVG2yUQBgGrcXAUw0XqMKDiqOTctVHaz
         HDAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782872821; x=1783477621; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG31ZUc+ubtcgyuM2rb9LSES25RyVoAiIpUsJZSniww=;
        b=JVlSUiwewVhBw3h8eOo9VDSH+F8h0+3G0p/XonHFx7BJHqO2mBPEV2koCNyLWVjucb
         GJOXMfHjBDt24u4e4pmQGaXiMtP/ySzhs8lu1BKjXG0uyY9FoQ+BGVnVaeVvFFqPs/1J
         9fpeZgK+dUhsrXJbfuLIS95PHzDdNTWLckVa/DGOZ973q6ANo7LAw8wq+oMslhaaVe8w
         jgz4RRe+KqastopyN2AacjWqMaxf4JhZZMrNFyHrlINGmEtg6bY8+ZsxeG9fjsaEHzrj
         QdBq+B8I+W8PahNXFrQBG3ISMHlsXuf8uPzu+vbd70qYrBa4Z9x+sV8IwtJNJpTJn2EX
         49oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782872821; x=1783477621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LG31ZUc+ubtcgyuM2rb9LSES25RyVoAiIpUsJZSniww=;
        b=kJJ6/2HaxfSFJPnZLPvIM9ZQIz2e8mBcYryC9z51AC+43bb6trTuqEIwYUg7L3ldCq
         QKmpqaX0RCC+aAOcSMsDFh31DEqSDtPh3xd87vnOsimnk71WhrdRImpQ87ezQqpkFk4V
         r+cojPINpg1om27lzHE8oHUmNhF+846jBHw3hAd9q/mFFfkDsOg4VNGmWW0sY0Pc7YEx
         pYuPJijykOUSzV6Ry4Q8V/F/3zpjGZuU9xAv9BHpR/CfsTo5LelyywRyq2T1KLlaAzi9
         1xEg1QngqwtAo3nofIfmM3svqmwVYxtTccwc6ZQUZuXjFYBaN5kuvg2FaCr+23oWEA4Z
         atyg==
X-Gm-Message-State: AOJu0YxG4jXf3Xr1Kml8ODq/zTONsRaN62NfYc8Zbnl8srHP3KopY7Y7
	VyhfmFOXZGBdA4DULtYAvnc98cLWA0AFNC7CZqJ8/ObnByF+xdB+Nh5+xEA2EGeD2Ro9IuxXL9k
	ag0NyqYtby8ETGS0eLDw0uaJtXOL7YPTR8ZVi2FMxxFMi3ivD5LA3ogLZ3ZdSKPmj1xBMJiaaah
	mB7a8xwRY8kF2bTdcYZUJLdEqXLBY82K1He5d9yvc7utWXFGXuV/QE1Hk3WBI=
X-Gm-Gg: AfdE7ckCWzID9oGOAnYyLf90m4V90kXYKrI7hVUjsm2mc354XC6eBR0j1KTpl0vdbpW
	Q15s2lL1XH1egprY30dNdRrTpxY/yqmOYj2JqEredZ6maUgchftFZ5HGo2UyGEEX8yt6qDG60+X
	R+I9n1XiSTH2buvg/Tp586S1I/geG3ryFoEZx0UfWiW6OrL5A0NmgItjdg73uDyEkiuQ==
X-Received: by 2002:a05:622a:2591:b0:517:9407:5c38 with SMTP id d75a77b69052e-51c17e92d8dmr51264401cf.24.1782872820991;
        Tue, 30 Jun 2026 19:27:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2591:b0:517:9407:5c38 with SMTP id
 d75a77b69052e-51c17e92d8dmr51264161cf.24.1782872820609; Tue, 30 Jun 2026
 19:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260619041304.2585485-1-hjadon@cisco.com>
In-Reply-To: <20260619041304.2585485-1-hjadon@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:26:47 +0800
X-Gm-Features: AVVi8CcSbcW8UtrCNhbMXiR_lUee-xSRa9d6JCCSvkT7fFDTfx3yWjgZVnzbKtw
Message-ID: <CA+s=J=wdJDW9TsU4kssqYAZzfFLyuPJA0oPQMSkTM-yMHPiU5A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH 0/4] samba: upgrade to 4.22.10
To: hjadon@cisco.com
Cc: openembedded-devel@lists.openembedded.org, vchavda@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZrzmQqcFcraJZESe0hzktEM8NXidyEuw
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a447af5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Q4-j1AaZAAAA:8 a=AUd_NHdVAAAA:8 a=EUspDBNiAAAA:8
 a=ocHU1tILJPdIRmwv4TUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: ZrzmQqcFcraJZESe0hzktEM8NXidyEuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAyMyBTYWx0ZWRfX+uCuJ+A9CclA
 1wGKCKXHSoE7NsWMjXr4VnXcSNOFEBu3FH9jVeWgKgOY98S0rf9xMN8UvtHs7tr7rkV6976dqmd
 /f1Cvjr0fYuoea8uMs/jVl3T6DKGdl4K88N3SMfYddcYxatedr/7dkBPojQuwDS2JgmE7BYy+Qj
 H1NzswSx+Jeq2lAoJcr2WiNQcgWQzC7r6vpE0i6cJ54/e3S08KK0GfHYrfpMJEGr/o3xDJ5MwEA
 66CSpxfcqADJie8Bjg3f0Qhi+AD3acQhFHYdKZljoKSBGBVOs1RCBVPVtpE6Im3CTEKq/Tov/Mn
 jYF/RbDdptnACZJkznmn1A3z22pGz2RfWPI7XLF7bXLEWRRpduYP2j/4WdXRKN8IgTyDqshwU83
 SFolalOFZZKm9AaKoUnGqCzUwuAofsFsY52T1Bsh0z9BD0d4yytDiiQW+9wtclxUHKQtrQmR3oU
 b1Ke7PxUPV14pg78VCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAyMyBTYWx0ZWRfXwodwe//LDqm1
 8zJCkEAcTomPVVmvg/OX3FY24k7VbJFUODSgwvXdHFd6lTxxQF3g8fpUjPg8Va9v+jvWVE5kOUN
 gr21+7rTgCaziJK3AGsyq6RHpLCI97k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 02:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127988

Hi Himanshu

On Fri, Jun 19, 2026 at 12:13=E2=80=AFPM Himanshu Jadon -X (hjadon - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org
<hjadon=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Himanshu Jadon <hjadon@cisco.com>
>
> This series upgrades Samba on scarthgap from 4.19.9 to 4.22.10.

This version jump includes feature upgrades and not acceptable for the
stable branch.

>
> Samba 4.22.10 is a security release and addresses:
> CVE-2026-1933, CVE-2026-2340, CVE-2026-3012,
> CVE-2026-3238, CVE-2026-4408, and CVE-2026-4480.
>
> The base 4.19.9 version is directly affected by CVE-2026-3012,
> CVE-2026-3238, CVE-2026-4408, and CVE-2026-4480. Samba lists
> CVE-2026-1933 as affecting versions since 4.21 and CVE-2026-2340
> as affecting versions since 4.20, so those two are fixed by
> 4.22.10 but are not applicable to the base 4.19.9 version.
>
> The Samba upgrade requires newer talloc, tdb, and tevent versions,
> so those dependency upgrades are included first in the series.
>
> Himanshu Jadon (4):
>   libtalloc: upgrade 2.4.2 -> 2.4.3
>   libtdb: upgrade 1.4.10 -> 1.4.13
>   libtevent: upgrade 0.16.1 -> 0.16.2
>   samba: upgrade 4.19.9 -> 4.22.10
>
>
> --
> 2.35.6
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127673): https://lists.openembedded.org/g/openembedde=
d-devel/message/127673
> Mute This Topic: https://lists.openembedded.org/mt/119879020/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

