Return-Path: <ian@boundarydevices.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 803A5719EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 15:53:16 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id z190so51437132qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=VIhQliiTjiXk8P7UDVdHVm/yt4N4yGnMaoZHAea7EYo=;
	b=VzFIyj5ZoiES4XGlrwe9zvgx6evZ1a1htjAUHoUDmKJuSa6o2tpwXRkpJ+7VIl6Aqi
	mZxG4GFnP+uFf5b8T4qkyZuQW38HoBGxyxRGeMtJrvJ2BkRFxB7mUP0gV52S7sTV1V/s
	+XI6qejqIDVo2m8kk3QK19oD+PRU3LcJqWt7NVlmXCE+dPXDGZ95837iTHFSICtavo5v
	kwkCV4Ln6YYMgGcUrF0EjJdGQ0h9AzYs60AWC9MNrqHMzVbAPyj6JOEppZLPPNs7WL+r
	hC9YZaAc2KEbfEu/gdlN2bzKWsPhJfAlstZ8xcyipl9hdlufFMcYH8Qmaz+GmIxenaLa
	gSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=VIhQliiTjiXk8P7UDVdHVm/yt4N4yGnMaoZHAea7EYo=;
	b=Sct66FUf80sEg/LyNUu+AvT15tpBgdpcKuEEnnK/jL0CyFgYCDonyJRV2MZ+Guuem/
	SB7CnYSrprwxnA+htEc3r15DdTtXptBcnc23qwRfU1Nw7UM++uyawh6lYVosXRoIi3qP
	LWlNjN7c/AEJwwCJ0GupZPkiMRGpB3lIKl4ZlrYh5Pl9vOphiAGGulqDm4ShL03ZT8WO
	R8MX1wGHFbUw7XN9bv5O/DfghcpQVXZF5cZaB5NpXondPjLqv7fSz3iDGvxTXxw1kdY/
	wkeAW/F35AKllYs2pdwdizDvpx4gZeNoVZZEpMaqZleneINsd2UcqXY7bt457VU9u2SN
	5Dag==
X-Gm-Message-State: ABUngvcsHCn30qQrZ7DNLfnR0YnU6m3XjZRV+EXKZKaZDguxdy0cHi2R8WUGy2yVUBXMmAxgh4jQGfzkPaRsXQ==
X-Received: by 10.55.203.25 with SMTP id d25mr7816683qkj.240.1477583598220;
	Thu, 27 Oct 2016 08:53:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.136.173 with HTTP; Thu, 27 Oct 2016 08:53:17 -0700 (PDT)
From: Ian Coolidge <ian@boundarydevices.com>
Date: Thu, 27 Oct 2016 08:53:17 -0700
Message-ID: <CADseiPkafvnNWo3pyhjPfjj-05ssn_UepHd7z8NKvCYk_PdBAg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] chromium-wayland touch not working
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
X-List-Received-Date: Thu, 27 Oct 2016 15:53:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I've built essentially core-image-weston with chromium-wayland on Yocto
Krogoth and touch isn't working on the chromium browser. Is there some
setting or configuration I'm missing? Touch is working just fine on the
wayland desktop, just not on chromium-wayland.

Thanks for any help!
-Ian

