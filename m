Return-Path: <joe@deserted.net>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB6060053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:59:55 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id o126so207278958iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=x2N7z7lPyqfhKwuKL1xbvO/NBcgNHRY5Smzq9oADcUw=;
	b=jIfc0Sj+UzXMIl9nvGBZo2dUabT0YqM9SLqgXxbMoxSkApeuKLLsJa/ICmoErGIjOp
	bBX4DpH4di9Og32vHNwqwM62n5baI9ygNRw6WWOSQVeb94OL8W+J354Om6bWzcLx4ihW
	OhO0q3KuAI9fu2n1JaE72wU1sfD1E3AKdXsfap1IzXC9IDK4fxLY9tY4J0nAEO7+jIds
	ZUo9Ko+YbWmdrgVDR65LcK9Im2wS5qW23yggmS1jmJHfZurmb0TtZfLrHCfUe4we+oMt
	06KIZrcBIpbS6gku2DxXKyF4/NbhLibJT4XB+pq8XgU+dZ0C3UTTrcGRhySlfiqqU3mm
	xZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=x2N7z7lPyqfhKwuKL1xbvO/NBcgNHRY5Smzq9oADcUw=;
	b=hJGeZ+Hr8eOLWDUAxesDXiIi6bT+frNM7sVlwQTyhH1Jt6wQMRDLQnDExfxi6En0XX
	B35WHDvoLxscXUOXxiZUAoAyDfKY6qZ/oyF/GLmy6jpzCitZZ+tHyMbLj3LTkTuigQgx
	pESAqgKmKg96Q/qM27Ms/lKiyg8LPPpG2Ml5Mtb9wPhw85E4DrEpTbQetLeIYmv0eX2o
	RVmdM0CH6LW5OKEeKjj1+gJ+QEoQbJe7UT71rIkywG0C3/VQV/iwTM/MiakwUa8Ph8CZ
	ZuLfT0qjF5ub2dxFLqKt/UCNCGlE6oI92SJgt6/vOrliTg6mGRc/uqtRK9dtZMFQSZD5
	m//A==
X-Gm-Message-State: AOPr4FXN+T6ff7MZB/HNO/jdg6mlSEa8flc/1SvnNwo5Xg96oQyYyUkotWGfc0qTVk/wOg==
X-Received: by 10.107.3.34 with SMTP id 34mr40046018iod.17.1461013195522;
	Mon, 18 Apr 2016 13:59:55 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	207sm22442437iou.33.2016.04.18.13.59.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 13:59:54 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 17:00:48 -0400
Message-Id: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: Update Samba
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
X-List-Received-Date: Mon, 18 Apr 2016 20:59:58 -0000

I'm still doing some testing on this and I haven't built for all the
architectures yet, but it passed at least the most basic smoke-test.  Given the
number of outstanding CVEs against our current version of Samba (thanks Armin!
:-)) I think it's best fo rus to update this rather than trying to do any
back-ports, but that also introduces a not-inconsiderable level of risk for
Samba users.  So please, if you're one of them, kick the tires on this as soon
as you can (or ping me back letting me know what your thoughts are on this, at
least).

Thanks all.

-- 
-Joe MacDonald.
:wq


