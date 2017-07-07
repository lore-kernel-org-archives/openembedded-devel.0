Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0529560746
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 18:32:59 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id k67so57860378wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jul 2017 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Z6GF15lzEJyiXA1noV9cfBoFGHldIaQL5rpdI0LR1WQ=;
	b=HegO8FOmjyvszfCEHyjevto2aSfFv8yMTxjaUXcHBOEwt3H5BM8jHtPiMZVNnA4h/N
	pKqJfqd0hYLi/+/J0v1poyvO83SL1t6ttM52CDk4cWU/NpWGhQFtgjP/eevkUGO9n8CS
	I0ugG7qrrHTMRJ80OVOh2txrNWK+GmsFC+baifazpNuiiAZF+RlmPBzO0DvX3StK0idG
	pBAu2TjaJ/AQ4+LRL8ttZ8YG5InLre21lwbZkAii6A5eKRmJ2E69tDV+7Uqx/QctVK6r
	UUIk35QNZa0akDgJdvEOUrmQKqJ2eyuRgpmyLdM+Zd+LiDL/CEFEsgNEqfj01xNiSBYa
	sHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Z6GF15lzEJyiXA1noV9cfBoFGHldIaQL5rpdI0LR1WQ=;
	b=KvrY6l2GjCb56ARJXlnNyDNe5Zt0iiMRQHoojWnr5LswOQHP916g1tj9dxWFW52GWt
	VXDV9zXjYLOZRQySdZ9CaQpbPatPkK5QSEvFNabq0aYXLoPKdwZrAREU7w81eY72xMyi
	6943APSQh1MH2oAR1a80x8x0Aozg8ZxY3xgc2qrIuO9IeQb0y5dUcuS6Fpk/fCj2lnGY
	kmtyHbWq5uA3V+4CR2I9dhPurOj54RXhmwwtF3uVlsmYPqB7G8CGo6yiQjsSRa3Qo5el
	u+oH17nQmuGu2bb5DNsohX1wCf4Zpb9/GQ5MZsc47Gx50fOCSXE+Wdt1I4NuPHirAC1X
	b/Gg==
X-Gm-Message-State: AIVw113zfO0NXk4HyeFzqEpd+orKabwCgzCQwmeLZF3uYYBsH8XuOtZW
	oscoeaDQY5tAVfBJeXr5kx0cG1eihR7O
X-Received: by 10.223.130.134 with SMTP id 6mr1495801wrc.16.1499452380833;
	Fri, 07 Jul 2017 11:33:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.45.130 with HTTP; Fri, 7 Jul 2017 11:33:00 -0700 (PDT)
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Fri, 7 Jul 2017 20:33:00 +0200
Message-ID: <CAHvQdo1KF6MqXRHcJuGrPapHqcHW24_oTOFAYDdEve-YNLUzwg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Subject: pyro samba
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
X-List-Received-Date: Fri, 07 Jul 2017 18:33:01 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Armin,

would it be ok to consider commit:

88885fc01 samba: upgrade to 4.6.5

for pyro which fixes CVE-2017-7494 (Remote code execution from a writable share)
or should only the fix for the CVE be backported?
I took a look into the release notes since 4.6.2 and there are a lot
of bugfixes included besides the CVE fix.

Thanks,
Hannes

