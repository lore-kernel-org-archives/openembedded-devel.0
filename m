Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1INle1-0003Ag-PT
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 10:32:53 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7M8Vd1R010074 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2007 10:31:42 +0200
Message-ID: <46CBF47D.7000500@dominion.kabel.utwente.nl>
Date: Wed, 22 Aug 2007 10:31:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <74d0deb30708220114v5a52985dx6ae79eace522bb6e@mail.gmail.com>
In-Reply-To: <74d0deb30708220114v5a52985dx6ae79eace522bb6e@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: gsmd machine dependent configuration and PACKAGE_ARCH
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
X-List-Received-Date: Wed, 22 Aug 2007 08:32:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> Hi,
> 
> I don't like how currently all (lib)gsmd(-plugin-...) packages are
> PACKAGE_ARCH="${MACHINE_ARCH}" just because of the small
> /etc/default/gsmd configuration file. Are there any objections to the
> patch below? It uses a single configuration file for all currently
> supported machines, parsing /proc/cpuinfo similarly to how Xserver
> configuration is done in xserver-kdrive-common.

One small suggestion:

Author: mickeyl@openembedded.org
Revision: a11f318a90beef34d84711b348b891eddfabc2bf
packages/initscripts/initscripts-1.0/functions

initscripts: add a functions script that is supposed to be sourced from individual init
scripts providing some useful functions.
added cpuinfo_id() and killproc() for a start

============================================================
- --- packages/initscripts/initscripts-1.0/functions	cdb873e9c652d090c2e40fa96d5fd2db86db5413
+++ packages/initscripts/initscripts-1.0/functions	cdb873e9c652d090c2e40fa96d5fd2db86db5413
@@ -0,0 +1,17 @@
+# -*-Shell-script-*-
+#
+# functions     This file contains functions to be used by most or all
+#               shell scripts in the /etc/init.d directory.
+#
+
+cpuinfo_id() {		# return the Hardware module ID
+    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+}
+
+killproc() {		# kill the named process(es)
+    pid=`/bin/ps -e x |
+         /bin/grep $1 |
+         /bin/grep -v grep |
+         /bin/sed -e 's/^  *//' -e 's/ .*//'`
+    [ "$pid" != "" ] && kill $pid
+}

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGy/R9MkyGM64RGpERAlJ1AJ0YIedmbKy5wQ+ERcw5bFcBJOeifgCcDTBc
7WwtqT6BHh/lwnT6kiDzgBQ=
=HRWu
-----END PGP SIGNATURE-----


