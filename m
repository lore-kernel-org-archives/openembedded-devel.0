Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com
	[209.85.161.48])
	by mail.openembedded.org (Postfix) with ESMTP id A124378F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:09:22 +0000 (UTC)
Received: by mail-yw1-f48.google.com with SMTP id v197-v6so13786356ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Te26Rf3ZGxT9oWGC0kBecRXBW8oAZVixbF9dGm9f81U=;
	b=pkPjKK8szmzqmyp/WP+fBxsm/o4paFORyGu2Eis+bF8DBtujYTQ19dfeJLzOHNNhkp
	dJsPThvGFJuaaR6BhIli54XftPCknemnRkrPtXfZfhIg3YoNESwZPxzB/ZPyozmg7AIb
	czFf8leVDeioFUkSihPi52fTQLQORjI9Zpt9RJPT38GtKNa5hdDVWg9t6n5DKUWyNsmD
	ATYZ/AsKJNjLtg2r30Rtuu4J0ZErNUb5ZhlXtkfIaroQAspmqltsSmGj7hZ9EeK4R5Wc
	fYGp6RqYnea9wHBhF5m4Eho3VpFd2WfxjXVHOYd5dgX/k41L9LX6fWfSRwueb4Lz3oIR
	HZ+g==
X-Gm-Message-State: AOUpUlGmv695+e1kLWFBGR+WZThzpIJ0iUe00AIW6Oxm0evZILeAAnEX
	Gp5+T0+FLMuSCrElOXDI/1iOI1t5
X-Google-Smtp-Source: AA+uWPx+4ZWTPHMvuOXjmxv8cpDfEH3lJ1vzcGfOpRc9bqPWgEhh7/yXjsuKi6zfSEwgyg5Qz8851Q==
X-Received: by 2002:a25:7a02:: with SMTP id
	v2-v6mr2695170ybc.277.1534172963238; 
	Mon, 13 Aug 2018 08:09:23 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x19-v6sm8064106ywg.72.2018.08.13.08.09.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 08:09:22 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 16:09:16 +0100
Message-Id: <20180813150918.26582-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java] prepare for openjdk-8 build infra re-use
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
X-List-Received-Date: Mon, 13 Aug 2018 15:09:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Icedtea 7 and OpenJDK 7 will need to apply new compiler flags for certain
compiler version without breaking support for older (host) compilers.

Move to a common class so that the same code can be re-used.

This series sits on top of my earlier patchset from today.



