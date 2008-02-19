Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRaad-0003XB-W5
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 23:05:30 +0100
Received: by ug-out-1314.google.com with SMTP id i24so3966936ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 14:04:37 -0800 (PST)
Received: by 10.66.249.16 with SMTP id w16mr5116072ugh.32.1203458677124;
	Tue, 19 Feb 2008 14:04:37 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id 29sm2691347uga.50.2008.02.19.14.04.32
	(version=SSLv3 cipher=OTHER); Tue, 19 Feb 2008 14:04:36 -0800 (PST)
Date: Wed, 20 Feb 2008 00:05:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20080220000502.328bc3ff@widy.localdomain>
In-Reply-To: <E1JRaSm-0003Nt-SZ@linuxtogo.org>
References: <E1JRaSm-0003Nt-SZ@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.168
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev ipkg-utils*: Re-add support for openwrt-style .ipk's.
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
X-List-Received-Date: Tue, 19 Feb 2008 22:05:30 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

FYI. I've done tests to ensure there're no changes to existing behavior
at all, but if you face any issues, please let me know.


On Tue, 19 Feb 2008 22:57:20 +0100
"pfalcon commit" <openembedded-commits@lists.openembedded.org> wrote:

> ipkg-utils*: Re-add support for openwrt-style .ipk's.
> * There're two .ipk formats: one with ar top-level wrapping
> (essentially, .deb format, native OE format) and with tar.gz
> top-level wrap, used by OpenWRT and some tiny distros. When I did
> performance optimization work on ipkg-make-index, I just blocked
> support of tar.gz-style ipk's, as it was unclear if those are used in
> OE at all. Now support is readded, with the old code to handle them
> (i.e. not as optimal as ar-style ones).
> * This makes DISTRO=openwrt-sdk usable for producing compatible
> packages and deploy-feed for them. But there're still some issues to
> resolve before OE can be said to provide seamless support for
> building packages for OpenWRT.
> 
> Author: pfalcon@openembedded.org
> Branch: org.openembedded.dev
> Revision: 76d408008f1f7528f07e505cb8346d8d4b239d12
> ViewMTN:
> http://monotone.openembedded.org/revision/info/76d408008f1f7528f07e505cb8346d8d4b239d12
> Files: 1
> packages/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch
> packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> packages/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> Diffs:
> 
> #
> # mt diff -rd0de4044d1bae905c2f30dd83d3f5bab85b3f52d
> -r76d408008f1f7528f07e505cb8346d8d4b239d12 #
> # 
> # 
> # patch "packages/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch"
> #  from [c624f83ac8b14092c184c051137a6dadd55508a6]
> #    to [ddbc1887bea6b823a043d3ded7f4d0e559b20437]
> # 
> # patch "packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb"
> #  from [9ec0920876981474a325a47766fa7d50bbb1cfd3]
> #    to [054d2acb3ff8284167043e5554633713ebdba2cf]
> # 
> # patch "packages/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb"
> #  from [f248fbf9a457e0555c36e5377bc412ced8f568db]
> #    to [53716efd0be08661e891166feef9298502f1ff73]
> # 
> ============================================================
> --- packages/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch
> c624f83ac8b14092c184c051137a6dadd55508a6 +++
> packages/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch
> ddbc1887bea6b823a043d3ded7f4d0e559b20437 @@ -1,13 +1,6 @@ ----
> - arfile.py |  124
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> - ipkg.py   |  106
> ++++++++++++++++++++++++++---------------------------
> - setup.py  |    2 -
> - 3 files changed, 177 insertions(+), 55 deletions(-)
> -
> -Index: ipkg-utils/arfile.py
> -===================================================================
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ ipkg-utils/arfile.py	2007-05-26 23:46:59.000000000 +0100
> +diff -r 720080c24d2f arfile.py
> +--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
> ++++ b/arfile.py	Sun Jan 27 23:26:35 2008 +0200
>  @@ -0,0 +1,124 @@
>  +"""
>  +arfile - A module to parse GNU ar archives.
> @@ -133,23 +126,10 @@ Index: ipkg-utils/arfile.py
>  +
>  +        f2 = tarf.extractfile("control")
>  +        print f2.read()
> -Index: ipkg-utils/setup.py
> -===================================================================
> ---- ipkg-utils.orig/setup.py	2007-05-26 23:45:55.000000000
> +0100 -+++ ipkg-utils/setup.py	2007-05-26 23:46:59.000000000
> +0100 -@@ -16,6 +16,6 @@ distutils.core.setup( name = 'ipkg-utils
> - 		      platforms = 'POSIX',
> - 		      keywords = 'ipkg familiar',
> -                       url =
> 'http://www.handhelds.org/sources.html/', --
> py_modules = [ 'ipkg' ], -+                      py_modules =
> [ 'ipkg', 'arfile' ],
> - 		      scripts = ['ipkg-compare-indexes',
> 'ipkg-make-index', 'ipkg-update-index', 'ipkg-build', 'ipkg-unbuild',
> 'ipkg-upload']
> -                       )
> -Index: ipkg-utils/ipkg.py
> -===================================================================
> ---- ipkg-utils.orig/ipkg.py	2007-05-26 23:46:55.000000000
> +0100 -+++ ipkg-utils/ipkg.py	2007-05-26 23:45:20.000000000
> +0100 -@@ -41,6 +41,8 @@ import re
> +diff -r 720080c24d2f ipkg.py
> +--- a/ipkg.py	Sun Jan 27 23:13:26 2008 +0200
> ++++ b/ipkg.py	Sun Jan 27 23:26:35 2008 +0200
> +@@ -41,6 +41,8 @@ import string
>   import string
>   import commands
>   from stat import ST_SIZE
> @@ -158,7 +138,7 @@ Index: ipkg-utils/ipkg.py
>   
>   class Version:
>       """A class for holding parsed package version information."""
> -@@ -131,78 +133,61 @@ class Package:
> +@@ -131,77 +133,61 @@ class Package:
>   	self.section = None
>           self.filename_header = None
>   	self.file_list = []
> @@ -198,8 +178,6 @@ Index: ipkg-utils/ipkg.py
>  -            self.size = stat[ST_SIZE]
>  +
>               self.filename = os.path.basename(fn)
> -+            assert self.isdeb == 1, "Old ipk format (non-deb) is
> unsupported" -+
>   	    ## sys.stderr.write("  extracting control.tar.gz from
> %s\n"% (fn,)) 
>  -            if self.isdeb:
>  -                control = os.popen("ar p "+fn+" control.tar.gz |
> tar xfzO - './control'","r") @@ -227,15 +205,18 @@ Index:
> ipkg-utils/ipkg.py
>  -                            self.__dict__[name] = value
>  -                else:
>  -                    line = control.readline()
> ++	    if self.isdeb:
> ++        	ar = arfile.ArFile(f)
> ++        	tarStream = ar.open("control.tar.gz")
> ++        	tarf = tarfile.open("control.tar.gz", "r",
> tarStream) +
> -+            ar = arfile.ArFile(f)
> -+            tarStream = ar.open("control.tar.gz")
> -+            tarf = tarfile.open("control.tar.gz", "r", tarStream)
> ++        	try:
> ++        	    control = tarf.extractfile("control")
> ++        	except KeyError:
> ++        	    control = tarf.extractfile("./control")
> ++	    else:
> ++		control = os.popen("tar --wildcards -xzO -f " + fn
> + " '*control.tar.gz' | tar xfzO - './control'", "r") +
> -+            try:
> -+        	control = tarf.extractfile("control")
> -+            except KeyError:
> -+        	control = tarf.extractfile("./control")
>  +            self.read_control(control)
>               control.close()
>  -            if self.isdeb:
> @@ -251,7 +232,7 @@ Index: ipkg-utils/ipkg.py
>   	self.scratch_dir = None
>   	self.file_dir = None
>   	self.meta_dir = None
> - 
> ++
>  +    def __getattr__(self, name):
>  +        if name == "md5":
>  +            self._computeFileMD5()
> @@ -269,11 +250,10 @@ Index: ipkg-utils/ipkg.py
>  +            sum.update(data)
>  +        f.close()
>  +        self.md5 = sum.hexdigest()
> -+
> + 
>       def read_control(self, control):
>           import os
> - 
> -@@ -221,9 +203,15 @@ class Package:
> +@@ -221,9 +207,15 @@ class Package:
>                       value = value + '\n' + line
>                   if name == 'size':
>                       self.size = int(value)
> @@ -290,20 +270,43 @@ Index: ipkg-utils/ipkg.py
>                       return # consumes one blank line at end of
> package descriptoin else:
>                   line = control.readline()
> -@@ -314,6 +302,16 @@ class Package:
> +@@ -314,7 +306,27 @@ class Package:
>   	return self.section
>   
>       def get_file_list(self):
> +-	return self.file_list
>  +        if not self.fn:
>  +            return []
> -+        f = open(self.fn, "rb")
> -+        ar = arfile.ArFile(f)
> -+        tarStream = ar.open("data.tar.gz")
> -+        tarf = tarfile.open("data.tar.gz", "r", tarStream)
> -+        self.file_list = tarf.getnames()
> ++	
> ++	if self.isdeb:
> ++    	    f = open(self.fn, "rb")
> ++    	    ar = arfile.ArFile(f)
> ++    	    tarStream = ar.open("data.tar.gz")
> ++    	    tarf = tarfile.open("data.tar.gz", "r", tarStream)
> ++    	    self.file_list = tarf.getnames()
> ++    	    f.close()
> ++	else:
> ++            f = os.popen("tar xfzO " + self.fn + " '*data.tar.gz' |
> tar tfz -","r") ++            while 1: 
> ++                line = f.readline() 
> ++                if not line: break 
> ++                self.file_list.append(string.rstrip(line)) 
> ++            f.close() 
> ++
> ++        # Make sure that filelist has consistent format regardless
> of tar version
>  +        self.file_list = map(lambda a: ["./",
> ""][a.startswith("./")] + a, self.file_list) -+
> -+        f.close()
> - 	return self.file_list
> ++        return self.file_list
>   
>       def write_package(self, dirname):
> +         buf = self.render_control()
> +diff -r 720080c24d2f setup.py
> +--- a/setup.py	Sun Jan 27 23:13:26 2008 +0200
> ++++ b/setup.py	Sun Jan 27 23:26:35 2008 +0200
> +@@ -16,6 +16,6 @@ distutils.core.setup( name = 'ipkg-utils
> + 		      platforms = 'POSIX',
> + 		      keywords = 'ipkg familiar',
> +                       url =
> 'http://www.handhelds.org/sources.html/', +-
> py_modules = [ 'ipkg' ], ++                      py_modules =
> [ 'ipkg', 'arfile' ],
> + 		      scripts = ['ipkg-compare-indexes',
> 'ipkg-make-index', 'ipkg-update-index', 'ipkg-build', 'ipkg-unbuild',
> 'ipkg-upload']
> +                       )
> ============================================================
> --- packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> 9ec0920876981474a325a47766fa7d50bbb1cfd3 +++
> packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> 054d2acb3ff8284167043e5554633713ebdba2cf @@ -1,7 +1,7 @@ RDEPENDS =
> "" require ipkg-utils_${PV}.bb 
>  RDEPENDS = ""
> -PR = "r15"
> +PR = "r16"
>  
>  inherit native
>  
> ============================================================
> --- packages/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> f248fbf9a457e0555c36e5377bc412ced8f568db +++
> packages/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> 53716efd0be08661e891166feef9298502f1ff73 @@ -5,7 +5,7 @@ SRCDATE =
> "20050404" CONFLICTS = "ipkg-link" RDEPENDS = "python"
>  SRCDATE = "20050404"
> -PR = "r17"
> +PR = "r18"
>  
>  SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
>             file://ipkg-utils-fix.patch;patch=1 \
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


