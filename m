Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D260A71A8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 15:24:39 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so20572431pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=SJPsdJFjFJs4n1qscyzWSrSDlsH8uH6nWBu7HzmOzxo=;
	b=lPkZKk6Zc+jqYTD4nJMm+8G6xnttfatfCAKYdeFGoaEjoH6m7tKcGVpCdtciiWfCTn
	rE5q7pq57mHDWhlW1U9moWNFykHo+0G6k+cgMqe1W1VKxTzPM/bd/FaRSzknPwM4HBF1
	GIUobS/RmdBXYwrFC5XCvzg5CTBboPPfmbVssPLiea0zp1wekhyTYKAuQBCfd0KXwPQv
	5xHozdljMe4An9IY3HvnHDu6WJE1791von4HDWpxKyu+GhmUUjsX1Dh3uUNZxw4qGQht
	dikz22fV5kXIa2nlor0bV1hK6gOVRzJwyuikKj6HKLhRmMUiTuAzZgW/TZxsdRIggr3j
	/VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SJPsdJFjFJs4n1qscyzWSrSDlsH8uH6nWBu7HzmOzxo=;
	b=B4IM4HBrSIivpE1B+u6B1ajazMr+1ocDgBZKCgXRY+qH/Jby7YLD7BS3IZfcDiUiIW
	Z69hv3BiOOhk2dRaitdiv5iZ1HXsGp2AsmD6hv6Y0d+PzGc0NvbrQAi8CK5dSkQB7Y9H
	Dx5nr7sBbtzCAY4zaJbNhEce1JVaJQMcVej9xiipN+ESfdBPJ4dGY8KGwAmZV7Y80zq8
	4LRrPl4jt7p0sqRNwtGScgoWQm/WMWBbkJH4GHKNhRUj3SqZ/z7tJ3QLx1jMG3RtpiEV
	r+CcxrR1asqNRIFuRteR5vmXOeIfMlB0AseE6vlAVLpXTEyoRk17EsQGcLlnR770ojjH
	HMKw==
X-Gm-Message-State: AKaTC01wNJhVurUSXPXlQfYB7/t5QIdwDOG7EdYulqsVvin+I05ossEQiA9J5BTMiPcRag==
X-Received: by 10.98.9.149 with SMTP id 21mr254032pfj.159.1479482680865;
	Fri, 18 Nov 2016 07:24:40 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:e516:3069:2e5f:dd9])
	by smtp.gmail.com with ESMTPSA id
	n25sm18890120pfi.33.2016.11.18.07.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Nov 2016 07:24:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 07:24:34 -0800
Message-Id: <cover.1479482464.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/3] meta-oe pull request krogoth-next
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
X-List-Received-Date: Fri, 18 Nov 2016 15:24:43 -0000

Please consider these changes for krogoth
The following changes since commit 851a064b53dca3b14dd33eaaaca9573b1a36bf0e:

  pypi.bbclass: Allow fetching without requiring the hash (2016-10-05 18:38:31 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/krogoth-next
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/krogoth-next

Andre McCurdy (1):
  syslog-ng: remove unused patches

Davis, Michael (1):
  pcsc-lite: Seperate GPLV3 portions from BSD

Ian Ray (1):
  syslog-ng: expand service file @variables@ earlier

 .../recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb  |  24 +-
 .../files/afsql-afsql_dd_insert_db-refactor.patch  | 494 ---------------------
 ...init-the-new-config-when-reverting-to-the.patch |  36 --
 .../files/free-global-LogTemplateOptions.patch     |  30 --
 .../logwriter-dont-allocate-a-new-buffer.patch     |  26 --
 .../rewrite-expr-grammar.ym-Free-up-token.patch    |  17 -
 .../files/still-free-the-unconsumed-item.patch     |  90 ----
 .../syslog-ng-verify-the-list-before-del.patch     |  38 --
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   9 +-
 9 files changed, 26 insertions(+), 738 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch

-- 
2.3.5


