Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E61D478355
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 14:16:10 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c65so2498988pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tGFhfQG/5HcofN1IE9wt8ADPT55dN9xhbQIGG9HEDtc=;
	b=msPIl7tpf+R27VOhaNxPgG8xFKDrPijy3j7nocg+tnlnZopcu6GtIsoBzgEMwc4rsv
	wJwkhgFW3c8wSaDuF27IAUl54D/x9W+7q2L+U82No+T1L/lwV4/ImUClrLxphltRUR2k
	XPIqR5C0lpLra9Is+mJGbbRroylwsegKh/xhyQ9w/aMoO/BCo5vDFoIShFPiiFJuMpTX
	OfEmiXzX6ix4jGlg8EkblTatFnSajrTn6yjAuSbsMBODGQPnaps0vwxoEwsIwAwFd342
	ohmJUl8Muapzv1p37WKDnNQYwYs2M9MVhyvoM4GIAALF94JsNi0kMfhtofXuQQ/DBnlY
	cF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tGFhfQG/5HcofN1IE9wt8ADPT55dN9xhbQIGG9HEDtc=;
	b=r0T6ZIZ/Vlq0ZO5j99L8gVnRZIVRP5lnR+eZayrHnEuX5NZ38sHI4rxR2AQmN84k54
	R5CJtJYGCK3+52oGnTPp3l4lP1J0fG3/dr2C9sRuuh2uOVzLjvwcLqyqWIhcWqUja8ra
	G7Wu2jlJOmHNhVH2suuJgrc5tpHqg+5t7UDVcJ093knA0qTBcjCF4dsM1XBtsZiHUojU
	ApuwWG8Wf3k8ujpKTu+84Jl60VPHgbSM0dDIfj+7jiV6nyvy6sSppVpmFrkBkrSiStjy
	dgWRlEeGCXtTfdaPYt6pyfLsjooFTQMlGpK5Q4/sNmW9QOiUK0dIBmoJtvTpWK0ey/cb
	yJEw==
X-Gm-Message-State: AIVw111B+ctx5JMkIn5iMa4odza1JXjxlJuLGZMPPYsHiPnO/S8NcHfq
	PN/2GP5YBljkuPAy
X-Received: by 10.84.133.162 with SMTP id f31mr21054367plf.242.1501596971978; 
	Tue, 01 Aug 2017 07:16:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	l17sm58510561pfk.146.2017.08.01.07.16.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 07:16:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 07:15:59 -0700
Message-Id: <20170801141559.17067-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170801141559.17067-1-raj.khem@gmail.com>
References: <20170801141559.17067-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] memcached: Update to 1.5.0
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
X-List-Received-Date: Tue, 01 Aug 2017 14:16:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../memcached/{memcached_1.4.36.bb => memcached_1.5.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.4.36.bb => memcached_1.5.0.bb} (92%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.36.bb b/meta-networking/recipes-support/memcached/memcached_1.5.0.bb
similarity index 92%
rename from meta-networking/recipes-support/memcached/memcached_1.4.36.bb
rename to meta-networking/recipes-support/memcached/memcached_1.5.0.bb
index 48c3c9ee2..fd3d171f0 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.36.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.5.0.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[md5sum] = "1e028fbab7288911fcaa5ed2a21817fe"
-SRC_URI[sha256sum] = "773b6bb20bf80223ca6a15d75f570fbab346ad11ec98595e5af5e33f54bd82d8"
+SRC_URI[md5sum] = "81326513f60d7ba482f8131975cd55ae"
+SRC_URI[sha256sum] = "c001f812024bb461b5e4d7d0506daab63dff9614eea26f46536c3b7e1e601c32"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
-- 
2.13.3


