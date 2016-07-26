Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 52626606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 13:31:21 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 38so20089704iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=wcsDBoETOZcDb1T3QX0G1iak98lSGXETssHhWvWCoGc=;
	b=hxPNPIqWIQTWUduCQx8d96noNM3lpkJ8VUIyekIsEUoDp8Aaz3qvSaG4LPmp7+cj1q
	SxyLU8jhsTZUoee9NC3NJtKhf1fpPxUPoiMA5zoa8LLBt/wqOwrFlHBwekAsFIZK1x3c
	jvZOm8OpBQt/JMWs1PtDn1KwQkzUAEkbo+XW1wEpd1tzMwibVBbx9SfEanBt3waovUEm
	69G1C8v6W9tv5cCY1GzlgD/mBjmgARWO1ReoL33juoKyLCfqLUOqa7m7MF1g+QuncjO+
	qLXdXcbf+X3axtMCTky+TgzYDJix57u0JRFdu1QS5sz17gAnohyQ5KRlIACnBr4bwx3A
	dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wcsDBoETOZcDb1T3QX0G1iak98lSGXETssHhWvWCoGc=;
	b=TcOfeG6Qv8rCRpawa0e9nDeMSfyhVtTAd0ohcjmTnsPX2lEvw+ZF11GjtlJQpxasF6
	L5RrrWiCgQgywNsC/AkS65Vj18tp+H3AZVYRmgz8mBs/tGPQWODCzc9XnF4M3QWGvblf
	yJCRGyBIIg1+Zywqk8fNM3pTv8th6jgTRLxBV7xEGaduO8P6z8bVAkhEl0suZ7rVwWwG
	XDW+0Fy88YKLFIXejSoQUyNSnlN8ebSoigGraqg3gnbsKOeYAdzOni0ZLkeMFlE4YY+x
	A/z6gCMyxgKTmCyKPZ2y3QwOxLZSACuToj1br7yLCI/p8wJRuhMxe9d00kaeRHW3wS0k
	7DSw==
X-Gm-Message-State: AEkooutkG80rQNJ68JnD13lUzlP5te6JOUwt8sAMZAIxrPKkxT4uZEaVilYahonuluMptx2M8wCnMWuXOcn+9SXM
X-Received: by 10.107.154.196 with SMTP id c187mr24991368ioe.99.1469539882139; 
	Tue, 26 Jul 2016 06:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 26 Jul 2016 06:31:02 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 14:31:02 +0100
Message-ID: <CAJTo0LYsTtk9eFD=kdhdrtFUCPr-eOn5dnPxDR+hM9LRbL40ug@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Meson build system
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
X-List-Received-Date: Tue, 26 Jul 2016 13:31:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

FWIW I started looking at packaging and writing a class for the Meson build
system (mesonbuild.com) last night.  It's not finished and needs quite a
lot of work, but if anyone has a need for Meson or just fancies finishing
it off as a project then I can share the recipes and braindump what's left
to do.

Ross

