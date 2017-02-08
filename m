Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 837936079E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:08:25 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v77so191893605wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ocy9st4fIWtY0ko9eHiNqE4+T/ip8jnazcY0wi6olcI=;
	b=jcvATYc8LD676ChjC0C95i32AhmODBjg3ZTVibpqm+Eu82lBQywk7J9hn3nhfce8FM
	fLggMo5s8IZYSXM8IMHsusHXtrzM+Rhvi0fv43iK6AeYgJxG8H4ij8dzAS87wfpwRtcP
	tCz0lFo+J5uWHMAncICNJ4elgcfcJJipGHHjyVkWSClRsUIOuMlN/ec17fYBq7VlU3CR
	po/ZB34GdSWdjTWT4N07xnAcV8ib03fg9+sLb1Eq83mRsor5d0agwPpqOqDqiNYbSLq9
	kW2ALhmFxcOcOg0+l3YaPRS1DOyiERtwMjUAuBNUp/cKA68zpsD+Zv17e0QSOMtytnfH
	vLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ocy9st4fIWtY0ko9eHiNqE4+T/ip8jnazcY0wi6olcI=;
	b=PDOknYzgvqsn5Zq2KNh1o+0ySN8R3Gok6Jaxanv6d/4zhubrqp6zoUNhT9OSvfjtv6
	S+1yg5gSEnDE5WU0LnMmoQJW2R2yldd+66gR/fxQiHDEY3UFKMjIuXnzfEU6itr1wNpj
	cRM6BvA8Ngkf8GGqWHPlbSbW4TZTKUzP9NzI1T0xrehg0NkHbvW6+27hsHjjFrbvChX1
	ANfJP6v4O9lPAb/akF5SAprGjpStupP1dfQQc3nGGnQr1fLwCYVW2VLi33CckOiPyQEg
	qWYN0bzWG12BlV2kPfVjkiuQXOOKmA17FcpCWvQ1eW3ul996WHZnRkxw/JPWHGVIxHg2
	TFBw==
X-Gm-Message-State: AMke39kjNn2nzyB5peZcJhLp5RiE8s0VxfTQcTD2HWAHTbDqtLTKUpIHf649WNzCjyWIoA==
X-Received: by 10.28.206.199 with SMTP id e190mr18441909wmg.98.1486562905296; 
	Wed, 08 Feb 2017 06:08:25 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	a72sm13143357wrc.48.2017.02.08.06.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:08:23 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:07:52 +0100
Message-Id: <20170208140755.12812-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: dconf: conditionally depend on gtk+3
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
X-List-Received-Date: Wed, 08 Feb 2017 14:08:25 -0000

dconf only uses gtk for dconf-editor. compiling editor conditionally allows to remove the hard dependency. so dconf can be used on systems without GUI.

while writing this patch I came across some minor bugs that are also fixed with this series.


