Received: from [24.71.223.10] (helo=pd5mo3so.prod.shaw.ca)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rayl@mail.com>) id 1GSZni-0005oN-FY
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 15:50:14 +0200
Received: from pd2mr7so.prod.shaw.ca (pd2mr7so-qfe3.prod.shaw.ca [10.0.141.10])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004)) with ESMTP id <0J6900IRP7JJDUC0@l-daemon> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Sep 2006 07:45:19 -0600 (MDT)
Received: from pn2ml4so.prod.shaw.ca ([10.0.121.148])
	by pd2mr7so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0J6900BQG7JJVQJ0@pd2mr7so.prod.shaw.ca> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Sep 2006 07:45:19 -0600 (MDT)
Received: from ray.lehtiniemi.com ([68.147.121.172])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004)) with ESMTP id <0J69004SH7JJK150@l-daemon> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 Sep 2006 07:45:19 -0600 (MDT)
Received: from [192.168.5.101] (siconix [68.146.203.109])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(Client did not present a certificate)	by ray.lehtiniemi.com (Postfix)
	with ESMTP id 32EC54E2ED0; Wed, 27 Sep 2006 07:45:19 -0600 (MDT)
Date: Wed, 27 Sep 2006 07:45:13 -0600
From: Ray Lehtiniemi <rayl@mail.com>
In-reply-to: <451A29EA.1080309@adtelecom.es>
To: openembedded-devel@lists.openembedded.org
Message-id: <200609270745.13235.rayl@mail.com>
Organization: Disorganized
MIME-version: 1.0
References: <45190D58.2020807@adtelecom.es> <451948D7.6000904@adtelecom.es>
	<451A29EA.1080309@adtelecom.es>
User-Agent: KMail/1.8.2
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2006 13:50:14 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7bit
Content-disposition: inline

On Wednesday 27 September 2006 01:36, Joaquim Duran wrote:
> Hello,
>
> As I've the impression that Bitbake is very related to OE. I post the
> bug here.
>
> I execute: bitbake -g boostrap-image.
> Output:
>
> NOTE: Parsing finished. 3962 cached, 0 parsed, 139 skipped, 27 masked.
>
> Traceback (most recent call last):
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 1161, in ?
>      main()
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 1156, in main
>      cooker.cook( BBConfiguration( options ), args[1:] )
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 962, in cook
>      self.generateDotGraph( pkgs_to_build,
> self.configuration.ignored_dot_deps )
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 544, in
> generateDotGraph add_depends( pkgs_to_build )
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 467, in add_depends
>      fn = myFilterProvider(providers, package)[0]
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 413, in
> myFilterProvider preferred_versions[pn] = bb.providers.findBestProvider(pn,
> pkg_pn)[2:4] TypeError: findBestProvider() takes at least 3 arguments (2
> given)
>

i've found that there are several files under lib/bb/ with this problem.

this patch is cut and pasted, so is probably whitespace mangled....

Index: lib/bb/shell.py
===================================================================
--- lib/bb/shell.py     (revision 612)
+++ lib/bb/shell.py     (working copy)
@@ -57,6 +57,8 @@
 except NameError:
     from sets import Set as set
 import sys, os, readline, socket, httplib, urllib, commands, popen2, copy, 
shlex, Queue, fnmatch
+
+import bb
 from bb import data, parse, build, fatal

 __version__ = "0.5.3.1"
Index: lib/bb/providers.py
===================================================================
--- lib/bb/providers.py (revision 612)
+++ lib/bb/providers.py (working copy)
@@ -23,8 +23,8 @@
 # Place, Suite 330, Boston, MA 02111-1307 USA.

 import os, re
+import bb
 from bb import data, utils
-import bb

 class NoProvider(Exception):
     """Exception raised when no provider can be found"""




hope it helps

ray



