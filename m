Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0272876FFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 02:48:54 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id o63so9537738ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 19:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DJZdTjIp15k9wSJFLKrS3QkKljJ+pAs7EEFiWGgNJ0c=;
	b=Tb8PJQcD0VpNKj2qv5zghxI0cUsxG04Iv5oVeEDtioBONuaaRlRRu3FkHNvG39TFQk
	CmYqOy3aze4T4c5qKBBnV+SWNogYhDIpFmbyqcMbQgnXsQ2n6O9044Uf+6uO5zabdiYw
	u0LbhQ11tkoaxadzYleFSdUlHKI1gJirEPAva/QFOIWf8rnoAt6ksNwurWrl4b1TKbir
	YNMaaHxRDdvht6KuFbryBFieQ5CoyjhgjU9bhe48zu1KS4RkhvnB1VnLSfX17vEXKUA4
	u/E16VNYrGW6DwCNp892VYnRprb2brYL1aMQnNjl7FhB6zWY8+SpJOEFdWu8FTfqMrYr
	J8cg==
X-Gm-Message-State: AD7BkJIq+53ScMjnpzrBgVuZez/Q5vYutg7oPeUF3Robn9YzZfxl2LdSjiP8KTHafnmnMA==
X-Received: by 10.37.231.16 with SMTP id e16mr302525ybh.142.1459997335292;
	Wed, 06 Apr 2016 19:48:55 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:18 -0400
Message-Id: <1459997302-25271-7-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 07/11] libdbi-perl: update to 1.634
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
X-List-Received-Date: Thu, 07 Apr 2016 02:48:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libdb/{libdbi-perl_1.628.bb => libdbi-perl_1.634.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbi-perl_1.628.bb => libdbi-perl_1.634.bb} (82%)

diff --git a/meta-perl/recipes-perl/libdb/libdbi-perl_1.628.bb b/meta-perl/recipes-perl/libdb/libdbi-perl_1.634.bb
similarity index 82%
rename from meta-perl/recipes-perl/libdb/libdbi-perl_1.628.bb
rename to meta-perl/recipes-perl/libdb/libdbi-perl_1.634.bb
index 38bdf61..0238781 100644
--- a/meta-perl/recipes-perl/libdb/libdbi-perl_1.628.bb
+++ b/meta-perl/recipes-perl/libdb/libdbi-perl_1.634.bb
@@ -13,11 +13,11 @@ RDEPENDS_${PN} = " perl-module-carp \
                    perl-module-dynaloader \
 "
 
-LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=7d9e154a9ca3c093d2422f7c692d5861"
+LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=d4e73f2616b2b41334cf2f7d25d827a2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
-SRC_URI[md5sum] = "4273f8cc6ee3979ce448c7eb3f8a6a5a"
-SRC_URI[sha256sum] = "46c834f4ba1b28c8d8a2db8095835a67fc69a9585761523aea3a74437a969b52"
+SRC_URI[md5sum] = "4ad15a9c2cc9b68e3fe1f5cadf9cdb30"
+SRC_URI[sha256sum] = "250712f385864818abfba409420d16d9ee61f1cc73ac85159d054a5ee86d1450"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
1.9.1


