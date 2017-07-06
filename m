Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2380E6010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 16:58:41 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id k67so10874001wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jul 2017 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=EEiHl+rfeOBCOWJuPODCwXniNaNyOdjLMEwkfpSSjAo=;
	b=dcRaE6WZe1x7gAm5fCkuN3U9cARlyN+vqUQRR+nngCvWTlZ1/TVkA7B8GZU06Ze9IW
	3gHROq89zzu4TFqkSe55DBon/hNukSKrYrBnkc2jvg/pz82maSrSHqomO1YTwbclU6a/
	NqB64AHPcYT/HlyAll1Zu3k8D5IQMQXFesehqLJfQWfYrHME6qb10V5ieE1LuP/9bIHe
	QjnidLlPPGk8rAGJAnqHU5TESMUtIYa5KZfOQAaeqFcAComdgQn0tQhzz0koN11WkPYC
	FdeSethoLEm2ox5iu0tG+vDseSlczbSAn6QS+DRa9SM0NNTPA2pkQsGJs85LxY4QiSa4
	ZztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=EEiHl+rfeOBCOWJuPODCwXniNaNyOdjLMEwkfpSSjAo=;
	b=DYG6UcnpHsqynW3YHI6JrApjIf2D+XhkF1Ip1fJTHdt09MwNxYMEDQprKfXV5Pz5n0
	yA12gtCnAfeFbgBy/zmpdHdqjW+Vzv8lHhNDrh9qBpvfWhH1GQBR0M+IDreNKqox8LHY
	xC02w1I519zxnlUq9+Gg0sT8FfttQUid9cXT4sDTShjTwd78gBS7vdwiwhWhRuMmlGuQ
	sEDI0KdihnJ9RjAbE+5s+7DQQDPVqnMtUUUFDhC7WEv9CI2BuCXVZLM2tWiXNrR6JNgN
	hLw4HcvJNHxAP7W+DjNV4IwJJI8Xexi1OCKcIjiQ34aygrIUzcWbis7kpVOcxh3CDZ1J
	cVcQ==
X-Gm-Message-State: AKS2vOyK7bDBE3LJ4k0Hbet/kWsmnwjXGpagGy8YWDK7fJ45zs5AVzvo
	wavPJiZst/Js4IM29Z8=
X-Received: by 10.223.142.66 with SMTP id n60mr44025264wrb.188.1499360322554; 
	Thu, 06 Jul 2017 09:58:42 -0700 (PDT)
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com.
	[209.85.128.178])
	by smtp.gmail.com with ESMTPSA id s30sm860817wrc.13.2017.07.06.09.58.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 09:58:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f178.google.com with SMTP id r103so11003894wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jul 2017 09:58:41 -0700 (PDT)
X-Received: by 10.223.129.6 with SMTP id 6mr30316329wrm.23.1499360321218; Thu,
	06 Jul 2017 09:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Thu, 6 Jul 2017 09:58:40 -0700 (PDT)
In-Reply-To: <20170706114443.3432-1-sledz@dresearch-fe.de>
References: <04322183-852a-d327-3706-845980657ac4@dresearch-fe.de>
	<20170706114443.3432-1-sledz@dresearch-fe.de>
Date: Thu, 6 Jul 2017 13:58:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr_MRqnZUsM9_GBC_LMbMxH5B51JPm=dYAC1NepiCwxAA@mail.gmail.com>
Message-ID: <CAP9ODKr_MRqnZUsM9_GBC_LMbMxH5B51JPm=dYAC1NepiCwxAA@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][pyro][PATCH] qtquickcontrols2: fix compilation of examples/texteditor
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
X-List-Received-Date: Thu, 06 Jul 2017 16:58:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 8:44 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> git/examples/quickcontrols2/texteditor/documenthandler.cpp:284:18: error: invalid use of incomplete type 'class QDebug'
>           qWarning() << "load() called before DocumentHandler has QQmlEngine";
>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

