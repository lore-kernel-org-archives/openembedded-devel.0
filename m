Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7400.1794642862031632809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 23:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PfYNS76f;
 spf=pass (domain: gmail.com, ip: 74.125.227.131, mailfrom: kowshika365@gmail.com)
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so416954a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 23:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794642861; cv=none;
        d=google.com; s=arc-20260327;
        b=WElfBmpsdGuKFvZwj594meXpyNE9xm8kCkERiGV8/DE3Or/mnQ1gU4cxXBXwIkGMHv
         +DatP37bST/x+YnqL1ccPZ4XuxxzrmIFCNM9LCHgKaHksGafAeuqWceMRRAm1l7pebjc
         SdV1K37YMmXMNtS0SAy0izCStuBmKanK1mgJxo5hcGdCOMDjf1/pyK5ltIbmUwCiq998
         OoaytTapDVCXyxE781MrXklAIZ4NKZa+V00lP859xW7w5ksY/9v964tBJC56DYNIn8UH
         fn4WmGOVRi+2p12U38MgEEHgJCUs32vC5hhOijc6Yy49I/eSzmhoeterWPtvKY8Di7jv
         k1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yyO7bJauA+xIlYGBVlxhVacOVtcAJ9wzumb2Q3I9NNg=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=pBiwjrMYHU+O4Qn2dIYUiP8OnDMY8k24W/S8aY2jUXyw6hENV0Rc2SwT0Q47dhpoYC
         sIIlM3BWL8uI1LedZchIa5leoPZUUb39wfsF1sAkdaXvIOV9VzhK44naT4hCRvQFJNz8
         Z7L/vy4eEzDhb6A3tJe/evWVP1o71sYyGciSI/11jOLyF4eXrrWsIvbIXqssu2hIbxxA
         6JvOQbrP4gTtS3x5Hhb8GCKutS1CsDKSfVjf9VRN0XfUMRRLUCM7zrcWqoRunMf4A8Ct
         2RNZ2WdBrtcpXAOmHZObrLpBn0ZuFaFK0gdmPHNOKjM6EpbgxAEpZc2vyVOjb2XRoK3P
         AJTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794642861; x=1795247661; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yyO7bJauA+xIlYGBVlxhVacOVtcAJ9wzumb2Q3I9NNg=;
        b=PfYNS76f/q0/qAisU4+Myii62GPC7TsJZfoBqE7yTapBZMQwSRUdYXw9fMbpmQYTxg
         HgnZ3PY9pqm+LHj8hbJ4mg5rCGH5mJRZOXrwR0zulgInW061qzl/lV6a40N3Im2h08Ib
         vZu4vigpI6ZdR/nggTMbQ/HOHwCz4vY2rCkScggrz+yOymslH5EEMPDnInVM2rJm9bqQ
         H7h+phRjQK2taPXWkw08j1B/75yM7Eo6YjF7EdV1SpPiXlzeYgJuA8y4mkkh2Vj1fYp2
         cv6LXrt3pUKy5SVDfncMitXQQ0kgxfM3mWKFUpnPdxur642ZUmlLMShTd12rMF7YnkDi
         7g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642861; x=1795247661;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyO7bJauA+xIlYGBVlxhVacOVtcAJ9wzumb2Q3I9NNg=;
        b=o731DM/viq8ZSrSt2yzz1K8rxSC9p+9io6xZTqJ01EGzs1YwROxFusKJz5wgqSh/+7
         vXf5eRP9m3KVURzFrSWfBATEcf0BTX7VS5AmPLriKGpcZQ3rPKvLTIjJjqU1Wiq3tKbh
         V30VVxSpQhceMGzk2zTXLcJXQyr4yxXYRh0XQzfDYWUMWisCwFBmzilEtXLH3axu45Qt
         qhnYgfxdDHd+DEhchZXmCoztIAM0qEqGiNCOFGK1pRFfw+5hrgPQL745lYe8KMa2Q3w1
         ZXXRHfnin1HQBZVKxC9ZP4mI5owUXY/goKDLKLE3PkFY96HRbBAJhpg/LybBqP+Q66+r
         Xy0A==
X-Gm-Message-State: APuU4Z/3k7QVSLx8ila9JQtoOAVCHaj14Xe+3OnqFMGCmcpE0OeRUG9E
	4bAk1pMrLgXyZWIUYt8gWFAYUpdhRIiWGQeuqY/fi+29Yiw4blcX74iFdcKR4yqULYyR5lVeT7q
	GGibW5rCe4A1l/tDc3NLUoizVbl8S3p8Nxm4wRjI=
X-Gm-Gg: AYBFou0UunRiZ474OcdvrTygwVdh+wkxLctRhvPCGZ2pTJbthfVRuhFYZa+C0/wkPP0
	NPV9nhOKj29mFeNSZSzhdC6slCdKYGO4VaUnqPLemA4dVN7sFR7Tm2zTLZpEw0PwLaoR/EMphmT
	WnDm6vgI/8MUIBry5ZyIjRkh8QAnNJDaIZ9coHAQWGe2Fk3zdkRBKl73sQ6uvJfwlYmZrkOzA0t
	E1pAcuj1N9SSAKvfNd92iGhsn+v3kq1ztEZqje3+qqhUMWmnf/aAhRKNKX/tQtGUL6UOZVxbzPx
	I7DMxGHKcnrrY1RGElHNpWDpZSdgbS7CmL0Ctr6263YC+HnRZscq5Cko8GnWaXBSAB1HI8zFD4Y
	3TqDHh5I5YRrxAjtJXjXxuZDvphZtZ+uKxNWKxQ3KFVuujrXnBlsQf4xcXH53txz7p8h9h+lmrA
	YYmvo/uj9gL9dI7EnlrmQ155UlhYEUXgspEhxj1nGa
X-Received: by 2002:a05:6a00:148e:b0:89f:7a1b:2bf4 with SMTP id
 d2e1a72fcca58-8beb5ba8d80mr5020751b3a.16.1794642860990; Fri, 13 Nov 2026
 23:54:20 -0800 (PST)
MIME-Version: 1.0
From: Kowshika <kowshika365@gmail.com>
Date: Sat, 14 Nov 2026 13:24:09 +0530
X-Gm-Features: AclHuK8W_1z0QEqFgcKsTF4FYbH3HMmxHfs8hSa-igeNMz7XHYY4XjOomJ6sFmk
Message-ID: <CABLpS_4ZfQMHogM2MfE_qY-8na+ByA9+P5pFTg6bsASHB43oDg@mail.gmail.com>
Subject: [meta-oe][PATCH] lirc: include lircd.conf.d configs in default config
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 07:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132254

Allow users to add remote configurations under lircd.conf.d without
replacing the packaged lircd.conf.

AI-Generated: Uses ChatGPT (GPT-6)
Signed-off-by: Kowshika Kumar <kowshika365@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc/lircd.conf        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
index 29b03c72a0..2ae1ebbdb4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
@@ -1,3 +1,4 @@
+include "lircd.conf.d/*.conf"
 # contributed by angelo castello
 #
 # note: this config file has been deduced starting from the
-- 
2.34.1
