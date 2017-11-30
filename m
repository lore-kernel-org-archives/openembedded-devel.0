Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 609DD7851A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:13 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id v41so3595911plg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BM+3qYTor+xgbqjM9OJeQIL6BTmwjidIr2s8ZJmQ2zE=;
	b=RY2ee2K74zW981gHJJZEVwpK5y7m0AwlNfv7FDX3+BopZsrpm5cr7JE8X55FR0SitT
	a7UFbUgFJIU//WLeY7p779iYDawF7/TX0SwhoBRaoC53cMMwlwcoPd3haGWQBU0FVz+T
	lFgPmRrEvD9ss6jEsIs4vcvpIs8cxX9TliKJVE9L5uGixOJAyHhHp4jwOw7GvdxkHFZz
	0Q7sz+gWDHmXW/8kka1fwvEtBdJBcMIaSamWlF1T/W5zsGWqrDKektZO1O5dFf66NYl8
	1NdeefK8odM9UCDKfaGynAMs+rRM+Y7aahKF7vfzxT3Is/0i3cvsffXHXlpUvPj+YfWm
	vXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BM+3qYTor+xgbqjM9OJeQIL6BTmwjidIr2s8ZJmQ2zE=;
	b=HZ/69Qa0YjeRVpYaCHl13SkhPJHV6PG/8eK8vblrUkuoampkiWWe8hmjMvcQfNYjWP
	v0aRJDe0c5bx4Mgjs0W3bUN+u3X4DwRA3LxbNYycwQ/pu5enMSAXsTPEnZT7aavFCalb
	f+pz9YegpVjzeolIvyFFHNp/CDEFwvIK1buFHMRBCKdwh8bKzY2/rf0kmCxdQ6+vAdXG
	Kv7tzvlrqr16WauD46IjWsaXaKZrEBqN4qJkl0HM0AP+PxGCbNQasn2w2gpnNpSiMBp1
	IqVfmsSOlC+8JxdyWcpx7oePFFyumQBXwNRyN4ZzBc3wxoNEsCbV8j5k3YA7RQSiOzwv
	egpg==
X-Gm-Message-State: AJaThX5Z101+yn+B/7m7TVYRDOk44D/3lvCD+lqW8yHI5zvmIuN8KLDm
	G3XtLqbgUh3GwVtbYDNulgFODg==
X-Google-Smtp-Source: AGs4zMYAnl3Q3TbnAvDX3Kh34RaD49v4KDSJ0OaEGkPaXwupaAf3bCVHDbaBui+rMEBAVFMQiBYMdg==
X-Received: by 10.159.218.144 with SMTP id w16mr1418595plp.443.1512020894571; 
	Wed, 29 Nov 2017 21:48:14 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:14 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:07 -0800
Message-Id: <1512020828-4040-9-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 08/12] python3-flask-wtf: new recipe
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:13 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
new file mode 100644
index 0000000..52362a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-wtf.inc
-- 
2.7.4


