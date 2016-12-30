Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6A093600E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 13:01:42 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id i68so148361634uad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 05:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=f8KQkhModHO/5gK40Bz+OuOWfgeZvAoe4kG0nXc2zZA=;
	b=lOvzfsc49604KzPWhFYA5MKFu1c5KtLDYpc2fC9KfzNbuJamjxPRfOVw/oYDYUPf3K
	SfAWIJX9QdjFP99gtA4IDE6X/v2ca5LkJgRWPyYYnF74/e3ryxu1YNXXYl4Cn6aPH7e1
	fpaQ1wtuYWf519OUAi2lwTydo5mFzCCaRhiOq9T7C8JDwCXyjkBe5/1rjZ5E0nWilLMo
	vB2bRx/oSvlEfj9Jijs8RsbxnSoOLXz5m6rrRYyp2R4Nf3v6hdzmDivyr+gczuxlxism
	+VeFn4hPXPQtAySF/56hW10kI33j1TX+tfZhQ4qwJeRu/CBNHQ5gA0wmNpYRXC909gmg
	oFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=f8KQkhModHO/5gK40Bz+OuOWfgeZvAoe4kG0nXc2zZA=;
	b=k1Qtho5IkUz+DrWkH1vJzMAQisyCRKerKcjouevci9hyHy4zuF+GDsJ+O26ZvKEFwE
	Vu7dmBYfH2bKAAbCMjoIqAtpbnnVHq5Hma0wJv/EzspSrhQh06oLNwtrNl83LE5ukOCU
	oOltcXQF0/zu18X2zC5wmZ/TLDRlY66yTjTimdDOhZMiHTrl7NYmPkUMHufAgF+mWBxx
	ShJMTuSW9Drh/5lp7YeWoFg0upGndZURvoNjNj+J4qgsmz30zN6ZFDFYMSdfoFAaprw+
	TFjp4dFmvBtXNbPFftgd4t0UulCYQynkqpSigwM2100UuHyWkWA9iIQyI+dCrr1odtxk
	51CQ==
X-Gm-Message-State: AIkVDXJaAMEtoZtcbCPJDbQBFjSF/GTQRLvjDgVJjI5vENTdmeKr4ZbNjqK7wlrpgkmBmM/fogQ2kBaHQPKowA==
X-Received: by 10.176.91.12 with SMTP id u12mr35263904uae.62.1483102902281;
	Fri, 30 Dec 2016 05:01:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.14.2 with HTTP; Fri, 30 Dec 2016 05:01:41 -0800 (PST)
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Fri, 30 Dec 2016 15:01:41 +0200
Message-ID: <CADnUhn0N6r3mia7iVBG8fN9oF84P2Jyx9dfkyGhmAUmGFOr14A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: libjs-jquery_1.7.2.bb
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
X-List-Received-Date: Fri, 30 Dec 2016 13:01:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi!

I browsed this libjs-jquery_1.7.2.bb recipe and noticed slight improvement:
There is definition for JQUERYDIR:
JQUERYDIR = "${datadir}/javascript/jquery"

This has been used extensively in this recipe except on the last line:
FILES_${PN} = "/usr/share/javascript/jquery"

Should it not be changed as below?
FILES_${PN} = "${JQUERYDIR}"

There is nothing wrong in either way, but it would be neater/less error
prone later on.

Thanks,
Matti

