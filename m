Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E62CD6E56
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 13:10:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23465.1763039417503836803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 05:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ip3IRgqo;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FpRbMOuD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADBLmbX174696
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 13:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GlZp79PVsTH3WUVudKWA5Vwn
	6mymdupFzUkl6/yGnIw=; b=ip3IRgqoaCjwIJ59TP/kJqs7QBJN+Td3wk3jykdr
	ZQhLtYu6VPPhm2e0UZVdy2YRgve/gmaEnaIp24Eb0+X7IBpGxHmweaJtXW+cjFZf
	hCTcaIOVlPD8yfKLPanAkJAnckCUL8HpSkhiwfUi4IjVpoxuAhdNje1UjY0iXNHp
	m2F07aUoIo6VZpReW+c0TC2wTWcgRz1jqAY+n7WjBzF2MohNe+D6YNRfeyi79U4O
	jwJa/JHjXrFJtUZlKR4Y1bxHnO05f++HryDcOE0WP5zZmwsEIHCJBArsWdsRBsKP
	NXapzBH2abglGJA3YClaVMWuOpbqoG24xwNEzJPfDf109A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aded1r9gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 13:10:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8826a2b2d9aso24859186d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763039416; x=1763644216; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GlZp79PVsTH3WUVudKWA5Vwn6mymdupFzUkl6/yGnIw=;
        b=FpRbMOuD7BonxrYRBdeqqnKg6759jxL7q9Ykd+Beq5+owdY/g+7PIA3rfBtek9HIny
         cAt/qty+V3eSO+tF+1sMe0W0FWuxPVwnrDsiJK52IEf6LhHGcq2uEmYU7v0ZVmNL/4Ur
         f5MgizzokAMFks9WmiA6dTkL/b6w+dZpy2x67KlhzD7+onLsABVTV5WmsYCyJRgwP/jJ
         vTmOtfoV9OY/dBNbe3cgYzbQ/yVpwwapRa5MHrpn8YARdUbpIZWORaqKcZnT5s4e9PXz
         TQ1zdV8N7Xx0G6AQaoQRYteaFaYpznwLPrC6if3MvVbXs78gVWhJhTu7L411hux+6NBu
         0maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039416; x=1763644216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlZp79PVsTH3WUVudKWA5Vwn6mymdupFzUkl6/yGnIw=;
        b=UEP45OQKjosYqm2YUu0Jv+N5Ri0okDKlFgJwWknb2yaYSImhFa0mnvgVmqrlg+zTVn
         UJCHA+xg8gGgliOLWnqwk6i9qAgFQW0grCZ30DUw7Dsldij8JBIjnMB7Az7cV6yD6scb
         heOoM4ceViHyaxB5QNK9z5zGcBDQTrpD1K1ve+zseATK556ZG0vf3ipNdMdLuih76tc4
         36n/p2XUXTi029a1ITfW1T/FjRMNx2MuXUbf1nqoLOTgLMeEaLdc4i0vAh2aJLO4R1q2
         QosgqS7Bxx9OxE/qqqX2S7LorujueQAt5L0AaNRHF9rjB7F/DCTTaGUvcr71v3lr/BTT
         k9mg==
X-Gm-Message-State: AOJu0YyhHX6H3uP1eT7gfLH6B+FLBG0VPyDf27gxbcR6yKqiDhgWs7oP
	efwsdAswYKRCNdcx+YnoY3b9xgcPgVzqgTOTnHcoUyT2LRyhXzzLCFNovAsXK3iHFH4GrK04Ruo
	OouCQfLwqBI3yfUqfbKWzEvVvn4zaBi9B25JY1QUaDLzWFmZha789D4MSHNOtn7Y2pKM/4yFrmL
	qUcAJA/8eBhynjh/85Cb8h/G/M6l0XYDd4E1yU1BoNOKyCwcSJwP7nmVdTelQ=
X-Gm-Gg: ASbGnculgen7D7cXWts6ooM0m07R/QjA2FLtuJI3hEGqzT+8b99JSKsdBVqh2Dl+Vgp
	DbcJnlIEPVKjzwb5z2cfxe6YTXgbrBepVGkDsasRUdzof4MX+XZxi6hna8PAPITlNQ8Gh7A9uSI
	Dd1H4qqESSTAK6pczzWCDbXZjp8OYKunuyjm1awkTvIOQ0xplJ0B1IDg==
X-Received: by 2002:a05:6214:4003:b0:882:36bc:da61 with SMTP id 6a1803df08f44-88271901f1fmr96911296d6.2.1763039415643;
        Thu, 13 Nov 2025 05:10:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzddTcuh9zhjO1h3kmtAdIA2w7xyj+8CALPteHOarD6LM/u7wltyyqsAqVt504wYpI1o+Y0J/j8glTRTZMDeQ=
X-Received: by 2002:a05:6214:4003:b0:882:36bc:da61 with SMTP id
 6a1803df08f44-88271901f1fmr96910456d6.2.1763039414908; Thu, 13 Nov 2025
 05:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20251101222410.1579968-1-peter.marko@siemens.com> <20251106210235.3255578-1-peter.marko@siemens.com>
In-Reply-To: <20251106210235.3255578-1-peter.marko@siemens.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 21:10:03 +0800
X-Gm-Features: AWmQ_bn8pl3QPbXNh0rVbVhoJh-eAIUr3C1es7CyLPH3POnYaxdnUaBqWRArVF4
Message-ID: <CA+s=J=xfczoSTjfVn7JQt3LoFsxPWhGnnR1Qtt1sQHKR4pdQtA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH v2] squid: patch CVE-2025-62168
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000d09c40643799a61"
X-Proofpoint-ORIG-GUID: yxxmcP_IloDMcXGTGCNUMrTdbQBtKKkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfX8xfE6SLPCZUB
 r5/ZXpI5miAFezAza34Slj4RRi4jU8m4LPWT+ey5vOl+SZErNG7kFTclyBHt8AC2g7s4TgQhzJD
 4q7gXjI+/Tm0V7tqc58+LLZAeelwAgaVz28WQwmH5sDkkO2BgoMQW6cetfVtllxN1LE+5YIg6HL
 Y4V03/JvFFgDj19T5gWMsKj51CMZYEYwz5n6cvwACY/jGaV6JTZk+TQ9QEMBnuxPM5O+KhPh9YZ
 UpmiC57jUt+tX3ZV8/1PU6T3ewoi8CRqXSwNtfahic4w+2505snL1AJfN/XnWWmz2f8sLNcJdUW
 k0bs89ScrZUDsH3JvAMCrxagxiBudNoeD/Z8ag6cJjaDg+OpgCkWGdE9yDTYc/ZkB5NJp1nii/A
 d2EhTK6uxftoapvOx7OzkgFDIvrggA==
X-Authority-Analysis: v=2.4 cv=StudKfO0 c=1 sm=1 tr=0 ts=6915d8b9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=00YenlzPAAAA:8 a=Q4-j1AaZAAAA:8
 a=a_U1oVfrAAAA:8 a=or2NZp3mAAAA:8 a=EUspDBNiAAAA:8 a=GitSb2nvo9UJ9BK4tHcA:9
 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10 a=QEXdDO2ut3YA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=cUW-zQj0AAAA:8 a=h7gzvpkNNT3s9TKo1aQA:9
 a=ya9VnApc5cvXhK1h:21 a=1HOtulTD9v-eNWfpl4qZ:22 a=FA-OfGwn9n36E_TAEFIg:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=gJuBBaUXoiGZxf_zayvq:22 a=2fd0wjtG6IkNllS7Rezt:22
X-Proofpoint-GUID: yxxmcP_IloDMcXGTGCNUMrTdbQBtKKkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 13:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121651

--0000000000000d09c40643799a61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed including this in my latest test queue. Will take it up now=
.

Thanks,

Anuj

On Fri, Nov 7, 2025 at 5:02=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit mentioned in NVD CVE report.
>
> Conflict in src/errorpage.cc resolved per patch from Debian bookworm.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2: added missing patch statuses (CVE, sign-off, upstream status)
>
>  .../squid/files/CVE-2025-62168.patch          | 211 ++++++++++++++++++
>  .../recipes-daemons/squid/squid_6.9.bb        |   1 +
>  2 files changed, 212 insertions(+)
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
>
> diff --git
> a/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
> b/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
> new file mode 100644
> index 0000000000..b4e05656ba
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
> @@ -0,0 +1,211 @@
> +From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
> +From: Amos Jeffries <yadij@users.noreply.github.com>
> +Date: Sat, 11 Oct 2025 16:33:02 +1300
> +Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
> +
> +Original changes to redact credentials from error page %R code
> +expansion output was incomplete. It missed the parse failure
> +case where ErrorState::request_hdrs raw buffer contained
> +sensitive information.
> +
> +Also missed was the %W case where full request message headers
> +were generated in a mailto link. This case is especially
> +problematic as it may be delivered over insecure SMTP even if
> +the error was secured with HTTPS.
> +
> +After this change:
> +* The HttpRequest message packing code for error pages is de-duplicated
> +  and elides authentication headers for both %R and %W code outputs.
> +* The %R code output includes the CRLF request message terminator.
> +* The email_err_data directive causing advanced details to be added to
> +  %W mailto links is disabled by default.
> +
> +Also redact credentials from generated TRACE responses.
> +
> +---------
> +
> +Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
> +
> +CVE: CVE-2025-62168
> +Upstream-Status: Backport [
> https://github.com/squid-cache/squid/commit/0951a0681011dfca3d78c84fd7f1e=
19c78a4443f
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> v2: added missing patch tags (cve, upstream-status, signed-off-by)
>
> + src/HttpRequest.cc            |  6 +++---
> + src/HttpRequest.h             |  2 +-
> + src/cf.data.pre               |  8 +++++++-
> + src/client_side_reply.cc      | 14 +++++++-------
> + src/errorpage.cc              | 17 ++++-------------
> + src/errorpage.h               |  1 -
> + src/tests/stub_HttpRequest.cc |  2 +-
> + 7 files changed, 23 insertions(+), 27 deletions(-)
> +
> +diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
> +index cd7ee71d4..c6ed5bee4 100644
> +--- a/src/HttpRequest.cc
> ++++ b/src/HttpRequest.cc
> +@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
> +
> + /* packs request-line and headers, appends <crlf> terminator */
> + void
> +-HttpRequest::pack(Packable * p) const
> ++HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) con=
st
> + {
> +     assert(p);
> +     /* pack request-line */
> +@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
> +                SQUIDSBUFPRINT(method.image()),
> SQUIDSBUFPRINT(url.path()),
> +                http_ver.major, http_ver.minor);
> +     /* headers */
> +-    header.packInto(p);
> +-    /* trailer */
> ++    header.packInto(p, maskSensitiveInfo);
> ++    /* indicate the end of the header section */
> +     p->append("\r\n", 2);
> + }
> +
> +diff --git a/src/HttpRequest.h b/src/HttpRequest.h
> +index 6d3690293..28dc4daf9 100644
> +--- a/src/HttpRequest.h
> ++++ b/src/HttpRequest.h
> +@@ -206,7 +206,7 @@ public:
> +
> +     void swapOut(StoreEntry * e);
> +
> +-    void pack(Packable * p) const;
> ++    void pack(Packable * p, bool maskSensitiveInfo =3D false) const;
> +
> +     static void httpRequestPack(void *obj, Packable *p);
> +
> +diff --git a/src/cf.data.pre b/src/cf.data.pre
> +index 0a73020e1..2dce65a4d 100644
> +--- a/src/cf.data.pre
> ++++ b/src/cf.data.pre
> +@@ -8915,12 +8915,18 @@ NAME: email_err_data
> + COMMENT: on|off
> + TYPE: onoff
> + LOC: Config.onoff.emailErrData
> +-DEFAULT: on
> ++DEFAULT: off
> + DOC_START
> +       If enabled, information about the occurred error will be
> +       included in the mailto links of the ERR pages (if %W is set)
> +       so that the email body contains the data.
> +       Syntax is <A HREF=3D"mailto:%w%W">%w</A>
> ++
> ++      SECURITY WARNING:
> ++              Request headers and other included facts may contain
> ++              sensitive information about transaction history, the
> ++              Squid instance, and its environment which would be
> ++              unavailable to error recipients otherwise.
> + DOC_END
> +
> + NAME: deny_info
> +diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
> +index d73bf3f99..fc2feccf8 100644
> +--- a/src/client_side_reply.cc
> ++++ b/src/client_side_reply.cc
> +@@ -94,7 +94,7 @@
> clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) =
:
> + void
> + clientReplyContext::setReplyToError(
> +     err_type err, Http::StatusCode status, char const *uri,
> +-    const ConnStateData *conn, HttpRequest *failedrequest, const char
> *unparsedrequest,
> ++    const ConnStateData *conn, HttpRequest *failedrequest, const char *=
,
> + #if USE_AUTH
> +     Auth::UserRequest::Pointer auth_user_request
> + #else
> +@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
> + {
> +     auto errstate =3D clientBuildError(err, status, uri, conn,
> failedrequest, http->al);
> +
> +-    if (unparsedrequest)
> +-        errstate->request_hdrs =3D xstrdup(unparsedrequest);
> +-
> + #if USE_AUTH
> +     errstate->auth_user_request =3D auth_user_request;
> + #endif
> +@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
> +     triggerInitialStoreRead();
> +     http->storeEntry()->releaseRequest();
> +     http->storeEntry()->buffer();
> ++    MemBuf content;
> ++    content.init();
> ++    http->request->pack(&content, true /* hide authorization data */);
> +     const HttpReplyPointer rep(new HttpReply);
> +-    rep->setHeaders(Http::scOkay, nullptr, "text/plain",
> http->request->prefixLen(), 0, squid_curtime);
> ++    rep->setHeaders(Http::scOkay, nullptr, "message/http",
> content.contentSize(), 0, squid_curtime);
> ++    rep->body.set(SBuf(content.buf, content.size));
> +     http->storeEntry()->replaceHttpReply(rep);
> +-    http->request->swapOut(http->storeEntry());
> +-    http->storeEntry()->complete();
> ++    http->storeEntry()->completeSuccessfully("traceReply() stored the
> entire response");
> + }
> +
> + #define SENDING_BODY 0
> +diff --git a/src/errorpage.cc b/src/errorpage.cc
> +index d7a588d09..06046de9e 100644
> +--- a/src/errorpage.cc
> ++++ b/src/errorpage.cc
> +@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
> + {
> +     safe_free(redirect_url);
> +     safe_free(url);
> +-    safe_free(request_hdrs);
> +     wordlistDestroy(&ftp.server_msg);
> +     safe_free(ftp.request);
> +     safe_free(ftp.reply);
> +@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
> +                     SQUIDSBUFPRINT(request->url.path()),
> +                     AnyP::ProtocolType_str[request->http_ver.protocol],
> +                     request->http_ver.major, request->http_ver.minor);
> +-        request->header.packInto(&str);
> ++        request->header.packInto(&str, true /* hide authorization data
> */);
> +     }
> +
> +     str.append("\r\n", 2);
> +@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
> +                 p =3D "[no request]";
> +             break;
> +         }
> +-        if (request) {
> +-            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
> +-                       SQUIDSBUFPRINT(request->method.image()),
> +-                       SQUIDSBUFPRINT(request->url.path()),
> +-
>  AnyP::ProtocolType_str[request->http_ver.protocol],
> +-                       request->http_ver.major, request->http_ver.minor=
);
> +-            request->header.packInto(&mb, true); //hide authorization
> data
> +-        } else if (request_hdrs) {
> +-            p =3D request_hdrs;
> +-        } else {
> ++        else if (request)
> ++            request->pack(&mb, true /* hide authorization data */);
> ++        else
> +             p =3D "[no request]";
> +-        }
> +         break;
> +
> +     case 's':
> +diff --git a/src/errorpage.h b/src/errorpage.h
> +index abca4a17d..297b30697 100644
> +--- a/src/errorpage.h
> ++++ b/src/errorpage.h
> +@@ -194,7 +194,6 @@ public:
> +         MemBuf *listing =3D nullptr;
> +     } ftp;
> +
> +-    char *request_hdrs =3D nullptr;
> +     char *err_msg =3D nullptr; /* Preformatted error message from the
> cache */
> +
> +     AccessLogEntryPointer ale; ///< transaction details (or nil)
> +diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.=
cc
> +index 495597d9a..48a0f1ce0 100644
> +--- a/src/tests/stub_HttpRequest.cc
> ++++ b/src/tests/stub_HttpRequest.cc
> +@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMetho=
d
> &, int64_t &) const STUB
> + bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
> + int HttpRequest::prefixLen() const STUB_RETVAL(0)
> + void HttpRequest::swapOut(StoreEntry *) STUB
> +-void HttpRequest::pack(Packable *) const STUB
> ++void HttpRequest::pack(Packable *, bool) const STUB
> + void HttpRequest::httpRequestPack(void *, Packable *) STUB
> + HttpRequest * HttpRequest::FromUrl(const SBuf &, const
> MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
> + HttpRequest * HttpRequest::FromUrlXXX(const char *, const
> MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
> diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb
> b/meta-networking/recipes-daemons/squid/squid_6.9.bb
> index 490a5401c3..26460d4619 100644
> --- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "
> http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
>             file://squid.nm \
>             file://CVE-2024-37894.patch \
>             file://CVE-2025-59362.patch \
> +           file://CVE-2025-62168.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121367):
> https://lists.openembedded.org/g/openembedded-devel/message/121367
> Mute This Topic: https://lists.openembedded.org/mt/116160723/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> anuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000d09c40643799a61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, I missed including this in my latest test queu=
e. Will take it up now.</div><div><br></div><div>Thanks,</div><div><br></di=
v><div>Anuj</div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 7, 2025 at 5:02=E2=80=AFAM Pet=
er Marko via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.o=
rg">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"mail=
to:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&g=
t;<br>
<br>
Pick commit mentioned in NVD CVE report.<br>
<br>
Conflict in src/errorpage.cc resolved per patch from Debian bookworm.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
v2: added missing patch statuses (CVE, sign-off, upstream status)<br>
<br>
=C2=A0.../squid/files/CVE-2025-62168.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 211 ++++++++++++++++++<br>
=C2=A0.../recipes-daemons/squid/<a href=3D"http://squid_6.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">squid_6.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A02 files changed, 212 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
25-62168.patch<br>
<br>
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.pat=
ch b/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch<br>
new file mode 100644<br>
index 0000000000..b4e05656ba<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch<br>
@@ -0,0 +1,211 @@<br>
+From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001<br>
+From: Amos Jeffries &lt;<a href=3D"mailto:yadij@users.noreply.github.com" =
target=3D"_blank">yadij@users.noreply.github.com</a>&gt;<br>
+Date: Sat, 11 Oct 2025 16:33:02 +1300<br>
+Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)<br>
+<br>
+Original changes to redact credentials from error page %R code<br>
+expansion output was incomplete. It missed the parse failure<br>
+case where ErrorState::request_hdrs raw buffer contained<br>
+sensitive information.<br>
+<br>
+Also missed was the %W case where full request message headers<br>
+were generated in a mailto link. This case is especially<br>
+problematic as it may be delivered over insecure SMTP even if<br>
+the error was secured with HTTPS.<br>
+<br>
+After this change:<br>
+* The HttpRequest message packing code for error pages is de-duplicated<br=
>
+=C2=A0 and elides authentication headers for both %R and %W code outputs.<=
br>
+* The %R code output includes the CRLF request message terminator.<br>
+* The email_err_data directive causing advanced details to be added to<br>
+=C2=A0 %W mailto links is disabled by default.<br>
+<br>
+Also redact credentials from generated TRACE responses.<br>
+<br>
+---------<br>
+<br>
+Co-authored-by: Alex Rousskov &lt;<a href=3D"mailto:rousskov@measurement-f=
actory.com" target=3D"_blank">rousskov@measurement-factory.com</a>&gt;<br>
+<br>
+CVE: CVE-2025-62168<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/squid-cache/squid=
/commit/0951a0681011dfca3d78c84fd7f1e19c78a4443f" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/squid-cache/squid/commit/0951a0681011dfca3d7=
8c84fd7f1e19c78a4443f</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
v2: added missing patch tags (cve, upstream-status, signed-off-by)<br>
<br>
+ src/HttpRequest.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++=
---<br>
+ src/HttpRequest.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
+ src/cf.data.pre=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 +++++++-<br>
+ src/client_side_reply.cc=C2=A0 =C2=A0 =C2=A0 | 14 +++++++-------<br>
+ src/errorpage.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++=
+-------------<br>
+ src/errorpage.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 -<br>
+ src/tests/stub_HttpRequest.cc |=C2=A0 2 +-<br>
+ 7 files changed, 23 insertions(+), 27 deletions(-)<br>
+<br>
+diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc<br>
+index cd7ee71d4..c6ed5bee4 100644<br>
+--- a/src/HttpRequest.cc<br>
++++ b/src/HttpRequest.cc<br>
+@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)<br>
+ <br>
+ /* packs request-line and headers, appends &lt;crlf&gt; terminator */<br>
+ void<br>
+-HttpRequest::pack(Packable * p) const<br>
++HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const=
<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0assert(p);<br>
+=C2=A0 =C2=A0 =C2=A0/* pack request-line */<br>
+@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SQUIDSBUFPRINT(met=
hod.image()), SQUIDSBUFPRINT(url.path()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http_ver.major, ht=
tp_ver.minor);<br>
+=C2=A0 =C2=A0 =C2=A0/* headers */<br>
+-=C2=A0 =C2=A0 header.packInto(p);<br>
+-=C2=A0 =C2=A0 /* trailer */<br>
++=C2=A0 =C2=A0 header.packInto(p, maskSensitiveInfo);<br>
++=C2=A0 =C2=A0 /* indicate the end of the header section */<br>
+=C2=A0 =C2=A0 =C2=A0p-&gt;append(&quot;\r\n&quot;, 2);<br>
+ }<br>
+ <br>
+diff --git a/src/HttpRequest.h b/src/HttpRequest.h<br>
+index 6d3690293..28dc4daf9 100644<br>
+--- a/src/HttpRequest.h<br>
++++ b/src/HttpRequest.h<br>
+@@ -206,7 +206,7 @@ public:<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0void swapOut(StoreEntry * e);<br>
+ <br>
+-=C2=A0 =C2=A0 void pack(Packable * p) const;<br>
++=C2=A0 =C2=A0 void pack(Packable * p, bool maskSensitiveInfo =3D false) c=
onst;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0static void httpRequestPack(void *obj, Packable *p);<b=
r>
+ <br>
+diff --git a/src/cf.data.pre b/src/cf.data.pre<br>
+index 0a73020e1..2dce65a4d 100644<br>
+--- a/src/cf.data.pre<br>
++++ b/src/cf.data.pre<br>
+@@ -8915,12 +8915,18 @@ NAME: email_err_data<br>
+ COMMENT: on|off<br>
+ TYPE: onoff<br>
+ LOC: Config.onoff.emailErrData<br>
+-DEFAULT: on<br>
++DEFAULT: off<br>
+ DOC_START<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0If enabled, information about the occurred erro=
r will be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0included in the mailto links of the ERR pages (=
if %W is set)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0so that the email body contains the data.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Syntax is &lt;A HREF=3D&quot;mailto:%w%W&quot;&=
gt;%w&lt;/A&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 SECURITY WARNING:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Request headers and othe=
r included facts may contain<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sensitive information ab=
out transaction history, the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Squid instance, and its =
environment which would be<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unavailable to error rec=
ipients otherwise.<br>
+ DOC_END<br>
+ <br>
+ NAME: deny_info<br>
+diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc<br>
+index d73bf3f99..fc2feccf8 100644<br>
+--- a/src/client_side_reply.cc<br>
++++ b/src/client_side_reply.cc<br>
+@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest=
 *clientContext) :<br>
+ void<br>
+ clientReplyContext::setReplyToError(<br>
+=C2=A0 =C2=A0 =C2=A0err_type err, Http::StatusCode status, char const *uri=
,<br>
+-=C2=A0 =C2=A0 const ConnStateData *conn, HttpRequest *failedrequest, cons=
t char *unparsedrequest,<br>
++=C2=A0 =C2=A0 const ConnStateData *conn, HttpRequest *failedrequest, cons=
t char *,<br>
+ #if USE_AUTH<br>
+=C2=A0 =C2=A0 =C2=A0Auth::UserRequest::Pointer auth_user_request<br>
+ #else<br>
+@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0auto errstate =3D clientBuildError(err, status, uri, c=
onn, failedrequest, http-&gt;al);<br>
+ <br>
+-=C2=A0 =C2=A0 if (unparsedrequest)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errstate-&gt;request_hdrs =3D xstrdup(unparse=
drequest);<br>
+-<br>
+ #if USE_AUTH<br>
+=C2=A0 =C2=A0 =C2=A0errstate-&gt;auth_user_request =3D auth_user_request;<=
br>
+ #endif<br>
+@@ -995,11 +992,14 @@ clientReplyContext::traceReply()<br>
+=C2=A0 =C2=A0 =C2=A0triggerInitialStoreRead();<br>
+=C2=A0 =C2=A0 =C2=A0http-&gt;storeEntry()-&gt;releaseRequest();<br>
+=C2=A0 =C2=A0 =C2=A0http-&gt;storeEntry()-&gt;buffer();<br>
++=C2=A0 =C2=A0 MemBuf content;<br>
++=C2=A0 =C2=A0 content.init();<br>
++=C2=A0 =C2=A0 http-&gt;request-&gt;pack(&amp;content, true /* hide author=
ization data */);<br>
+=C2=A0 =C2=A0 =C2=A0const HttpReplyPointer rep(new HttpReply);<br>
+-=C2=A0 =C2=A0 rep-&gt;setHeaders(Http::scOkay, nullptr, &quot;text/plain&=
quot;, http-&gt;request-&gt;prefixLen(), 0, squid_curtime);<br>
++=C2=A0 =C2=A0 rep-&gt;setHeaders(Http::scOkay, nullptr, &quot;message/htt=
p&quot;, content.contentSize(), 0, squid_curtime);<br>
++=C2=A0 =C2=A0 rep-&gt;body.set(SBuf(content.buf, content.size));<br>
+=C2=A0 =C2=A0 =C2=A0http-&gt;storeEntry()-&gt;replaceHttpReply(rep);<br>
+-=C2=A0 =C2=A0 http-&gt;request-&gt;swapOut(http-&gt;storeEntry());<br>
+-=C2=A0 =C2=A0 http-&gt;storeEntry()-&gt;complete();<br>
++=C2=A0 =C2=A0 http-&gt;storeEntry()-&gt;completeSuccessfully(&quot;traceR=
eply() stored the entire response&quot;);<br>
+ }<br>
+ <br>
+ #define SENDING_BODY 0<br>
+diff --git a/src/errorpage.cc b/src/errorpage.cc<br>
+index d7a588d09..06046de9e 100644<br>
+--- a/src/errorpage.cc<br>
++++ b/src/errorpage.cc<br>
+@@ -792,7 +792,6 @@ ErrorState::~ErrorState()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0safe_free(redirect_url);<br>
+=C2=A0 =C2=A0 =C2=A0safe_free(url);<br>
+-=C2=A0 =C2=A0 safe_free(request_hdrs);<br>
+=C2=A0 =C2=A0 =C2=A0wordlistDestroy(&amp;ftp.server_msg);<br>
+=C2=A0 =C2=A0 =C2=A0safe_free(ftp.request);<br>
+=C2=A0 =C2=A0 =C2=A0safe_free(ftp.reply);<br>
+@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SQUIDSBUFPRINT(request-&gt;url.path()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0AnyP::ProtocolType_str[request-&gt;http_ver.protocol],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0request-&gt;http_ver.major, request-&gt;http_ver.minor);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 request-&gt;header.packInto(&amp;str);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 request-&gt;header.packInto(&amp;str, true /*=
 hide authorization data */);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0str.append(&quot;\r\n&quot;, 2);<br>
+@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &amp;build)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D &quot;=
[no request]&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (request) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mb.appendf(SQUIDSBUFPH &quot; &=
quot; SQUIDSBUFPH &quot; %s/%d.%d\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SQUIDSBUFPRINT(request-&gt;method.image()),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SQUIDSBUFPRINT(request-&gt;url.path()),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AnyP::ProtocolType_str[request-&gt;http_ver.protocol],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0request-&gt;http_ver.major, request-&gt;http_ver.minor);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request-&gt;header.packInto(&am=
p;mb, true); //hide authorization data<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (request_hdrs) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D request_hdrs;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (request)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 request-&gt;pack(&amp;mb, true =
/* hide authorization data */);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D &quot;[no request]&q=
uot;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
+diff --git a/src/errorpage.h b/src/errorpage.h<br>
+index abca4a17d..297b30697 100644<br>
+--- a/src/errorpage.h<br>
++++ b/src/errorpage.h<br>
+@@ -194,7 +194,6 @@ public:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemBuf *listing =3D nullptr;<br>
+=C2=A0 =C2=A0 =C2=A0} ftp;<br>
+ <br>
+-=C2=A0 =C2=A0 char *request_hdrs =3D nullptr;<br>
+=C2=A0 =C2=A0 =C2=A0char *err_msg =3D nullptr; /* Preformatted error messa=
ge from the cache */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0AccessLogEntryPointer ale; ///&lt; transaction details=
 (or nil)<br>
+diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc=
<br>
+index 495597d9a..48a0f1ce0 100644<br>
+--- a/src/tests/stub_HttpRequest.cc<br>
++++ b/src/tests/stub_HttpRequest.cc<br>
+@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod =
&amp;, int64_t &amp;) const STUB<br>
+ bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)<br>
+ int HttpRequest::prefixLen() const STUB_RETVAL(0)<br>
+ void HttpRequest::swapOut(StoreEntry *) STUB<br>
+-void HttpRequest::pack(Packable *) const STUB<br>
++void HttpRequest::pack(Packable *, bool) const STUB<br>
+ void HttpRequest::httpRequestPack(void *, Packable *) STUB<br>
+ HttpRequest * HttpRequest::FromUrl(const SBuf &amp;, const MasterXaction:=
:Pointer &amp;, const HttpRequestMethod &amp;) STUB_RETVAL(nullptr)<br>
+ HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::=
Pointer &amp;, const HttpRequestMethod &amp;) STUB_RETVAL(nullptr)<br>
diff --git a/meta-networking/recipes-daemons/squid/<a href=3D"http://squid_=
6.9.bb" rel=3D"noreferrer" target=3D"_blank">squid_6.9.bb</a> b/meta-networ=
king/recipes-daemons/squid/<a href=3D"http://squid_6.9.bb" rel=3D"noreferre=
r" target=3D"_blank">squid_6.9.bb</a><br>
index 490a5401c3..26460d4619 100644<br>
--- a/meta-networking/recipes-daemons/squid/<a href=3D"http://squid_6.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">squid_6.9.bb</a><br>
+++ b/meta-networking/recipes-daemons/squid/<a href=3D"http://squid_6.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">squid_6.9.bb</a><br>
@@ -22,6 +22,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.squid-cache.org/V=
ersions/v$%7BMAJ_VER%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}=
.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://squid.nm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-37894.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-59362.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-62168.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1ad72d46e1cb556e9561214f0fb181adb87c7c47=
927ef69bc8acd68a03f61882&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121367): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121367" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121367</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116160723/361=
6702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116160723/3616702</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:anuj.mittal@oss.qualcomm=
.com" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000d09c40643799a61--

