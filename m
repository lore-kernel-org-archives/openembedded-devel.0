Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CDF377FD6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:54:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so3115375wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VJDWRn1lAGvTEuCq01Vr3f/vsftR8B0ws23akyYTvAk=;
	b=JgMoxQWZ027uO3VVwR+ZA/ffNTP4PbQ5SUg1t2WNAjVYiJ5/2k08AJ/f/T53IHfkB+
	tjMUA70lcLTEwhwC71YE/rH8wXyF6uv652tLfZV31QjyO8jW7xEon6LU5C8ZbKUPdy/b
	NvVsxxrCOfEyfWOFN0QdP45QJfhETHo8Lc9I5z2BRbq9fdrSv0lsVKvV3MVX6DcAgVvj
	32k1kOdbXYsZU42YbY/Wxe6XH0rdrkl5dGBo1k/PjKXP72U8fBCRN1xnum0FWQBH+KP6
	dTAiuAXiWQ8nz+IOunKCoU1QquKkLS3PoeYxyqY11dukqzF++IqL9vLXKKa+D8W7yw4M
	bFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VJDWRn1lAGvTEuCq01Vr3f/vsftR8B0ws23akyYTvAk=;
	b=tCowD0xp6oGYkbPD2os02NSwK3h7DYIKt8ioYZAVP6n/nB8VgSgwGEASi1irNHsGWc
	2kLKlUNr9HWlm5xpS77rC4besGGA7+v4HI6EseZDAexRVVZGPWivNSIz2PWGpp01faoL
	udYp601RX3fwzcjcEQJOC8t0zNszLKWzNiZ/lEkcXkZLoCkEjT6T2Vo5aBSMto8yS3c1
	oRArdlFriVO4q613Mo/3Osxn0uTY+oKwLjX/EsHkoV1j8vukSVQCTxQw5cGzs/jG6W94
	5jBXZZBhpCOCzmt/INrE4AbiGlVlBStS/XKvOooYRVPt/C8oSM+gy+YrudecKqWco/wS
	4irQ==
X-Gm-Message-State: APjAAAX6mvJph3GxOxzus4Aw4pulNQMNqpLYlrjZdiyker5x1DbHUCqz
	uwzGQPcD/9Upb6a7JCJCvYG06VgL
X-Google-Smtp-Source: APXvYqw9uCzArebHMyvGvJrYaTmvI43y6lt4I0ECTQ8ws8eJ+STFk8FwLqYtLsb3+U93vL7k+hbJ4Q==
X-Received: by 2002:adf:f20b:: with SMTP id p11mr16699367wro.195.1579787664245;
	Thu, 23 Jan 2020 05:54:24 -0800 (PST)
Received: from vpr-vm.corporate.saft.org
	(mey38-h01-176-145-72-80.dsl.sta.abo.bbox.fr. [176.145.72.80])
	by smtp.gmail.com with ESMTPSA id 2sm3119045wrq.31.2020.01.23.05.54.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 05:54:23 -0800 (PST)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 14:53:47 +0100
Message-Id: <20200123135347.24361-1-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] mongodb: bump version to r4.2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 13:54:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index cd8ccdc8a..6f460bf76 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native
 
-PV = "4.2.0+git${SRCPV}"
-#v4.2.0
-SRCREV = "18ce5c9f56a01f2c933a720d64707f3456f81c8b"
+PV = "4.2.2"
+#v4.2.2
+SRCREV = "a0bbbff6ada159e19298d37946ac8dc4b497eadf"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.2 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
-- 
2.24.0


