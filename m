Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7D06E682
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:03:51 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id j92so2103737qgj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hPzHVTakLWNmKHfXJon/2BB+jXSVGNvKhWwTH4QDFlg=;
	b=ilEAoQwgjujx3SsR1k1xlXkdy1yKTxjuDe0wVUC1bCYbPpbHq0AdgFFeWtIWkmtMif
	+PNkQhLeG8h8U+xsO3MNd5LOml4HPP+phAAFnE2nJzyTNkUoAZbhzXs4y9PXi4dzY/tn
	e4jlYowI8AvRjZ3lIdkbtSWcgAQspWFaycEwG+EthqNYd+aIRkH9Yk7d7XXnz5hIFHcD
	nbWgqoGntrhBIgNsunDNXF0DpdAl2vcqSMsw7pHy4hbB3WpIQNAUtq6uMhe9pZxvpFGS
	7H2rxbnON/9nYP8ke+xlVYfFJMvI3BmftkNu64RIOkvXau+dj5s/LxViFFzKjavmBIRx
	ZFNQ==
X-Gm-Message-State: AD7BkJLHdkWC0iOlIdb7kvzdZRziSHwGWYLV/JgIELxjtKmG1AapdKxb6uJEhkhkH0XdIg==
X-Received: by 10.140.106.68 with SMTP id d62mr6105314qgf.84.1458763432571;
	Wed, 23 Mar 2016 13:03:52 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	b103sm1771859qge.2.2016.03.23.13.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:03:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:03:39 -0400
Message-Id: <1458763422-30827-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763422-30827-1-git-send-email-derek@asterius.io>
References: <1458763422-30827-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/5] python-parse: add initial recipe for version 1.6.6
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
X-List-Received-Date: Wed, 23 Mar 2016 20:03:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-parse_1.6.6.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-parse_1.6.6.bb

diff --git a/meta-python/recipes-devtools/python/python-parse_1.6.6.bb b/meta-python/recipes-devtools/python/python-parse_1.6.6.bb
new file mode 100644
index 0000000..45b52a3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse_1.6.6.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Parse strings using a specification based on the Python format() syntax"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://parse.py;md5=e067ba2a08b73721dbe7356dc0282918;startline=1108;endline=1126"
+
+SRC_URI[md5sum] = "11bc8c60a30fe52db4ac9a827653d0ca"
+SRC_URI[sha256sum] = "71435aaac494e08cec76de646de2aab8392c114e56fe3f81c565ecc7eb886178"
+
+inherit pypi setuptools
-- 
1.9.1


