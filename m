Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3EE0771F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:06:38 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c52so1172071qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 19:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nnbx1QruNbeiEcshjULE0mSTWFc+CL8i8k4bVLzNnOk=;
	b=SfzBHd1YxnYZkgLNWmZQ3xBvkysuwEaVeF4/4tpu3ZkIdrvVNYHizu9YWYRBmLjS6c
	Ls6xmssw3eqlTsYPqrBt0iRjSWSii7I8rVtvEr1Q5RMLFDnyiJ/hIAwVbBP8JxW/tsnd
	Y47g/fq/OgusNku/NIUO+L6LpkVov5JSFD9ivEa13uRkBiKhTq0tOOWuvXHnY/RV/7jL
	+nhi6/tACLII8DGrLmu5W2DPUzamGeyM9FLwHFdqdmLIknSiI/xboj6g/7KL00KCM5AK
	IHvqapUBaTviAyG79vg0tzb2UdqiolUTdRS6UrEWQgVRdwthNkzSMl00PKx0gaC//n1U
	6rfA==
X-Gm-Message-State: AEkoouvjv2mUzqamLjePs1mpu7cpULa9fdjSxy4wdTbLgkDvhaQZPdBPram60kno13rN4w==
X-Received: by 10.237.46.6 with SMTP id j6mr1620579qtd.113.1470794799115;
	Tue, 09 Aug 2016 19:06:39 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id p70sm9771107qke.1.2016.08.09.19.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 19:06:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 22:06:32 -0400
Message-Id: <1470794793-3976-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH 1/2] nginx: add the LDFLAGS to the link arguments
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
X-List-Received-Date: Wed, 10 Aug 2016 02:06:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index ebf926a..167dc5a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -41,6 +41,9 @@ do_configure () {
 	echo $CFLAGS
 	echo $LDFLAGS
 
+	# Add the LDFLAGS to the main nginx link to avoid issues with missing GNU_HASH
+	echo "MAIN_LINK=\"\${MAIN_LINK} ${LDFLAGS}\"" >> auto/cc/conf
+
 	./configure \
 	--crossbuild=Linux:${TUNE_ARCH} \
 	--with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
-- 
1.9.1


