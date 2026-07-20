Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AAEC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:47:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11555.1784591215658716308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OWUhJsO+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hZird6Fr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND0er4022366
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJZ68AjblRiDIfZizoQljUL5ppOzl6hnXf594HzsAkc=; b=OWUhJsO+sTDc5ohs
	WBaWxFHYjzR/63TPNlzEoMPPjPOI60QZqf4AKQClFkH4WAoe6WZvaek7egYiE7is
	7c/jb04Tlboj1Ys4u5MB9ZXsOarJw7s1KfmreT/qlWpmyKRZjjAf/lPydTDdg0+M
	RzQQwMcjdCjnAmdeu1uG2KvcenU33WIrMsqFO6i/X1WRMa4hfAHjTXMCQWM60h09
	bRZl0kr6igy5nQSzaYpy17WvFngfX5UgHq8BfiO3p5+gZpCQFm9J2hCsXiPWSrmg
	6oBJcdodjdG5sNA2c4dvDzaktbjJoxBFWI6BUFtzCmAyR4Ute0iSMAIiJuB9Ibqn
	A4C2eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2fay0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:46:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so1778127785a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784591214; cv=none;
        d=google.com; s=arc-20260327;
        b=Hoo2bLlAlQnnYkZb+0hIe3gGmYpJNsb247bp+HmmHOXjT+kueuBir+l9iVzyZRXaeh
         klCglI8PgAZ2DSN+ayYVNJoR56/zcMrNjS4PK+kUxFHitm2Qzj1ZDQuW/b/kBNHqAX+c
         tBagjtNp13GHuwOvv9jASVSIRkzp5p7l7+wqeXkPRZj/JSYStfTm2Aedb/BgOOfuE8K8
         co+MHC9UEFVmVPlhQmQACSvB2yxAPQIhwfRAObcGURQg1uzatwhb3VT4pJRMXFwYgRY1
         B1m8OkdlGEyTMwOoMg7jJbOVsfuQbqulpizjA2+h/bS7XKvhS3CHykQRK2CCT+ukHog5
         KbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZJZ68AjblRiDIfZizoQljUL5ppOzl6hnXf594HzsAkc=;
        fh=xj6KlzOxbbr2PKjxKUjdj421gOtWsVmf9I9jk9T7wcY=;
        b=n6xOfHAYKMlINYEYjVsuPR1GPJoVQ/9iF5EYk8WF7kFEdVyKd41dH7xw4DwIceSehO
         dmr5a8HgNxar/0/5hwfH92CQ8CXEopqhWySps8eRdF9lsB/8zw7EhHexnFX0MDvzZOEs
         m21WayivOn9MAz5Ui+PKuwyMf38wGWIbEIHzl0LvTQ6jI3zygjobLwVGPbXwrc0f7YyC
         OW+j3o0VGqs3CtV02saEufaHHXL0b4B1aiY53xGRAWWP0jHTo6EE0hkVOjmrFe8ScP2F
         rGZ00CRnVoWPh1NlpKK+WdBRQj6RfwXqQzrRunGOdmEMfC1fPDzKDLI4LMNDa34eJ1Ck
         LrkA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784591214; x=1785196014; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZJZ68AjblRiDIfZizoQljUL5ppOzl6hnXf594HzsAkc=;
        b=hZird6FrCk463amvWJwwnnq/INaUkUX0UNuqUm09r0M0pr/7QRZ6d5x5CDmM0gBV6T
         CrNfdwquVZgI7alAJjgmsPrxslY502W2v8GK+CdPzNyqWEkKhR5rTPOZv6XrIVhUfySK
         aLyoKI2sECzG/r/2MzqI95CYOOV+LuNUBq0wyEUfQ/BJLYiMv3O/ic69O6RW+9izPyrE
         pqsnAq7V6rADwzNuSBjTHJoTQXYUKZBzW6xfEaVJDcveG6/FDOBRif1cCLAB2ZztKNHO
         Roy/dZrUO+2S0TC57/6ZrxVVsgiSM84KgMosaPKlEEcQwVBBu0MT30zIKR0Sq/a7BBtM
         nnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784591214; x=1785196014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJZ68AjblRiDIfZizoQljUL5ppOzl6hnXf594HzsAkc=;
        b=MNVlyT95vJ0GzcXpM2OH7F0Ua+GSJxznFexd1UrJPlCM7sRom30HV1vJ4DUCX5GpL6
         PXZPVwbJkPgKPUc5UNfuLjsIKLR5EC/+H7Sxym3ca+36ji2vpHxAkrD/7uD8V750QHqV
         dRA/yluly5i3Rbx8jv8BwAGYffMKHbp5cI/T67izcUzWg/0S+ljloWPhAxYabMDVDslK
         RNR4jd98WKqMUzqaB1hlRU0HkdiNgyhNQhDAQ8vu2/Ezx/R9wRW3ikqV2QRe9YP2sW4Y
         jMOb0R5jofo7x+2ixL7PvderuygtkgnLm58qy79YLLnTVPUgskx0Gs3YT0yVFaaNBRKS
         a6VA==
X-Gm-Message-State: AOJu0YzyvYahGZJD/ShPq3jFC9OYutPARd10+yzFL8EUqb9fdHp/jN/4
	rBzfoB+uAtSZwNm51Dqe027ZdeqPsvtn2GWD7n+3JCl8Nb3gW6H4gT3KCGMFP3HAXx1FPZWZjBT
	txw5RBvz/45mNfwErgAMpLieO+4XCNA5jbm12AWWxN58SSTOjy55kl7vczZzhUdFUaeZEvCQliM
	sKUkuiup3fToHQ34BsXlDUwo0d32t2dbmGiSexlCnnbFu0C+E68FxzM5JCgeg=
X-Gm-Gg: AfdE7clvxiLDahZd88obx30+gDaQrJIuiOKN3prWrXM0nN9SRv4iWrCHLAapjap768a
	GlvJnyYzcZvC+1hDSWrq8hxf10gb5H+DikAfwEpUldoDgN1BU9aYhb1XrAbpTwJ4UKhmn3tfIF7
	03UGXYAPIXK/AW8eUuhcL+5wudFzuoIv5W0bP92a0YbtYMs8Z5r3iAqRc=
X-Received: by 2002:a05:620a:400a:b0:92e:c117:5ee9 with SMTP id af79cd13be357-930b4315f90mr1576689485a.85.1784591213820;
        Mon, 20 Jul 2026 16:46:53 -0700 (PDT)
X-Received: by 2002:a05:620a:400a:b0:92e:c117:5ee9 with SMTP id
 af79cd13be357-930b4315f90mr1576686485a.85.1784591213393; Mon, 20 Jul 2026
 16:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260720225209.3736953-1-amery@apptly.co>
In-Reply-To: <20260720225209.3736953-1-amery@apptly.co>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:46:41 +0800
X-Gm-Features: AUfX_my-zEHJ-y0zz5KBi_sWh3s40y0MD9XTpq9i96rRwAbA2jeNRfyor2VrD7Q
Message-ID: <CA+s=J=xytfH89NZRWo4tooHb5S4EAWbxwzP87Y2-r5qgee__8A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][wrynose][PATCH] ltrace: fix PRIb64 length modifier
 on LP64 musl
To: amery@apptly.co
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YS1iFBHAQ2rJwA4LgTSEOh7ED8WayBAL
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5eb36e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Q4-j1AaZAAAA:8 a=Qku1CixM8vREcRu02ScA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI1NyBTYWx0ZWRfX+quUgbHQcd9y
 W+oxCjUItNn6IuKAWkCt8B3n4tdALM2o3iVZGaR4pv21YVQoFLYp0zRMyfOLTs94I+aevB5M199
 3c9AVtm/0IKaOGfd5++qD5/BekGcp2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI1NyBTYWx0ZWRfX9kdhPKRmVpNQ
 UFWiuLCKLpY9J+U/3O/hgl4sKjXUqaE9Ao/qo5RYEDL8DV636kpoIGI0QVOLS50Wa041bNrRysL
 VwC4fc3rjJwLcRe/YThY2xtcVwXlBPNKNVrEldBzCpY9L2H7PCC+tyxyKLQyN8950+3Ovv1c8Em
 Y7TyQwd+U5ZXpCXZXwUHoCxiQL+ZH0VVfs2Yg3bqb9U2yKtioybh71PNgWCB/BGXLkr7mVD/uZj
 XnlpCA+JEXOOm5Gx1PQ+vnXK9CWTqO/4mzDQmqq8T3PgMBOPyduDUiWDOG7Gq2Zr/+ds8rbiDiL
 KENqnZpoxXwdIObjxUaI+eYzYrdrBuZhzESDdDc5VjcFUJLNIgp9foQd04HQ0Vf0ZimZTkArI9Y
 Xi5uxN3wgpj4uF+pVbRTovX0Dg6xzSTWSkFyANK3fCTdae6gkJwXmqbxtkqNaGgKh4obDdKgxW5
 GKLB1nyz0DfUpe7j3ew==
X-Proofpoint-GUID: YS1iFBHAQ2rJwA4LgTSEOh7ED8WayBAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200257
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128332

Hi,

On Tue, Jul 21, 2026 at 6:52=E2=80=AFAM Alejandro Mery via
lists.openembedded.org <amery=3Dapptly.co@lists.openembedded.org> wrote:
>
> lens_default.c defines PRIb64 through a fallback that hardcodes
> __PRI64_PREFIX as "ll". That is only correct where uint64_t is unsigned
> long long (ILP32). On LP64 musl targets uint64_t is unsigned long, so the
> resulting "%llb" conversion does not match the argument and do_compile
> aborts under -Werror=3Dformat:
>
>     lens_default.c:90:48: error: format '%llb' expects argument of type
>     'long long unsigned int', but argument 3 has type 'uint64_t'
>     {aka 'long unsigned int'}
>
> glibc never reaches the fallback: it defines __PRI64_PREFIX itself,
> wordsize aware, in <inttypes.h>. musl provides the same modifier there
> under the name __PRI64 but not __PRI64_PREFIX, so the hardcoded "ll" is
> used and is wrong on 64-bit. Reuse musl's __PRI64 when __PRI64_PREFIX is
> absent, keeping "ll" as a last resort. glibc builds are unaffected: the
> block is skipped entirely.
>
> Signed-off-by: Alejandro Mery <amery@apptly.co>
> ---
>  ...t-fix-PRIb64-length-modifier-on-musl.patch | 49 +++++++++++++++++++
>  .../recipes-devtools/ltrace/ltrace_0.8.1.bb   |  1 +

master has the same version so I'm guessing this fix is applicable
there as well. Please send it for master branch first and wrynose fix
can be cherry picked from there.

Thanks,

Anuj

