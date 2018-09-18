Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 171F27548B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:43:05 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id n3-v6so650850qkn.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7jFzdnitixExbMN7J9nRr3c+YVT9JZhuCKzBDceg+7E=;
	b=hM/vzPT5mSsj3oo8v+vCr7baL2KML2cChsLSPwb+TogMwQL5M0g+K0vg1F+Ly0mydZ
	KJ5z+M6t+Ik3rRr6Vo3rYYMVA1AnMC8aSdIrckNCJMEMi+3VfnMi2ZHvj3YltcjIgJtc
	cZLCMpbBl3ipwCaumUIP0Wv6M3yWmx9bWSWJxCDe+BKz326GvGJ80yNAqDAL+0U36HTj
	7uF9G2rqbuRD5HfIUS6M/Hg/BEK//fb7fgmd3pNlwiVANrYScNkubB+vjevhWozp3Fs3
	S3unBfk0aa/bSoPDE9ptx2MDOSYTiJxwlOs/bmVSvnNgZmCCR2DrQxKCOvwar7MlI0OY
	nwoA==
X-Gm-Message-State: APzg51BSU//1cbP92IpER7tosPj4HMkLHM9B6auK06sn/2Fc2oeQ/Lg5
	PLFylp/uzFDntnV+2Q5wJmjwxxoy
X-Google-Smtp-Source: ANB0VdarlXpC6MImFd96Vqrj+ARSi/MMeuVRzRN0kKOf8XYVR0GRCvqO4YrczXpys5yJpJG5h3T9Cw==
X-Received: by 2002:a37:4843:: with SMTP id
	v64-v6mr20767009qka.209.1537281786722; 
	Tue, 18 Sep 2018 07:43:06 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k15-v6sm13198668qtf.95.2018.09.18.07.43.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 07:43:06 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 15:43:04 +0100
Message-Id: <20180918144304.26846-1-git@andred.net>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk: remove incorrect PROVIDES (java2-vm java2-runtime)
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
X-List-Received-Date: Tue, 18 Sep 2018 14:43:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

There are two issues here:
* PROVIDES is not package specific
* it doesn't look like the intention is to be able to
  DEPENDS on java2-vm or java2-runtime anyway

Regarding java2-vm:
-------------------
java2-vm was originally used in the OpenJDK 6 & 7 recipes to be able to
select shark, zero, cacao, or jamvm VMs. OpenJDK-6 is not available any
more, and OpenJDK-7 has removed support for most of this in commit
38f4c1365c11 ("openjdk7: remove broken/unsupported VM's")

It is not clear why it was added to the OpenJDK-8 recipe either.

Given OpenJDK-7 has no way of using the VM compiled as part of OpenJDK-8,
and given that no part of the OpenJDK-8 makes use of the java2-vm part, the
correct solution here is to actually *remove* the incorrect PROVIDES
statement for java2-vm completely.

Regarding java2-runtime:
------------------------
Again, looking at the other uses of this:
java2-runtime is a virtual runtime package name, which is provided by
different *runtime* packages (created by the OpenJDK-7, OpenJDK-8, JamVM, or
Cacao recipes). Other recipes only ever RDEPEND on java2-runtime. It makes
no sense for the OpenJDK-8 recipe to PROVIDES java2-runtime given the above.

Remove the incorrect PROVIDES statements.

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
This applies on top of commit ec5aae3d ("conf: distro: add mejate{,-musl} distributions")
---
 recipes-core/openjdk/openjdk-8_172b11.bb | 2 --
 recipes-core/openjdk/openjre-8_172b11.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_172b11.bb
index c1c6e1e..08f3a32 100644
--- a/recipes-core/openjdk/openjdk-8_172b11.bb
+++ b/recipes-core/openjdk/openjdk-8_172b11.bb
@@ -48,9 +48,7 @@ FILES_${PN}-doc_append = "\
 FILES_${PN}-source = " ${JDK_HOME}/src.zip "
 
 RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_172b11.bb
index dd29691..d2e8f31 100644
--- a/recipes-core/openjdk/openjre-8_172b11.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -36,9 +36,7 @@ FILES_${PN}-doc_append = "\
 "
 
 RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
-- 
2.19.0


