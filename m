Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36759.1793165386972555149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FiWSosVE;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UknP4tji;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PVCG655647
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf+f6WV9ErNlExe38UkyvbfXDIKLLc7O2f4ZnfLN8WQ=; b=FiWSosVE6UTO4N+0
	TsCmXZ9CSmVDujnISMDA/gbm/SPljtOAK7hQeXSBahhVwQX/ffnWbMsT4O5Lz9X5
	wBms0xK0fJJxerJmA4m8hlYfz+AcZU0p7npPfUardR+/tnm1ZzYPDCmmQxmg5+G+
	/hXup5vpaAih2mqMtfn5xTUtnTuDydRxkm63hP1ueKaWzkCq5czCtMe9CFv0d208
	/0z/Adg2gxSBTUGbE0mByGYLUST+HzwbyTEZx7LlQy3xqJeoRPsSjxJ1qm2AgIya
	ZXY9MK459dGPkdI37TvfA8rUaEpZzs3FVsJ0T3PocSte1gVGmRijg3Uyc2QKoQTz
	HxKe1g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7gp6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:29:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7a0f8250so13225256d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793165385; cv=none;
        d=google.com; s=arc-20260327;
        b=P1tcmBqo3YH5+LIGIqaobklUN8a/S3FG6DRe/j/siZ0yPfubjJjKgghutitILhwHTB
         vDZdQp99JUP1dGMLwXjcZ27WhhAsbnAP136xwQSxMigRaypAP2jPw/WPQZGO9nMoKmaY
         VK38peYkWeTxl3Gvza0wAqAvDwWfr7Rj40BgTuZV0OnG1I0Sr0JR/wpwx4eZYlN2wOwf
         PdTKIY6f5jRp91Leu//HS2UZZ7ogsYvUHMsvk+px2SwX+ntbtdi3LgkSTkRG1PkYvi2h
         BWZpELHIgVW0NNGkQWCEt7XJ/LrPNXLEsGYaVC5ptbnTY5mq08WHwaBn+iKRByKmGsCZ
         5K8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nf+f6WV9ErNlExe38UkyvbfXDIKLLc7O2f4ZnfLN8WQ=;
        fh=N3H+ws6gupY3nESZFJT+UZTvc/8nVpLwCxPcZ/GIbDg=;
        b=H2xJw027uND0R1Q963G2WGPHLP0zCqxpsnVJOr0eTbMrHjeG687Nvc3Gaca8d6R3tu
         FhY6R1B47PIh+bwOLjvt7zyzlrkeDT8KawH0o5K/Lusk41lJNH9eQAZYle/nQrWpkfum
         T4dZi0SzDEzOZSvhL8a0lbbQPerd+IfYjvC+BUUbMdI+Rwm3jR3JoEXdquwOWFCO2Iqw
         XpN0WgYxJetv8T/CPb/AR8m3aVQBJOHOp+3x2M5BnKSXNAqrTH5/Tqcl/1C+F+77yPUQ
         1/Zlsy4L/1JyQoJDqcQYy3hWjxde6mW/8dn24R86TA7zNlkw7MYMM0XHkcVYItp73h+A
         AWmg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793165385; x=1793770185; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nf+f6WV9ErNlExe38UkyvbfXDIKLLc7O2f4ZnfLN8WQ=;
        b=UknP4tjir+vVpiKrzMRmpz2DbXdSqGx1o6kI8FhYykavTV0/bAjRg4qg9Rt6Pr4qtK
         bLYuPsmtwUKJbrw31reMIwQFxsKakHEBtcmCdFQl5OsvfxCPZWJEnXPm/8w5b3a1bQRu
         9ns7lrGRukCDiG0JbiwqTGzj3widFUF7mBH+inOp5GLeG+wyjoLrFgqu/Yd0eerG/1bf
         Bc3gohy6le2zKMGmnTvaKRqUfEeF3I8O9r7Ol7GNygXZuqa/xBJVZlsdHDqRtrpJ8X02
         D8nDb/0Pop6KIr8KVFJaskUfB0Byiz+JDmmZWgSAgVcTQ15cU6S1o859ZckWp/koVipv
         APSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793165385; x=1793770185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf+f6WV9ErNlExe38UkyvbfXDIKLLc7O2f4ZnfLN8WQ=;
        b=DBf5uD5yVFkns+DlK83Cf6AAxmV0MihoM2m8QsRDMwlk4rCxm1hO74JG6XcE2f7T+6
         LUx4vqKFyIAwS/zld0l38vyu76vExmM+19MIpoa4MMiAJ7l+Mjud4DWeX4R+Lg5cJCir
         TBJ5wjp8C3tlgD4pjXrE3m8Vvj4pwSKjZNUARbTuRXKc0i2yHYy+V/C3vN1XbSboCgew
         zqvckVL6y8yaVasq3YnJcNb4E4a5AlofGwLdRL6cUyTKkEXmAtzI9+uuhEa7VJnGivgM
         Pf5+r+a5goz5tsufE29QCKFEzcW7I4CUFZPnbY0e9khLVcYLIKfaD8Zvz9dM/NAtxmjl
         mWsQ==
X-Gm-Message-State: AFq9FYIB6866tZF7b2CoYhkSEGw/9vZji7Fszam+/hTSuwakNthdLfFX
	C0Iono4cp9rAPUpOhQcRUVsKYvPkEFHaNjsWNNCsA0NN3E8wvGyKYcZlid4UVPoREikofkur8ny
	R3SRagTeAQrkwzHo67LspFf6j1qkrv6Uc9i8EED9FDGA7uNEFl/hG25ERiKdxCoCg7anYS2U6Tw
	fa6IBqfuStJjqWvSrWUN22DyoBkZ/sfV1PPPDmzKHUKTv+uXN1QIWuX0nK9vg=
X-Gm-Gg: AYBFou05+IqbCYK6wD5J+57xS4AsrdoAdAn2lrtlfuRmt+9ozWKfBLT1TDFOYEaVw5s
	2s9RGKAudCzD2Li0D1SQxQKcRjhDyfO7LxjasqFuZ4pPMxbEOwHIQlq5gOSDV8HG/hazbTQAAGq
	+2/R68c3x6W4wKpIgamS9lzVMNIOhjlqtzwqX+ofchMrNXOAqmoSZzkgCvFQ==
X-Received: by 2002:ad4:5aae:0:b0:91c:7549:f381 with SMTP id 6a1803df08f44-91c7cfa2bf2mr21134686d6.22.1793165384649;
        Tue, 27 Oct 2026 22:29:44 -0700 (PDT)
X-Received: by 2002:ad4:5aae:0:b0:91c:7549:f381 with SMTP id
 6a1803df08f44-91c7cfa2bf2mr21134456d6.22.1793165384144; Tue, 27 Oct 2026
 22:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261016064219.3910025-1-dkelaiya@cisco.com> <20261016064219.3910025-3-dkelaiya@cisco.com>
In-Reply-To: <20261016064219.3910025-3-dkelaiya@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:29:33 +0800
X-Gm-Features: AclHuK-GvZ8B9vVcZQ5UDhPm7ADpGv2I1PUI2WsdGpoGjYMTWFP5XWeq7j4SxaA
Message-ID: <CA+s=J=ynvape2M1h++vPfhp+ScUgUkCXB6bVG-gX+2gA8vQ33A@mail.gmail.com>
Subject: Re: [oe][meta-python][wrynose][PATCH 2/3] python3-aiohttp: fix CVE-2026-69243
To: dkelaiya@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfX31DeAmYcgztw
 ba8hfxvgnCBcBGgYjBR6RMyLSHQRnywmbs1uERn5gB0iAr7CHxd3szYPe1iT+7/diYXLn11qK+X
 rRvK3s4qQboC9cLZFArXTzAs2QY46bU=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae18849 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=BqEg4_3jAAAA:8
 a=Q4-j1AaZAAAA:8 a=AUd_NHdVAAAA:8 a=0lhnMm1FAAAA:8 a=EUspDBNiAAAA:8
 a=EnuzUtRM99ZE6yQg96MA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=OIgjcC2v60KrkQgK7BGD:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=0mFWnFbQd5xWBqmg7tTt:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=9CHbX8HeWodPCPcMgNm7:22
X-Proofpoint-GUID: Qe7rXsavXBi08nHkF8d6Yx2oY5z4YKtB
X-Proofpoint-ORIG-GUID: Qe7rXsavXBi08nHkF8d6Yx2oY5z4YKtB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfX1oN6v53vE5HS
 Dak39nUFLiD6VniVkloP8dY9FkplMaWBal8r5yzdvD5WNM2zp56mC8YfLAB1wi3+t/z6ZQfGIMQ
 wCG447LCzZ6/Ow77t10+B2FQo009Q0GQYb8FYQ1huVgav+ZfWYNO7137y7H/uQYQyMM65IIZnfQ
 Kv0HqOtlOt6JaaTHgtF0iPtjOURBqmxrdrnSIOBCvNpd2T3r23Gb8vi8kiyZ7xGRvIeT3kQ3JoR
 P2QEZUdRw7l8VCPBTUWF0Rhhog2eFPkZSGG+eDMce9xp6kJylqFQhvTbQDIAdgpT2A7Qt8yOfe4
 GFMQGm+2Zk/741/Krn4ex+okqy7gPWOYqsP+fQGz2VoCCWIPicvK410/bAnnyiF6GPGc5e/+W1D
 dy6IZbnI1fy0iR4uNgsZ5m+LJjNdtrUnWcmCYhXukCx9zCc5UGwccLhRw/o02DfYALH/mlHR5uJ
 6MKXkk3hwISyrMe7KUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131614

This does not apply:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1906

On Fri, Oct 16, 2026 at 2:42=E2=80=AFPM Darsh Kelaiya -X (dkelaiya - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org
<dkelaiya=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using
> the commit shown in [1]. It adapts the Python and C HTTP parser
> paths to read a rejected WebSocket upgrade request body before
> switching protocols.
>
> [1] https://github.com/aio-libs/aiohttp/commit/6ae358f0983c3f4d6f67692b2f=
8e65dc8e091c98
> [2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-mfx4-hv7=
3-q22v
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python3-aiohttp/CVE-2026-69243.patch      | 307 ++++++++++++++++++
>  .../python/python3-aiohttp_3.13.5.bb          |   1 +
>  2 files changed, 308 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2026-69243.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026=
-69243.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026=
-69243.patch
> new file mode 100644
> index 0000000000..090a82f2f2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.=
patch
> @@ -0,0 +1,307 @@
> +From 3267a26ebb0c28cc70b0caf5836d20ff1b7c2f39 Mon Sep 17 00:00:00 2001
> +From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com=
>
> +Date: Tue, 30 Jun 2026 20:21:57 +0100
> +Subject: [PATCH] [PR #13016/8ef76ab8 backport][3.14] Fix body reads afte=
r
> + failed WS upgrade (#13017)
> +
> +This is a backport of PR #13016 as merged into master
> +(8ef76ab8029d0f2d88449fe115feb42ded646c7c).
> +
> +CVE: CVE-2026-69243
> +Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/6a=
e358f0983c3f4d6f67692b2f8e65dc8e091c98]
> +
> +Backport Changes:
> +- Adapted deferred upgrades to the 3.13.5 llhttp pause and tail
> +  buffering path, including the CVE-2026-54273 queue limit.
> +- Adapted the pure Python parser to its boolean payload result.
> +- Used the 3.13.5 buffer size in the earlier 54273 test.
> +- Kept the existing pipelined-upgrade regression test and added
> +  the upstream body-read regression test.
> +- Omitted generated _http_parser.c because the Wrynose recipe
> +  regenerates it from _http_parser.pyx during do_configure.
> +
> +Co-authored-by: Sam Bull <git@sambull.org>
> +(cherry picked from commit 6ae358f0983c3f4d6f67692b2f8e65dc8e091c98)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + CHANGES/13016.bugfix.rst     |  1 +
> + aiohttp/_http_parser.pyx     | 20 +++++++++----
> + aiohttp/http_parser.py       | 21 ++++++++++----
> + tests/test_http_parser.py    | 48 ++++++++++++++++++++++++++++++++
> + tests/test_web_functional.py | 54 ++++++++++++++++++++++++++++++++++--
> + 5 files changed, 131 insertions(+), 13 deletions(-)
> + create mode 100644 CHANGES/13016.bugfix.rst
> +
> +diff --git a/CHANGES/13016.bugfix.rst b/CHANGES/13016.bugfix.rst
> +new file mode 100644
> +index 000000000..a984f64e3
> +--- /dev/null
> ++++ b/CHANGES/13016.bugfix.rst
> +@@ -0,0 +1 @@
> ++Fixed request body not being read on rejected WebSocket upgrades -- by =
:user:`Dreamsorcerer`.
> +diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
> +index 0d0762748..478d82ecb 100644
> +--- a/aiohttp/_http_parser.pyx
> ++++ b/aiohttp/_http_parser.pyx
> +@@ -318,6 +318,7 @@ cdef class HttpParser:
> +         set     _seen_singletons
> +         list    _raw_headers
> +         bint    _upgraded
> ++        bint    _pending_upgrade
> +         list    _messages
> +         Py_ssize_t _msg_in_flight
> +         Py_ssize_t _max_msg_queue_size
> +@@ -387,6 +388,7 @@ cdef class HttpParser:
> +         self._response_with_body =3D response_with_body
> +         self._read_until_eof =3D read_until_eof
> +         self._upgraded =3D False
> ++        self._pending_upgrade =3D False
> +         self._auto_decompress =3D auto_decompress
> +         self._content_encoding =3D None
> +         self._lax =3D False
> +@@ -466,10 +468,13 @@ cdef class HttpParser:
> +             h_upg =3D headers.get("upgrade", "")
> +             allowed =3D upgrade and h_upg.isascii() and h_upg.lower() i=
n ALLOWED_UPGRADES
> +             if allowed or self._cparser.method =3D=3D cparser.HTTP_CONN=
ECT:
> +-                self._upgraded =3D True
> ++                # Wait until the complete request body has been parsed.
> ++                self._pending_upgrade =3D True
> +         else:
> +             if upgrade and self._cparser.status_code =3D=3D 101:
> +-                self._upgraded =3D True
> ++                # llhttp pauses for a 101 on its own; just mark the pen=
ding
> ++                # switch so feed_data returns the upgraded-protocol tai=
l.
> ++                self._pending_upgrade =3D True
> +
> +         # do not support old websocket spec
> +         if SEC_WEBSOCKET_KEY1 in headers:
> +@@ -597,6 +602,10 @@ cdef class HttpParser:
> +         if errno is cparser.HPE_PAUSED_UPGRADE:
> +             cparser.llhttp_resume_after_upgrade(self._cparser)
> +             nb =3D cparser.llhttp_get_error_pos(self._cparser) - base
> ++            if self._pending_upgrade:
> ++                # A supported upgrade whose request body has now been f=
ully read.
> ++                self._upgraded =3D True
> ++                self._pending_upgrade =3D False
> +         elif errno is cparser.HPE_PAUSED:
> +             cparser.llhttp_resume(self._cparser)
> +             pos =3D cparser.llhttp_get_error_pos(self._cparser) - base
> +@@ -818,10 +827,9 @@ cdef int cb_on_headers_complete(cparser.llhttp_t* p=
arser) except -1:
> +         pyparser._last_error =3D exc
> +         return -1
> +     else:
> +-        if pyparser._upgraded or pyparser._cparser.method =3D=3D cparse=
r.HTTP_CONNECT:
> +-            return 2
> +-        else:
> +-            return 0
> ++        if not pyparser._response_with_body:
> ++            return 1
> ++        return 0
> +
> +
> + cdef int cb_on_body(cparser.llhttp_t* parser,
> +diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
> +index 32375f83a..f4458dc9d 100644
> +--- a/aiohttp/http_parser.py
> ++++ b/aiohttp/http_parser.py
> +@@ -289,6 +289,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
> +         self._lines: List[bytes] =3D []
> +         self._tail =3D b""
> +         self._upgraded =3D False
> ++        self._pending_upgrade =3D False
> +         self._payload =3D None
> +         self._payload_parser: Optional[HttpPayloadParser] =3D None
> +         self._auto_decompress =3D auto_decompress
> +@@ -417,9 +418,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
> +                         if SEC_WEBSOCKET_KEY1 in msg.headers:
> +                             raise InvalidHeader(SEC_WEBSOCKET_KEY1)
> +
> +-                        self._upgraded =3D msg.upgrade and _is_supporte=
d_upgrade(
> +-                            msg.headers
> +-                        )
> ++                        upgraded =3D msg.upgrade and _is_supported_upgr=
ade(msg.headers)
> +
> +                         method =3D getattr(msg, "method", self.method)
> +                         # code is only present on responses
> +@@ -431,8 +430,7 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
> +                             method and method in EMPTY_BODY_METHODS
> +                         )
> +                         if not empty_body and (
> +-                            ((length is not None and length > 0) or msg=
.chunked)
> +-                            and not self._upgraded
> ++                            (length is not None and length > 0) or msg.=
chunked
> +                         ):
> +                             payload =3D StreamReader(
> +                                 self.protocol,
> +@@ -457,6 +455,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
> +                             )
> +                             if not payload_parser.done:
> +                                 self._payload_parser =3D payload_parser
> ++                                # https://www.rfc-editor.org/info/rfc91=
10/#section-7.8-15
> ++                                # Defer any requested upgrade until the
> ++                                # complete request has been read.
> ++                                self._pending_upgrade =3D upgraded
> +                         elif method =3D=3D METH_CONNECT:
> +                             assert isinstance(msg, RawRequestMessage)
> +                             payload =3D StreamReader(
> +@@ -501,6 +503,11 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
> +                             )
> +                             if not payload_parser.done:
> +                                 self._payload_parser =3D payload_parser
> ++                        elif upgraded:
> ++                            # No body to read, so the connection switch=
es to
> ++                            # the upgraded protocol immediately.
> ++                            self._upgraded =3D True
> ++                            payload =3D EMPTY_PAYLOAD
> +                         else:
> +                             payload =3D EMPTY_PAYLOAD
> +
> +@@ -548,6 +555,10 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
> +                     start_pos =3D 0
> +                     data_len =3D len(data)
> +                     self._payload_parser =3D None
> ++                    if self._pending_upgrade:
> ++                        # The body is complete; the protocol switch may=
 begin.
> ++                        self._upgraded =3D True
> ++                        self._pending_upgrade =3D False
> +                     continue
> +             else:
> +                 break
> +diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
> +index a4e6bc056..92e59af1c 100644
> +--- a/tests/test_http_parser.py
> ++++ b/tests/test_http_parser.py
> +@@ -1217,6 +1217,54 @@ async def test_http_request_upgrade_unknown(parse=
r: Any) -> None:
> +     assert await messages[0][-1].read() =3D=3D b"{}"
> +
> +
> ++@pytest.mark.parametrize("chunked", (False, True), ids=3D("content-leng=
th", "chunked"))
> ++async def test_http_request_upgrade_with_body_read(
> ++    parser: HttpRequestParser, chunked: bool
> ++) -> None:
> ++    body_request =3D b"foobarbaz\r\n\r\n"
> ++    if chunked:
> ++        framing =3D b"Transfer-Encoding: chunked\r\n"
> ++        body =3D b"%x\r\n%s\r\n0\r\n\r\n" % (len(body_request), body_re=
quest)
> ++    else:
> ++        framing =3D b"Content-Length: %d\r\n" % len(body_request)
> ++        body =3D body_request
> ++    after =3D b"GET /after HTTP/1.1\r\nHost: a\r\n\r\n"
> ++    text =3D (
> ++        b"GET /ws HTTP/1.1\r\nHost: a\r\n"
> ++        b"Connection: Upgrade\r\nUpgrade: websocket\r\n"
> ++        + framing
> ++        + b"\r\n"
> ++        + body
> ++        + after
> ++    )
> ++    messages, upgrade, tail =3D parser.feed_data(text)
> ++    assert len(messages) =3D=3D 1
> ++    msg, payload =3D messages[0]
> ++    assert msg.method =3D=3D "GET"
> ++    assert msg.path =3D=3D "/ws"
> ++    assert msg.upgrade
> ++    assert await payload.read() =3D=3D body_request
> ++    # The connection switches protocols only after the body is fully re=
ad.
> ++    assert upgrade
> ++    assert tail =3D=3D after
> ++
> ++
> ++def test_http_request_upgrade_empty_body_allowed(parser: HttpRequestPar=
ser) -> None:
> ++    text =3D (
> ++        b"GET /ws HTTP/1.1\r\n"
> ++        b"Host: a\r\n"
> ++        b"Connection: Upgrade\r\n"
> ++        b"Upgrade: websocket\r\n"
> ++        b"Content-Length: 0\r\n\r\n"
> ++        b"some raw data"
> ++    )
> ++    messages, upgrade, tail =3D parser.feed_data(text)
> ++    msg =3D messages[0][0]
> ++    assert msg.upgrade
> ++    assert upgrade
> ++    assert tail =3D=3D b"some raw data"
> ++
> ++
> + @pytest.fixture
> + def xfail_c_parser_url(request) -> None:
> +     if isinstance(request.getfixturevalue("parser"), HttpRequestParserP=
y):
> +diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
> +index b958bef9d..0d2824a9c 100644
> +--- a/tests/test_web_functional.py
> ++++ b/tests/test_web_functional.py
> +@@ -25,7 +25,6 @@ from aiohttp import (
> + )
> + from aiohttp.compression_utils import ZLibBackend, ZLibCompressObjProto=
col
> + from aiohttp.hdrs import CONTENT_LENGTH, CONTENT_TYPE, TRANSFER_ENCODIN=
G
> +-from aiohttp.helpers import DEFAULT_CHUNK_SIZE
> + from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
> + from aiohttp.streams import StreamReader
> + from aiohttp.typedefs import Handler
> +@@ -1923,7 +1922,7 @@ async def test_unread_compressed_body_drain_is_bou=
nded(
> +             await writer.wait_closed()
> +
> +     # Bounded by the buffer, not the decompressed size.
> +-    assert max(drain_reads) <=3D 3 * DEFAULT_CHUNK_SIZE
> ++    assert max(drain_reads) <=3D 3 * 2**16
> +     assert max(drain_reads) < decompressed_size
> +
> +
> +@@ -2624,3 +2623,54 @@ async def test_keepalive_expires_on_time(aiohttp_=
client: AiohttpClient) -> None:
> +
> +         # Ensure the keep alive handle expires
> +         assert request_handler._keepalive_handle is None
> ++
> ++
> ++async def test_declined_websocket_upgrade_reads_body(
> ++    aiohttp_server: AiohttpServer,
> ++) -> None:
> ++    body_read =3D b""
> ++
> ++    async def ws_handler(request: web.Request) -> web.Response:
> ++        nonlocal body_read
> ++        # Decline the upgrade; read the body as a normal handler may.
> ++        body_read =3D await request.read()
> ++        return web.Response(text=3D"declined")
> ++
> ++    async def after_handler(request: web.Request) -> web.Response:
> ++        return web.Response(text=3D"after")
> ++
> ++    app =3D web.Application()
> ++    app.router.add_get("/ws", ws_handler)
> ++    app.router.add_get("/after", after_handler)
> ++    server =3D await aiohttp_server(app)
> ++
> ++    body =3D b"FooBarBaz\r\n\r\n"
> ++    # Use raw connection in order to pipeline requests.
> ++    pipeline =3D (
> ++        (
> ++            b"GET /ws HTTP/1.1\r\n"
> ++            b"Host: localhost\r\n"
> ++            b"Connection: Upgrade\r\n"
> ++            b"Upgrade: websocket\r\n"
> ++            b"Content-Length: %d\r\n\r\n" % len(body)
> ++        )
> ++        + body
> ++        + b"GET /after HTTP/1.1\r\nHost: localhost\r\nConnection: close=
\r\n\r\n"
> ++    )
> ++
> ++    reader, writer =3D await asyncio.open_connection(server.host, serve=
r.port)
> ++    try:
> ++        writer.write(pipeline)
> ++        await writer.drain()
> ++        # The trailing request sends Connection: close, so the server c=
loses
> ++        # once it has answered it -- reading to EOF gathers both respon=
ses.
> ++        response =3D await asyncio.wait_for(reader.read(), 5)
> ++    finally:
> ++        writer.close()
> ++        with suppress(ConnectionResetError, BrokenPipeError):
> ++            await writer.wait_closed()
> ++
> ++    assert body_read =3D=3D body
> ++    # Both the upgrade request and the pipelined request were served.
> ++    assert response.count(b"HTTP/1.") =3D=3D 2, response
> ++    assert response.count(b" 200 ") =3D=3D 2, response
> +--
> +2.35.6
> +
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.b=
b b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
> index b34a0fa3eb..417760c9ca 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
> @@ -20,6 +20,7 @@ SRC_URI +=3D " \
>      file://CVE-2026-54273_p1.patch \
>      file://CVE-2026-54273_p2.patch \
>      file://CVE-2026-59881.patch \
> +    file://CVE-2026-69243.patch \
>  "
>
>  CVE_PRODUCT =3D "aiohttp:aiohttp"
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131067): https://lists.openembedded.org/g/openembedde=
d-devel/message/131067
> Mute This Topic: https://lists.openembedded.org/mt/121783978/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
