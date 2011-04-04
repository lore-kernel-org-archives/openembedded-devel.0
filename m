Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fgretief@gmail.com>) id 1Q6ecN-00028y-SL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 09:54:35 +0200
Received: by eye27 with SMTP id 27so1468089eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:x-enigmail-version:content-type:content-transfer-encoding;
	bh=iDARNjnnmqEqIJGkYxZJX8zB2lTDmUShSM2pB+fMA8A=;
	b=QDLoBB9dbOW6RgfLovALlh4kcuLoy6ws37ilEhALPGEfKJuXfqgCWkwBOpwukwfANj
	Vo95rpBKHQBpCOl3jdZ6OCvysZScCEboEyWDGm1peZB/VEwDVlgaWOya1qM5WVrZEYoo
	xZTP0fcyvz4qWpDL57jAzFKYXp9i7XIiJWz0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding;
	b=AqE+CzsoEm5WaWcLJFEl2uId+cmKUFSfCHCv5T1wkL506nAneYZ4oXBic+ZGUmprjJ
	YuR2Jnq986TTuWrxQkJK6KqByYLuVHTAu2zLVDyvlT3A8PNFG99Ycyr4/ra2qw5Evakc
	ggvPNbsFah55JPpExPrtvVOk4BmSRrqQYvLDE=
Received: by 10.14.124.147 with SMTP id x19mr1222828eeh.249.1301903550444;
	Mon, 04 Apr 2011 00:52:30 -0700 (PDT)
Received: from [192.168.1.10] (dsl-185-157-179.dynamic.wa.co.za
	[41.185.157.179])
	by mx.google.com with ESMTPS id x54sm3134997eeh.19.2011.04.04.00.52.28
	(version=SSLv3 cipher=OTHER); Mon, 04 Apr 2011 00:52:29 -0700 (PDT)
Message-ID: <4D997896.9050607@gmail.com>
Date: Mon, 04 Apr 2011 09:51:50 +0200
From: Francois Retief <fgretief@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.1
Subject: Ignore externals from a SVN source in SRC_URI
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
X-List-Received-Date: Mon, 04 Apr 2011 07:54:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

What is the recommended way to ignore external directories from a SVN
source? Tried SVNCOOPTS, but it did not work.

So I hacked bitbake for my needs with the patch below. But is there a
better way?

SRC_URI =
"svn://svn.somesite.com/trunk;module=somemodule;externals=ignore;proto=https"

Cheers
  Francois

diff --git a/lib/bb/fetch/svn.py b/lib/bb/fetch/svn.py
index ba9f6ab..f22f572 100644
--- a/lib/bb/fetch/svn.py
+++ b/lib/bb/fetch/svn.py
@@ -114,6 +114,12 @@ class Svn(Fetch):
         if command is "info":
             svncmd = "%s info %s %s://%s/%s/" % (basecmd, "
".join(options), proto, svnroot, ud.module)
         else:
+            if "externals" in ud.parm:
+                if ud.parm["externals"] == "ignore":
+                    options.append("--ignore-externals")
+                else:
+                    raise FetchError("Invalid value for 'externals':
expected 'ignore'")
+
             suffix = ""
             if ud.revision:
                 options.append("-r %s" % ud.revision)




