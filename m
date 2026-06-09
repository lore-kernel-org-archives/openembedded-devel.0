Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F78ACD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75306.1780997127822416515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eVWcLTBA;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842204fcca4so365173b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997127; x=1781601927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+O7T1rT9lELc7OPRsrboWxXfR8R9oy8K+CzMG7tM+A=;
        b=eVWcLTBAcYXk9gzzGXPxc22MOIpkwOB7cXAmLY5ECwA/OgAlM6T7qQT9AHcxbPpLeA
         g/WmM8NfgJ85YtIeJdppbjrhlibYOu7+xoWIzWi9wuam2WzAKUBd/BSF4r/poTHf0FD1
         rpmd+iAk7+cOW5k9aUkRDifjbJ1Zdcb99KVEN9+PsEl3DC5Uw7AHZWt3HI0yp9BLYMzS
         XA6+Do2s6dHvEMqb4lcWGCVJIlC9IWLCvP39R/bz7K3OVKsnPEbBY+3KPIpKHfLBQoQx
         /7vY14tLBdXgo1UrJCZpXZNxjJkSKA9DelMZcVZpKMLFEh6cpRcaEmNbEfDyIncMFZ7O
         TUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997127; x=1781601927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+O7T1rT9lELc7OPRsrboWxXfR8R9oy8K+CzMG7tM+A=;
        b=WI+eIQHF9mXVihZjZAfV+I2CZgWJ468uwAVkbES1toNZ9LnSnmqbSZh7LFRbr6FIBU
         GMmqJxRCsTCCgfZQ8YrlwzKFYO8bM0XeI5pNgzAoDLz4Jttmm+8oVv3HUNS8TdDfp8T0
         LVNUzAE5BRlKFp4MXdMInV2n3BX8Z9ZpLv6rmOmPdffwMHIjkGN8SVh54u92D50KZnFr
         H/bZzN1e92mZtMY47uVIpPhDej+fHhIDUoXGcPQnsvZHE3GmVbCFp+OB4RUsR5bENVnO
         oelmY9p/59bLhL6BhK4Wdws7qjRMGa9ZwuXqpckJaGBdLGC3rMWHLZOUnK1zQgQKi2iD
         ZmCQ==
X-Gm-Message-State: AOJu0YxRqH47yLSJw8J646W/8I7N7mAPq5UupRovK60PStf5QilqwHE+
	IuG+vF2l7xH5s9/v0kw7qXI46FDmIly8GQdvxvljq2hDOSlrE3uFOuOELWRwgkBYf8Z9XA==
X-Gm-Gg: Acq92OGdT9Y5jZQUVai42q+st/M/VX5Q7VTQoYkuMYv/BwVbOfxl7AgiWy+JyZSUYux
	/EBm84hCEbjFTuKpixLqjs6lS5s36db9KtbgQrnKhSWU4Vjfy+WBA7xwkxyLrn0lA5D8UO+JV+K
	2KXOFC8X/a4iCpM/ZuvflMaR2bcdoD/uXkMvdJtlHp2uvHXUJqp9fKUPVT05fsnNvL4c3nbab1v
	4x8r02VZYwgSDa5i9xHGgbVxlKEcwAWXEM9cXj+qk6UrGaoonkps88TPc/rV/3FahZUDIyvaAqU
	swhITM4miDNTlJIZ4yJdJhf3CRigvRWUnbkYd+LBVzJO/WeqfdRT3ENTP89J4TCjy10hIEWSbUk
	0/8KPqvHFgAPlWkugvtgQO2txJxk0D8M0b0CWVS7HWdVmSGwC/Eb/7wGkA3NZNf9x3JbtsbG5rD
	VIxdNpJCEDIk9C4VHwlziF4BVKI/kmZQL28JK+/dCgO0O2mTBKbD+Dr+B8k00QTQ==
X-Received: by 2002:a05:6a21:4582:b0:3b4:895f:6abf with SMTP id adf61e73a8af0-3b4cd4970acmr11105600637.3.1780997127262;
        Tue, 09 Jun 2026 02:25:27 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm16496633a12.8.2026.06.09.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:25:26 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH V2 1/6] strongswan: Fix CVE-2026-35328
Date: Tue,  9 Jun 2026 14:54:02 +0530
Message-Id: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127446

Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/56c7f0d13dffcfebf4255470e375234144d28134]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...nt-infinite-loop-if-supported-versio.patch | 42 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch
new file mode 100644
index 0000000000..9bd26409ff
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch
@@ -0,0 +1,42 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 25 Mar 2026 10:17:46 +0100
+Subject: tls-server: Prevent infinite loop if supported versions are too
+ short
+
+If the extension doesn't contain a multiple of two bytes, the previous
+code would get stuck in an infinite loop as `remaining()` continued to
+return TRUE while `read_uint16()` failed to parse a value. Initiating
+several connections with such an extension allows a DoS attack as no
+threads would eventually be available to handle packets/events.
+
+Fixes: 7fbe2e27ecf6 ("tls-server: TLS 1.3 support for TLS server implementation")
+Fixes: CVE-2026-35328
+
+CVE: CVE-2026-35328
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/56c7f0d13dffcfebf4255470e375234144d28134]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libtls/tls_server.c b/src/libtls/tls_server.c
+index 3ad9fd2..7b2238e 100644
+--- a/src/libtls/tls_server.c
++++ b/src/libtls/tls_server.c
+@@ -471,15 +471,12 @@ static status_t process_client_hello(private_tls_server_t *this,
+ 		bio_reader_t *client_versions;
+ 
+ 		client_versions = bio_reader_create(versions);
+-		while (client_versions->remaining(client_versions))
++		while (client_versions->read_uint16(client_versions, &version))
+ 		{
+-			if (client_versions->read_uint16(client_versions, &version))
++			if (this->tls->set_version(this->tls, version, version))
+ 			{
+-				if (this->tls->set_version(this->tls, version, version))
+-				{
+-					this->client_version = version;
+-					break;
+-				}
++				this->client_version = version;
++				break;
+ 			}
+ 		}
+ 		client_versions->destroy(client_versions);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 7cc67e4d92..6fbc345923 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2025-62291.patch \
            file://CVE-2026-25075.patch \
            file://CVE-2026-35334.patch \
+           file://tls-server-Prevent-infinite-loop-if-supported-versio.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


