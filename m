Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD761F46C5C
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 16:54:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59746.1775494473771240371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 09:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kotBG69z;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso34194115e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775494472; x=1776099272; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhWkhfzTabfG9LCmEcYBTnGWH4H7B2pTmiu0llwGEs8=;
        b=kotBG69zNNlMw2NTXsG70Y31ajZtNj8PjJm4iBurWoeYIJ1W+wVQTbr8MU86V6Ya6n
         wmmNUIbzwFp8sHO0NrQgiDCek1BEd6h995HemeXKV5zMcdnAggw3j16syIvYi5a/8ODM
         UoyD6KvX5A3wGF5pbwJck+C7ByICoQBB6GmeUSa0nkRjFnPKETa/sauKw458ByPki69g
         TcKm6Kn81WOhdgZAvDMW85QX5aP3MDYwfBCREc9ACh/RRkfHI3RN9+0aMFs6oKZCfLDp
         qzqnGccVrT3hPaOJWN1/3ZCNhqwL5ArlS3SKTTQNW6+jcINt42jbmOX9we6BSipio9Do
         LU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775494472; x=1776099272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhWkhfzTabfG9LCmEcYBTnGWH4H7B2pTmiu0llwGEs8=;
        b=d3Flia++m6LgmdltH6lX7lbrDcErbLzKXWeMl8Xz/a5kHRMfT+bVV4yoTFkG4bETe+
         crJPpxBqNB/vUTWW4LRObILusEOvzJNawb/YSn2R/bz4ILtiEVKvjlVKjRlK8CCiDs4W
         mMa8doPMcWb4mFCZGwJuUaMSJ0HTFtlmmHnnAxFpDAqnQgZxYjkoiglZl4Jf/Yrisv4q
         DP1BRz5jetlsOTQ8WpFA9bQxklz7pChnNEx+psuuIUfWJmOZu646JxLc9T2jX5+qB/An
         ItxK2pXa1sSenDzHJ/68qtgfa4IfXQ1O/h3jPAXb7xFkhwPk79SyEQl7o2BnlJQOsaxG
         V+Yw==
X-Gm-Message-State: AOJu0Yx8ntTCaCdGEPsGkrrN59bRgGTlquB/LF51BZDHlncHkd9dWN1b
	/8OlhvrY4UxYZI/81wbgEPZion1j2Ta4233EbBjp7LkPnPiM+qp1U59i
X-Gm-Gg: AeBDietao5/g9HOt6UrZR4ipHNgeEag260HUy5uTHrtXyvMjcszqqr3Qu2upozpfqrN
	dt2C42VX8uKnAUP11PbU7MKDKUPiEq0+CL9wJq+gmNb/iBMz8WZJExynTTKLoJe6zEFIcQOkV2v
	avFJ71CiZq89ItpU+SGLSt8CjxfpTqXkHbLBM8HuPZZJ8bnNg8Z9+2tb76v8UlW/HF41pMJxbTc
	UaOkk/YswEyWAFJVDzSwbXUIPekFiml56OT4uVowjtNgkw9izNN8OKHqv8TUp+0B+PfoLDHzHfP
	MbUYRBcrwf0K8aDKBnbpgKKRLjKgxZbmopBct4NfyJw4vIMJ8y5aFRxhwrMsIPGaIx+pKQ9KqR+
	6BziJjyaxvyksHl2LRRIyTZxuNB8zUTPjnxREa0qOE3RFdndTk9uZia2St9l2ORyckmCgeofg74
	2WS4sJZo5hb9s5C0FEchvjwJHFDpB2H1w=
X-Received: by 2002:a05:600c:621a:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488af7f7fd3mr70788065e9.18.1775494471966;
        Mon, 06 Apr 2026 09:54:31 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a3d6944bsm211989985e9.11.2026.04.06.09.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 09:54:30 -0700 (PDT)
Message-ID: <825b176a-832b-46f7-96e6-021cebd10a9b@gmail.com>
Date: Mon, 6 Apr 2026 18:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 1/2] tinyproxy: patch CVE-2026-3945
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260406155044.3662500-1-skandigraun@gmail.com>
 <CAMKF1sqY05YKLDQjhv4X8v=ownZkR15iWvOfFo7bqfZfJmcjfg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqY05YKLDQjhv4X8v=ownZkR15iWvOfFo7bqfZfJmcjfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 16:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126055

On 4/6/26 18:45, Khem Raj wrote:
> 
> 
> On Mon, Apr 6, 2026 at 8:50 AM Gyorgy Sarvari via lists.openembedded.org
> <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3945 <https://
>     nvd.nist.gov/vuln/detail/CVE-2026-3945>
> 
>     Backport the patches which are references by the NVD avisory.
> 
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>     <mailto:skandigraun@gmail.com>>
>     ---
>      .../tinyproxy/tinyproxy/CVE-2026-3945-1.patch | 29 +++++++++++++++++
>      .../tinyproxy/tinyproxy/CVE-2026-3945-2.patch | 31 +++++++++++++++++++
>      .../tinyproxy/tinyproxy_1.11.3.bb <http://tinyproxy_1.11.3.bb>     
>            |  2 ++
>      3 files changed, 62 insertions(+)
>      create mode 100644 meta-networking/recipes-support/tinyproxy/
>     tinyproxy/CVE-2026-3945-1.patch
>      create mode 100644 meta-networking/recipes-support/tinyproxy/
>     tinyproxy/CVE-2026-3945-2.patch
> 
>     diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/
>     CVE-2026-3945-1.patch b/meta-networking/recipes-support/tinyproxy/
>     tinyproxy/CVE-2026-3945-1.patch
>     new file mode 100644
>     index 0000000000..99c4ea705d
>     --- /dev/null
>     +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/
>     CVE-2026-3945-1.patch
>     @@ -0,0 +1,29 @@
>     +From 245946bb789c8fc0e4758c344f735a5d53827dce Mon Sep 17 00:00:00 2001
>     +From: rofl0r <rofl0r@users.noreply.github.com
>     <mailto:rofl0r@users.noreply.github.com>>
>     +Date: Thu, 12 Mar 2026 14:26:24 +0000
>     +Subject: [PATCH] reqs: check negative length values when reading
>     chunked data
>     +
>     +this could lead to a DoS when a legitimate client reads from an
>     +attacker-controlled web server.
>     +
>     +closes #597
>     +
>     +CVE: CVE-2026-3945
>     +Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/
>     commit/969852ccdb1d19d7ed302f0e1d324661be641e0a <https://github.com/
>     tinyproxy/tinyproxy/commit/969852ccdb1d19d7ed302f0e1d324661be641e0a>]
>     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>     <mailto:skandigraun@gmail.com>>
>     +---
>     + src/reqs.c | 1 +
>     + 1 file changed, 1 insertion(+)
>     +
>     +diff --git a/src/reqs.c b/src/reqs.c
>     +index a562c68..94ce767 100644
>     +--- a/src/reqs.c
>     ++++ b/src/reqs.c
>     +@@ -613,6 +613,7 @@ static int pull_client_data_chunked (struct
>     conn_s *connptr) {
>     +                 }
>     +
>     +                 chunklen = strtol (buffer, (char**)0, 16);
>     ++                if (chunklen < 0) goto ERROR_EXIT;
>     +
>     +                 if (pull_client_data (connptr, chunklen+2, 0) < 0)
>     +                         goto ERROR_EXIT;
>     diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/
>     CVE-2026-3945-2.patch b/meta-networking/recipes-support/tinyproxy/
>     tinyproxy/CVE-2026-3945-2.patch
>     new file mode 100644
>     index 0000000000..3da30b54eb
>     --- /dev/null
>     +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/
>     CVE-2026-3945-2.patch
>     @@ -0,0 +1,31 @@
>     +From 8f12872b8e50fe22be0a65ead260ebbedde905cd Mon Sep 17 00:00:00 2001
>     +From: rofl0r <rofl0r@users.noreply.github.com
>     <mailto:rofl0r@users.noreply.github.com>>
>     +Date: Sun, 29 Mar 2026 16:48:54 +0200
>     +Subject: [PATCH] reqs: prevent potential int overflow when parsing
>     chunked
>     + data (#603)
>     +
>     +follow-up to 969852ccdb1d19d7ed302f0e1d324661be641e0a
>     +
>     +closes #602
>     +
>     +CVE: CVE-2026-3945
>     +Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/
>     commit/bb7edc4778041b3bc8ad7fca448b67d98039cc7d <https://github.com/
>     tinyproxy/tinyproxy/commit/bb7edc4778041b3bc8ad7fca448b67d98039cc7d>]
>     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
>     <mailto:skandigraun@gmail.com>>
>     +---
>     + src/reqs.c | 3 ++-
>     + 1 file changed, 2 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/src/reqs.c b/src/reqs.c
>     +index 94ce767..7aacfd3 100644
>     +--- a/src/reqs.c
>     ++++ b/src/reqs.c
>     +@@ -613,7 +613,8 @@ static int pull_client_data_chunked (struct
>     conn_s *connptr) {
>     +                 }
>     +
>     +                 chunklen = strtol (buffer, (char**)0, 16);
>     +-                if (chunklen < 0) goto ERROR_EXIT;
>     ++                /* prevent negative or huge values causing overflow */
>     ++                if (chunklen < 0 || chunklen > 0x0fffffff) goto
>     ERROR_EXIT;
>     +
>     +                 if (pull_client_data (connptr, chunklen+2, 0) < 0)
>     +                         goto ERROR_EXIT;
>     diff --git a/meta-networking/recipes-support/tinyproxy/
>     tinyproxy_1.11.3.bb <http://tinyproxy_1.11.3.bb> b/meta-networking/
>     recipes-support/tinyproxy/tinyproxy_1.11.3.bb <http://
>     tinyproxy_1.11.3.bb>
>     index 745c55bc0d..56e3296066 100644
>     --- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
>     <http://tinyproxy_1.11.3.bb>
>     +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
>     <http://tinyproxy_1.11.3.bb>
> 
> 
> We have 1.11.2 in master branch, we should do the upgrade to 1.11.3
> before applying this patch.


Yeah, *somebody* forgot to submit it along with this patch, even though
it was prepared...
Sorry for that, it should be floating around the ML now.



