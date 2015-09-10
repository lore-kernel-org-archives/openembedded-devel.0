Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id AC93D6E26B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 18:01:17 +0000 (UTC)
Received: by ykdu9 with SMTP id u9so66822962ykd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=amTOrS2s1xcrYyaR65NZ8AfD55CCI8mmiqZVu+BsdbA=;
	b=jEDD4476dpfdlgC6by5c64I0w7fLH9NyH0EMwoSbPsUq+P3nqmmDU7Kd1awkYGuEft
	JBR/4cLcXHdkzaOcmw+sqeneEHryumwV2ftlJpfNw0YYsO4zZ33Cxof4AGnSAKXThI7o
	BLCk9zZZ85qsC+WfFVJ9V8lkpo7qhn/+/iSKuXVGr+PwmsRaqfvKP/ScF4yMNK6cMb7Y
	pV2P3pOxvsMDA5tJ/Z95G7fjjJ54/rLanl7/NPVqPiRWIbzlpYyqQGSzASlFOy3p1AOU
	IA0N7dnFy8okjRmhBDfvLYs4+8cBQK7KOHCwssSUl6Xd3cJ0tHFrXw57rAikMdFYqaIK
	ke6A==
X-Gm-Message-State: ALoCoQmaURlnjGcDH2+14pJ8u3wIzLTQzMKyRRm3DZGA9JUHyrnL22sjpPpZTQ7vwm8GgihVkJAz
X-Received: by 10.13.230.6 with SMTP id p6mr48368940ywe.86.1441908077934;
	Thu, 10 Sep 2015 11:01:17 -0700 (PDT)
Received: from localhost.localdomain ([201.22.227.56])
	by smtp.gmail.com with ESMTPSA id
	d136sm10089400ywb.53.2015.09.10.11.01.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 11:01:17 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2015 15:01:02 -0300
Message-Id: <1441908063-29340-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH v2 1/2] python-pyzmq: Add python-multiprocessing in RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 18:01:19 -0000

Fix the following runtime error:

>>> import zmq
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib/python2.7/site-packages/zmq/__init__.py", line 53, in
<module>
from zmq import devices
File "/usr/lib/python2.7/site-packages/zmq/devices/__init__.py", line 7,
in <module>
from zmq.devices import basedevice, proxydevice, monitoredqueue,
monitoredqueuedevice
File "/usr/lib/python2.7/site-packages/zmq/devices/basedevice.py", line
9, in <module>
from multiprocessing import Process
ImportError: No module named multiprocessing

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
index 0d822f5..949b7e1 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
@@ -15,6 +15,8 @@ S = "${WORKDIR}/pyzmq-${PV}"
 
 inherit setuptools pkgconfig
 
+RDEPENDS_${PN} += "python-multiprocessing"
+
 FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
 
 do_compile_prepend() {
-- 
2.1.4


