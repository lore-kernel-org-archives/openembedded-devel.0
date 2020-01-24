Return-Path: <kraaggorim@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id CE3DB7FD73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 16:22:24 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id i126so1084357ywe.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 08:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=sdjuPErGTCIRAtiBPAjj0Z3N9ff/UKgeuiS9Jb5DwJc=;
	b=QC1UJzmf+hdEDu6rI5WvY/WS1zyTfA+EFDMTHpxqmZ/Xj8MdVnz8oaaReXQoXWYjgj
	mY0dr31RmsW3oORwZOWQrddl+jr5rOWNWsieQqibFnKdC6mBIqG/3UOdtaJsy9jLZ8Ou
	JcIztAO/qr0sc6iaGiEVuXcG+x6gFFuyW8gT2a3nD37RvrFNU7nEAdDSd9ExVCN7f9kk
	UduRfthyJcg1NoofbDZRfIg9tJ2vyNHh6vKFG0j9ReK5E/2gftIwatlwiysgCEHlkj8I
	Na34zDDWUw7Yu2SBX5l8feSMU59ptT/wsb2xZrtoZaz8GA4exVeqWU45NkpExsVJKa1m
	zVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sdjuPErGTCIRAtiBPAjj0Z3N9ff/UKgeuiS9Jb5DwJc=;
	b=RiUTjZPw25bg9zfkJQUspZ1b0vNtWnp92gmrTmVtCslFeIgyHXy2qJ8qHfi8/JS1wu
	gI9I4q3gTv+Pzu4/MTqIs3CafdnPWnGQTS49Gw/h1WPlKkoRb0myZqIA0LnX+U8foi3/
	yHqCrJHHrD7Aa2LP6erHDq9T9dK2yfco1Wf21yR5ma/QFMQ5lhazoMFj3SuzJZpJHn6p
	Ke3WMmby836pAztOf8T80xZbfHfbWnzr6EctiabnAfpmBL5GXrJeB8Fi+3KqXaeAhE5w
	sYzIhWuw0BP/rTYrffHQDUGLol4dTZOpgzIlYcWIhxziMFqOSRLzrrrGrW+gPJ46AU0y
	0VVQ==
X-Gm-Message-State: APjAAAXad2Bt9/nzAZqPyhC+X4NxxSyvemRQA5+dFr8EpxBrECKsXnO4
	daZJIs6eCkp/wJz7o/7+YlYTg4472Ost9q6L2l8aFCmyKcA=
X-Google-Smtp-Source: APXvYqwhl3bLg+Lbu6l7zPEIMCXIgtNUYIxEwnaRCNp9rQJe41NnTuIWEp7n3hlVpPJaWHhp7P0D7La5hvl9LAwwsf0=
X-Received: by 2002:a81:2608:: with SMTP id m8mr2645504ywm.259.1579882945666; 
	Fri, 24 Jan 2020 08:22:25 -0800 (PST)
MIME-Version: 1.0
From: Kraag Gorim <kraaggorim@gmail.com>
Date: Fri, 24 Jan 2020 17:22:14 +0100
Message-ID: <CACc3Zv5viBSLrGYNsumrn9xt8Aq+aXHGz0BWH6w5sAs0MMAHjg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH v2 1/2] [meta-java] java-library: inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 16:22:25 -0000
Content-Type: text/plain; charset="UTF-8"

Several components make use of python in their build process. To not
rely on python being part of the HOSTTOOLS python should be inherited.

Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
---
 classes/java-library.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index e0159ba..496be33 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -17,6 +17,7 @@ PACKAGE_ARCH ?= "all"
 # Fully expanded - so it applies the overrides as well
 PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
 inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all',
'allarch', '')}
+inherit python3native

 # use java_stage for native packages
 JAVA_NATIVE_STAGE_INSTALL = "1"
-- 
2.24.0

