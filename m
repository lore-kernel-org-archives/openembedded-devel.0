Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0831EC2A073
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 01:42:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55779.1767577373081775905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 17:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gpAd6e7P;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=edRUVSiz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MwlbI3028359
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jan 2026 01:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sHLTL83s7wDfgRamn6vp0LtCCuR+DyBwHL23gabotG4=; b=gpAd6e7P+UVJ/+Ja
	TsvZhXvoGPAYyiKZcVLwiZaKQ8zxUCXZ64Oi9WwBxoGFxLPVGiJNhwDlqt8mB0+w
	vEy4687+GuHw3bPoP0sRW/5gfESt6NRUenSMffoWenbR3hup0KiKRZgWSXVUI5tr
	zX+TuB3JgEFccwHNt3JW9yq8oidMEMgWtZ+zJ8ZYD8pIQsXoYzJHyoz0cxmGj3WV
	V9LHzUolKSa2VxqiIoC9YYaVQmvkdXz7B8d37eDtL/6ObQSZ2lhcGlNa9leVEaVC
	0ZuexWECFyOrfb8yEPJd1OieLfc3/yQTC3Y0mkuxKA6e4tHMZBtLUmVhqHj0712Q
	6t4jmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bevd82r55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 01:42:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so3368724185a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 17:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767577371; x=1768182171; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHLTL83s7wDfgRamn6vp0LtCCuR+DyBwHL23gabotG4=;
        b=edRUVSizHKpjkIyDa6pAAmprsx6zCxKuDVbAsAMwl6tm8h09ypQ5Rv7Hqiz4Ep0qf3
         K666h6+ixssRX7oH0h0YI1aWafKOplplx3J1jrXmvRcBB0RAgLMIpC9aZLEIPdOKPolH
         RiOaCAuDFOlQTcaQniHuwTdkvXisdrTuox36558uwdSSVF9nv+BDbkDnVmMt3+Lv/ArX
         Y9CMbt3LbNhLYANu/6Cmg95lICrxs/kkFsHNinC3JStdqs2OBmem3uHYET8yDx5wFP+3
         1zAZ2PPOuCjkToWPThsmju1apnFiU7o6U8yC3Msdj262JRrOcb+QumYGI9FoNbWliV6Z
         wFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767577371; x=1768182171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sHLTL83s7wDfgRamn6vp0LtCCuR+DyBwHL23gabotG4=;
        b=t5H2sdCebAjsdZ3Ntxag8j2Ner1LKhm/sGHTDzSjifmHTsT5QNJyACovWWfHrDVahS
         zwU2GDvz2eIPeXa989wHmKTcF/rjckShd79bQAonIol23nyVsXcBDaWSIyE+kNyrUg/u
         nUjHGF0KRghCVVlmlZ0hYsEca8vV4PY0bpvXbi0IN/exVFZXin7JRtqudzi8WYi7xC/5
         TY3LvzJv/B8uohyGIQcWXp9Q60ZjgXeox0cBrCZfbUnjrTCdy72z8Fo6HLTi9limxoVD
         acN7VuxB1TcynfesX+rB0cw+KsPX/9x3C2lg3yDj/Gc8nps1uOEl1pH7ujWyvLI3AxNE
         BqxQ==
X-Gm-Message-State: AOJu0Yw1SKC8/9oo7eXowymBJINpb6oZXi7qY+cgODLrGpzRT3wacsRn
	+Jn2ITPMTRJ4kVlI/8fxoOXPidywgKCs9b5EEFJ+tNMqU9FUf5MWAOdV4LNP/K4p1dDY3JBcqA3
	Mp2mvLLppbHBXVTygOWqRIN8TOKBHIneQBBIQdir/UpB3PEmubqXF7vNxlOy2hd7Zbi6y9kEngo
	L+dcQrxWlmQeo/2KXpNqW7joL1REHcW3Xo+Q4L1SecMhkWDFP9gOHOmYuJ5SQ=
X-Gm-Gg: AY/fxX6FW+r+jG9tIimqGDrLw/56S1KEJT6qfRnuQkNF7X5Rwc/Ixt8fE4LkH31dN6K
	AkN85yULEPFSHcfVyiUCplAKG65jvMCtn4UDyBMCgVbu/ZTzz0LAmUedT+vFSfUBw+iqbETW5Et
	/8V64zy2hXMQz2phz4/yUDVvhfcdHTALKpuaBkpXXXb/gqz1EmWtrNwUqyQOQmoBzh
X-Received: by 2002:a05:620a:7004:b0:89a:2f9b:10d3 with SMTP id af79cd13be357-8c08f66d9fcmr6984877885a.30.1767577371264;
        Sun, 04 Jan 2026 17:42:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIM2/27aMx0j04fRNpTNfFZwoZJFljPWVgzOOb1svhZSM3XybIBfs3tLfViKI71D/CNuoEZNQeMGhl7O7PCF4=
X-Received: by 2002:a05:620a:7004:b0:89a:2f9b:10d3 with SMTP id
 af79cd13be357-8c08f66d9fcmr6984876185a.30.1767577370627; Sun, 04 Jan 2026
 17:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20251231153607.3978985-1-colin.mcallister@garmin.com> <20251231153607.3978985-3-colin.mcallister@garmin.com>
In-Reply-To: <20251231153607.3978985-3-colin.mcallister@garmin.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 09:42:38 +0800
X-Gm-Features: AQt7F2qvz733okRNMJADFkaPjqPJg2nx6xmWQR61WH7-XG20mvhEijQvfKB9Jjw
Message-ID: <CA+s=J=xA_p9y-gnicpR+=Q+sxXk8sb8LwDE0o=SJgBJhaEjZ6A@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][scarthgap][PATCH 2/2] nginx: Fix
 CVE-2025-23419 for 1.25.5
To: colin.mcallister@garmin.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ZNfGj1qYwTUDe83-GJ_07t7ZS1wsDUw3
X-Proofpoint-ORIG-GUID: ZNfGj1qYwTUDe83-GJ_07t7ZS1wsDUw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAxMyBTYWx0ZWRfXw2jhj+cmN2Zh
 wazQ88Xp6ItVWtjHcj6eTVMn3WdT5EWUs6ovVUTBcwf5cwGQLaAxQUAdkBFDXFWfmxMeaNUkzhK
 3NCzas9A65KeghnDoHdCqBg2eErPGe+IXRTnbJMgLvOEm+oCXbM9kk55dPhmQtfnpriX3ptYZdH
 fUJbZfVOFlgdXffcbQsH2J0fQawh9hpKMNmByVBez/s9uFGrZVvOAj3gxGhdmEbrieVgYrKVY8I
 UYooecdMZrDJka9PCjGmnSu2sptiV34IDLaOtkC6yEI2sJ2rFYpW1kXoAJKsHTfPa8AdfRPu/aa
 Ly4fE6lOhG+jrP96RBfUkNWSI81SprDMSuorK8PPGmWHqXMZ+toPgIq8hDYZ6j2xUuZwfh4RA8D
 KvwF27yuGluEPBTkBFw90YuCHI+oY9OLdR0TnteBukObpBCk0WX828ZOIZlkJcNhUrjLhb8OGYe
 KdlQxuMIRBRZKBm65LQ==
X-Authority-Analysis: v=2.4 cv=B9G0EetM c=1 sm=1 tr=0 ts=695b171c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=NbHB2C0EAAAA:8 a=L4EWI0dvAAAA:8 a=QIhr-27iAAAA:8 a=A1X0JdhQAAAA:8
 a=EUspDBNiAAAA:8 a=JLJCf6UEHuXGZ7jOmsUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 01:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123121

On Wed, Dec 31, 2025 at 11:39=E2=80=AFPM Colin McAllister via
lists.openembedded.org
<colin.mcallister=3Dgarmin.com@lists.openembedded.org> wrote:
>
> Updates nginx.inc to apply CVE-2025-23419.patch to both 1.24.0 and
> 1.25.5. However, a unique patch is provided for 1.25.5 since the
> upstream patch for CVE-2025-23419 can be cleanly applied to 1.25.5.
>
> Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
> ---
>
> I'm not 100% sure if this is the best way to handle overriding the patch =
for 1.25.5.
> I figured this was better than having two patch files both in the files d=
irectory
> with nearly identical names. Please let me know if there is a better way =
to do this.

This relies on BP being included first before files. I think we should
also create a separate directory with ${BP} as the name and move patch
for 1.24.0 there as well to make it easy to identify. It also won't
rely on parsing order.

>
>  .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 ++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
>  3 files changed, 121 insertions(+), 2 deletions(-)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2=
025-23419.patch
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-234=
19.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.p=
atch
> new file mode 100644
> index 0000000000..d1c5bd9b40
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patc=
h
> @@ -0,0 +1,119 @@
> +From 2de0d3fd114e9d3d6a56bd7298aff8c637063509 Mon Sep 17 00:00:00 2001
> +From: Sergey Kandaurov <pluknet@nginx.com>
> +Date: Wed, 22 Jan 2025 18:55:44 +0400
> +Subject: [PATCH] SNI: added restriction for TLSv1.3 cross-SNI session
> + resumption.
> +
> +In OpenSSL, session resumption always happens in the default SSL context=
,
> +prior to invoking the SNI callback.  Further, unlike in TLSv1.2 and olde=
r
> +protocols, SSL_get_servername() returns values received in the resumptio=
n
> +handshake, which may be different from the value in the initial handshak=
e.
> +Notably, this makes the restriction added in b720f650b insufficient for
> +sessions resumed with different SNI server name.
> +
> +Considering the example from b720f650b, previously, a client was able to
> +request example.org by presenting a certificate for example.org, then to
> +resume and request example.com.
> +
> +The fix is to reject handshakes resumed with a different server name, if
> +verification of client certificates is enabled in a corresponding server
> +configuration.
> +
> +CVE: CVE-2025-23419
> +Upstream-Status: Backport [https://github.com/nginx/nginx/commit/13935cf=
9fdc3c8d8278c70716417d3b71c36140e]
> +Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
> +---
> + src/http/ngx_http_request.c        | 27 +++++++++++++++++++++++++--
> + src/stream/ngx_stream_ssl_module.c | 27 +++++++++++++++++++++++++--
> + 2 files changed, 50 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/http/ngx_http_request.c b/src/http/ngx_http_request.c
> +index 3cca57cf5..9593b7fb5 100644
> +--- a/src/http/ngx_http_request.c
> ++++ b/src/http/ngx_http_request.c
> +@@ -932,6 +932,31 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, i=
nt *ad, void *arg)
> +         goto done;
> +     }
> +
> ++    sscf =3D ngx_http_get_module_srv_conf(cscf->ctx, ngx_http_ssl_modul=
e);
> ++
> ++#if (defined TLS1_3_VERSION                                            =
       \
> ++     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGS=
SL)
> ++
> ++    /*
> ++     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
> ++     * but servername being negotiated in every TLSv1.3 handshake
> ++     * is only returned in OpenSSL 1.1.1+ as well
> ++     */
> ++
> ++    if (sscf->verify) {
> ++        const char  *hostname;
> ++
> ++        hostname =3D SSL_SESSION_get0_hostname(SSL_get0_session(ssl_con=
n));
> ++
> ++        if (hostname !=3D NULL && ngx_strcmp(hostname, servername) !=3D=
 0) {
> ++            c->ssl->handshake_rejected =3D 1;
> ++            *ad =3D SSL_AD_ACCESS_DENIED;
> ++            return SSL_TLSEXT_ERR_ALERT_FATAL;
> ++        }
> ++    }
> ++
> ++#endif
> ++
> +     hc->ssl_servername =3D ngx_palloc(c->pool, sizeof(ngx_str_t));
> +     if (hc->ssl_servername =3D=3D NULL) {
> +         goto error;
> +@@ -945,8 +970,6 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, in=
t *ad, void *arg)
> +
> +     ngx_set_connection_log(c, clcf->error_log);
> +
> +-    sscf =3D ngx_http_get_module_srv_conf(hc->conf_ctx, ngx_http_ssl_mo=
dule);
> +-
> +     c->ssl->buffer_size =3D sscf->buffer_size;
> +
> +     if (sscf->ssl.ctx) {
> +diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_=
ssl_module.c
> +index ba444776a..6dee106de 100644
> +--- a/src/stream/ngx_stream_ssl_module.c
> ++++ b/src/stream/ngx_stream_ssl_module.c
> +@@ -521,12 +521,35 @@ ngx_stream_ssl_servername(ngx_ssl_conn_t *ssl_conn=
, int *ad, void *arg)
> +         goto done;
> +     }
> +
> ++    sscf =3D ngx_stream_get_module_srv_conf(cscf->ctx, ngx_stream_ssl_m=
odule);
> ++
> ++#if (defined TLS1_3_VERSION                                            =
       \
> ++     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGS=
SL)
> ++
> ++    /*
> ++     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
> ++     * but servername being negotiated in every TLSv1.3 handshake
> ++     * is only returned in OpenSSL 1.1.1+ as well
> ++     */
> ++
> ++    if (sscf->verify) {
> ++        const char  *hostname;
> ++
> ++        hostname =3D SSL_SESSION_get0_hostname(SSL_get0_session(ssl_con=
n));
> ++
> ++        if (hostname !=3D NULL && ngx_strcmp(hostname, servername) !=3D=
 0) {
> ++            c->ssl->handshake_rejected =3D 1;
> ++            *ad =3D SSL_AD_ACCESS_DENIED;
> ++            return SSL_TLSEXT_ERR_ALERT_FATAL;
> ++        }
> ++    }
> ++
> ++#endif
> ++
> +     s->srv_conf =3D cscf->ctx->srv_conf;
> +
> +     ngx_set_connection_log(c, cscf->error_log);
> +
> +-    sscf =3D ngx_stream_get_module_srv_conf(s, ngx_stream_ssl_module);
> +-
> +     if (sscf->ssl.ctx) {
> +         if (SSL_set_SSL_CTX(ssl_conn, sscf->ssl.ctx) =3D=3D NULL) {
> +             goto error;
> +--
> +2.52.0
> +
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
> index 945be05c6a..865d7f86ee 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -26,6 +26,7 @@ SRC_URI =3D " \
>      file://CVE-2024-7347-1.patch \
>      file://CVE-2024-7347-2.patch \
>      file://CVE-2025-53859.patch \
> +    file://CVE-2025-23419.patch \
>  "
>
>  inherit siteinfo update-rc.d useradd systemd
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.24.0.bb
> index ed18b6471d..e5666f6fe6 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> @@ -2,8 +2,7 @@ require nginx.inc
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D175abb631c799f54573dc481454c8=
632"
>
> -SRC_URI:append =3D " file://CVE-2023-44487.patch \
> -                   file://CVE-2025-23419.patch"
> +SRC_URI:append =3D " file://CVE-2023-44487.patch"
>
>  SRC_URI[sha256sum] =3D "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a=
940283e30ff2f55d"
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123077): https://lists.openembedded.org/g/openembedde=
d-devel/message/123077
> Mute This Topic: https://lists.openembedded.org/mt/117013060/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

