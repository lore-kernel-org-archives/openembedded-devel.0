Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQcKm-00030J-Rq
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 13:40:02 +0200
Received: by mail-da0-f41.google.com with SMTP id w4so1111728dam.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RHOD0hMimlvKVT6X2WqsPSoVwOE2SU/yfoqu+9UTZRE=;
	b=FMz0rEpJFrl9pHDRL2JZZ8cNtbCglf+rW2keCrahRL0wdJ+9d4Y/happwDJchW+s3S
	LqpKJ+oT9Ca7bYSj2dqwH8q4UDnt+mB/kYSUSQFYYge5KtfGlsLYeoakWenswnpExjDd
	xnZrZOeo3uWIYF0zS8KN0Zx89JIbijRG/cO3p0juinSW9WJDLhP+fkAG+Y6r4kjjmsrF
	DhbU0crTixfOcZnyUoeYdUBgZVIGuj6QcZ5qfQGIkFFu0JndTM7riWdTEAJEHacPTnUF
	FWqVTTIscgT4+w5F22/+PM/V18/i/bKS3gJnUNlxNcjK/K8ymjLtI94ajCbLpqxHpQQI
	QYpA==
X-Received: by 10.68.218.34 with SMTP id pd2mr3543449pbc.204.1365765755775;
	Fri, 12 Apr 2013 04:22:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pb14sm8200013pbb.27.2013.04.12.04.22.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:22:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 13:20:31 +0200
Message-Id: <1365765631-23070-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365765631-23070-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365765631-23070-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/2] meta-systemd: move cronie to oe-core subdirectory
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
X-List-Received-Date: Fri, 12 Apr 2013 11:40:04 -0000

---
 .../{meta-oe => oe-core}/recipes-extended/cronie/cronie/crond.service     | 0
 .../{meta-oe => oe-core}/recipes-extended/cronie/cronie_1.4.9.bbappend    | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/cronie/cronie/crond.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/cronie/cronie_1.4.9.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/cronie/cronie/crond.service b/meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/cronie/cronie/crond.service
rename to meta-systemd/oe-core/recipes-extended/cronie/cronie/crond.service
diff --git a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend
rename to meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
-- 
1.8.1.5



