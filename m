Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T3dxg-0004mi-OJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 04:12:56 +0200
Received: by pbcwy7 with SMTP id wy7so8799196pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 19:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=WqWY22RZUb79RrH6IBwPW9ZBhif4wiuEDxMvYqhUxrk=;
	b=Gb2d7Zs10bqsXs6ErYfL3xK35SEyCFENmfzh/jBd5FB8859QCUkTEx3FghHTdEjx8b
	7sFspdZKYKEHxDEDZ41QQTlKwweVTZBdyQOMXY60mAmI/UfO4KikQlGKCSbdD8J6S6Ot
	pDGhi/HCLqrPkjYAi7P1l8nckFWcafmtwYogLUI3T+FBDel4vPyMWaF69KuVhRBjKPa7
	OQnouMhUm2ucGq2MMZzMEgnqNQttski9nJgUYdgYn1ALr9f4HwW8IZ5+ha4sw7TWw7Go
	xtsV5gz7aYXoJtQ8rBxpERcXnlV/KCguGrxW98bAs9d6DqtO+lQv0o8b63zFwPdjDrGf
	Viyg==
Received: by 10.68.194.169 with SMTP id hx9mr39754893pbc.8.1345514453020;
	Mon, 20 Aug 2012 19:00:53 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id gh9sm329808pbc.20.2012.08.20.19.00.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 19:00:51 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2012 11:54:25 +1000
Message-Id: <1345514067-16394-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
Subject: qwt: V2, fix linking with ld-gold and tabs to spaces
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 02:12:57 -0000

Hi,

This is V2 of patch to fix linking error when the linker is ld-gold. 
Patch 1 fixes the linker error, V2 addresses whitespace issue in SRC_URI and 
adds upstream status to patch file.

Patch 2 is new to the series and converts tabs to spaces.

Cheers,
Marc




