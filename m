Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JI8A9-00082g-3A
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jan 2008 20:55:01 +0100
Received: by ug-out-1314.google.com with SMTP id i24so367492ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2008 11:55:05 -0800 (PST)
Received: by 10.67.116.7 with SMTP id t7mr2643712ugm.38.1201204504803;
	Thu, 24 Jan 2008 11:55:04 -0800 (PST)
Received: from ?192.168.10.89? ( [88.248.7.116])
	by mx.google.com with ESMTPS id l4sm2004756ugf.75.2008.01.24.11.55.03
	(version=SSLv3 cipher=OTHER); Thu, 24 Jan 2008 11:55:03 -0800 (PST)
Date: Thu, 24 Jan 2008 22:06:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <12710310367.20080124220602@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JHLbJ-0006Ho-GM@linuxtogo.org>
References: <E1JHLbJ-0006Ho-GM@linuxtogo.org>
MIME-Version: 1.0
Subject: [oe-commits] org.oe.dev python 2.5.1 ship sitecustomize.py that enables some convenient features when
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2008 19:55:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

This is a forwarded message
From: mickeyl commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Tuesday, January 22, 2008, 6:03:49 PM
Subject: [oe-commits] org.oe.dev python 2.5.1 ship sitecustomize.py that enables some convenient features when

===8<==============Original message text===============
python 2.5.1 ship sitecustomize.py that enables some convenient features when
working with the interactive interpreter: attribute completion and persistent command history

[]
============================================================
--- packages/python/python-2.5.1/sitecustomize.py       af970496467ab4f0fbef36bbcac4de27afc77306
+++ packages/python/python-2.5.1/sitecustomize.py       af970496467ab4f0fbef36bbcac4de27afc77306
@@ -0,0 +1,45 @@
[]
+def __enableReadlineSupport():
+    readline.parse_and_bind("tab: complete")
+    try:
+        readline.read_history_file( "/tmp/python-history-file.txt" )

    Shouldn't this file be under ~/ instead?


[]

===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



