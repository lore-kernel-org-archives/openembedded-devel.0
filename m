Received: from na3sys009aog112.obsmtp.com ([74.125.149.207])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pztxi-0006xs-W0
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:52:43 +0100
Received: from source ([209.85.213.182]) (using TLSv1) by
	na3sys009aob112.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDqburKPyMrInuEOQf03zQ0VUL2mjfC@postini.com;
	Wed, 16 Mar 2011 09:51:02 PDT
Received: by yxl31 with SMTP id 31so1027224yxl.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=KWjyxM7+oc/JtzuuNXoMwo0q3Bg12nC6LrG//p6TvxQ=;
	b=Q1Xo9mEUp0h1NVQZjsqS5M7GSMs01oRi57XG+B1wWvzGM4exUWDklOvXsYqN/2ZKuL
	YHOLUn5DBND8KwNxGIhq55DXZ7n1UHY8i/KfM78tNs30T7D7x+kSAB1G73mS2b3CauYl
	QPH3EJI61y4MJoMRO39AJuzW+ye7D0cg3hOB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ExusgzpVDCyeFVOUvNeYw1wOJiunxdxWdAIeVlocQCrY2Y+7+9kf7qoGF9HXy7vNza
	EPQ5RISB5nwAYDVY8wS7+hanhndjkHgQ2/CiitvjwJH5Jk+g4KIMkAsWtlndUmr6im6V
	NlNKtUoB8RlU80vA0OcDSduCvVicIjUfztlKs=
Received: by 10.42.75.130 with SMTP id a2mr282323ick.320.1300294253697;
	Wed, 16 Mar 2011 09:50:53 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:52 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:40 -0400
Message-Id: <64d42452395f0c02d355516943c8493dc770ade2.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [2010.03-maintenance] [PATCH 7/7] toolchain-external.conf: set the default provider for gdbserver
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
X-List-Received-Date: Wed, 16 Mar 2011 16:52:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
(cherry picked from commit df59f77a2eb37d9807c6d9167488110e92601d7b)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 conf/distro/include/toolchain-external.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
index 12dc454..6ea2a37 100644
--- a/conf/distro/include/toolchain-external.inc
+++ b/conf/distro/include/toolchain-external.inc
@@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-toolchai
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain-${TOOLCHAIN_BRAND}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN_BRAND}"
 PREFERRED_PROVIDER_linux-libc-headers ?= "external-toolchain-${TOOLCHAIN_BRAND}"
+PREFERRED_PROVIDER_gdbserver ?= "external-toolchain-${TOOLCHAIN_BRAND}"
 
 TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
 TARGET_VENDOR := "${TOOLCHAIN_VENDOR}"
-- 
1.7.1



