Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A6D1A639
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 14:17:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10916.1767968264261337491
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 06:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gz/OH1AG;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c96215so1398830f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968263; x=1768573063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaiGrrAh92+gNMtJrIywNp9sZJ+YU+F/m1lnHN1t+cQ=;
        b=gz/OH1AGeq5jj9KhtTrzprHO6+kg+zy0smGcVWQj2BIII+gVQF5fKJI5qa6VS3ojrw
         9ta32L4hQyYRbYC35dVp+ekGAL6lYvUE3xlP1K8cVqaAY044IBiieFZ2Y4rCw0m8L8+p
         /TPS2GkqWSD0j/6OmA+NJ9542dd3354rJ4AqWY1RNp//3KbD0rOwyqI5yFxgODQiIbbJ
         CqRgQCInamaHQg/At39Fd5sgyT9kzR/k3IRGJbR7ff7LL1H714K6pwEevTTID+mHV4wD
         Rx1sWBnatUahSUzH+LB3asqzIVWYyiNBAW2cHigiJBq5RWv0H8bl205LbIUZwHw+NGNF
         tR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968263; x=1768573063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VaiGrrAh92+gNMtJrIywNp9sZJ+YU+F/m1lnHN1t+cQ=;
        b=G+ThOUUglLaxOME7MN9vHR77EIi8LYNWQuzi5C2VRPCNY84pGzhIfrN8rs6qfUqP1F
         wEt6CofxrThWdZFcdeRapruastVygiB549Pyn0kVLiP2rqLbyuxsoI9u05QJMwwdW+MM
         NcFCMMTjEemyslqqlWz02fgiguyeI4KGJloqEsRZd2dRgcv8t71C6B28KVpk4fv5YNz6
         rZDs6FxCQH9AGhSXvD9C5o11QYp7jHAk4c06yoMB1M2yaIpaBu1PzHuThd+jzH8jOvY9
         K4nYMmrrT+fyW8iLTV70VeuuW2uBIFVxpksYR5M7Eoyu/FFJdKDlNdKnR+VTAh873rJU
         ZSVA==
X-Gm-Message-State: AOJu0Yw+SCer3VyakXIoQoQkptgh35IlmGI19VUeomjDzCpW31tx4rlg
	87Fj5voFxjnqu1u+0F/xQjm12/0713s5xRJOPmNDohKsUqXzmG6AWgZI0fVmQQ==
X-Gm-Gg: AY/fxX4WJXnp/4YL7BxNBgXe0owgljiMDSkgHhr9t7fEv1hAty5nSNp3gyxt6CuiGds
	28v4/mDRuEhFx2CV2gx1fUzW/hwhdRLbbS0JUdtkThS4O3W01jMuTOYDKkWLACns+kLKDwhyYgN
	E6xC74uhCFt5gcVCzX1izwRbV7r5oGPikHvFsdvakWSDRPMUmkL8QWgu4Sd33cZczx61h+pq18M
	5rTk2bQjEqD8Xb5ZtUgSp1Q1dr1TyJBhtAdoX7E+pTBVBYTwL24638Zyaw7Cd93do2+ajE3XgxZ
	cwI3g4xVQo+PAY/TE/aXiAs7/eD8XPjBmjnUtE5VkIkD2J3t1K6r5LVO2S/FFJomJjledrfnGD7
	r/YSe1hTh2HFhURaFoHjbQ3BVaImI5H4hwWEJ9kxdKWdRcephP7S1PKF5CiwSD/pznuZuGBmgm2
	cAcW08yi6UfGvgXt80ZHA=
X-Google-Smtp-Source: AGHT+IFPhp+VBu8YGs4XC4cAktw3y8iVhiikW2xkssKMnuB44nl6GSamKCvHSQfFNpFlHGA8if0urg==
X-Received: by 2002:a05:6000:26d1:b0:431:266:d135 with SMTP id ffacd0b85a97d-432c37d364dmr13198851f8f.52.1767968262524;
        Fri, 09 Jan 2026 06:17:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm22686384f8f.35.2026.01.09.06.17.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:17:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-twitter: mark CVE-2012-5825 patched
Date: Fri,  9 Jan 2026 15:17:34 +0100
Message-ID: <20260109141734.1596725-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109141734.1596725-1-skandigraun@gmail.com>
References: <20260109141734.1596725-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 14:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123305

Details: https://nvd.nist.gov/vuln/detail/CVE-2012-5825

The Debian bugtracker[1] indicated that the issue is tracked by
upstream in github[2] (with a difference CVE ID, but same issue),
where the vulnerability was confirmed. Later in the same github issue
the solution is confirmed: the project switched to use the requests
library, which doesn't suffer from this vulnerability.

Due to this mark the CVE as patched.

[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=692444
[2]: https://github.com/tweepy/tweepy/issues/279

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
index 9bbbc9e8c5..ad05e0ac47 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
@@ -19,3 +19,4 @@ RDEPENDS:${PN} += "\
 "
 
 CVE_PRODUCT = "tweepy"
+CVE_STATUS[CVE-2012-5825] = "fixed-version: The vulnerability has been fixed since v3.1.0"

