Return-Path: <prvs=7077f78b2=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6AED477025
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:40:05 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap8EAPB3ClasEApK/2dsb2JhbABdg3hpBr9nhXcCgh0BAQEBAQGBAAuEJAEBAQMBMgFFARALDQsJFg8JAwIBAgFFBg0BBwKIIg0Iy0QBAQEBAQEEAQEBAQEdhnOEfYRCSweELAEEhzKGf4QTgzCFFolMRoZwF4phg1iDb4J0ARsWgUBvAQEBAYgWgQUBAQE
X-IPAS-Result: Ap8EAPB3ClasEApK/2dsb2JhbABdg3hpBr9nhXcCgh0BAQEBAQGBAAuEJAEBAQMBMgFFARALDQsJFg8JAwIBAgFFBg0BBwKIIg0Iy0QBAQEBAQEEAQEBAQEdhnOEfYRCSweELAEEhzKGf4QTgzCFFolMRoZwF4phg1iDb4J0ARsWgUBvAQEBAYgWgQUBAQE
Message-ID: <560A7883.5010200@skidata.com>
Date: Tue, 29 Sep 2015 13:39:47 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <D4F319EC2C6BBA46B2FB63E54D8E81C3C03392@PGSMSX101.gar.corp.intel.com>
In-Reply-To: <D4F319EC2C6BBA46B2FB63E54D8E81C3C03392@PGSMSX101.gar.corp.intel.com>
X-Originating-IP: [172.16.60.30]
Cc: "Ramajayam, Yugeraj" <yugeraj.ramajayam@intel.com>
Subject: Re: [meta-java] openjdk: openjdk.tar.bz2 download time out due to sha256sum mismatch.
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
X-List-Received-Date: Tue, 29 Sep 2015 11:40:07 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 09/25/2015 11:25 AM, Ramajayam, Yugeraj wrote:
> Hi all,
> 
> I am trying to include java support for valleyisland-64 bsp.
> 
> I have followed all the Usage Instructions as mentioned in the meta-java
> About page.
> 
Your configuration looks fine!

> 
> When I execute $ bitbake core-image-sato , I am having following error
> due to openjdk.tar.bz2 time out issue.
> 
> When I try to wget manually, the tar ball was downloaded fine and the
> md5sum and sha256sum matches accordingly.
> 
> The error message appears as below :
...
> 
> *openjdk.tar.bz2: FAILED*
> */usr/bin/sha256sum: WARNING: 1 computed checksum did NOT match*
> * *
> *--2015-09-25 17:00:34-- 
> http://icedtea.classpath.org/download/drops/icedtea7/2.6.1/openjdk.tar.bz2*
> * *
> *Resolving icedtea.classpath.org (icedtea.classpath.org)...*
> *208.78.240.231*
> * *
> *Connecting to icedtea.classpath.org
> (icedtea.classpath.org)|208.78.240.231|:80...*
> *failed: Connection timed out.*
> * *
> *Retrying.*

IMHO it looks like the wget falls into a timeout. How long does the
"manual" wget download take?

You could try to increase the wget timeout in
bitbake/lib/bb/fetch2/wget.py and meta/conf/bitbake.conf to for example
100sec:

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -58,7 +58,7 @@ class Wget(FetchMethod):

         ud.localfile = data.expand(urllib.unquote(ud.basename), d)

-        self.basecmd = d.getVar("FETCHCMD_wget", True) or "/usr/bin/env
wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
+        self.basecmd = d.getVar("FETCHCMD_wget", True) or "/usr/bin/env
wget -t 2 -T 100 -nv --passive-ftp --no-check-certificate"

     def _runwget(self, ud, d, command, quiet):

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -575,7 +575,7 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"

 FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp
--no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 100 -nv --passive-ftp
--no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"


hope that helps!

best regards,
Richard L

