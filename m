Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16914.1793547261369959130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 07:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hhiKHmUN;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36661f953e4so3481758eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 07:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547261; x=1794152061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQPaTiBifOYxikuwjWL7YeAVP3eKYSxoQNp1znnbFG8=;
        b=hhiKHmUNUnmxAmYTFCjuMNCwO2+jD/iCzDqPpuKTHs53P8H9zeKpg8nRzwJoa4u1D/
         PMDX5odS1eWS8+ePA2t9gI11NkYjcNVuae3f8LzCigPoRjjwCV84neQFQ2wuVwBiqOc6
         FDucQlCxwCXfSZpq1ziNACTROgvEove6zWfmYlNkLz885SrdWyXRdm4JNplZU/g1sl2n
         jEn3kIWg14UnoG7iqgjbDV8t0F2nk7jbGimAFbOaf/5jGNWI3mri029lerpWgkwKL7cX
         3SY1Ko6U1DlJEZq5EjBX2R/3Uzoof9d8C4nLQrcR48wR44YCU5LDBNOIFqEhHRGMMJVa
         sc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547261; x=1794152061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQPaTiBifOYxikuwjWL7YeAVP3eKYSxoQNp1znnbFG8=;
        b=F6DRsjTothLACMXX0oGuHhcSlA1jqrB9zOSkg2xFhX/3AtppyS5h8zsEe4jBokPSw9
         IYlWYXvngmUYQBGUH47/Y42lASHjq1Lz6slf0iG1keJ3ZX8F4myXGwbY8fss1fJjnNHC
         d8jrppW9h9KcRQWUORW9z6CHSUwjUuBIHu9xjscEpXE+fWYRwNM6QSftlzA5rOCDU8HF
         UeYd01qnwJ3caUpBRzW+aExtTnjSjC3AvoDRfK1ClonMOa7hncmaH4N6dMJZrbZ8ZfVY
         L6NpRj/NP9ze5YKqbeojEIidYDquo6Ii4pjYsQV/RrYUlF63u1IN0D3HyrKDH56/W6Kd
         Nv1A==
X-Gm-Message-State: APuU4Z8YCAOKWDdwxS83K7jNcjN5qdEQUBqQPPE2LqkEgRX+9lHYOMQu
	A/tX7qjp+PYqUXVlYiQsrW6eWu+HdoD8KbDboYgHOEpWmlLhZxO4LdMeeka+dLlFfvM=
X-Gm-Gg: AYBFou2A/9yi+GHhMJoXU/8nDiJmbQZhllvJ49Q7mJJMHHBixe3bclOcPWe4v4mNg3q
	vbqeLjUmJ32ivvajWuwLwVAsBHznZRGHz8keifx5pKUOKegD49PnpJgXnk5Cy58t12OzxHUqxET
	VOjplptdG9PwhgXICqhQuNJaheJGJ7Sk5FpTe4NvdRv7n3iQNZRhgzMYe7JFGm6btBiPiXbmuln
	S3HYZ5rRfvMOKpMXp3oqQl3Co7MthUVozvCoZTCu52CRenNhzJjWYtAVwyy2C8JuBmsBql73GdF
	MROj559tmjYEAHVerjfNDLR3bO9wh+lMF9MKkun47IOvCUo7IMXR1QUVFksTHQYDFNqTDTYCbva
	iTUj9QqemprtklmBecAYKK+KmNsx2zSQ0KMOO0o50yjSTVJTWm9YeV05crcV0pIu/NQGVltduwR
	P6sTP0O0rN/OTe/KmPDNyxi8iviGnWqsWYGU8e9fgVCkVjOWqWHRwMMVwNr/68vmzzU5qLU7GvE
	AKJBX7nVJ+3UYS+jKLBJ+MMmsX30+PEuBS4NPZKU9YhMXA8cV1HVxjekzC/XLI1mW9URvEvGM19
	QU9cACCyC9hdVxD5U9CZ6ZPAgpZuqB++DV0IwCubPqmqePEdx8poLABUAEDJcdcK+0vZ/x2Jyqg
	14pufyy5A01fqMYkm+HITDVvKwl7OOxpUkhNPlQ3snq3KF+zR39Cn8+36Cce63ZMmdCox382Cqs
	wJ+YsK3o7AegHKMuovMPP4WU/yZNjSzh8C1N42fwP7skyK3l1WMuqDys6p+laV6UNuDFu9tkVc4
	6e7zFyP0oLi05CNhF7CruhvoGNa+ykpl/vipGZlamxyzfojGqnIVb/ZS+aFGSCunAcGp5ugJMHv
	mIr/
X-Received: by 2002:a05:7301:1a15:b0:369:a113:756f with SMTP id 5a478bee46e88-36a423f980emr11026812eec.34.1793547260356;
        Sun, 01 Nov 2026 07:34:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm31448224eec.29.2026.11.01.07.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:34:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] fwupd-efi: Use the cross linker instead of the host ld.bfd
Date: Sun,  1 Nov 2026 07:34:14 -0800
Message-ID: <20261101153414.1370959-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101153414.1370959-1-khem.raj@oss.qualcomm.com>
References: <20261101153414.1370959-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 15:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131729
Content-Type: text/plain; charset="utf-8"

fwupd-efi finds the linker with find_program(cc.get_linker_id()),
which looks for a program named ld.bfd. meson.cross only sets ld, so
meson falls back to PATH and picks up ld.bfd from HOSTTOOLS. That breaks
cross builds on an x86-64 host:

  hosttools/ld.bfd: cannot represent machine `aarch64'

and on x86-64 targets it silently links with the host linker.

Set ld.bfd in an additional cross file

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
index 8682d97c06..44d1f1807b 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
@@ -12,6 +12,16 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"

 inherit meson pkgconfig python3native

+# without this meson finds the build host linker in HOSTTOOLS.
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+ld.bfd = '${HOST_PREFIX}ld.bfd'
+EOF
+}
+
+MESON_CROSS_FILE:append = " --cross-file ${WORKDIR}/meson-${PN}.cross"
+
 # These should be configured as needed
 SBAT_DISTRO_ID ?= "${DISTRO}"
 SBAT_DISTRO_SUMMARY ?= "${DISTRO_NAME}"
