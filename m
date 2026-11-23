Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54392.1795443273430672736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cOwdwmr+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=AeI+VHXq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLHcZ4030540
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xq0yA1ioYWTh1dj920r9dMKSD+006EiunnV
	JwAidyhQ=; b=cOwdwmr+FDr0oVtEJH60Z81sWX8zoq85S1mERDE1fZk463BU9TF
	nX4oCbr/u7014MFDQ4F0+BgclkMhr78I6Lgz1gBCw1jL+TmN/VujDw8BchpWkDFn
	fYDmTt9ocU6OOma+tUxgkBzOFZpH6OTy2H1rb43CL0HwuMWwGqZMMnRuu9gCf+Va
	R6o1vDgqYAB2nqkJ520q0Jr+sqdSGDPRk76CeuFh8R1yEzilU64S0sxukNtRSnNe
	m3/G0h82qQsi+8KK9DeJdi03kBfaz0n1M6+QOmhA3cZeiv7d45BiQxhDemgYkI7Y
	/xD0JZZAxpJf9XD6KS04wkxiXEaRilEkpYw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshxqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so2657417c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443271; x=1796048071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xq0yA1ioYWTh1dj920r9dMKSD+006EiunnVJwAidyhQ=;
        b=AeI+VHXqTgCLRHGOtYGwLHQrJjelsvoHjXYk3EBS/vGKwf4RD5ZlXa4/CvSCbdfEpx
         0dqQSNbpNYOaYipmdVFwlyc1XUmGYNeL5ROS37E89B1yC86ND+TYZ52QpamoQD/D+7tC
         yW0NWNusdi2kXObH0NUrZ6yUi26aGzqY12zmB6p3lmFWViJasMs/fuBG3v4Tkps99ygu
         NkyQlGQJ7MZrf3qSuzei80nGFc2YCoWcgYdOHs85qouZ1W+KJAANOkZR/8ARvfG+lA9J
         gws5Ip2h33Sw4/EL12NPnFnGugc+KFrSxA+dRTFENOLxoD7mgisH4LL1p5Utwj+B4bhI
         Gw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443271; x=1796048071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xq0yA1ioYWTh1dj920r9dMKSD+006EiunnVJwAidyhQ=;
        b=0kV56DOkb5Kn0n4Y+QU4hr4AVGlMwvNeON4GWzHa2/xBaAxQUYfWENO+Uh9ysxMjj0
         g3KyquiPooSNSSzQIeulQQL6ZzBKceHW3cnYggPXGlRI3jO0Evfw8wvF5LNY/0BidzBM
         mVen/uUr08QVxGxwJEDEqdPRHcIGlmfcvzmGCv4HRJRjyHI58xGOR7jHXACdYrIivNRD
         lv54oeVkTYRS5pIyIvh7amBqw1aBEs1rz6bnZlOJuSae0h97iY+o0hh18jn8OwsCVCwv
         b7laGayJ2eZKhoPJialMcJ59EdjPbLiA/wo3s0czC7MtYMMF9ah6maDZRTODwNkKbhEe
         52bQ==
X-Gm-Message-State: APuU4Z+lTNmHsYMmk8k3kS/6ZXStgUYEVFWY+k9K3LVBRCCqHbKw3qeB
	mAoGIxCxAqxMv9ye/vwfwq+cePHpfS9WjBGRGqDXDvPYj4rMsSh78QzCVj9NkDj5t8MOwemGV0O
	Wmtdo/MvEOibEenKD+rNrS4cmeeN+neah+4BHmbUNjA4tzvz8ERxlYDfxrEP9lV6ueu6/nSeREu
	NwKpu3kGv+yzF60ysh
X-Gm-Gg: AZFdTZeCMzhhtx6PU2zQ+RqGFhX+iPYJvoeJCheK1uMV0+GSVBHhL6GFHlfyGvH0KoI
	XkLdbTXTHtykeriCCpbRMVEV8hDSXfqyp1k4Hb27BPgKDLQqnYtBj4Ng/tHBxanWEo0vHHxMMdd
	4rpOcflEgx733Yp3/fUT19BTiQeFr/bQs2DCstb+wh27ToYmeN34yqfgexifKT+dZNT9FuP7GZm
	oNfoxSFVibG7jzCr1NJP0o29v55Hs2AgUs9S1lbrJRA2I1eeCA3KKLMizZLyGZtmQKUyKirnkB+
	zvAIcLV4tKmQSqq2vpzEeK3ObcLDCW8DQNgGTqv0INM/K49CO6UruizX0bbE+dNAOLgJ4KN1Dsx
	DLFlIKqtgGa+oQ8n3ZpB17SGGoxUgFCk36aD56DYwDNB36nvHfhguVkRDVc5wMJrYpC28lt8u6o
	UP9W1o
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr11920309c88.34.1795443270728;
        Mon, 23 Nov 2026 06:14:30 -0800 (PST)
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr11920273c88.34.1795443269956;
        Mon, 23 Nov 2026 06:14:29 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33218644c88.7.2026.11.23.06.14.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:14:29 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH 1/5] tmate: patch CVE-2026-4751
Date: Mon, 23 Nov 2026 19:44:15 +0530
Message-ID: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b044a47 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jpih-j6UxA3449jKgz0A:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: GnWM0q5_VGYJSCVQBNuDOY6uqTR4YE9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfXxed5XJE5HJJu
 VaacnwZ2AoVTAVhVN+pjPqNXSwBP9jZVkb7uJPb5whLo0Ah2cWjSerxP4Np1kaQw0SjFyYLpNnC
 FjxPNynJufQJ8l3C8gQcoyn3mXfNudMVs5qIXienGJ5orWmnWDRw5nkz3F/DebInoq7iLogjVrx
 lCpizIfSak1ypvRlBJAh8M61/BrVM4ekZxUr7P2PwKgmwUOpNRX2wZkIXolFjXEg7HmYLyqisWL
 x01Vr3E6BHKVIwmf7XVCeUUdnAB+d+L/+VhKRaJGg9lXAlqhzXbquD558YXh8O0OXSn2WsvTeLV
 0roEuVBWyXqRgr8pI8ObGyLM57ryshWEfKU7sMObdQbyDn9MtlTToLV0QP4VF5bTHQ8ggIU+C22
 XgzxHXmKFauQPhTZoEXln0SRDnC00BxDkonCUYey4YrO8v76pwYFL6NMEofnvIr34jGXRC5lIuj
 jDMumYCPqM6b1ysVL5Q==
X-Proofpoint-GUID: GnWM0q5_VGYJSCVQBNuDOY6uqTR4YE9Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX1fmZulYRBQeP
 x7jKFOrtA8MBqxjm4cmjQycgTzRuAcpNSBoiMen52yN/6Wm3P4JawayCCWQzncp8eUaPXIu3fyg
 gYnUtqYquf6A1CLM9Qae35ZXiMJ9VNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132895
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-4751

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 08bb24edb73eb95458a98d7171db72f3c66ffab7)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../tmate/files/CVE-2026-4751.patch           | 75 +++++++++++++++++++
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch

diff --git a/meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch b/meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
new file mode 100644
index 0000000000..faf3d2a3ae
--- /dev/null
+++ b/meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
@@ -0,0 +1,75 @@
+From 27f07d414949259f17aebc02a61f103629d547f1 Mon Sep 17 00:00:00 2001
+From: npt-1707 <npthanh132@gmail.com>
+Date: Tue, 10 Mar 2026 00:19:33 +0800
+Subject: [PATCH] Fix CVE-2018-19387
+
+(cherry picked from commit 3e12f558c7b71b7135403cdd2df77d38538a695c)
+
+CVE: CVE-2026-4751
+Upstream-Status: Backport [https://github.com/tmate-io/tmate/commit/3e12f558c7b71b7135403cdd2df77d38538a695c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ format.c        | 2 ++
+ input.c         | 2 ++
+ server-client.c | 6 ++++++
+ window.c        | 2 ++
+ 4 files changed, 12 insertions(+)
+
+diff --git a/format.c b/format.c
+index f771c85f..3bbb8cf1 100644
+--- a/format.c
++++ b/format.c
+@@ -468,6 +468,8 @@ format_cb_pane_tabs(struct format_tree *ft, struct format_entry *fe)
+ 		return;
+ 
+ 	buffer = evbuffer_new();
++	if (buffer == NULL)
++		fatalx("out of memory");
+ 	for (i = 0; i < wp->base.grid->sx; i++) {
+ 		if (!bit_test(wp->base.tabs, i))
+ 			continue;
+diff --git a/input.c b/input.c
+index 18c8eb9a..8a66d89e 100644
+--- a/input.c
++++ b/input.c
+@@ -766,6 +766,8 @@ input_init(struct window_pane *wp)
+ 	ictx->input_buf = xmalloc(INPUT_BUF_START);
+ 
+ 	ictx->since_ground = evbuffer_new();
++	if (ictx->since_ground == NULL)
++		fatalx("out of memory");
+ 
+ 	input_reset(wp, 0);
+ }
+diff --git a/server-client.c b/server-client.c
+index 21cccc85..e8614d40 100644
+--- a/server-client.c
++++ b/server-client.c
+@@ -121,8 +121,14 @@ server_client_create(int fd)
+ 	c->cmdq->client_exit = 1;
+ 
+ 	c->stdin_data = evbuffer_new();
++	if (c->stdin_data == NULL)
++		fatalx("out of memory");
+ 	c->stdout_data = evbuffer_new();
++	if (c->stdout_data == NULL)
++		fatalx("out of memory");
+ 	c->stderr_data = evbuffer_new();
++	if (c->stderr_data == NULL)
++		fatalx("out of memory");
+ 
+ 	c->tty.fd = -1;
+ 	c->title = NULL;
+diff --git a/window.c b/window.c
+index 45ec7790..9d95bb77 100644
+--- a/window.c
++++ b/window.c
+@@ -945,6 +945,8 @@ window_pane_spawn(struct window_pane *wp, int argc, char **argv,
+ 
+ 	wp->event = bufferevent_new(wp->fd, window_pane_read_callback, NULL,
+ 	    window_pane_error_callback, wp);
++	if (wp->event == NULL)
++		fatalx("out of memory");
+ 
+ 	bufferevent_setwatermark(wp->event, EV_READ, 0, READ_SIZE);
+ 	bufferevent_enable(wp->event, EV_READ|EV_WRITE);
diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
index 4e66d8d05a..7a1752f881 100644
--- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
+++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
@@ -8,6 +8,7 @@ DEPENDS:append = " libevent libssh msgpack-c ncurses"
 SRC_URI = "\
     git://github.com/tmate-io/tmate.git;protocol=https;branch=master \
     file://0001-fix-finding-msgpack.patch \
+    file://CVE-2026-4751.patch \
 "
 
 SRCREV = "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
-- 
2.55.0

