Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 52CE2787EE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:36 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id d4so8116707pll.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Eumqhs9dcdmWfoQQTbWSZ85COdEPnvh06V6+o+rUtAY=;
	b=aB48yAxLPmH3lzhb2uw7n1f58cNWlnQeWRJ6ixuIhwi7WPzDvrG+ixfi8f4SWYQa44
	NTVYBURgdsr91tse6TrtjLxY4jeL+nSpS0n4Tj5tdRwaisjktESRYjOY7/X1ktKCY2c+
	vblv0p7DMlDfJgpr+vMdkfdj3TCZbz6edaXmM3ahGB3EarY+IkZzlIEZxLJmWzd9/qbv
	x5PUVA7LrIXDUQMUTIiyh4xHTecLLb1nqtsWwD86qzKKtrHLup3eOCcz/mIWZXSpw2jr
	UeZEPffvYpXvJVxpXi03tvVQCyUkq/FD4S40l3qCcoYqHGI+9bZ/RJUC+z8Zjrd0Lg5u
	r70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Eumqhs9dcdmWfoQQTbWSZ85COdEPnvh06V6+o+rUtAY=;
	b=qqnkncjAQq4Jja5qKW7ZIS7zzWa1q/lKpXnsXpvfDts3BSLzuy2lT82ebm9+c22zZj
	lvLXYzjhM/N/1JXVYOzVfNoD+UVPX452zo2urIhi2n9HKK0OSqiRjIWR4UDlRWCyKPRb
	F2uOPJL5ySeD4v3AThDOqH97PG6PgIzAZMG9plT37DrpY2KnyDa3hBUak1bY/li7kjJd
	OZYJDvySC+5pZPVnU52SS/pJd4QFVxaNKHttlaxG+WuOfbqXzHQL1EvKAkYboTGkyn26
	d+uZuLr1N9hxNlyNYp/APvVcwFHr8CyX462UOwjLneVOahCknYZ5KI/Wr7ncUdazGZ03
	xh0Q==
X-Gm-Message-State: APf1xPC70oMiqPIbtHGg83tPW4nHRGjkborFR6BY9KGkS8cXjS23lpcw
	n/8vcMMF+BTQiBIFHl35f48ZIQ==
X-Google-Smtp-Source: AH8x225RZfwjHHVMPAu2nX6wlqKK0qwlx4wFLDg+LNtP2awLZ3jvByat0X+CK2++dTkskChc/vVYHg==
X-Received: by 2002:a17:902:6184:: with SMTP id
	u4-v6mr8352735plj.390.1519594417654; 
	Sun, 25 Feb 2018 13:33:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:00 -0800
Message-Id: <1519594406-24490-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 10/36] ipmiutil: move to recipes-kernel
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:36 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ipmiutil/ipmiutil/fix_systemd_path.patch                              | 0
 meta-oe/{recipes-support => recipes-kernel}/ipmiutil/ipmiutil_3.0.5.bb    | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-kernel}/ipmiutil/ipmiutil/fix_systemd_path.patch (100%)
 rename meta-oe/{recipes-support => recipes-kernel}/ipmiutil/ipmiutil_3.0.5.bb (100%)

diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
similarity index 100%
rename from meta-oe/recipes-support/ipmiutil/ipmiutil/fix_systemd_path.patch
rename to meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_3.0.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.0.5.bb
similarity index 100%
rename from meta-oe/recipes-support/ipmiutil/ipmiutil_3.0.5.bb
rename to meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.0.5.bb
-- 
2.7.4


