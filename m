Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id E0C2D7D075
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 04:43:36 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id m25so16654386ioo.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 20:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=kXRxQkeARLjRTfEs7puVpZAd0tf5GzrBMtlmGnW/ntA=;
	b=lUfD9icCio+mStlzidacgx2uRWsq+6TU4CiNmvbLWPRvIml8IqGpcdmucvQ+hRbm5I
	KOfBSYJA0afgyQFdL+IDsuO3KtzFtx6ti4lRi6cvQ6pj6UM0iMwtQt/H9lA930duWKK9
	taV7CK1pdtZOlFY8m8TeJDsYlo3Kba7SGWEM/KppLz/qGd6ZH86dNi4+BKofjxjRTKNU
	p7F/BUjtlAKnXWUlAB/7kjpyyDF2LhC1oV8cEuTGPHrRAcyqgcyzvHpt70rZEbvv9Dhs
	sLcOZ+x4UtIb9w/zUv8Il9+kndPZI3wQHdFqCLxeO0SQu+cD6hh/KAL9cLyOq3i2Reqr
	E5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kXRxQkeARLjRTfEs7puVpZAd0tf5GzrBMtlmGnW/ntA=;
	b=iNyLuRME80QEPFeOJbV7Uf0poBYx6kjhkoTg1lqbdGovpQ9eL7Wo5JE+5blCJKirIY
	CvAGA0y2B0Y/ojE9TOyq47+v+5cwAb4REgaLYyg4mvvKrhY+USYWaTCxM1FdyHu5HlGj
	fMQJrSGg6VsliwUy8bL33yTWEFFKiHFqTz6kBa/SvrTlJiHwyQ8zsc+SvJzwBCm1kAYB
	ZYKJDjoeQBS79UQgKbYdcHeisKYNYj+7qfNCwwgAN8kHzzov+Yrm+nb8knktqYoOemOg
	IpP2fLvOnS6VpDETghgmKEDU+e8Ajq140+Mk85kpVmDKBGgVY7HouXOoK37ZSLE0H84q
	2oHg==
X-Gm-Message-State: APjAAAUCZhfbifIBX/0k6b0H0PDZJvn8c1J9GqlQp/QpeX6ZYmpQ+LrY
	BALMUKIkrAMrFwZk3ctESrKVhN3NHXltNoCtZ6ynuu4i
X-Google-Smtp-Source: APXvYqxsOSPchfwIMAEGaI6kKUOLKjA2wPnUdC/RCAMEHU8axuyMlI7JXzSdMcyISAvMnXKjBOGKmheL7uUwJ6M6+rs=
X-Received: by 2002:a05:6602:22c5:: with SMTP id
	e5mr39021089ioe.302.1579495417643; 
	Sun, 19 Jan 2020 20:43:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:e345:0:0:0:0:0 with HTTP; Sun, 19 Jan 2020 20:43:37
	-0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Mon, 20 Jan 2020 15:43:37 +1100
Message-ID: <CAA=hcWQw7QndKo=kFcrKyk5w8p6yBnN2Cd6YW-GpBsfCR-C+fg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Network failed, no DHCP response updated from thud to zeus
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
X-List-Received-Date: Mon, 20 Jan 2020 04:43:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I updated thud to zeus on imx6 with WiFi network, the WiFi network is
no longer work, connman sent DHCP request, but no DHCP response
received, could anyone advise what could be missing?

I saw another email OP failed Ethernet network after updating from
thud to zeus, looks like something is going on.

Thank you.

Kind regards,

- jh

