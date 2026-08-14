Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EAFC5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24546.1786747646713288017
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s2UCAd8r;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1612171a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747646; x=1787352446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDddcI0cT+3d+CRE/Wfue0GHAjnQ2lC/SLvmqPsp8EM=;
        b=s2UCAd8rd5n8o3m9W/DMZ1ymBwWgenhkhC3YwB4gNtEZpaU4+LGALArmHLNOLqyYU2
         J6G0yGxVE973Y0baGRIwC+/ycZEK1xF01NAz0c9nfFH+PTtLpRrSa9FDg1rxt9if6A6C
         c86IhT4EP72wLS2KQlMfs4ShI0YRyt94AadGG/YbJsXyYTsPIixhvTqZL0pcnMDlRlIV
         MrR5lStTn6F5P7wHNz7Rl0h24cArsobdtaUPb54kyY3sClSxljFXsd4yCrxOWpsXFOTy
         T5+ugHe9w9Pb/CxDzTCNfIL5lZqELVz2yODndcqmjj5AwMGXp2WnOScA8V/gLosX4BZw
         Oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747646; x=1787352446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDddcI0cT+3d+CRE/Wfue0GHAjnQ2lC/SLvmqPsp8EM=;
        b=Z7zfuRmILhQaC+zhb54EpH0F5sy8J80tJO72lE/KYYtYJ83dQE/Ma4UKygfPCynIIU
         OlEOQHiAhY4YtYbd4Rd224DH263UgPz1yYUnWgMwaYchnkXC6F/0LOJxeA8ayT64DDgM
         tlMH+dP2jW1U3Lc6mbb6jac+pbsTt9y86dUx+YSbOPZnmntiORS+dfXUeYmud4kSb2tC
         Lj6IWq+cV/caknkV9nmyK2xYtWYh3Iqv6p7zw4ZF6l6WhLft7HOS7vlYY3Mls4/rIjUW
         ekrlCNFxftzA/d6Kog3xBhJAuxOoZISEsUlQz5TiRxIvI8Ap++sFJVnNW4Et0oDJr+H3
         xZGw==
X-Gm-Message-State: AOJu0Yz5iqv1bJgCuHGk4KJBnijVBK02C54xd5CkhihJhPaEpVrb4sgF
	CBQ/CI/66Tmw3h1LAGYKiD+alDJvF3ZeKbQbplYfOvYTgp6y7RGR4s4SS2lhK8T0
X-Gm-Gg: AR+sD124gewUkFI1HnSn92AanJxANwwqgIm3+9spTFj+JHCjRnVhva7Wym1zNEEHIBm
	Url0PulTX05OVbE6Lsmxm3/+UA11WwdpQRjrCYsZCg+V7zrXObSYB1uCdkPmqJzYbnAxSsllSk2
	njpmxrRWjndpTqlovOQ+qCWhJs9/lru4PN03QrdKZzN1mb3nykDi92XXDDBNbfpUuNEEF3iHwKO
	PTis1VA/Ie9ht400oiHs2pi3hmx6iQtm20soSGFoRTyfNhc9iKeYXTvypcVAYv/g3s2sET3si7n
	ll7/2qFW1nz0yCClSAipEtmO1QU4V7xiZndgS63IDD98092XL6fQPyQMoq9qq4JVjQusnz9sq6f
	Osc0wAlqRw9OlyPrsAES7pUayX12C4W+3OQ1OMGdLsXhjjHsPBrbE4UBy4+c2JGS4wTzFWeac6S
	up6rgKlFY7/TcgQSOlHFpT1FdW14pCoG7WzRAP5MiZUzBFp5N5bJ1l0fv0WQdneTNkuVXZB5A4z
	I05FZsJ2IFrJZqFQlDkgw3mKWfVz5/B//1iwsDFsrpUN1zDqF+3t3DvKTUl2u2JCbw9meCLySc4
	VmIf+cVeyJh/gOKo0jv+dV+TLlxKNvoSKd/elbRUhtC2Z5JN4QowL3jnUeCPUOWjLEWajblh3/9
	lKggb8ABFtzq4m5/cbP+twL4FrGHecdVl+LXB43xzpvapJw==
X-Received: by 2002:a17:90b:5826:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-3931f5bbb2cmr12122556a91.15.1786747646034;
        Fri, 14 Aug 2026 15:47:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 087/109] fetchmail: upgrade 6.6.4 -> 6.6.6
Date: Fri, 14 Aug 2026 15:45:13 -0700
Message-ID: <20260814224539.1523174-87-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129151

No patches involved. Build-verified with a full cleansstate rebuild.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fetchmail/{fetchmail_6.6.4.bb => fetchmail_6.6.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.6.4.bb => fetchmail_6.6.6.bb} (92%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
similarity index 92%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
index 2556f97c4f..815b11b0bd 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.6.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70"
+SRC_URI[sha256sum] = "da99f8c573c4d9e63f493c7e24447126aea25b53b4c076ec79266874e29b1975"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 

