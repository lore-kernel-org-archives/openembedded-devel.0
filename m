Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 03CB86C4E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 09:38:51 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n32so9872774qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 01:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=nSGHVYZob2x2TRnyujlkZ2ia1n5an+sNNMMK3fsGH0E=;
	b=FZk/vQ6o83I/tqHZCt1rjA2euXSqfwVcIfoL+WoakDcOUAwEpD+yYrpyxQMMlXCFA0
	rL3wPn/DA/xt3tD8mxdc7ssD7puh6Xku1/O0HQZY7JPdGdv1BWQMv60uand+s8VmoYE4
	1+RlpQl2gK6Yif3OhYdaDh895q/7Sh0bG+Vzpa+RCwVMYE8q4EDq+C7n+EwabwjzC1+F
	DwDEnB/3eDivGSV92nVfdfBRF50e1il+QQf5AWVdB6BjdXS7c9MlBvwgNOuCvwMnqFdg
	/KMyYF24hkQ5tzJ/4CuPOP1CFU0UGOdC4k4x8Ull+EYkMRLQcF/I9fi+WQtxJAuI/lQ2
	X8Jg==
X-Gm-Message-State: AGRZ1gL9nLwiWb7LfS+waWagR337nageD+ey3iDaEUzoIXN5ser5WHd/
	Qt+d/kdu7C6Q6PQOEKe3wK4Ok0Xb
X-Google-Smtp-Source: AJdET5e0qhR6WK4LEM7onQW5nAPXi4uE7wQsWfBrxx25NvSoe9S3GKz3j3c2YTRGomGKOJkwR+o4GQ==
X-Received: by 2002:ac8:1185:: with SMTP id d5mr13608184qtj.117.1542965932570; 
	Fri, 23 Nov 2018 01:38:52 -0800 (PST)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	k132sm22288512qke.36.2018.11.23.01.38.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 01:38:51 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 23 Nov 2018 07:38:46 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Nov 2018 07:38:45 -0200
Message-Id: <20181123093845.22336-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] postgresql: Allow successful run of postgresql-setup
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
X-List-Received-Date: Fri, 23 Nov 2018 09:38:52 -0000
Content-Transfer-Encoding: 8bit

The postgresql-setup utility log-in on postgres user to create the
database, however, the shell set to the user is bash and it wasn't
being installed as runtime dependency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 3bf71f02e..5fc823898 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -231,6 +231,7 @@ FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
        if 'pam' == d.getVar('enable_pam') \
        else ''} \
 "
+RDEPENDS_${PN} += "bash"
 
 FILES_${PN}-client = "${bindir}/clusterdb \
     ${bindir}/createdb \
-- 
2.19.1


