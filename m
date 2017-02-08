Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 86CC86022F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:31:53 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t18so50739429wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Tsp5VdvnyW8YKGz6fiuovgXp00ZV2K9X8n0dHA7GVeQ=;
	b=camKVKYz75HX8NVAYdWimU3p5zPgDIdOj4MUoSopDP0Q8BL0cHJEE/xWnwk9Y3Um4B
	PNnSA4sxkiOFq0DrroYCG4tYH6jXM3azvQHmKUB3h4zRqVVQENo7KzvEvKgsTSLOMN+u
	zAfq1uWU0H+4HGJBBeCQoDmHvCCWOTtmkpcN2ZV3CQu2/BbRQ8DYrLb+/gE2g+hBHphB
	031da5c5vC+ds/W/LVUQqXsaXb64PBygp6QFEXbd/hLPbUMSwFMVbgsRw0Peg4i/HRFR
	R/qx6UVhG4lWQ22+7don5WczyY8BMd84/0hLOWHuFs/wYSr0hn1nvZibS6BWHQugV6cm
	Q08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Tsp5VdvnyW8YKGz6fiuovgXp00ZV2K9X8n0dHA7GVeQ=;
	b=rfteLbxbfiilh4roMotvxevLlaFxcjgu8w3tntRdHeHjre3hXWMtowTxXwO+pF6zi3
	ARral3c2RNHgU91ssZe56GLclUR9JODo+5KxayVmuVubNICycxYGcpnqeKqdqkm4oysD
	DXdi8vDfUymlgolxBeg8oXs68LIZhMWw2AT460E9s2s2aqT9qhxvw8gGc0fMyhGqX2S1
	ebpPfyk2V1WziHO/k2yLeGBp+0U+U/Wno6kt+lqwVKLRzqbc2+CqmhsAh5QtVXkqoGl6
	1HjgaEY9ZaUL3BjHRnriJPMZukitGa4n/k/EVgpMkJJjWO9OhD8tnd/iPMa6pWBzx09j
	0PGw==
X-Gm-Message-State: AMke39mKr1pca5qQNC8lXRWfcjbDX2v2GSrrtItsrixq9g25ZQEKHFd2Fck+HeIEpBLUiA==
X-Received: by 10.28.148.76 with SMTP id w73mr18523624wmd.43.1486564313541;
	Wed, 08 Feb 2017 06:31:53 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id 36sm13283196wrz.8.2017.02.08.06.31.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:31:52 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:31:37 +0100
Message-Id: <20170208143140.22903-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208140755.12812-1-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2017 14:31:56 -0000

v02 fix typo introduced during rebase
sorry for the noise :/


