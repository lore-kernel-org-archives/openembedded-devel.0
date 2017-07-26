Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0D15F60720
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 15:07:38 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id m86so62429011lfi.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=g3yIs9G0+A+QHS4E/syNspcKyRQAqCcdrAINn7LQQz4=;
	b=nrAyEZYmOE5PVNlFSfYkV4XrwhmEeLNftFU5A/hIK04AdP49hg5QLZ5SakNKxRuPV5
	6E/B+WoO11h/bJB0GahvpnDgaALHIGXHhJuHU9DORTvmx70SmtfERp+tNiMTR6/w+SXZ
	XB6osmkjHEGUvXpIvBXWomF2VbMxEFRGPZ2lnheGdfKByZ8P9N658BWMffpThG/T83oe
	lafVgpHjIwaH6RF3oc/GPsyHNWEA+nPELwO1eMriCdIU5uKB94Qsn70fJDA6LhuJmi+r
	4ZX0TIuijZBhodgrK+gVeMKDXBfPRza8sPH62ObuTlO/+XWX6TX+z81zviQPDGHOY3ey
	kxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=g3yIs9G0+A+QHS4E/syNspcKyRQAqCcdrAINn7LQQz4=;
	b=uZIqVBr3ZDWbtyfc1HwKU5hAkD0Lf+F4/B+ToX5v1SdGOvWHhql4KTUV1/qRooS4F8
	N1UdWhvAvveEtBuJW2T9dYu7W8v/8V2kxDdsjYyPEx9ZMHJOTdkV9Uvvuz68bm6YLd2c
	zdgkJwzBaAar5Ney9dmYMaioXtmvmUP7HWF7DUquot0/mOq3+sfQOoFRbpaUTKq7tt4K
	cpY7PpB6tjdTebcSRTdHYB38uENtnFhZQ9eubiYwVGf5KH/XIc9PsYXNNN46VaHrVL3M
	7HuitHKpSKg64f00NNtrZrGUZ7Ot9X1gYKCCw/d12kckIwo5dxTwYZUlkGgaCv3yX/LV
	Skaw==
X-Gm-Message-State: AIVw111BiheOKlulmeKehqUEs/lkrqrg78ZOfNAWajT+Q2ucCqz36Z7H
	awaXmMK1K8sUOv7gbXMbgjSjO7GlTadSvWQ=
X-Received: by 10.46.9.206 with SMTP id 197mr502786ljj.45.1501081659258; Wed,
	26 Jul 2017 08:07:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.42.131 with HTTP; Wed, 26 Jul 2017 08:07:18 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 26 Jul 2017 17:07:18 +0200
Message-ID: <CAPybu_3uuf6n73pYn8cA3GJPQC6VnWjAKODi7TMr7ondCTjG8g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Has anyone added support for bazel
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
X-List-Received-Date: Wed, 26 Jul 2017 15:07:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all

I am working on adding support for TensorFlow in Openembbedded.

One of the building dependencies is bazel ( https://bazel.build/ )

Before I create a recipe and a class I was wondering if anyone has
already worked on this?

Regards!


Random Thought: Why dont we fix the current build systems that we
have, instead of inventing new ones that require java?

-- 
Ricardo Ribalda

