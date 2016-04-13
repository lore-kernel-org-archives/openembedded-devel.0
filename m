Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F51070101
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:28 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i7so142368qkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ZhnnQmAw5ji6w9OytmQwgS9GGvFRtmjZws2hBN0fT1g=;
	b=Noa8VMMxzEYglU1dLJl2bpXTV3hElImjLNffUXzbrM3O+O6THAeYJDNywlmjuDm155
	LkqkD9hjR01RZGjbVFjS8hmFlE7Izga4Ek0UIlJOp/1KaKq4U95IFgVREVmbJzjFDeVy
	dXWnErm9vOUk5NVhCui1fhms2i+Qyx4VMxkG6GtxunBalCokvinbR/JYiM6Ry+Zo+Tm/
	IJEttNFnybmYra8dUEcGk1LvH/TQ9Fz2FWBeQPj/SISc6vdTzt5cI11PsV5qUaTrse0O
	sGe02EGZKpsYtQttqQeKZmKMS/UyDPp0oLJih9RIr0kUsqlIFfq8e7qPkiTZhnqRAkG6
	mV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ZhnnQmAw5ji6w9OytmQwgS9GGvFRtmjZws2hBN0fT1g=;
	b=QqF1YRZbE5ZblqqkkMGfoAwjjcm06iuD+JyLs+UxD+4SHVihbyUfWGcGusfi8ykgcF
	WaQuf0hfkXYHPtpRJR/mYQI5WgV10C/aUBSgwQ+FFpAIxrFxkyUUWxtr+UUb+o/0HubS
	oNbxMFmdjktW4v5buYf3ie0oS6PFD7XNuznZ49Wb7reoU1msD4x5xv4tdudrV84RhOXX
	ImtSUc7ITG7kHL885L+XhXUq8pE0xVozjPd8XsuFGZL6vCcbCekTB3YdoML6Fk7R1DFq
	oNkoW/fIzBe7t2l7fv2ZqGrcr94jByA3d2pyYiIWc0ZMtG8T37ZSPxtiDVjBOoFa4Q8O
	LxHA==
X-Gm-Message-State: AOPr4FXU6p967g3HHcCUJKEjWzjnPRIYgFSaazQNWOB//7vJrd3pEuffhoFeG0JTzziODg==
X-Received: by 10.55.40.78 with SMTP id o75mr11225958qkh.54.1460553448717;
	Wed, 13 Apr 2016 06:17:28 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:27 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:54 -0300
Message-Id: <1460553420-12533-3-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 3/9] python-flask-bcrypt: Add recipe for version 0.7.1
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:29 -0000

It's a brcrypt hashing for Flask.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-flask-bcrypt_0.7.1.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
new file mode 100644
index 0000000..d08883d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Brcrypt hashing for Flask."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ee2ee5bee7fe96597770e92db5719a8"
+
+SRC_URI[md5sum] = "d345c36ac6637d3ca9fa942e238d00ca"
+SRC_URI[sha256sum] = "d71c8585b2ee1c62024392ebdbc447438564e2c8c02b4e57b56a4cafd8d13c5f"
+
+PYPI_PACKAGE = "Flask-Bcrypt"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "python-bcrypt"
-- 
2.1.4


