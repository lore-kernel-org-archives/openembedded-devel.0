Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id E9AEA73257
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:09 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id 90so56342800qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=tP3JoxwKLK9vfJzcBAe8JoNDKzEi8YdRZYPb00bQVhc=;
	b=YodLWj1huYf8SMF4oLHGdM8M5NlPgOpsAOHQiE97VkUyKF4XWu+IrQSHMelI9chmZT
	ngixro0mfV92lP1CQP8cQYAvUzZ0TQGxOkPxF/M9xokuXvdEggsYweT2Hot3ccqnxvpO
	XeMEd8ZOA8jvk0pQFj6GHMjjYJlF0wIB8HpXCD79wvyaKq+zR9R1ra26LLyLZMs5/mO/
	jG1U0VL/jqNCRupwErMkgqYRqV7OBNFaPun8NzyGZzkPFTM0YRZ5NOi445vSm552Qg5W
	K7tP0VCtYIYRfYBdXkDrc6KSaBKLv2Jqae7JjKQBVNjQVD9gauqeHB/aeLcPb93cIB+v
	j1Sg==
X-Gm-Message-State: AOPr4FXybbhOpfVMtXzzQwPfAEip95P9oLzVi0uMGwyumpt8nluvZ8Hfu+JVsD0cRSeBlg==
X-Received: by 10.140.19.131 with SMTP id 3mr18820691qgh.83.1462543330600;
	Fri, 06 May 2016 07:02:10 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	d140sm5833244qke.10.2016.05.06.07.02.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:09 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:04 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:49 -0300
Message-Id: <1462543259-7206-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 12/22] syslog-ng.inc: fix prerm script & class includes
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
X-List-Received-Date: Fri, 06 May 2016 14:02:13 -0000

From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>

The order of class includes is very important because it's the order in
which classes are evaluated. Both update-rc.d and update-alternatives
write to the prerm script, so the class order decides the script code
ordering. As they are now, prerm is:

 #!/bin/sh
        update-alternatives --remove  syslog-init /etc/init.d/syslog.syslog-ng
if [ -z "$D" ]; then
        /etc/init.d/syslog stop
fi

This causes errors because when syslog-ng is the only alternative it is
removed and then the script tries to stop it (No such file or directory)
but even if there are other alternatives, the script tries to stop
something other than syslog-ng which was removed.

By reversing the include order, prerm gets generated correctly and it
tries to stop syslog-ng before removing it:

if [ -z "$D" ]; then
        /etc/init.d/syslog stop
fi
update-alternatives --remove  syslog-init /etc/init.d/syslog.syslog-ng

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 382dc5e..4e0f697 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source
            file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
 "
 
-inherit autotools systemd pkgconfig update-rc.d update-alternatives
+inherit autotools systemd pkgconfig update-alternatives update-rc.d
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
-- 
2.8.2


