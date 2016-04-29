Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 81E5277100
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 20:05:57 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id f74so47384501qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kr5iKemOkEbARSgbcCZBHL7Q0HymGi+1qqe+4c6cPPw=;
	b=AoZhG9E24jTG1TPCvw0XDj8qdOAj0vjKyvQ5WmUdTXTOSnj+4SoLJyszUzG3YsTMkH
	SAMzFHn4d5H3Cs0A4oajDp5cbOSbxnyREplQyf87p8o8J1uFAgVFOjW0gilWyEsjfIoI
	SQDr8o3kxzY3lZOVQwOlKmLE1dT/N/zXSg5PCGxGWQQ8DPkLAhhamTEITApGC7PYOd7f
	Be3t8qBeYV/rXk3fVrF0PUdujebjryg4iLEz9zMT1B9W9nbDOZi9Zzj6fCqUkQWxmzg2
	1PIXA3BRdjpltoOIMg3dYNRbEvRMvxcq7q3j6xxUYQHv0jg1e9CaVl9smeVzq/r6z5Wg
	kBNw==
X-Gm-Message-State: AOPr4FVBSpZzd3AM/87WH6ZQjbLJhH4uFwx4TK/jvbqLvLYJKaMxYjc/a3cDft9t3gAF8w==
X-Received: by 10.140.98.147 with SMTP id o19mr20761129qge.8.1461960357994;
	Fri, 29 Apr 2016 13:05:57 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 77sm4935895qgn.29.2016.04.29.13.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 13:05:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 16:05:42 -0400
Message-Id: <1461960343-28462-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH 1/2] netdata: fix whitespace in the patch that caused failures when applying
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
X-List-Received-Date: Fri, 29 Apr 2016 20:05:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../netdata/netdata/0001-Correct-Timeout-issue.patch              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
index f5342c3..d5529a2 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
@@ -7,12 +7,12 @@ index 40c0356..bca57b3 100755
  # can emulate the timeout command we need:
  # > timeout SECONDS command ...
 -if [ $check_for_timeout -eq 1 ]
--      then
--      require_cmd timeout || exit 1
+-	then
+-	require_cmd timeout || exit 1
 -fi
 +#if [ $check_for_timeout -eq 1 ]
-+#     then
-+#     require_cmd timeout || exit 1
++#	then
++#	require_cmd timeout || exit 1
 +#fi
 
  # -----------------------------------------------------------------------------
-- 
1.9.1


