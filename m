Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id DF4C161149
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:18:43 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i6so5604874pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7wdlOIAInsrIMYrfaMHoKPsfhlcP3FjX8BnhdPq6vTY=;
	b=qUTeErTT1V5OBIjGlt7eUMgmuZfyv0Qb7CyXHFjVtLCC+1Vi4QlEDRqFWmlD7V3KZe
	AXzIWOTCFBZFtYBpItts3xrZ3ScM1RFw5MepE8rIqmazq1pDwIki07V+l97OtOXmHKUb
	b3/fpw2eOOLwfEnwE0MsdjKRmQ5mG4oXrepp8Wei/vTisn6QlrxZg87o/k2n7SLyscEk
	3HbjqwmN3A5TuoQWuied0oHdWpL1zvgIi1rE6Gx0hmMwaHftO7ml1AJimhMOduZhmkGx
	r0m/1mLs37vCDSvF7UuwlbMrqHSO6ABPt66uuGdDiR4PJI+5rtyyTloBfbFWDQ+DcnWs
	G2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=7wdlOIAInsrIMYrfaMHoKPsfhlcP3FjX8BnhdPq6vTY=;
	b=VH7T6pa9x7E7tCtFzFB5NH+16Kr3MfXMn8XzKOladeP16Wvo2lXEdRzkFbd3fN9pqu
	zUXCGoeIzQjeKYCu/Put/rnAdxU2bE0eGjmzUk34uFXUcxyGEuaFI1pGlxje4KIFnyAx
	I9lX4Cfzy23iSNJD1Ytm58lFNJwQJPjYRUqV+Y7nTpwMADvLttnMETLjFZ413RUnFY5e
	7PDUvP/PE5lZn5O1SvpyqQYxjEhMyEPIEuSjOHvW+N3Gx/3SFl754QPwXkwqH9taagsV
	CPcph5SWR6Ia3HhhFJA73UuWLa+kfjARV4ZjHU59+PlWs59kCTugQZKz2va7WEh2e1Jr
	v3tQ==
X-Gm-Message-State: APjAAAU7ULS4CCep6LKfJtgSTLFimnjgeMPkC0mGKmwxVfwwkLQo0wCV
	YC144M045CZokl0rQGE1QvJVL4y3peU=
X-Google-Smtp-Source: APXvYqz41W51GV++DdgU15LMgeRjNJ9HWruyM7w6V6+c7Y/JBxXIy8IQxZJ3JbY6MBVwZf0oTyO8kw==
X-Received: by 2002:a65:4bc7:: with SMTP id p7mr3273036pgr.204.1581722324636; 
	Fri, 14 Feb 2020 15:18:44 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	x65sm8487198pfb.171.2020.02.14.15.18.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:18:44 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id DCC1F2A04B2; Fri, 14 Feb 2020 15:18:42 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 15:18:26 -0800
Message-Id: <20200214231828.9286-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-python][PATCH 1/3] pytest-timeout: New package
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
X-List-Received-Date: Fri, 14 Feb 2020 23:18:44 -0000

Adds plugin for pytest to abort tests after a certain time out.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../recipes-devtools/python/python3-pytest-timeout_1.3.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
new file mode 100644
index 000000000..a359969ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "py.test plugin to abort hanging tests"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
+
+PYPI_PACKAGE = "pytest-timeout"
+
+SRC_URI[md5sum] = "1594762ae77ed7c6c2727aa8b4aa8bfb"
+SRC_URI[sha256sum] = "80faa19cd245a42b87a51699d640c00d937c02b749052bfca6bae8bdbe12c48e"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pytest"
-- 
2.13.3


