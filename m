Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1N2h4w-0004F6-8Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 09:06:57 +0100
Received: by fg-out-1718.google.com with SMTP id d23so131595fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:message-id:date:from
	:user-agent:mime-version:to:cc:subject:content-type;
	bh=uYU4X5d8Rb2WwkKAGI75Dl0DLGqI0XHzgC1vf9KLRIo=;
	b=ZySJmUHv5ocy/qT/ieIjunPtOUdY/q2rbsEH0pd2zmKXI1lBzMaKmWvQHwWCqoTlbB
	FyZepXp6xravQse+89CqpcGbgRDi2c+DIC+CAW2KVGNGP8VRGNhgkVG8WhvBv5Pcm91c
	4fRFOWU3TNVAmjR70wKGlweVY8BMdKkYXTw+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type;
	b=NdTRKebxjqZzEhan+aK5DAtOd0nPJ6tTG7aF7ezp8fmY56WtqtWmayvfEqF9nuPnft
	TlyKXSKctq3URk87Msj7kCIpXzSAvh+aR6ZVjKvqf+WleIaPmFeyp16JWrc5Q0W+d4Yl
	wSfLeNo8/EKEYErfL7cvScWOwLK5D8Vo6y8OA=
Received: by 10.86.16.9 with SMTP id 9mr9154419fgp.8.1256630750679;
	Tue, 27 Oct 2009 01:05:50 -0700 (PDT)
Received: from ?192.168.1.110? (pat35-2-82-240-215-236.fbx.proxad.net
	[82.240.215.236])
	by mx.google.com with ESMTPS id 4sm3845361fge.4.2009.10.27.01.05.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 27 Oct 2009 01:05:50 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
Message-ID: <4AE6A9B7.4050100@devlife.org>
Date: Tue, 27 Oct 2009 08:05:11 +0000
From: Camille Moncelier <moncelier@devlife.org>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: opkg-devel@googlegroups.com
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Add ssl support to curl in opkg
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
X-List-Received-Date: Tue, 27 Oct 2009 08:06:57 -0000
Content-Type: multipart/mixed; boundary="------------010907080003080609050106"

--------------010907080003080609050106
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch adds to opkg several option which allows to
configure curl to use openssl autenticate an https session.

The client when downloading packages will be able to verify
the sever signature, authenticate itself, via certificates on
disk or on a smartcard.

# example opkg.conf settings

option ssl_ca_path /etc/ssl/certs
option ssl_key_type ENG

option ssl_cert_type PEM
option ssl_cert /etc/opkg/client.pem

option ssl_engine pkcs11

diff --git a/configure.ac b/configure.ac
index 4346373..2e17b70 100644
--- a/configure.ac
+++ b/configure.ac
@@ -37,6 +37,22 @@ if test "x$want_curl" = "xyes"; then
   AC_DEFINE(HAVE_CURL, 1, [Define if you want CURL support])
 fi
 
+# check for libssl-curl
+AC_ARG_ENABLE(ssl-curl,
+              AC_HELP_STRING([--enable-ssl-curl], [Enable certificate authentication with curl
+                              [[default=yes]] ]),
+                              [want_sslcurl="$enableval"], [want_sslcurl="yes"])
+
+if test "x$want_sslcurl" = "xyes"; then
+  PKG_CHECK_MODULES(OPENSSL, openssl)
+  PKG_CHECK_MODULES(CURL, libcurl)
+  AC_DEFINE(HAVE_CURL, 1, [Define if you want CURL support])
+  AC_DEFINE(HAVE_SSLCURL, 1, [Define if you want certificate authentication with curl])
+  OPENSSL_LIBS="-lssl -lcrypto"
+fi
+AC_SUBST(OPENSSL_LIBS)
+
+
 
 dnl **********
 dnl GPGME
diff --git a/libopkg/Makefile.am b/libopkg/Makefile.am
index 0e9d3a9..8fca9ac 100644
--- a/libopkg/Makefile.am
+++ b/libopkg/Makefile.am
@@ -36,7 +36,7 @@ libopkg_la_SOURCES = \
 	$(opkg_cmd_sources) $(opkg_db_sources) \
 	$(opkg_util_sources) $(opkg_list_sources)
 
-libopkg_la_LIBADD = $(top_builddir)/libbb/libbb.la $(CURL_LIBS) $(GPGME_LIBS)
+libopkg_la_LIBADD = $(top_builddir)/libbb/libbb.la $(CURL_LIBS) $(GPGME_LIBS) $(OPENSSL_LIBS)
 # make sure we only export symbols that are for public use
 libopkg_la_LDFLAGS = -export-symbols-regex "^opkg_.*"
 
diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
index 4d1306e..8ef63ad 100644
--- a/libopkg/opkg_conf.c
+++ b/libopkg/opkg_conf.c
@@ -75,6 +75,17 @@ int opkg_init_options_array(const opkg_conf_t *conf, opkg_option_t **options)
 	  { "proxy_user", OPKG_OPT_TYPE_STRING, &conf->proxy_user },
 	  { "query-all", OPKG_OPT_TYPE_BOOL, &conf->query_all },
 	  { "verbosity", OPKG_OPT_TYPE_BOOL, &conf->verbosity },
+#if defined(HAVE_SSLCURL) && defined(HAVE_CURL)
+          { "ssl_engine", OPKG_OPT_TYPE_STRING, &conf->ssl_engine },
+          { "ssl_cert", OPKG_OPT_TYPE_STRING, &conf->ssl_cert },
+          { "ssl_cert_type", OPKG_OPT_TYPE_STRING, &conf->ssl_cert_type },
+          { "ssl_key", OPKG_OPT_TYPE_STRING, &conf->ssl_key },
+          { "ssl_key_type", OPKG_OPT_TYPE_STRING, &conf->ssl_key_type },
+          { "ssl_key_passwd", OPKG_OPT_TYPE_STRING, &conf->ssl_key_passwd },
+          { "ssl_ca_file", OPKG_OPT_TYPE_STRING, &conf->ssl_ca_file },
+          { "ssl_ca_path", OPKG_OPT_TYPE_STRING, &conf->ssl_ca_path },
+          { "ssl_dont_verify_peer", OPKG_OPT_TYPE_BOOL, &conf->ssl_dont_verify_peer },
+#endif
 	  { NULL }
      };
 
diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
index ca2661b..7e16d13 100644
--- a/libopkg/opkg_conf.h
+++ b/libopkg/opkg_conf.h
@@ -75,6 +75,22 @@ struct opkg_conf
      int noaction;
      char *cache;
 
+#ifdef HAVE_SSLCURL
+     /* some options could be used by
+      * wget if curl support isn't builtin
+      * If someone want to try...
+      */
+     char *ssl_engine;
+     char *ssl_cert;
+     char *ssl_cert_type;
+     char *ssl_key;
+     char *ssl_key_type;
+     char *ssl_key_passwd;
+     char *ssl_ca_file;
+     char *ssl_ca_path;
+     int ssl_dont_verify_peer;
+#endif
+
      /* proxy options */
      char *http_proxy;
      char *ftp_proxy;
diff --git a/libopkg/opkg_download.c b/libopkg/opkg_download.c
index f185f22..d2ff04b 100644
--- a/libopkg/opkg_download.c
+++ b/libopkg/opkg_download.c
@@ -20,10 +20,15 @@
 #ifdef HAVE_CURL
 #include <curl/curl.h>
 #endif
+
 #ifdef HAVE_GPGME
 #include <gpgme.h>
 #endif
 
+#ifdef HAVE_SSLCURL
+#include <openssl/conf.h>
+#endif
+
 #include "includes.h"
 #include "opkg_download.h"
 #include "opkg_message.h"
@@ -84,6 +89,11 @@ int opkg_download(opkg_conf_t *conf, const char *src,
     CURLcode res;
     FILE * file = fopen (tmp_file_location, "w");
 
+#ifdef HAVE_SSLCURL
+    static char openssl_init = 0;
+#endif
+
+
     curl = curl_easy_init ();
     if (curl)
     {
@@ -105,6 +115,85 @@ int opkg_download(opkg_conf_t *conf, const char *src,
 	    curl_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
 	    free (userpwd);
 	}
+#ifdef HAVE_SSLCURL
+	if (conf->ssl_engine) {
+
+	    /* Tels openssl to read it's configuration if not already 
+	     * done
+	     */
+	    if(!openssl_init){
+		OPENSSL_config(NULL);
+		openssl_init = 1;
+	    }
+
+	    /* use crypto engine */
+	    if (curl_easy_setopt(curl, CURLOPT_SSLENGINE, conf->ssl_engine) != CURLE_OK){
+		opkg_message(conf, OPKG_ERROR, "can't set crypto engine: '%s'\n",
+			conf->ssl_engine);
+
+		fclose (file);
+		free(tmp_file_location);
+		free(src_basec);
+		curl_easy_cleanup (curl);
+		return -1;
+	    }
+	    /* set the crypto engine as default */
+	    if (curl_easy_setopt(curl, CURLOPT_SSLENGINE_DEFAULT, 1L) != CURLE_OK){
+		opkg_message(conf, OPKG_ERROR, "can't set crypto engine as default\n");
+
+		fclose (file);
+		free(tmp_file_location);
+		free(src_basec);
+		curl_easy_cleanup (curl);
+		return -1;
+	    }
+	}
+
+	/* cert & key can only be in PEM case in the same file */
+	if(conf->ssl_key_passwd){
+	    res = curl_easy_setopt(curl, CURLOPT_SSLKEYPASSWD, conf->ssl_key_passwd);
+	    if(res != CURLE_OK){
+		opkg_message(conf,OPKG_DEBUG, "Failed to set key password\n");
+	    }
+	}
+
+	/* sets the client certificate */
+	if(conf->ssl_cert_type){
+	    res = curl_easy_setopt(curl, CURLOPT_SSLCERTTYPE, conf->ssl_cert_type);
+	    if(res != CURLE_OK){
+		opkg_message(conf,OPKG_DEBUG, "Failed to set certificate format\n");
+	    }
+	}
+	/* SSL cert name isn't mandatory */
+	if(conf->ssl_cert){
+	    curl_easy_setopt(curl, CURLOPT_SSLCERT, conf->ssl_cert);
+	}
+	/* sets the client key */
+	if(conf->ssl_key_type){
+	    res = curl_easy_setopt(curl, CURLOPT_SSLKEYTYPE, conf->ssl_key_type);
+	    if(res != CURLE_OK){
+		opkg_message(conf,OPKG_DEBUG, "Failed to set key format\n");
+	    }
+	}
+	if(conf->ssl_key){
+	    curl_easy_setopt(curl, CURLOPT_SSLKEY, conf->ssl_key);
+	}
+
+	/* Should we verify the peer certificate ? */
+	if(conf->ssl_dont_verify_peer){
+	    // CURLOPT_SSL_VERIFYPEER default is nonzero (curl => 7.10)
+	    res = curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0);
+	}
+
+	/* certification authority file and/or path */
+	if(conf->ssl_ca_file){
+	    curl_easy_setopt(curl, CURLOPT_CAINFO, conf->ssl_ca_file);
+	}
+	if(conf->ssl_ca_path){
+	    curl_easy_setopt(curl, CURLOPT_CAPATH, conf->ssl_ca_path);
+	}
+#endif
+
 	res = curl_easy_perform (curl);
 	fclose (file);
 	if (res)


--------------010907080003080609050106--
