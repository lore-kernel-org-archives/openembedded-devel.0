Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1Mrzll-0005Qw-Uv
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Sep 2009 21:50:57 +0200
Received: from [76.91.220.157] (helo=[192.168.1.25])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1Mrzl7-0001pd-IT
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Sep 2009 12:50:13 -0700
Message-ID: <4ABFC1F0.2080601@symas.com>
Date: Sun, 27 Sep 2009 12:50:08 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090909 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.37215.1252941941.21824.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.37215.1252941941.21824.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 64.71.152.235
X-SA-Exim-Mail-From: hyc@symas.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: python-wpactrl
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
X-List-Received-Date: Sun, 27 Sep 2009 19:50:57 -0000
X-Groupsio-MsgNum: 13236
Content-Type: multipart/mixed; boundary="------------010007060604060200020208"

--------------010007060604060200020208
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> Date: Mon, 14 Sep 2009 13:46:35 +0200
> From: Koen Kooi<k.kooi@student.utwente.nl>

> Please use SRCREV to point to the revision and put it in PV as well so
> people can see which version they are installing.
>
> And please send it as a git-am'able patch so we can track author metadata.

I think this addresses your comments.

-- 
   -- Howard Chu
   CTO, Symas Corp.           http://www.symas.com
   Director, Highland Sun     http://highlandsun.com/hyc/
   Chief Architect, OpenLDAP  http://www.openldap.org/project/

--------------010007060604060200020208
Content-Type: text/x-diff;
 name="0001-Add-wpactrl-module.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Add-wpactrl-module.patch"

From 89b27aff8cb95def72927604492bbf77990da403 Mon Sep 17 00:00:00 2001
From: Howard Chu <hyc@symas.com>
Date: Sun, 27 Sep 2009 12:43:40 -0700
Subject: [PATCH] Add wpactrl module


Signed-off-by: Howard Chu <hyc@symas.com>
---
 recipes/python/python-wpactrl_svn.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-wpactrl_svn.bb

diff --git a/recipes/python/python-wpactrl_svn.bb b/recipes/python/python-wpactrl_svn.bb
new file mode 100644
index 0000000..e0e8a05
--- /dev/null
+++ b/recipes/python/python-wpactrl_svn.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A Python extension for wpa_supplicant/hostapd control interface access"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+HOMEPAGE = "http://projects.otaku42.de/wiki/PythonWpaCtrl"
+
+inherit distutils
+
+SRCREV = "383"
+SRC_URI = "svn://svn.otaku42.de;module=python-wpactrl;proto=http"
+S = "${WORKDIR}/python-wpactrl/trunk"
+PV = "1.0.1+svnr${SRCREV}"
+
-- 
1.6.0.4


--------------010007060604060200020208--
