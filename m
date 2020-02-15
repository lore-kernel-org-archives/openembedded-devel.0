Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 215B56077F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:15:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c23so4355231plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bN9eRj4eNz6Sho3fOjBpcUO+gWViXJE4KnPypGdJR/8=;
	b=ds0YnSY1d36n1QBEBu5dDt71CrKxCzyAc9RRtyMCk3zZusXQV7fuMlUjpcJcWCRXNM
	c7Ci6GzEoTW8UjTkTb9egsjihWBhE3k1lSgpeU1g4YqSdtQeiP5pEYcAfv3ZmNUwKTwP
	GSplsYklIkOQq+qAaWj8l3+o0AQhcHYt/IXbWfbr9XokIjNazQQkdV52NNLoRySSpUSZ
	a5NNTJ8rFhGuI/VHwCXBMw580iNUxERHSo/ANTvxmhWFIViDqibFoy5h+hVUP0METhWN
	6HsmyAs5bKa/PcjsFYacnKQufeIpWhwy8XN8YXnnPNSJlLhIXsEAnG9MtsOY3G1P18zW
	kK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bN9eRj4eNz6Sho3fOjBpcUO+gWViXJE4KnPypGdJR/8=;
	b=H8teRlnZMZtNDWTIEJ4JKofoSOXI/LIHNKIUD1fGGeYst1WgNmLm2znXH1UFhIL6To
	xv7kOo4x8TV96K4AB+hxz9iv5hahC+F3YqOAMPxOU26u/OHuMwmRATlSIFvlPIYtFVsn
	IQrUfOYNxF9tOIFr0kVjzgS8kq5pZ/lyZRkq+VCJXE745PvDbG9zEQEKwL1oWTyb7Usq
	xm2WpsRlgahTe4TM/5UGSiXKjidRObMn3+J/zwTf16X+AuxZ1PxDECXbgNVdczSBJZiY
	Y+XC5ATIz5nH/RxDB3HFTpALApk9zc9xVE6IcxUEKe656IclTQLwtx+euwYpB0SDbUCr
	ZEpQ==
X-Gm-Message-State: APjAAAWKA74Oeixmf+KqtWDTCqEJIK0I/i1RJDIbRJTDlVA8vl8vJAjp
	AuPU8+DzvyWQMJJhydJtkVl2DBe6vuI=
X-Google-Smtp-Source: APXvYqxLZvTbdE45Gc9yPQcClL5Y+FWDBThpLfLQYnO+5vr75yT0vf5s08BqgRErvORvgHjBx3NUwA==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr6497191pjn.127.1581729323876; 
	Fri, 14 Feb 2020 17:15:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	m15sm8664397pgn.40.2020.02.14.17.15.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 17:15:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:15:27 -0800
Message-Id: <20200215011527.217227-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] libmimetic: Fix ordrered comparision between pointer and zero
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
X-List-Received-Date: Sat, 15 Feb 2020 01:15:24 -0000
Content-Transfer-Encoding: 8bit

Found with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: asmitha <asmithakarun@gmail.com>
---
 ...eck-for-MMAP_FAILED-return-from-mmap.patch | 49 +++++++++++++++++++
 .../libmimetic/libmimetic_0.9.8.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/libmimetic/libmimetic/0001-mimetic-Check-for-MMAP_FAILED-return-from-mmap.patch

diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/0001-mimetic-Check-for-MMAP_FAILED-return-from-mmap.patch b/meta-oe/recipes-support/libmimetic/libmimetic/0001-mimetic-Check-for-MMAP_FAILED-return-from-mmap.patch
new file mode 100644
index 0000000000..c7c8d62aaa
--- /dev/null
+++ b/meta-oe/recipes-support/libmimetic/libmimetic/0001-mimetic-Check-for-MMAP_FAILED-return-from-mmap.patch
@@ -0,0 +1,49 @@
+From f8ab2b1aaa37f6ba9d527a99cb37b6ac2171e122 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Feb 2020 17:03:12 -0800
+Subject: [PATCH] mimetic: Check for MMAP_FAILED return from mmap()
+
+Avoids using greater than zero comparision on pointers
+
+Fixes
+mimetic/os/mmfile.cxx:60:14: error: ordered comparison between pointer and zero ('char *' and 'int')
+
+if(m_beg > 0)
+~~~~ ^ ~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mimetic/os/mmfile.cxx | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/mimetic/os/mmfile.cxx b/mimetic/os/mmfile.cxx
+index dfc95b7..ed4ff55 100644
+--- a/mimetic/os/mmfile.cxx
++++ b/mimetic/os/mmfile.cxx
+@@ -57,15 +57,13 @@ bool MMFile::open(int mode)
+ bool MMFile::map()
+ {
+     m_beg = (char*) mmap(0, m_st.st_size, PROT_READ, MAP_SHARED,m_fd,0);
+-    if(m_beg > 0)
+-    {
+-        m_end = m_beg + m_st.st_size;
+-        #if HAVE_MADVISE
+-        madvise(m_beg, m_st.st_size, MADV_SEQUENTIAL);
+-        #endif
+-        return true;
+-    }
+-    return false;
++    if(m_beg == MAP_FAILED)
++        return false;
++    m_end = m_beg + m_st.st_size;
++    #if HAVE_MADVISE
++    madvise(m_beg, m_st.st_size, MADV_SEQUENTIAL);
++    #endif
++    return true;
+ }
+ 
+ MMFile::~MMFile()
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
index fd65db2d39..d0fe498adc 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b49da7df0ca479ef01ff7f2d799eabee"
 SRCREV = "50486af99b4f9b35522d7b3de40b6ce107505279"
 SRC_URI += "git://github.com/LadislavSopko/mimetic/ \
             file://0001-libmimetic-Removing-test-directory-from-the-Makefile.patch \
+            file://0001-mimetic-Check-for-MMAP_FAILED-return-from-mmap.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.0


