Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 33A867F8AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:03:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id a6so2622768wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=61fnx9SWrZFFcUl+IEsmD3X+zSonBvYhMf0iFYMRy3o=;
	b=B3SF416WdM8eJWOX0LE0L2IQLadnHqp/TCoBNcYlyeXNfMqXwmfggR9VJbOlj5YHux
	j3YS+HolQH1Jgt1dmueGRTk/PzzHP6GvEcbJuDPIXFCnQYhMIa+w2z6IcbHxlfOjJ5oO
	CkWdn2OWebfGnhjLERzj8zxXhSgHUpvAr3Jw8W2z2tAyfOo0iMpfyGJ4CGvuYO0jXO8I
	w/meOpJ/fhoBGqfZvJzV9ixZ5FAuS+OhmEix2CcvyNK2kV3mUORnE6OFTl0o9VhC9KA8
	PUar0IQ3F0Yc2isW8CI9S0yeQ2WWqvFknmDqEI+O6wE2gLh8WuunW82Llq8aE7LrJ5qt
	STsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=61fnx9SWrZFFcUl+IEsmD3X+zSonBvYhMf0iFYMRy3o=;
	b=OnUylxL2W58+bd2PLbFbr24fe+2gmLJqQyrYw1LWffRHRthrtuBE7rGXJcHH2IlVMW
	3Ex4jNXoorLzQGCpQfhRM8LcgTeNWkSZfXw+tF07plCbsEbFLLDCaeJdvpYjlTsB7fP0
	+ni53onAZS0WwnicBpfjdIB3ZFleRuatvX+Xw+d8isQcUSbUO9aqH2hS9GpS+QYYBL7y
	GXLplAbYOBVF1r3pRMASfy97zLx+Cv78soZqa83hYU0fj3cjv/FpfYZ3qkNScawUygQm
	dIm1AYD3b5a4ad4aGLSc5MZqf84NmSHixDNSde5U4+Np+9lMvFolL8d1dXIuGcfZFybm
	tn3A==
X-Gm-Message-State: APjAAAUOcSi41eORrzFEjn0qOdIxTUixn+5vdqUr2GYFs/9gM/YLMhA7
	1wm4Fbf0rutvhee/osI7S8XWa5U5hhM=
X-Google-Smtp-Source: APXvYqzwhSETBATq0FNdP2ektH9hP+w0zS2HhniKtU3XvJM2/lzZCuG9TkLn9t3qvFNQU4immqQJ6g==
X-Received: by 2002:a1c:a54c:: with SMTP id o73mr3639446wme.68.1568988180436; 
	Fri, 20 Sep 2019 07:03:00 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.101.3])
	by smtp.gmail.com with ESMTPSA id
	f186sm2338132wmg.21.2019.09.20.07.02.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Sep 2019 07:02:59 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Fri, 20 Sep 2019 16:02:39 +0200
Message-Id: <1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH v2 0/4] mongodb: bump to version 4.2.0+git18ce5c9
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
X-List-Received-Date: Fri, 20 Sep 2019 14:03:00 -0000

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
 .../mongodb/mongodb/0003-fix-musl-strerror_r.patch | 30 ++++++++++++
 .../0004-wiredtiger-Disable-strtouq-on-musl.patch  | 15 +++---
 .../mongodb/mongodb/arm64-support.patch            | 57 +++++++++++++---------
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb         | 22 +++++----
 .../recipes-devtools/python/python-psutil.inc      |  2 +
 .../python/python3-cheetah_3.2.3.bb                | 15 ++++++
 .../python/python3-regex_2019.08.19.bb             | 12 +++++
 16 files changed, 225 insertions(+), 131 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0003-fix-musl-strerror_r.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cheetah_3.2.3.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb

-- 
2.7.4


