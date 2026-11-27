Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10324.1795752986678786935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PsrAHJmT;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b546061d58so17750216c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752986; x=1796357786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCdhLB0CPp3xzfnli7V1RJKtzI2HT7Y/1diYculeHFc=;
        b=PsrAHJmTQk3VL1CAOUMOstlfTLTZUKb0vGoWltSJ+PJlvW4kQmbm6434EnD8HojR+Y
         6qkJYIDHmER7Bj1t4JC5Sj9AcQ9xDBnLbdNxtGcr2e4DfROrEUlCxynHXGsAnbhL5ks4
         9tAlI/EcHEJVQiivxZfw+fXZhd/Z1fqSV4Hn6tDk2dJyzFxHTytjN0pfSh6sTTFDG0nm
         4E2Bkj+v1mvlz7kMvN7HMwDcz33Jfd9I/z1YL/2999aChLgYsYkHoGIW0giceZczVFea
         qHwDNe9vawtxUIn7japiUqa7MGcKD5YYqzS9n37RrpfXWF6eFCVUZ3lBY32DjeEb5+Ps
         pPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752986; x=1796357786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCdhLB0CPp3xzfnli7V1RJKtzI2HT7Y/1diYculeHFc=;
        b=SRWiIW1gqM+GiXM/oAkJ3QF8ITpVJBvsuDghWKaMruupycSo+aHcYN651Z14QCFjLf
         G4c9TvdXs94B1fJ+H0svL/nF+JciJraW3aVm/8lFhXiJe/x2ixbmzoD2NZ4IV9P6/7E+
         GKZWY19BxMtxSC+wWkIhNetDXjC27YE4X+rF4Ojn6Hpgub71u44cb5K/Vw0LtNrA2aeP
         z/SufZUs2BFh5PEVdvpIvZBHplbem8ajZAYVfgBUx0KIRiRDIa7WpjYnxGoeGeNNPPQP
         5QoVVqdUsN3J35Gi382d72HNQXu+OiMSLZebcowp62WNwlFvcvlN1mRL09WryCb+ecxV
         gJsw==
X-Gm-Message-State: APuU4Z+zuLsY8GYnI/aYCkN5ru21gDg+YC6QjR1E+ZFVyJc9rs9g/XQ3
	z05udfPltRP08a3eYPaIvRvBCLxtCwyTVrbU0KFYFGPvXc2S3iY+1O7F8ajoWVqK
X-Gm-Gg: AZFdTZerGcr7YtaDaTvqE43ndT8+XQHnuSscEt6CSu/HC1SYuhuxO/AaDoNBf+FlKmM
	4U0Yu7vXc0uSd6JiN2fK5bHtSr2FkdSwLyzR2RTJL6ZTzO0PLu6BfCFnPRdNQBFjARxiVEDHdHl
	vrfYfz7fELPpIaAfaxh5vD2vb5MxOBAx/72rya9UPeK0NJMQxsyqU4ip/6tLB9/w9tC+OX6v7hn
	9zEu9oNpUWLqYHb60btPTjqt0pLb3trzItxzlnekYdoC3rD0PPDahdVja40n5S9q9tMA4j4LLF7
	KmVwLIIsGH5rH141SIfYK5+Hr0uyhecawmISf6Rzfp6ltiGJ8DSQMB6g7S0RmQ9JKvzud/FYsQO
	EdclO4zSpX5XxBKNBd21Rn9xfdBjnsSl7IYadFuuKgcqO/ZahqNI+pRibXWXfnE9zzKxVgYe9XB
	2E/idx9yXbQ0Fg0fN5Kbm/mH4EbBWP1IrqBfT2vuArdYqOFLSmsGO8VxZ1qFoqwRL25/Tz/omDL
	koeu4pWnqlvlWYslxE60EMSH/tOsBYShPbV42zlyl4NpcD0MWj18y9D1NqIL7cMXZX0inQ/d7aB
	bCqXOPBKjD/NHZbbU6ZIoZkPvlfDBdxZwLcVJrOUcy5pftnx+hUbOYxO9aYMRHxhnQw6bqTSBqd
	RMrfdQ5DaOQDkXJDUuAwQlRtbP+YamvhatNCnIPCWz6z59ddHAu4J9TcxIpiDGcFlUIva33u//w
	Qc+DhNQikoXGH/S85ha5acHKoGjDuiO9XmZBQOgNnH9no9IbCSBEkv4nC8MwaI7mtjN84Z86GyK
	1ikrEqlIptOwuCuugTjx0VvY9gdFPnjVrNkGWNkMGzpWjsTJ08GOJ8GFGYSaFS7vQCICTGd7laO
	ttUd
X-Received: by 2002:a05:7022:7f12:b0:1b5:4dff:8b67 with SMTP id a92af1059eb24-1b5568eeba1mr22678191c88.29.1795752985902;
        Thu, 26 Nov 2026 20:16:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 06/32] python3-slip-dbus: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:48 -0800
Message-ID: <20261127041614.1775064-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133225
Content-Type: text/plain; charset="utf-8"

The release download directory is not a listing, so the check found
nothing. Check the GitHub tags page for python-slip-X.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index 99d2f9b7e1..85bd8b92c2 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -23,6 +23,9 @@ SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
+UPSTREAM_CHECK_URI = "https://github.com/nphilipp/${SRCNAME}/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/python-slip-(?P<pver>\d+(\.\d+)+)$"
+
 do_compile:prepend() {
     sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
 }
