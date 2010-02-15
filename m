Received: from [65.126.90.84] (helo=mail.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jgilles@multitech.com>) id 1Nh6vt-00056a-Hh
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 20:48:40 +0100
X-Ninja-AntiSpoofing: spoofed
Received: from [192.168.52.197] ([192.168.52.197]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.6713); Mon, 15 Feb 2010 13:45:45 -0600
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1266262558.32499.31.camel@jjg-linux>
References: <1266262558.32499.31.camel@jjg-linux>
Date: Mon, 15 Feb 2010 13:45:58 -0600
Message-Id: <1266263158.32499.37.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 15 Feb 2010 19:45:45.0988 (UTC)
	FILETIME=[7754FC40:01CAAE77]
X-SA-Exim-Connect-IP: 65.126.90.84
X-SA-Exim-Mail-From: jgilles@multitech.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] ruby: fix 1.8.7-p248 compile
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
X-List-Received-Date: Mon, 15 Feb 2010 19:48:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

* Update ruby library path so extensions needing mkmf can build and
  find the right ruby headers.  Fixes building of ext/dl.

diff --git a/recipes/ruby/files/extmk.patch b/recipes/ruby/files/extmk.patch
new file mode 100644
index 0000000..8b68450
--- /dev/null
+++ b/recipes/ruby/files/extmk.patch
@@ -0,0 +1,13 @@
+diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
+--- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
++++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
+@@ -354,8 +354,8 @@
+   $ruby = '$(topdir)/miniruby' + EXEEXT
+ end
+ $ruby << " -I'$(topdir)'"
++$ruby << " -I'$(top_srcdir)/lib'"
+ unless CROSS_COMPILING
+-  $ruby << " -I'$(top_srcdir)/lib'"
+   $ruby << " -I'$(extout)/$(arch)' -I'$(extout)/common'" if $extout
+   $ruby << " -I./- -I'$(top_srcdir)/ext' -rpurelib.rb"
+   ENV["RUBYLIB"] = "-"
diff --git a/recipes/ruby/ruby_1.8.7-p248.bb b/recipes/ruby/ruby_1.8.7-p248.bb
index 8d95373..827327b 100644
--- a/recipes/ruby/ruby_1.8.7-p248.bb
+++ b/recipes/ruby/ruby_1.8.7-p248.bb
@@ -2,6 +2,7 @@ require ruby.inc
 DEPENDS = "ruby-native zlib openssl"
 SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://extmk_run.patch;patch=1 \
+           file://extmk.patch;patch=1 \
 "
 FILES_${PN}-dbg += "${libdir}/ruby/1.8/*/.debug \
                     ${libdir}/ruby/1.8/*/*/.debug"

On Mon, 2010-02-15 at 13:35 -0600, Jesse Gilles wrote:
> Hi all,
> 
> I am new to the mailing list and I have a couple of patches to
> contribute.
> 
> This fixes SSL support for python 2.6.  Looks like the python module for
> SSL was missing from the package.
> 
> Thanks,
> Jesse
> 
> * Add SSL module to build -- fixes "import ssl"
> 
> diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
> index fe0e385..890d1c0 100755
> --- a/contrib/python/generate-manifest-2.6.py
> +++ b/contrib/python/generate-manifest-2.6.py
> @@ -248,7 +248,7 @@ if __name__ == "__main__":
>  
>      m.addPackage( "python-io", "Python Low-Level I/O", "python-core python-math",
>      "lib-dynload/_socket.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
> -    "pipes.* socket.* tempfile.* StringIO.* " )
> +    "pipes.* socket.* ssl.* tempfile.* StringIO.* " )
>  
>      m.addPackage( "python-json", "Python JSON Support", "python-core python-math python-re",
>      "json" ) # package
> diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
> index cee12c8..188ee31 100644
> --- a/recipes/python/python-2.6-manifest.inc
> +++ b/recipes/python/python-2.6-manifest.inc
> @@ -51,7 +51,7 @@ FILES_python-core="${libdir}/python2.6/__future__.* ${libdir}/python2.6/_abcoll.
>  
>  DESCRIPTION_python-io="Python Low-Level I/O"
>  RDEPENDS_python-io="python-core python-math"
> -FILES_python-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
> +FILES_python-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/ssl.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
>  
>  DESCRIPTION_python-compiler="Python Compiler Support"
>  RDEPENDS_python-compiler="python-core"
> diff --git a/recipes/python/python.inc b/recipes/python/python.inc
> index 7e61f79..aff18db 100644
> --- a/recipes/python/python.inc
> +++ b/recipes/python/python.inc
> @@ -4,7 +4,7 @@ LICENSE = "PSF"
>  SECTION = "devel/python"
>  PRIORITY = "optional"
>  # bump this on every change in contrib/python/generate-manifest-2.6.py
> -INC_PR = "ml8"
> +INC_PR = "ml9"
>  
>  DEFAULT_PREFERENCE = "-26"
>  	
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



