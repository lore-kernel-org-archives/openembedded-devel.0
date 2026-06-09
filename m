Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4F0CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 05:54:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73017.1780984487670574724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 22:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cKhf5B5Q;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=H3oJpLtO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593xa8X1478553
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 05:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zA0gZ4lY5OPekWXlQHGHpA1cJMF0pLYPhlZ7LCWyJBs=; b=cKhf5B5QbkiRBW5l
	EK0GrRV9qQyN7otLgneQLFVu2ZdaQtk3BZYGYekcx13mhxip30/BqYkB7+P6+5qC
	0G/0Efg0L2kicgHX9a3bmNOV8TXdgAVhixLCMPrbrRcCfxXXtsAxhGF+VijM95Gb
	urbPPsWOyA7JicZxcSDqTjhWCkM6ZLE6IZqkctgBsHlhxePD1049Cjtv4hQN75oU
	L2gBCDw99sKAceFuue3FyInHBRA6ieXq1zBUTJWSNko+noyj82aaM4LM2SvoSS8i
	MtmRMrjHz5vAHtsMqVY7R78G7oq2sWpL/iA8ztDb7WHY3C4NEf+Nfa/hS4jt2/6y
	5/neUw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0mwvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 05:54:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccdcd8dd3dso125639956d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 22:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780984486; cv=none;
        d=google.com; s=arc-20240605;
        b=WJ1AGvi6/gX+WdYT3TGY0LVb39eWjTNofIecOC5bKzyQTlHqw528Azzod36ffYdfSo
         0PFPzMEuGaBC6ZpAxzMj0Lln9s6nVWdfqr5xQd39zlL+s4V2bC3SNKh7n7FHMUYGJcSR
         scKO19TBPKwl831clZLAYPl2ZVJgOREEqRyrVkUTlq9rHl1EFhtLuMUuv2GJj9+YAbLP
         IHD4sT7GxwiMhtuJeEB8KZApvE3cm/hnJFQqUNHvc+J46E8Gp8W4iR02a3uH7UoJvcIk
         9hchNxacaJzlQkkKB3juQGWRMwVwCVava417Dj37TGZ/BkB9dHnlGZQhvz3nWT5UCt6M
         /jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA0gZ4lY5OPekWXlQHGHpA1cJMF0pLYPhlZ7LCWyJBs=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=ICGgqx5MuTqVab9OTHSQNUWqbNrabtpyJ2RfwioMSuAcjyoj2xaQ6TZLOLcnyEizuH
         gsFm3K+pnE4ClST/01qw2xtaOtvoqUv22GZwz3Kxs6Znqb7Vguzx91JxBn4QHi1wNevA
         5njXOp1oY4MMEy5eeVIceHPkzuLgUt38Ei1hA/xDivopBTGdsdlHFU7UklV5gYkVftUx
         +IK7AC1XkFfb+bJXM2+/Tn9jrwJdI4fFgDFvyPlzYERo41eIxshkSTY67pWUho/WamNp
         DX+hS5b4YP8FTHZPGemRHeZhfaBAim37hU3GwSQWVSijSwvfl2o2zq5UcPXGQox5838p
         6u6A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984486; x=1781589286; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA0gZ4lY5OPekWXlQHGHpA1cJMF0pLYPhlZ7LCWyJBs=;
        b=H3oJpLtO2ai3byYe6U9fYwSgrcXUa3ECkdSBjOFFJR7O5a/jiu6bKYmA0m3syHXoX6
         /xkSHBNSBNyrm+2WEKvrQ3sz7nGyRw3EscFF5KVxDH/pKhMVB4M5Ho0Z1wetumaNvjy+
         zwrIOYIp986U5vi6Dyg2S9CobYMjHABv8IqAVGrLCiDM3M1SLo5LeJONdzMEOSWGOTQQ
         RDx7b2vERC+nUq3/PoXr12PbMWaO+JwDNM8GI1v5iLeTcYNTWXbd6cPlNKU/hdwiKRnw
         UBX16JqV8YsLytpOnemv53WI4xgPhDqfgNMwtbh0NE9eer7I7sjdNnEpwySYmmkP9zPI
         lCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984486; x=1781589286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zA0gZ4lY5OPekWXlQHGHpA1cJMF0pLYPhlZ7LCWyJBs=;
        b=ObBmKZw8mqWHRdl2caKoJYbFHqVYpoxRbW1NEG2Ol1txzJhSoyYXzrQ0LNtuEzU1Fm
         QwBBDL1a4nMg8OwQkHf4HwBSjPBROnONQ0SkN1lsIzZ+PibiZGdgeIl4i10xRgAgELh/
         pjerY2UHmPAdWMoAWe8+ql2a/LobZCJ6emaki/lQb3CPS28YhlakcPIVLPUIN9fO2FB3
         F5Yx0/eD7mbBPTPhkmg+RKMUSW+FT8LpxEzYDdavxcMUJy9C2HjJG7h2RQE5P9tA9dVK
         Srz3f1Qa7K2bRGwHlEBolGVCqSzQS2ofq25R/6T73l0W4BbWgzhj33ErfJpQQH2N119d
         Bmew==
X-Gm-Message-State: AOJu0Yy7ka6S5Z2hhFw0V/gIp2i9Hwao93v1CKgYD0ZkCXL/CNz3ng8+
	p1PrM4+lpbumd/f12FtDSavIomKKWD7TfcXMH68IDZFoG8Rg/Ypfc7JCtTeVR1gZTXotxmOvpAS
	4qlqywB6suYXoPOTN125soeuFW7u1T5HJHtym4PkQhqwAqfrHjTziTVIVad3nN9f0o/ndV8Qjcq
	1bQ/auBUJaUj8gEtrbr6+KnKNkYjEbaBzCUsdnqswsFFnOQ9VBqZGz/OmBt3Y=
X-Gm-Gg: Acq92OHmz3axiBMSACyAQD+DtV+LT2+TsnkvhjpOY+SOib4SFHeKaH5g0r088+NfO2/
	zH28B6OB6sYfNQDuUBRAGj9P6Fd/aFwoQIH1mYXdRmTWtHqlnO17O3kHOu5s7hrb5HZj7cjZhMC
	bFuGa4Oly0VkT3gevn+ePsAA5ev9HVhFYeLB8IUAS0qQJaY+GjzNkCfAgk1ZJE8l2+Q31uXMsDj
	JH9d/6OzWNm2cE=
X-Received: by 2002:ad4:574d:0:b0:8ca:1eb5:eaa3 with SMTP id 6a1803df08f44-8cf1cc977f2mr17642096d6.27.1780984485470;
        Mon, 08 Jun 2026 22:54:45 -0700 (PDT)
X-Received: by 2002:ad4:574d:0:b0:8ca:1eb5:eaa3 with SMTP id
 6a1803df08f44-8cf1cc977f2mr17641726d6.27.1780984484855; Mon, 08 Jun 2026
 22:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603094207.218632-1-ankur.tyagi85@gmail.com> <20260603094207.218632-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20260603094207.218632-3-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:54:33 +0800
X-Gm-Features: AVVi8Ccg2iw4ilhOR2t04m6vXD6HtagKqprG8tgcKapvS_0424311usKcrsFA3E
Message-ID: <CA+s=J=z5HK7CL31TbiLyGWzFtCXmyHUNA2JhsH=DXtG44gwSEQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 3/3] redis: upgrade 7.2.12 -> 7.2.14
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MyBTYWx0ZWRfX9AdfkuvDegVG
 0XwVLvEbqZ0APvZ6P0aJd9DB6izX58s1/14hP331C+Am2niKqv4jHiM/XoHAK38RS9r/ieJev2P
 djMeFESEvHJrqRV2+w2rOjlr/g2KFuYoDucuCxRrj0aikMLjZKeVOb650AmRaQNrdDF8u4VKwq0
 H6o4YOZ38ioglwHP+aMK7IfAACdrEgH5QDfkAaJEJz4N+1OkUmmNvbRUdSk/hdMulbNGxnah2HP
 Sb3UU0Y3mC9am2eRMJCdEOdQAez5Gvb1p+kboHFgXYiFlid9kWvr7C10LOKsk3sxlD88xiKvWQ3
 rrGbTJiE8+WnpU3bhlhNEhldUentorN1XfYViKe+WWm9Gjv+GztxvU8A8EUqdaG38giDiwCbQcP
 PV77ft07j7WCcEfb4p3EGpkzWn0Cxn32WZNWb2H4V4in0fKBbOZDIuleT+88JW0yuGhvvpDOgZw
 GWhQ0ixUxlKiyJyqs+g==
X-Proofpoint-ORIG-GUID: zWaTKU-Y-Fvx_qM5S3TcUrL2bdrxKoGQ
X-Proofpoint-GUID: zWaTKU-Y-Fvx_qM5S3TcUrL2bdrxKoGQ
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a27aaa6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=kw_7P3TwAAAA:20 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=Xf8B8zKvrIhdg1JsFn4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 05:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127431

On Wed, Jun 3, 2026 at 5:42=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Bug and security fix release
> https://github.com/redis/redis/releases/tag/7.2.13
> https://github.com/redis/redis/releases/tag/7.2.14
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
>  ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
>  .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
>  .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
>  ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
>  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
>  .../redis/{redis-7.2.12 =3D> redis-7.2.14}/init-redis-server      | 0
>  .../redis/{redis-7.2.12 =3D> redis-7.2.14}/redis.conf             | 0
>  .../redis/{redis-7.2.12 =3D> redis-7.2.14}/redis.service          | 0
>  .../recipes-extended/redis/{redis_7.2.12.bb =3D> redis_7.2.14.bb} | 2 +-

This fails with patch fuzz errors:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1546

Thanks,

Anuj

