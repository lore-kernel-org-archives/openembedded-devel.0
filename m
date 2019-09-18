Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 48F07901C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:26:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id y21so2155510wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fC2ux+wSHOgmqZnxNRwsYZjRbEbGtpnDGcg62mxvGJE=;
	b=YWTJnFEnwVaEGPK2YwYrUf6I+pWuWzrWbIybwkAIFDC0LRuLTK+X0aO2ABiPIOgq3r
	ZWvhdEPk5AlRmggpFEtKM/HbC+ZznYltdwxP2/yzDZXrKIl0kolPcfFfDe9l4Y61tH9H
	AxbdZo4HhDQg6XA9Ar4CKDh2aZAN++Z23UtQfA034i8USYBRaZ9sXYEbPwfle7Hjo7kU
	18608CoHE3Ka+9tINnIYox0HEvqFGLtQn6ffGki1UWExwBihfpYCc9M1izoJGTF5s3f6
	fGcfwGCOpSscisfB1t+/Gld691Vw0WDVfDuYyXePug02chxGoERt+oj5CMHwfwUQuGiS
	xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fC2ux+wSHOgmqZnxNRwsYZjRbEbGtpnDGcg62mxvGJE=;
	b=e4GZJHaFgjwyOrUX7EB6ovRR74HPrzd6P2KyYxxjLQYXHGDfdKFtrOqzUcMtOYK98+
	f8bDgxS6LzL3fUIi+2IilbrjGUoibMbjaM9YrMNW4FifgYWLVdThlb/NullykzMmqUkI
	DOVU2+bAzTYOPqCuPT2GQLkH6l0LQwDx5Vhy8vcIubMG4FdO5X+5yiJWP/NQQp4sAR59
	oTKx+4HwTB5OioPUEYd0LDzwslvDBe4aj5SIEqxs0PG/Lxpllftg+JXhx80uv3GZF1wX
	iiXKFJv6uFda/roTgtTt6wYKHX8wDEc/WPxDt0mOmdAwjmb+QrkOvnNt7oDHUNJrb16i
	wIUQ==
X-Gm-Message-State: APjAAAULgBhDTWaqQ91PK3DmU6lUawpUkGioMklaIEQw7IPaESKOBOdH
	/HZ6DbsGMJvrZMhTm/MBJ0NAl08y7fw=
X-Google-Smtp-Source: APXvYqxnJ8Jz1tMfRYA/UnOAyJWbRQ0115MeTmop+320qB5s/diIACPGRNrjKXbodE31feq9R6IbOg==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr2216597wml.86.1568805978426; 
	Wed, 18 Sep 2019 04:26:18 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	(i19-lef01-t2-89-85-250-196.ft.lns.abo.bbox.fr. [89.85.250.196])
	by smtp.gmail.com with ESMTPSA id
	o193sm2191749wme.39.2019.09.18.04.26.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Sep 2019 04:26:17 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 18 Sep 2019 13:25:48 +0200
Message-Id: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH 0/4] mongodb: bump to version 4.2.0+git18ce5c9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 11:26:18 -0000

This patch serie also adds some needed native python3 recipes:
 - python3-psutil
 - python3-cheetah
 - python3-regex

Vincent Prince (4):
  python*-psutil: Add native and nativesdk to BBCLASSEXTEND
  python3-cheetah: add recipe
  python3-regex: add recipe
  mongodb: bump to version 4.2.0+git18ce5c9

 ...FPMathLib20U1-Check-for-__DEFINED_wchar_t.patch | 22 +++++----
 ...001-Support-deprecated-resolver-functions.patch | 10 ++--
 ...to-use-build-settings-from-environment-va.patch | 46 ++++++++---------
 ...__-to-control-use-of-gnu_get_libc_version.patch | 29 ++++++-----
 .../0001-Use-long-long-instead-of-int64_t.patch    | 26 +++++-----
 ...001-asio-Dont-use-experimental-with-clang.patch | 29 +++++------
 ...finition-for-the-macro-__ELF_NATIVE_CLASS.patch | 10 ++--
 .../0002-Fix-default-stack-size-to-256K.patch      | 12 ++---
 .../mongodb/0003-Fix-unknown-prefix-env.patch      | 19 ++++++++
 .../0004-wiredtiger-Disable-strtouq-on-musl.patch  | 15 +++---
 .../mongodb/mongodb/arm64-support.patch            | 57 +++++++++++++---------
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb         | 20 ++++----
 .../recipes-devtools/python/python-psutil.inc      |  2 +
 .../python/python3-cheetah_3.2.3.bb                | 15 ++++++
 .../python/python3-regex_2019.08.19.bb             | 12 +++++
 15 files changed, 193 insertions(+), 131 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb

-- 
2.7.4


