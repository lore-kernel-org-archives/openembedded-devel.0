Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6934.1794458681449232434
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RlnRBoq/;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3021145a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458681; x=1795063481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDlEgziNqunqggW/luFDNrufEbsRgIUzQyEFSwkgPBc=;
        b=RlnRBoq/WEuO5pla38af5eQpI9ifkozrfMn4a6pLeO5Y3vv41a0NPvL4SDfGoIhxai
         OI/1JUsifFoaTqBlV8Ay0PT81agzz8X8TNLbHpTLP1WAZVIEf/w/8CR7vkfbXAZcRrZu
         82bpcbQixIN0+nKx5nEwOCbNQrkQ71ydXBMqgu0uPZvES4v+GpM+5XaBYyVUgTz7tjAj
         SufFsvJffkN8O/h3XK+k2idXTVivPxpb6bZSmOG0djBGEvrbIqnlnfaa0jq3tp1+sxgN
         hALeJux98BwBJTUqYEN03szAlQwi+uXGuM7vcEd8cwyhsjtLCASerCoE+0fUlr+F0UJv
         C10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458681; x=1795063481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDlEgziNqunqggW/luFDNrufEbsRgIUzQyEFSwkgPBc=;
        b=fWV7UPzrlqSStzl6MFNIDl5rtBTGeuNAwL9qhU8LQZD2MJJIUWeP+OLa/gbSeEPb0M
         oPGkAavLZoXrD0DD3TzLp+Lspv1hd3dPyHnzMy+evVVrAH0tbxNeok4TqV967buopkiZ
         c4DBs9IPvdjXjnjJUdpyvyDHJhcS9PoQ7zk57KPMpjqGGP3JYtNC+7L2KmLuYWM6Mmf/
         8d0lZmbwt7iNSGMkwTLC4pdQVbmZIvKNQj2D0F9BA9oIfGAmSyJlbzW/4bJa/1KFYyTl
         S9aeTw6sjL2ybtIoPeytH2g8Bm9xvXy8VBfA9YhIYREzU1FyTT8w31LwPyrEpPslHAU3
         iw3w==
X-Gm-Message-State: APuU4Z8PeoOBJ1TlCTMxQi3gmQ5CA9xIKQAC7Po2dX/om16CG/Z3CDAJ
	IAFmL658+mkAqL31qov1N8zSrZ59vFzF5f5o9qieio87E/oYSvKCEj1hgKmKSw==
X-Gm-Gg: AYBFou1eccC2z2cdOGes7+tXD8IOP8A4/d/brR1Rr0FuzfNpV1WSNRkGbYMQHO1SpH2
	BrIN/woEwykX9sD4bnNq1zHnqmJzFnQ/o1KrD5We5HG7GrdgK49gxG5eFWsj1KaIYLT4gm4gk0e
	xWsDDgFhycw13jfRuKOge5Pe72hWjG/L71ObtVwhkmSXiwX9g74vNlBULB9NLPq3Qd/a8zAmn21
	Ln0agJxkvoqtPoSmhhDlbm6qi7wqlmlzdBFLu7IUderrKwR0KV1pxwG7xF+dcCTWfe3Og37RdTf
	4Xevsj0iW2hzEJ9m7F/Uc6nHF+6Lqyj+Rt9wDWSfFDuH+/1bLjsfkCYbr3EvvpjKY/FFdxIC3cD
	aMVzp/sb8ykJ3b/U8eUNcoyYmAFAcvXdgt6BP9h4d3LexZSM9CidIPXxlQyiU66IWq/I4YQAWFN
	f98kutk6cYAX5KtmXARmfoSY9+sKHnUFG7Chywj7SRuIkHgT2aLdUORv6cUBmF/lA2eTc6rAX6z
	fOoG8oDzJMDsh4fTzRN7eWamb2dUKquDCyDYYAek4XPN3OYP4xOmPvyZTUppX1oLLZB4pdIiNxT
	PNdo6dW68bMu3OGjopR5MmlnMMX0/Nm6iLfy88NtkdcD44WwYmkU466iFc7W2w==
X-Received: by 2002:a17:90b:224e:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b182f198d0mr4598647a91.57.1794458680625;
        Wed, 11 Nov 2026 20:44:40 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 3/16] cockpit: mark CVE-2024-2947 fixed
Date: Thu, 12 Nov 2026 17:44:13 +1300
Message-ID: <20261112044426.3933391-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132154
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Commit[1] also identified by Debian[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-2947

[1]https://github.com/cockpit-project/cockpit/commit/9c4cc9b6df632082538b53bdc8ee9ec1c5cad4da
[2]https://security-tracker.debian.org/tracker/CVE-2024-2947

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
index e12cabcd98..3aa1f155e7 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
@@ -202,3 +202,4 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "cockpit-project:cockpit"
+CVE_STATUS[CVE-2024-2947] = "fixed-version: fixed since v314"
