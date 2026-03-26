Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC16109E550
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 05:11:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41540.1774501860901624680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 22:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QFiTx+y0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=O87kla9A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0xPFL779734
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 05:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDrNMuqRStlfajAZgaeynXGQXbX7bwyBTbTgjdUX0Gs=; b=QFiTx+y0vHov3s0p
	AErgToPoC5E1AkyHGhjAXyy5jJMbD7/8+JSfyqh0REqRPSTxEmrR1Rhq2GVsTLYQ
	ZUJFQpalKMXKroUrd6PmVPxncLoXOLNSlfWzHlS1k3GWYnCZmalcNl3mtnlctu7s
	QmC6m5aqKkPI8+UtEDK27hbTa7E9WlHTgan9Uum10bKF+9DeZ4Iel1rc+T/cyYA+
	FuFtCDnGg7eS210va4ZeE2/d3U3mTyyqQ9h6YITwiPyN/eGEURx14wL4eg1aiC1X
	vkpChn74nTtfQ6+loWI1fmziK4wS744kdm2teA8UPwUMk53u5sIzg4eHC0M7c0tR
	MWfglg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp3s2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 05:10:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cc6879a4bso18183706d6.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 22:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774501859; cv=none;
        d=google.com; s=arc-20240605;
        b=TYJwIU4j0Qm3CbxBJ5dXIoaaIjZB+SYRFtdsFmRNvwIrBrtr4QSpDijZ+PpIEfzrj0
         rI72BTfMloWSmZc68+HRgDLTQhQaQFqGDaQ9g5LSGtAg5RJfNZ2P/5mNtM5h6tIWNdLD
         McrQuXK7Pz1H7SlZ7q50xpOb3JzVItMgydiOC3NERjPHu6IZe3f8zgBr2eWHfgNWpRZM
         rSub3Sdsi665KBm72dRLPvbk3efaAW7PFFM1wXF/gJC6yfxTSmwqKW1Jl7+MhccRlox4
         t0kdHJI4hkRiEYi3CskwlkKDgvmTMyam1BzqB9SS1cXCfl+Gx7994+AJJHMDn6vNra67
         zFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xDrNMuqRStlfajAZgaeynXGQXbX7bwyBTbTgjdUX0Gs=;
        fh=pdeOg0eUEeSbuFfdgh6mXmfyvsNCruy81TzftImGxD4=;
        b=aTaZvjcKyqmsw6FhL6TYjhyz8mitSILr1lVSEKRAAqXIcxJKaRggfUi46+eZhXju6G
         OMlQG6zi9NONKNikeX0HB/6yVvV3o9rQ7A6GI0NTiNJ5Mt3jA4ZMwzhAzJ7blqjE2Wry
         S4ArtfCnhh0icmlj1iscF4Kjbd2cD8gpueQgsN+tbPGUwno6xuy7jzNl9XX9OkBJhmhr
         Q4bwRhyEE/QqmJHZXAC8I2ND8Smv9H6ABRiGFAN45BTIPaVuyFu2D8xl5WysjCzJ1zNf
         wF/w3SmxNyy9i5diADxxj3UhZ6/hJ7KagNV9DD6HjAzvB21paG3PQkGyXIijXrF1Li/7
         RJZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501859; x=1775106659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDrNMuqRStlfajAZgaeynXGQXbX7bwyBTbTgjdUX0Gs=;
        b=O87kla9AkBVeIdkLDl468oWprRv7VAmNbBl+PQbqx0HdJLTiZzOWTITY+65O0XN9J1
         LFYEzRDr+AgmjOaXyw/7LPbeG3klIm+LPurfFq//V5t4c34LwAsduXUCP+eBN9XKl3gU
         pzTc/KKVZeSgKFv8G6/ZRB94677mg6RYz5Y+s/V8S6pzx5e4xuiT/P/3i5cpfYQYHMax
         mqOrfPS3surKyKy16O5HAGB+n0DygXBjv4lI515LpsHcZhxPLtnnDxNUIfsoo+yyCCh9
         /Zk71ObOykTZ56GkzS23ICz7PqMhdemdCOdhXVN+WaQfuHsXY8uEXi14DCA5RgSQAld4
         Bn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501859; x=1775106659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xDrNMuqRStlfajAZgaeynXGQXbX7bwyBTbTgjdUX0Gs=;
        b=DbgTGSxUgUmpKk+ddruFz0dAUs2563gl+GuzEh7GLdVr8ea/A2irdZGhlNsoNCl3sz
         MheNHdwLVnxW8P2uAon+yHPy7ShDHnKc95SPVdA+N8v6CAufRFuO0MN4VebIL3rT1/4i
         CXra++gI8cV85X9DXxrKYyWOKrXD/+BOvKuSTug7tPXou1Feev77cCWyo0D6LbcttibO
         LpL+Jy5346iT8FLsN9v2q/38C5INjxnxX63MY7Bs60O5xS+1uwqhPszYdi3AmEu2YfkA
         efIJwwQrSb1j0IkP2lhrqwVzcWDTbfh2nf6Ju61oxKQrPpq7lVE+L0JOMhiCz/UYVcv5
         N8MA==
X-Gm-Message-State: AOJu0Yw+La0e2ztQswm9eCRN4dDKhUg3A+107ke27Ztf1kBKwGy/IRtZ
	jQkIHhpOabTezto/TgESdmIggGIUmV/dEnlAhIEp351mRiKGigRieMOX5vExdbzEG0+6CIeX+gI
	udBW+N6pKqVshGZ6fc+z9gFKVUP7m+pHgQB5N3FZrtmWalHXEJaey/J7iWeDN26WzykunH3v7xZ
	+nUmve/tTdCEvBLu7LBRqezF3S1/mBQZmJoJca5B9PBTEiLTo4kSx+bejJHag=
X-Gm-Gg: ATEYQzzrhRtMTst1AJkTdSsnI4zd/p6YPmPfTmBhnVVW4Ce6bbTGWx0fSSvk9EqLp4q
	FhI6JOlWnTksydkYNE46YlwJMQ3nFipqXKNW1fQDf64UV0Wu4S5m7zxIvEt67GyM6SL+s2tUILu
	biuRs9VOWfDGhI1fTUB7ozHwzwCYYZ+iXmInIyRxDIEFk8SxmEjH1rh1XZNYC5aS4XMiVjFEOTp
	Dh9
X-Received: by 2002:a05:6214:246b:b0:89c:869e:4972 with SMTP id 6a1803df08f44-89cdde0e947mr2213636d6.10.1774501859010;
        Wed, 25 Mar 2026 22:10:59 -0700 (PDT)
X-Received: by 2002:a05:6214:246b:b0:89c:869e:4972 with SMTP id
 6a1803df08f44-89cdde0e947mr2213466d6.10.1774501858527; Wed, 25 Mar 2026
 22:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260310121621.196342-1-deerath@cisco.com> <20260311102514.2921809-1-deeratho@cisco.com>
In-Reply-To: <20260311102514.2921809-1-deeratho@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:10:47 +0800
X-Gm-Features: AQROBzBDwN2lSW4PGV0T1iGu2IuT0k0Ub945zt8N-u3eUq1zihjRPc48_1nt8tU
Message-ID: <CA+s=J=z+CAH7pVNJr45ig9J0BxPTjoxN3dwcEq6h9vPpG=zBPA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][whinlatter][PATCH v2] libssh: Fix CVE-2026-3731
To: deeratho@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: wnqzzeEklPUFx_bsSBu80MCY1qkDURqg
X-Proofpoint-GUID: wnqzzeEklPUFx_bsSBu80MCY1qkDURqg
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c4bfe3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=nar8ntqeAAAA:8 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8
 a=AUd_NHdVAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ib6B5nv-OXExPXElO18A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=RptMqvEBejqe73AKBt4K:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNyBTYWx0ZWRfXyeUZIGgILkkX
 gm3T2Ww4ahm6xkgNm5ePyFCML5VSPyE6u+bNNUqLzbTrm8BnnT9+dcBQexCJAXa7dJg2igR6aJg
 hOVa2HHQQvHLbR0RuPScgH97ceRDmaCdov9m6G11NdcTFntQXcy4S9Npk8Cg2KFpOblVGRm4o1M
 Od3bC6+BvRzhjoQwgTppFCGj1QWIieQ3vWV24ajJIhkzdrIgGHiYHwjD/vBMMETowdN5nItdins
 wsr4RbezsH477O6lvw04JB5W3ZcNoGOoP3kSslqVYXkHNIAnsa9ls5XjwSvkS10gvXBL4kok420
 hi9FohQdQnuX9THtiQbqsZD4pg/KBgkghm055gt0DzoHIFvswKFe1hRmgYtFMlAZgCHMADQmc9N
 sM4nct+dgvK584nDPM8P6Bttj76KBN5gg1Qoq62WWpHCFUD6lnDHwpxfgJ47cR+JLjhS+r3QlVH
 vQAR0tlqDVG5b8OlTdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 05:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125636

On Wed, Mar 11, 2026 at 6:25=E2=80=AFPM Deepak Rathore via
lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
wrote:
>
> From: Deepak Rathore <deeratho@cisco.com>
>
> Pick the patch [1] and [2] as mentioned in [3]
>
> [1] https://git.libssh.org/projects/libssh.git/commit/?id=3Df80670a7aba86=
cbb442c9b115c9eaf4ca04601b8
> [2] https://git.libssh.org/projects/libssh.git/commit/?id=3D02c6f5f7ec862=
9a7cff6a28cde9701ab10304540
> [3] https://security-tracker.debian.org/tracker/CVE-2026-3731
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> Changes from v1 to v2:
> - Update the commit message.
> - Cherry pick it from libssh-0.11.4 release tag and add the second patch
>   to add the reproducer for the CVE.
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch=
 b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch
> new file mode 100644
> index 0000000000..bf1fbcc027
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch
> @@ -0,0 +1,35 @@
> +From 04d2f831fa8da74c973538cd3f621061a7656771 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 11 Dec 2025 13:22:44 +0100
> +Subject: [PATCH 1/2] sftp: Fix out-of-bound read from sftp extensions
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2026-3731
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/co=
mmit/?id=3Df80670a7aba86cbb442c9b115c9eaf4ca04601b8]

We are missing a hunk from this commit. Was it dropped on purpose?

> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik <pzacik@redhat.com>
> +(cherry picked from commit 855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60)
> +(cherry picked from commit f80670a7aba86cbb442c9b115c9eaf4ca04601b8)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + src/sftp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/sftp.c b/src/sftp.c
> +index 37b4133b..05e05019 100644
> +--- a/src/sftp.c
> ++++ b/src/sftp.c
> +@@ -583,7 +583,7 @@ const char *sftp_extensions_get_name(sftp_session sf=
tp, unsigned int idx) {
> +     return NULL;
> +   }
> +
> +-  if (idx > sftp->ext->count) {
> ++  if (idx >=3D sftp->ext->count) {
> +     ssh_set_error_invalid(sftp->session);
> +     return NULL;
> +   }
> +--
> +2.35.6
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch=
 b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch
> new file mode 100644
> index 0000000000..b5a267b808
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch
> @@ -0,0 +1,102 @@
> +From df01168bb3863306ba0f35b50e5b2e5dd00ba9f6 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 11 Dec 2025 13:21:23 +0100
> +Subject: [PATCH 2/2] Reproducer for out of bounds read of SFTP extension=
s
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2026-3731
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/co=
mmit/?id=3D02c6f5f7ec8629a7cff6a28cde9701ab10304540]
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik <pzacik@redhat.com>
> +(cherry picked from commit b90b7f24517efa7ab21506db9379aa3dce9fee7d)
> +(cherry picked from commit 02c6f5f7ec8629a7cff6a28cde9701ab10304540)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + tests/client/torture_sftp_init.c | 62 +++++++++++++++++++++++++++++++-
> + 1 file changed, 61 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/client/torture_sftp_init.c b/tests/client/torture_sft=
p_init.c
> +index a17f01fe..cdc24426 100644
> +--- a/tests/client/torture_sftp_init.c
> ++++ b/tests/client/torture_sftp_init.c
> +@@ -72,6 +72,63 @@ static void session_setup_channel(void **state)
> +     assert_non_null(s->ssh.tsftp);
> + }
> +
> ++static void session_setup_extensions(void **state)
> ++{
> ++    struct torture_state *s =3D *state;
> ++    struct passwd *pwd =3D NULL;
> ++    int rc, count;
> ++    const char *name =3D NULL, *data =3D NULL;
> ++    sftp_session sftp =3D NULL;
> ++
> ++    pwd =3D getpwnam("bob");
> ++    assert_non_null(pwd);
> ++
> ++    rc =3D setuid(pwd->pw_uid);
> ++    assert_return_code(rc, errno);
> ++
> ++    s->ssh.session =3D torture_ssh_session(s,
> ++                                         TORTURE_SSH_SERVER,
> ++                                         NULL,
> ++                                         TORTURE_SSH_USER_ALICE,
> ++                                         NULL);
> ++    assert_non_null(s->ssh.session);
> ++
> ++    s->ssh.tsftp =3D torture_sftp_session(s->ssh.session);
> ++    assert_non_null(s->ssh.tsftp);
> ++    sftp =3D s->ssh.tsftp->sftp;
> ++
> ++    /* null parameter */
> ++    count =3D sftp_extensions_get_count(NULL);
> ++    assert_int_equal(count, 0);
> ++
> ++    count =3D sftp_extensions_get_count(sftp);
> ++    assert_int_not_equal(count, 0);
> ++
> ++    /* first null parameter */
> ++    name =3D sftp_extensions_get_name(NULL, 0);
> ++    assert_null(name);
> ++    data =3D sftp_extensions_get_data(NULL, 0);
> ++    assert_null(data);
> ++
> ++    /* First extension */
> ++    name =3D sftp_extensions_get_name(sftp, 0);
> ++    assert_non_null(name);
> ++    data =3D sftp_extensions_get_data(sftp, 0);
> ++    assert_non_null(data);
> ++
> ++    /* Last extension */
> ++    name =3D sftp_extensions_get_name(sftp, count - 1);
> ++    assert_non_null(name);
> ++    data =3D sftp_extensions_get_data(sftp, count - 1);
> ++    assert_non_null(data);
> ++
> ++    /* Overrun */
> ++    name =3D sftp_extensions_get_name(sftp, count);
> ++    assert_null(name);
> ++    data =3D sftp_extensions_get_data(sftp, count);
> ++    assert_null(data);
> ++}
> ++
> + static int session_teardown(void **state)
> + {
> +     struct torture_state *s =3D *state;
> +@@ -92,7 +149,10 @@ int torture_run_tests(void) {
> +                                         session_teardown),
> +         cmocka_unit_test_setup_teardown(session_setup_channel,
> +                                         NULL,
> +-                                        session_teardown)
> ++                                        session_teardown),
> ++        cmocka_unit_test_setup_teardown(session_setup_extensions,
> ++                                        NULL,
> ++                                        session_teardown),
> +     };
> +
> +     ssh_init();
> +--
> +2.35.6
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.11.3.bb
> index 5928581312..ab47931fa3 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> @@ -9,6 +9,8 @@ DEPENDS =3D "zlib openssl"
>  SRC_URI =3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;b=
ranch=3Dstable-0.11;tag=3D${BPN}-${PV} \
>             file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-comma=
nds.patch \
>             file://run-ptest \
> +           file://CVE-2026-3731_p1.patch \
> +           file://CVE-2026-3731_p2.patch \
>            "
>
>  SRC_URI:append:toolchain-clang =3D " file://0001-CompilerChecks.cmake-dr=
op-Wunused-variable-flag.patch"
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125081): https://lists.openembedded.org/g/openembedde=
d-devel/message/125081
> Mute This Topic: https://lists.openembedded.org/mt/118257651/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

