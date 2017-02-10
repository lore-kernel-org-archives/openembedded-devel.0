Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFD177317
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:07:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so6382612wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 01:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NXdziPkrcvU1UWiOIbtDzprLyfV+FdXfSHpV1xOnGLY=;
	b=DqHoh/rJ42bFDoRWdwiD6jgGgawJK3q6reL4o1x5yXHwoY5txoi0fHzGqx+KjfSTC5
	O+/wnQVs3jKP7RagHPve6VO1oc5ea/2S2elqfLOtn5ip2LzWZzD2sBqqfBOFG6uKTA13
	CQ0Zs9CPi6lcJTHMN5Xf/HgrKOmHlfuwIitoVBMVp0LbavpBTFyQwNvOW7kvn4ddedHh
	c85vrBVUdNiqaazz8WOCYX8jp2Bp8GqL/Ee1vsv+3NvCwpazIPVVwCSW9heE97sBq+sA
	k7OvGV6N+TDQmpkz8PKKxFUcL3DXLx4cJZTOxwEro8FyRrlZFTGR0HQ8qf9gY1GUYi2p
	/TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NXdziPkrcvU1UWiOIbtDzprLyfV+FdXfSHpV1xOnGLY=;
	b=RIM9cK0Vf8zYZIDXBA037DQAIIbcMym9sMpSznQgWedB6l/xFdGlXvfDZ7Aq2ZN/L9
	ctIiS0gZKoHb61MkSXqwj8cfRiIEhmcDRqS8joSof07dtaR9NzmHsu2pgyer5N1w0MaN
	m9bWrdhjNWdfzt/sSxdtrmSRFdGZrlKiASu3zYb7wxdgbJNLfeWPuZ9zYMyA+TY7prmp
	YpV+nyth9ADBffvR3LgoDF3bVa+XAmFzUAA9i2wA8hSibybaX4tJAlM4LXGMsj/oj9NV
	/R7GVNTESp49Xb0rwUy3JO9ZpU9gjc7bAR8S2pvGDAQTzSGUX/KZdLzJuSxVMoCHWuKU
	0OdQ==
X-Gm-Message-State: AMke39kysoDFDJHpiy1iV0OEnsDpNwBlZiIsB8ksxxrzw2fTI4LF0ISDxwOJNDZ0mPGWig==
X-Received: by 10.28.34.194 with SMTP id i185mr25192945wmi.118.1486717656538; 
	Fri, 10 Feb 2017 01:07:36 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id v128sm565618wmv.2.2017.02.10.01.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 01:07:35 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 10:07:19 +0100
Message-Id: <20170210090722.11753-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CALbNGRQAEX5aBsvsb3rY3CQ1C0V-WFzsJKxnNnLos8LdJJxA9g@mail.gmail.com>
References: <CALbNGRQAEX5aBsvsb3rY3CQ1C0V-WFzsJKxnNnLos8LdJJxA9g@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH v02 3/3] dconf: make gtk+3 dependency optional
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
X-List-Received-Date: Fri, 10 Feb 2017 09:07:38 -0000

many thanks for your review.
no idea how I only recognized rdepends in base class.

v03
remove duplicated depends to gtk+3
rebase from master to master-next

v02
fix typo

[oe] [meta-gnome][PATCH v03 1/3] dconf: depends on dbus
[oe] [meta-gnome][PATCH v03 2/3] dconf: fix bash completion in wrong
[oe] [meta-gnome][PATCH v03 3/3] dconf: make gtk+3 dependency

