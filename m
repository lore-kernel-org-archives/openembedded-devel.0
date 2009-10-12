Received: from [209.85.218.227] (helo=mail-bw0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1MxKAI-0004Rm-Bp
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Oct 2009 14:38:17 +0200
Received: by bwz27 with SMTP id 27so1923027bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2009 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=Xf18Vnr4tHop8r9TNgdWfmlxwYOB7sZphrq2EHRw/jU=;
	b=nH5sb1sSI6N8F+Avyq4Oj4TdAoDbOXEFXvTVswdsFkxwrJFa/f5iItC7FVc+gnipEa
	tXsDk5O/AvwnhtU4wQpb8O9ueQw3McHFH1qzR+BqlQFMLHYKwwy9oMJXIOq5wv34dKzz
	zJ4PVZmSXvgFcUxLbSc5VRtxLV/R0pM+ZwELc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=NA1//EslpqxbhlS1AVVPXo++CM9fq82HvEkNK21MsvnOofy7AY6Dsgo1Fa3ensi3II
	XMUsCA46ZAuYzO0jAjTvL7eMzepRPg19Q3jiFMbTFrNwSK+DgJ3TEqwdLDQz6+ckAjpI
	KA8fTDGwZV4F2jkMkv+NPaQbmRMRJNqD4M7Mk=
MIME-Version: 1.0
Received: by 10.223.2.196 with SMTP id 4mr1493147fak.3.1255351039987; Mon, 12 
	Oct 2009 05:37:19 -0700 (PDT)
Date: Mon, 12 Oct 2009 12:37:19 +0000
Message-ID: <fca63bcf0910120537n73c7a9dveb742edf1f75542d@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.227
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: patch: lighttpd runtime issues; lighttpd ssl version;
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
X-List-Received-Date: Mon, 12 Oct 2009 12:38:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Maybe someone can integrate it into the .dev tree.

Subject: [PATCH] lighttpd 1.4.18: Fixed dependency on modules; Added
ssl version;
   - lighttpd-module-access and lighttpd-module-accesslog added to
RDEPENDS as the shipped config loads them.
   - Added lighttpd-ssl recipce that compiles with openssl support and
adds a self signed cert on install.

---
 recipes/lighttpd/lighttpd-ssl/configure.in.patch   |   34 ++
 recipes/lighttpd/lighttpd-ssl/index.html           |    1 +
 recipes/lighttpd/lighttpd-ssl/lighttpd             |   34 ++
 recipes/lighttpd/lighttpd-ssl/lighttpd.cnf         |   57 ++++
 recipes/lighttpd/lighttpd-ssl/lighttpd.conf        |  331 ++++++++++++++++++++
 recipes/lighttpd/lighttpd-ssl/mod_redirect.c.patch |   56 ++++
 recipes/lighttpd/lighttpd-ssl/src-server.c.patch   |   25 ++
 recipes/lighttpd/lighttpd-ssl_1.4.18.bb            |   29 ++
 8 files changed, 567 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lighttpd/lighttpd-ssl/configure.in.patch
 create mode 100644 recipes/lighttpd/lighttpd-ssl/index.html
 create mode 100644 recipes/lighttpd/lighttpd-ssl/lighttpd
 create mode 100644 recipes/lighttpd/lighttpd-ssl/lighttpd.cnf
 create mode 100644 recipes/lighttpd/lighttpd-ssl/lighttpd.conf
 create mode 100644 recipes/lighttpd/lighttpd-ssl/mod_redirect.c.patch
 create mode 100644 recipes/lighttpd/lighttpd-ssl/src-server.c.patch
 create mode 100755 recipes/lighttpd/lighttpd-ssl_1.4.18.bb

diff --git a/recipes/lighttpd/lighttpd-ssl/configure.in.patch
b/recipes/lighttpd/lighttpd-ssl/configure.in.patch
new file mode 100644
index 0000000..772103c
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/configure.in.patch
@@ -0,0 +1,34 @@
+Index: lighttpd-1.4.13/configure.in
+===================================================================
+--- lighttpd-1.4.13.orig/configure.in	2006-10-09 18:19:34.000000000 +0200
++++ lighttpd-1.4.13/configure.in	2007-02-13 18:42:34.000000000 +0100
+@@ -250,23 +250,23 @@
+     [WITH_PCRE=$withval],[WITH_PCRE=yes])
+ AC_MSG_RESULT([$WITH_PCRE])
+
+-if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
++if test "$WITH_PCRE" != "no"; then
+   AC_PATH_PROG(PCRECONFIG, pcre-config)
+
+-  if test x"$PCRECONFIG" != x; then
++#  if test x"$PCRECONFIG" != x; then
+     PCRE_LIB=`$PCRECONFIG --libs`
+     CPPFLAGS="$CPPFLAGS `$PCRECONFIG --cflags`"
+     OLDLIBS="$LIBS"
+     LIBS="$LIBS $PCRE_LIB"
+-    AC_CHECK_LIB(pcre, pcre_compile, [
++#    AC_CHECK_LIB(pcre, pcre_compile, [
+       AC_CHECK_HEADERS([pcre.h], [
+         AC_DEFINE([HAVE_LIBPCRE], [1], [libpcre])
+         AC_DEFINE([HAVE_PCRE_H], [1])
+       ])
+-    ])
++#    ])
+     LIBS="$OLDLIBS"
+-  fi
+-fi
++#  fi
++fi
+
+ AC_SUBST(PCRE_LIB)
+
diff --git a/recipes/lighttpd/lighttpd-ssl/index.html
b/recipes/lighttpd/lighttpd-ssl/index.html
new file mode 100644
index 0000000..cd25bf1
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/index.html
@@ -0,0 +1 @@
+<html><body><h1>It works!</h1></body></html>
\ No newline at end of file
diff --git a/recipes/lighttpd/lighttpd-ssl/lighttpd
b/recipes/lighttpd/lighttpd-ssl/lighttpd
new file mode 100644
index 0000000..82fbaa5
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/lighttpd
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/lighttpd
+NAME=lighttpd
+DESC="Lighttpd Web Server"
+OPTS="-f /etc/lighttpd/lighttpd.conf"
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	sleep 1
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/recipes/lighttpd/lighttpd-ssl/lighttpd.cnf
b/recipes/lighttpd/lighttpd-ssl/lighttpd.cnf
new file mode 100644
index 0000000..1741627
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/lighttpd.cnf
@@ -0,0 +1,57 @@
+#
+# OpenSSL configuration file.
+#
+
+# Establish working directory.
+
+dir                                     = .
+
+[ ca ]
+default_ca                              = CA_default
+
+[ CA_default ]
+default_days                            = 365
+default_md                              = md5
+preserve                                = no
+email_in_dn                             = no
+nameopt                                 = default_ca
+certopt                                 = default_ca
+policy                                  = policy_match
+
+[ policy_match ]
+countryName                             = match
+stateOrProvinceName                     = match
+organizationName                        = match
+organizationalUnitName                  = optional
+commonName                              = supplied
+emailAddress                            = optional
+
+[ req ]
+default_bits                            = 1024                  #
Size of keys
+default_keyfile                         = key.pem               #
name of generated keys
+default_md                              = md5
  # message digest algorithm
+string_mask                             = nombstr               #
permitted characters
+distinguished_name                      = req_distinguished_name
+
+[ req_distinguished_name ]
+# Variable name                         Prompt string
+#-------------------------        ----------------------------------
+0.organizationName                      = Organization Name (company)
+organizationalUnitName                  = Organizational Unit Name
(department, division)
+emailAddress                            = Email Address
+emailAddress_max                        = 40
+localityName                            = Locality Name (city,
district)
+stateOrProvinceName                     = State or Province Name
(full name)
+countryName                             = Country Name (2 letter
code)
+countryName_min                         = 2
+countryName_max                         = 2
+commonName                              = Common Name (hostname, IP,
or your name)
+commonName_max                          = 64
+
+# Default values for the above, for consistency and less typing.
+# Variable name                         Value
+#------------------------         ------------------------------
+0.organizationName_default              = My Company
+localityName_default                    = My Town
+stateOrProvinceName_default             = State or Providence
+countryName_default                     = US
diff --git a/recipes/lighttpd/lighttpd-ssl/lighttpd.conf
b/recipes/lighttpd/lighttpd-ssl/lighttpd.conf
new file mode 100644
index 0000000..c9b1fbe
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/lighttpd.conf
@@ -0,0 +1,331 @@
+# lighttpd configuration file
+#
+# use it as a base for lighttpd 1.0.0 and above
+#
+# $Id: lighttpd.conf,v 1.7 2004/11/03 22:26:05 weigon Exp $
+
+############ Options you really have to take care of ####################
+
+## modules to load
+# at least mod_access and mod_accesslog should be loaded
+# all other module should only be loaded if really neccesary
+# - saves some time
+# - saves memory
+server.modules              = (
+#                               "mod_rewrite",
+#                               "mod_redirect",
+#                               "mod_alias",
+                                "mod_access",
+#                               "mod_cml",
+#                               "mod_trigger_b4_dl",
+#                               "mod_auth",
+#                               "mod_status",
+#                               "mod_setenv",
+#                               "mod_fastcgi",
+#                               "mod_proxy",
+#                               "mod_simple_vhost",
+#                               "mod_evhost",
+#                               "mod_userdir",
+#                               "mod_cgi",
+#                               "mod_compress",
+#                               "mod_ssi",
+#                               "mod_usertrack",
+#                               "mod_expire",
+#                               "mod_secdownload",
+#                               "mod_rrdtool",
+#								"mod_webdav",
+                                "mod_accesslog" )
+
+## a static document-root, for virtual-hosting take look at the
+## server.virtual-* options
+server.document-root        = "/www/pages/"
+
+## where to send error-messages to
+server.errorlog             = "/www/logs/lighttpd.error.log"
+
+# files to check for if .../ is requested
+index-file.names            = ( "index.php", "index.html",
+                                "index.htm", "default.htm" )
+
+## set the event-handler (read the performance section in the manual)
+# server.event-handler = "freebsd-kqueue" # needed on OS X
+
+# mimetype mapping
+mimetype.assign             = (
+  ".pdf"          =>      "application/pdf",
+  ".sig"          =>      "application/pgp-signature",
+  ".spl"          =>      "application/futuresplash",
+  ".class"        =>      "application/octet-stream",
+  ".ps"           =>      "application/postscript",
+  ".torrent"      =>      "application/x-bittorrent",
+  ".dvi"          =>      "application/x-dvi",
+  ".gz"           =>      "application/x-gzip",
+  ".pac"          =>      "application/x-ns-proxy-autoconfig",
+  ".swf"          =>      "application/x-shockwave-flash",
+  ".tar.gz"       =>      "application/x-tgz",
+  ".tgz"          =>      "application/x-tgz",
+  ".tar"          =>      "application/x-tar",
+  ".zip"          =>      "application/zip",
+  ".mp3"          =>      "audio/mpeg",
+  ".m3u"          =>      "audio/x-mpegurl",
+  ".wma"          =>      "audio/x-ms-wma",
+  ".wax"          =>      "audio/x-ms-wax",
+  ".ogg"          =>      "application/ogg",
+  ".wav"          =>      "audio/x-wav",
+  ".gif"          =>      "image/gif",
+  ".jpg"          =>      "image/jpeg",
+  ".jpeg"         =>      "image/jpeg",
+  ".png"          =>      "image/png",
+  ".xbm"          =>      "image/x-xbitmap",
+  ".xpm"          =>      "image/x-xpixmap",
+  ".xwd"          =>      "image/x-xwindowdump",
+  ".css"          =>      "text/css",
+  ".html"         =>      "text/html",
+  ".htm"          =>      "text/html",
+  ".js"           =>      "text/javascript",
+  ".asc"          =>      "text/plain",
+  ".c"            =>      "text/plain",
+  ".cpp"          =>      "text/plain",
+  ".log"          =>      "text/plain",
+  ".conf"         =>      "text/plain",
+  ".text"         =>      "text/plain",
+  ".txt"          =>      "text/plain",
+  ".dtd"          =>      "text/xml",
+  ".xml"          =>      "text/xml",
+  ".mpeg"         =>      "video/mpeg",
+  ".mpg"          =>      "video/mpeg",
+  ".mov"          =>      "video/quicktime",
+  ".qt"           =>      "video/quicktime",
+  ".avi"          =>      "video/x-msvideo",
+  ".asf"          =>      "video/x-ms-asf",
+  ".asx"          =>      "video/x-ms-asf",
+  ".wmv"          =>      "video/x-ms-wmv",
+  ".bz2"          =>      "application/x-bzip",
+  ".tbz"          =>      "application/x-bzip-compressed-tar",
+  ".tar.bz2"      =>      "application/x-bzip-compressed-tar"
+ )
+
+# Use the "Content-Type" extended attribute to obtain mime type if possible
+#mimetype.use-xattr        = "enable"
+
+
+## send a different Server: header
+## be nice and keep it at lighttpd
+# server.tag                 = "lighttpd"
+
+#### accesslog module
+accesslog.filename          = "/www/logs/access.log"
+debug.log-request-handling = "enable"
+
+
+
+
+## deny access the file-extensions
+#
+# ~    is for backupfiles from vi, emacs, joe, ...
+# .inc is often used for code includes which should in general not be part
+#      of the document-root
+url.access-deny             = ( "~", ".inc" )
+
+$HTTP["url"] =~ "\.pdf$" {
+  server.range-requests = "disable"
+}
+
+##
+# which extensions should not be handle via static-file transfer
+#
+# .php, .pl, .fcgi are most often handled by mod_fastcgi or mod_cgi
+static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
+
+######### Options that are good to be but not neccesary to be changed #######
+
+## bind to port (default: 80)
+#server.port                = 81
+
+## bind to localhost (default: all interfaces)
+#server.bind                = "grisu.home.kneschke.de"
+
+## error-handler for status 404
+#server.error-handler-404   = "/error-handler.html"
+#server.error-handler-404   = "/error-handler.php"
+
+## to help the rc.scripts
+#server.pid-file            = "/var/run/lighttpd.pid"
+
+
+###### virtual hosts
+##
+##  If you want name-based virtual hosting add the next three settings and load
+##  mod_simple_vhost
+##
+## document-root =
+##   virtual-server-root + virtual-server-default-host + virtual-server-docroot
+## or
+##   virtual-server-root + http-host + virtual-server-docroot
+##
+#simple-vhost.server-root   = "/home/weigon/wwwroot/servers/"
+#simple-vhost.default-host  = "grisu.home.kneschke.de"
+#simple-vhost.document-root = "/pages/"
+
+
+##
+## Format: <errorfile-prefix><status-code>.html
+## -> ..../status-404.html for 'File not found'
+#server.errorfile-prefix    = "/home/weigon/projects/lighttpd/doc/status-"
+
+## virtual directory listings
+#dir-listing.activate       = "enable"
+
+## enable debugging
+#debug.log-request-header   = "enable"
+#debug.log-response-header  = "enable"
+#debug.log-request-handling = "enable"
+#debug.log-file-not-found   = "enable"
+
+### only root can use these options
+#
+# chroot() to directory (default: no chroot() )
+#server.chroot              = "/"
+
+## change uid to <uid> (default: don't care)
+#server.username            = "wwwrun"
+
+## change uid to <uid> (default: don't care)
+#server.groupname           = "wwwrun"
+
+#### compress module
+#compress.cache-dir         = "/tmp/lighttpd/cache/compress/"
+#compress.filetype          = ("text/plain", "text/html")
+
+#### proxy module
+## read proxy.txt for more info
+#proxy.server               = ( ".php" =>
+#                               ( "localhost" =>
+#                                 (
+#                                   "host" => "192.168.0.101",
+#                                   "port" => 80
+#                                 )
+#                               )
+#                             )
+
+#### fastcgi module
+## read fastcgi.txt for more info
+## for PHP don't forget to set cgi.fix_pathinfo = 1 in the php.ini
+#fastcgi.server             = ( ".php" =>
+#                               ( "localhost" =>
+#                                 (
+#                                   "socket" => "/tmp/php-fastcgi.socket",
+#                                   "bin-path" => "/usr/local/bin/php"
+#                                 )
+#                               )
+#                            )
+
+#### CGI module
+#cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
+#                               ".cgi" => "/usr/bin/perl" )
+#
+
+#### SSL engine
+$SERVER["socket"] == "0.0.0.0:443" {
+	ssl.engine                 = "enable"
+	ssl.pemfile                = "/etc/ssl/server.pem"
+}
+
+
+#### status module
+#status.status-url          = "/server-status"
+#status.config-url          = "/server-config"
+
+#### auth module
+## read authentication.txt for more info
+#auth.backend               = "plain"
+#auth.backend.plain.userfile = "lighttpd.user"
+#auth.backend.plain.groupfile = "lighttpd.group"
+
+#auth.backend.ldap.hostname = "localhost"
+#auth.backend.ldap.base-dn  = "dc=my-domain,dc=com"
+#auth.backend.ldap.filter   = "(uid=$)"
+
+#auth.require               = ( "/server-status" =>
+#                               (
+#                                 "method"  => "digest",
+#                                 "realm"   => "download archiv",
+#                                 "require" => "user=jan"
+#                               ),
+#                               "/server-config" =>
+#                               (
+#                                 "method"  => "digest",
+#                                 "realm"   => "download archiv",
+#                                 "require" => "valid-user"
+#                               )
+#                             )
+
+#### url handling modules (rewrite, redirect, access)
+#url.rewrite                = ( "^/$"             => "/server-status" )
+#url.redirect               = ( "^/wishlist/(.+)" => "http://www.123.org/$1" )
+
+#### both rewrite/redirect support back reference to regex conditional using %n
+#$HTTP["host"] =~ "^www\.(.*)" {
+#  url.redirect            = ( "^/(.*)" => "http://%1/$1" )
+#}
+
+#
+# define a pattern for the host url finding
+# %% => % sign
+# %0 => domain name + tld
+# %1 => tld
+# %2 => domain name without tld
+# %3 => subdomain 1 name
+# %4 => subdomain 2 name
+#
+#evhost.path-pattern        = "/home/storage/dev/www/%3/htdocs/"
+
+#### expire module
+#expire.url                 = ( "/buggy/" => "access 2 hours",
"/asdhas/" => "access plus 1 seconds 2 minutes")
+
+#### ssi
+#ssi.extension              = ( ".shtml" )
+
+#### rrdtool
+#rrdtool.binary             = "/usr/bin/rrdtool"
+#rrdtool.db-name            = "/var/www/lighttpd.rrd"
+
+#### setenv
+#setenv.add-request-header  = ( "TRAV_ENV" => "mysql://user@host/db" )
+#setenv.add-response-header = ( "X-Secret-Message" => "42" )
+
+## for mod_trigger_b4_dl
+# trigger-before-download.gdbm-filename = "/home/weigon/testbase/trigger.db"
+# trigger-before-download.memcache-hosts = ( "127.0.0.1:11211" )
+# trigger-before-download.trigger-url = "^/trigger/"
+# trigger-before-download.download-url = "^/download/"
+# trigger-before-download.deny-url = "http://127.0.0.1/index.html"
+# trigger-before-download.trigger-timeout = 10
+
+## for mod_cml
+## don't forget to add index.cml to server.indexfiles
+# cml.extension               = ".cml"
+# cml.memcache-hosts          = ( "127.0.0.1:11211" )
+
+#### variable usage:
+## variable name without "." is auto prefixed by "var." and becomes "var.bar"
+#bar = 1
+#var.mystring = "foo"
+
+## integer add
+#bar += 1
+## string concat, with integer cast as string, result: "www.foo1.com"
+#server.name = "www." + mystring + var.bar + ".com"
+## array merge
+#index-file.names = (foo + ".php") + index-file.names
+#index-file.names += (foo + ".php")
+
+#### include
+#include /etc/lighttpd/lighttpd-inc.conf
+## same as above if you run: "lighttpd -f /etc/lighttpd/lighttpd.conf"
+#include "lighttpd-inc.conf"
+
+#### include_shell
+#include_shell "echo var.a=1"
+## the above is same as:
+#var.a=1
diff --git a/recipes/lighttpd/lighttpd-ssl/mod_redirect.c.patch
b/recipes/lighttpd/lighttpd-ssl/mod_redirect.c.patch
new file mode 100644
index 0000000..7bbdf32
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/mod_redirect.c.patch
@@ -0,0 +1,56 @@
+Backport support for url.redirect-code directive from 1.5 branch.
+
+diff -urN lighttpd-1.4.18.orig/src/mod_redirect.c
lighttpd-1.4.18/src/mod_redirect.c
+--- lighttpd-1.4.18.orig/src/mod_redirect.c	2007-04-10 09:52:58.000000000 +0200
++++ lighttpd-1.4.18/src/mod_redirect.c	2008-06-11 17:38:50.000000000 +0200
+@@ -16,6 +16,8 @@
+ typedef struct {
+ 	pcre_keyvalue_buffer *redirect;
+ 	data_config *context; /* to which apply me */
++
++	unsigned short redirect_code;
+ } plugin_config;
+
+ typedef struct {
+@@ -72,6 +74,7 @@
+
+ 	config_values_t cv[] = {
+ 		{ "url.redirect",               NULL, T_CONFIG_LOCAL,
T_CONFIG_SCOPE_CONNECTION }, /* 0 */
++		{ "url.redirect-code",          NULL, T_CONFIG_SHORT,
T_CONFIG_SCOPE_CONNECTION }, /* 1 */
+ 		{ NULL,                         NULL, T_CONFIG_UNSET, T_CONFIG_SCOPE_UNSET }
+ 	};
+
+@@ -90,6 +93,7 @@
+ 		s->redirect   = pcre_keyvalue_buffer_init();
+
+ 		cv[0].destination = s->redirect;
++		cv[1].destination = &(s->redirect_code);
+
+ 		p->config_storage[i] = s;
+ 		ca = ((data_config *)srv->config_context->data[i])->value;
+@@ -140,6 +144,7 @@
+ 	plugin_config *s = p->config_storage[0];
+
+ 	p->conf.redirect = s->redirect;
++	p->conf.redirect_code = s->redirect_code;
+ 	p->conf.context = NULL;
+
+ 	/* skip the first, the global context */
+@@ -157,6 +162,8 @@
+ 			if (0 == strcmp(du->key->ptr, "url.redirect")) {
+ 				p->conf.redirect = s->redirect;
+ 				p->conf.context = dc;
++			} else if (0 == strcmp(du->key->ptr, "url.redirect-code")) {
++				p->conf.redirect_code = s->redirect_code;
+ 			}
+ 		}
+ 	}
+@@ -250,7 +257,7 @@
+
+ 			response_header_insert(srv, con, CONST_STR_LEN("Location"),
CONST_BUF_LEN(p->location));
+
+-			con->http_status = 301;
++			con->http_status = p->conf.redirect_code > 99 &&
p->conf.redirect_code < 1000 ? p->conf.redirect_code : 301;
+ 			con->file_finished = 1;
+
+ 			return HANDLER_FINISHED;
diff --git a/recipes/lighttpd/lighttpd-ssl/src-server.c.patch
b/recipes/lighttpd/lighttpd-ssl/src-server.c.patch
new file mode 100644
index 0000000..dbf614b
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl/src-server.c.patch
@@ -0,0 +1,25 @@
+upstream: http://trac.lighttpd.net/trac/ticket/1402
+status: pending
+
+--- lighttpd/src/server.c.orig	2006-03-04 09:12:17.000000000 -0800
++++ lighttpd/src/server.c	2006-07-11 09:16:28.000000000 -0700
+@@ -1174,8 +1174,8 @@
+ 		if (srv->sockets_disabled) {
+ 			/* our server sockets are disabled, why ? */
+
+-			if ((srv->cur_fds + srv->want_fds < srv->max_fds * 0.8) && /* we
have enough unused fds */
+-			    (srv->conns->used < srv->max_conns * 0.9) &&
++			if ((srv->cur_fds + srv->want_fds < srv->max_fds * 8 / 10) && /*
we have enough unused fds */
++			    (srv->conns->used < srv->max_conns * 9 / 10) &&
+ 			    (0 == graceful_shutdown)) {
+ 				for (i = 0; i < srv->srv_sockets.used; i++) {
+ 					server_socket *srv_socket = srv->srv_sockets.ptr[i];
+@@ -1187,7 +1187,7 @@
+ 				srv->sockets_disabled = 0;
+ 			}
+ 		} else {
+-			if ((srv->cur_fds + srv->want_fds > srv->max_fds * 0.9) || /* out of fds */
++			if ((srv->cur_fds + srv->want_fds > srv->max_fds * 9 / 10) || /*
out of fds */
+ 			    (srv->conns->used > srv->max_conns) || /* out of connections */
+ 			    (graceful_shutdown)) { /* graceful_shutdown */
+
diff --git a/recipes/lighttpd/lighttpd-ssl_1.4.18.bb
b/recipes/lighttpd/lighttpd-ssl_1.4.18.bb
new file mode 100755
index 0000000..0116ad4
--- /dev/null
+++ b/recipes/lighttpd/lighttpd-ssl_1.4.18.bb
@@ -0,0 +1,29 @@
+require lighttpd.inc
+DEPENDS+="openssl"
+RDEPENDS_${PN} += " \
+                   openssl \
+                  "
+PR = "${INC_PR}.0"
+SRC_URI += "file://configure.in.patch;patch=1 \
+	    file://mod_redirect.c.patch;patch=1 \
+	    file://src-server.c.patch;patch=1 \
+            file://lighttpd.cnf \
+           "
+
+S="${WORKDIR}/lighttpd-${PV}"
+
+EXTRA_OECONF += " \
+                 --with-openssl \
+                 --with-openssl-libs=${STAGING_LIBDIR} \
+"
+
+do_install_append() {
+	install -d 0644 ${D}${sysconfdir}/ssl
+	install -m 0755 ${WORKDIR}/lighttpd.cnf ${D}${sysconfdir}/lighttpd/
+}
+
+pkg_postinst_${PN} () {
+	openssl req -new -x509 -batch -days 365 -nodes -keyout
/etc/ssl/server.pem -out /etc/ssl/server.pem -config
/etc/lighttpd/lighttpd.cnf
+	/etc/init.d/lighttpd restart
+}
+
-- 
1.6.4.4


