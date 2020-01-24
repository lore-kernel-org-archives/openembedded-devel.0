Return-Path: <kraaggorim@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id F2DDC7FD73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 16:22:21 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id t141so1076801ywc.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Olu02QCUEQ3GQ4sD0LoVdl9dMYIsHePoPi3Gjl5NYR0=;
	b=gz+iqmVndqwSKE/CgNKGzjfgI3zDN44yvpF5+qCzSze8NkhrA5K1Bz7p9I/Zno5xKu
	IKapJgY8bKbHQVG0Liu6HyPfhhhVYjALzCL+LxMcTAggasnV9HZpM4nk9tVz1xqQ2HXV
	eHZ5Z+aSbtaPSMAkem1uBZo0xEbd7/3pB5mqgeRb7wJoCx4pSwerkbGVtDl/RLy7B7iI
	rSAPu7IBohk2VHGanUhUiS2h/dzQmyLhcUFXhpXOgFUM6zfZKrAj4leNJq3CNpDYKBL5
	fNfO62UHQcs+7bkC2AbrEDqQJDhfhk8s9OkQKcQ9PF2fahHoY+pcCxTOCLZz0Nhx/82l
	lpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Olu02QCUEQ3GQ4sD0LoVdl9dMYIsHePoPi3Gjl5NYR0=;
	b=m+Oy69bE0pCt2Qj6Uzd9+gCbDHLzN54MLG19Dm1x8St5jKunM/vPhgy5iJGbsgelUP
	6FyL61Wx9c2kAKGmSd8PAeRDXztDIY90fiCYJ07plX4aWiEXxwIt24UkOmfXqHoj2hEH
	o3ZfKooYr5l8isaZzspTgILLPSgxiaF47lF0/w1oPTbF13JIYp5bFkhyQ+j1IuXfoAw/
	nP+hi2Au2VotgPj4EYDNdJDTy7YqVJ7Aiq/i2/1iE/NprMxk86103cJofUNpPedJmVRb
	SW6zze6ENgH4mcq8NNmdDBPx5M15dijGuKTZPRnppBXfnSdI8sklyFfokkq/6D3jTp2I
	dYUw==
X-Gm-Message-State: APjAAAW9WpsY4lDx2TCDQ+Bs6dQpjzZrXYM4FRAkwhFNWAAtr9DkKDKS
	jsZXOO+wtNTcUAn6DM67dRICUjsAtBNEq2lYYBhWy3FzDd4=
X-Google-Smtp-Source: APXvYqzYLJHNx3uBkDHmlhb8CI+a4CxXLpMMHVbK1+5xviXqTRio6UMepAMT0X3MyLTtVOa1tQfFgWMjQfILhNu2/kA=
X-Received: by 2002:a81:4c13:: with SMTP id z19mr2650912ywa.466.1579882942822; 
	Fri, 24 Jan 2020 08:22:22 -0800 (PST)
MIME-Version: 1.0
From: Kraag Gorim <kraaggorim@gmail.com>
Date: Fri, 24 Jan 2020 17:22:11 +0100
Message-ID: <CACc3Zv7_EOHx9yK7E-WYOCi_qdJ32ZGAi5_QnLZMT9ZxS_7toA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH v2 0/2] [meta-java] inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 16:22:22 -0000
Content-Type: text/plain; charset="UTF-8"

Building openjdk with python and meta-java on their zeus releases
revealed some problems regarding python. Multiple package make use of
python to build or for configuration. Cacao even gets python patched
into its tools which is late on used by other packages. To avoid
requring having python set as HOSTTOOL it should be added to the
corresponding packages.

