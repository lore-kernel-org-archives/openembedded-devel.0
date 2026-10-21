Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7541.1792574985269074780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rS3w/c2m;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-17bc533fda3so633526c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574985; x=1793179785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfAWJji5B93Z81VjOHA1zXK6H/EHUFsw2F280LxpAfM=;
        b=rS3w/c2mxTsJJWAJKWj0VIN6Kv7d4kHcMG/q7fbNDJNVIQHf/NsktWKAfsuuEdlivh
         CMbN/rKgFSWTcHOdTffh1ocZsEXZpkRo1zMMAAjtegr5o2lxCBNJ5jPljzwIkaOId4Iz
         jouldwbHGVTdNCYgGbzlRmlFto3WdhyaRwqIhcECaZKHUQSAP/F6zcyRmAgMx7QCKu6J
         lfjHqHS++IcS7waKVbsnSwY8A/TKThrFXb+YdEVy+Hu+L+vbAhCpQA/KBNS/qMgLO+fJ
         WFvkZxZ3mWNVBjzOAiv+Sv8qT8jFASGJU9HrkdWrsBdoPG5NZngTnaP42q4DT07aNTle
         8gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574985; x=1793179785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfAWJji5B93Z81VjOHA1zXK6H/EHUFsw2F280LxpAfM=;
        b=1xP5jSH0C949cY5ZNLyDSbOL3kVx/jnj852aUdb6xrPM4FbmdvTVfeWxtZB1T6JnRj
         RJqE5wVQIS/T+M525FTFCgBFYlsL1/0YbW3JUJ1aQSof310+JAjnHxrCnCU7Zj4GTBFY
         MJUVQI3g7kVLkQn5VCEyKEYE7ccHxfilipWxtMa6u2PTSBinxR4qn3QVZ0gGL8JXWitk
         bAtgSZ+ei2VWVjZuUHmt7jVhIkHicBgeMI1+akK+ejTXOQuBM0/INhAWhEWe6S55obx1
         vjlqHENO73mhPaFzd049WV3LGCSz0eKA05xiwVNY4cXW4pXYcLrxXPl4DDivHyQWJqcM
         L8HQ==
X-Gm-Message-State: AFq9FYIHuR1qvK6d8Xxzi1REaLcuZT3eaehcf6xzJYbv3VWi/1DH/jHO
	d5/I4kjCPV9xJD5hpEgD5vLWicwoC74fdmk8TlJsHizGCIelW3jQKgPU4lhnMw==
X-Gm-Gg: AYBFou0De6PUVpgEtmoiFaFaBCq1rHf8F8cRJ8TOrhJJumAGXk6yk4eePXcYdS/bogU
	hIvnaP0KjR0LKnKvaEInusPeRS8so4Ivc2zNLmfg6yP0Z9E6Z1VEVCECZaZU1meUAv1PzmeGEoy
	5hj2mel/WJjpk0ZCEK3FHTWRt/pRKQNyN2kJi8xUnKiJcdHoFMBbWWkfrHn3eJusHmy7HJFootd
	eS2+40BFAImvBLMToKdv4ydAZ3ODAaMDzGO4bbVMX+3AJExPmSxmkjSdUwd/vxkV2nfXyp8z/Ii
	klTu/F5yqwxwEnoLmk+N9LgDOtTZRaBdxXh7F/mHsx9mbbltWQ7PGEVvZtPQOlOrMBxNw65D6lP
	J6gLNs6VU57OvjhU6wmtI3IKr6RDUKCIVkPUhTaTUAdT8SPZIpkIIOgTRU9U4hFUpxW9H8ANTzS
	1vGXdMYAlixnrnQ4NNqi+uL7iOlEsoYax/7Vf+Yz0x50eB9nzwdau0l2F/cjVPxO3sWFwNOfnxU
	ErUDH5lNLZCLhu/ZkpU7bX8tkik0OskI6vltfVyt9a1QcgrgqRgeNjKr1/23aNah3b6mM8lem9t
	ST/0aa4Y9LfYDUgiWf89t8S5lFuYlms=
X-Received: by 2002:a05:7022:ea56:20b0:170:64b:b388 with SMTP id a92af1059eb24-190a8f51921mr1899492c88.46.1792574984588;
        Wed, 21 Oct 2026 02:29:44 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 18/44] proftpd: mark CVE-2026-53994 fixed
Date: Wed, 21 Oct 2026 22:28:31 +1300
Message-ID: <20261021092857.3585453-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131205
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] identified the issue[2] associated with this CVE.
Changelog[3] confirms the resolution.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-53994

[]https://security-tracker.debian.org/tracker/CVE-2026-53994
[]https://github.com/proftpd/proftpd/issues/2115
[]https://github.com/proftpd/proftpd/blob/v1.3.9b/NEWS#L35

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
index 81a7094359..5c194ebb23 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
@@ -26,6 +26,7 @@ CVE_VERSION_SUFFIX = "alphabetical"
 
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
 CVE_STATUS[CVE-2021-47865] = "upstream-wontfix: it is not a vulnerability but inproper configuration"
+CVE_STATUS[CVE-2026-53994] = "fixed-version: fixed since v1.3.9b"
 
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
 
