Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RzY7r-0004a7-4T
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 19:38:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4AA3B31590D6;
	Mon, 20 Feb 2012 19:29:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BJ94VmGzmsCs; Mon, 20 Feb 2012 19:29:44 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecde1.pool.mediaWays.net
	[89.14.205.225])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1314531590E5;
	Mon, 20 Feb 2012 19:29:42 +0100 (CET)
Message-ID: <4F429115.3070907@opendreambox.org>
Date: Mon, 20 Feb 2012 19:29:41 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1329745909-21013-1-git-send-email-eric@eukrea.com>
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Mon, 20 Feb 2012 18:38:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Eric,

On 20.02.2012 14:51, Eric B=C3=A9nard wrote:
> - imported 2.0.5 from oe-classic
> - upgrade to 2.3.5 which is latest stable
> - tested on ARMv5 with Angstrom

I created a recipe for vsftpd, too. Here's my version for your=20
reference. All patches were taken from the Debian or Ubuntu package.

It differs from your recipe in these ways:
- uses openssl
- uses pam if available
- uses xinetd
- allows to set custom default configuration options in bbappends
- only build-tested with OE-core, no runtime tests so far.

Regards,
Andreas



diff -Naur empty/vsftpd/01-builddefs.patch vsftpd/vsftpd/01-builddefs.pat=
ch
--- empty/vsftpd/01-builddefs.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/01-builddefs.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,18 @@
+Author: Daniel Jacobowitz <dan@debian.org>
+Description: Build with tcpwrapper and SSL support.
+
+diff -Naurp vsftpd.orig/builddefs.h vsftpd/builddefs.h
+--- vsftpd.orig/builddefs.h	2009-01-31 00:02:36.000000000 +0000
++++ vsftpd/builddefs.h	2009-01-31 00:26:34.000000000 +0000
+@@ -1,9 +1,9 @@
+ #ifndef VSF_BUILDDEFS_H
+ #define VSF_BUILDDEFS_H
+=20
+-#undef VSF_BUILD_TCPWRAPPERS
++#define VSF_BUILD_TCPWRAPPERS 1
+ #define VSF_BUILD_PAM
+-#undef VSF_BUILD_SSL
++#define VSF_BUILD_SSL
+=20
+ #endif /* VSF_BUILDDEFS_H */
+=20
diff -Naur empty/vsftpd/02-config.patch vsftpd/vsftpd/02-config.patch
--- empty/vsftpd/02-config.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/02-config.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,120 @@
+Author: Daniel Jacobowitz <dan@debian.org>
+Description: Set default configuration.
+
+diff -Naurp vsftpd.orig/tunables.c vsftpd/tunables.c
+--- vsftpd.orig/tunables.c	2009-07-15 22:08:27.000000000 +0200
++++ vsftpd/tunables.c	2009-11-06 13:33:34.000000000 +0100
+@@ -246,7 +246,7 @@ tunables_load_defaults()
+   /* -rw------- */
+   tunable_chown_upload_mode =3D 0600;
+=20
+-  install_str_setting("/usr/share/empty", &tunable_secure_chroot_dir);
++  install_str_setting("/var/run/vsftpd/empty", &tunable_secure_chroot_d=
ir);
+   install_str_setting("ftp", &tunable_ftp_username);
+   install_str_setting("root", &tunable_chown_username);
+   install_str_setting("/var/log/xferlog", &tunable_xferlog_file);
+@@ -256,7 +256,7 @@ tunables_load_defaults()
+   install_str_setting(0, &tunable_ftpd_banner);
+   install_str_setting("/etc/vsftpd.banned_emails", &tunable_banned_emai=
l_file);
+   install_str_setting("/etc/vsftpd.chroot_list", &tunable_chroot_list_f=
ile);
+-  install_str_setting("ftp", &tunable_pam_service_name);
++  install_str_setting("vsftpd", &tunable_pam_service_name);
+   install_str_setting("ftp", &tunable_guest_username);
+   install_str_setting("/etc/vsftpd.user_list", &tunable_userlist_file);
+   install_str_setting(0, &tunable_anon_root);
+diff -Naurp vsftpd.orig/vsftpd.conf vsftpd/vsftpd.conf
+--- vsftpd.orig/vsftpd.conf	2009-11-06 08:41:11.000000000 +0100
++++ vsftpd/vsftpd.conf	2009-11-06 13:35:37.000000000 +0100
+@@ -8,6 +8,17 @@
+ # Please read the vsftpd.conf.5 manual page to get a full idea of vsftp=
d's
+ # capabilities.
+ #
++#
++# Run standalone?  vsftpd can run either from an inetd or as a standalo=
ne
++# daemon started from an initscript.
++listen=3DYES
++#
++# Run standalone with IPv6?
++# Like the listen parameter, except vsftpd will listen on an IPv6 socke=
t
++# instead of an IPv4 one. This parameter and the listen parameter are m=
utually
++# exclusive.
++#listen_ipv6=3DYES
++#
+ # Allow anonymous FTP? (Beware - allowed by default if you comment this=
 out).
+ anonymous_enable=3DYES
+ #
+@@ -34,6 +45,12 @@ anonymous_enable=3DYES
+ # go into a certain directory.
+ dirmessage_enable=3DYES
+ #
++# If enabled, vsftpd will display directory listings with the time
++# in  your  local  time  zone.  The default is to display GMT. The
++# times returned by the MDTM FTP command are also affected by this
++# option.
++use_localtime=3DYES
++#
+ # Activate logging of uploads/downloads.
+ xferlog_enable=3DYES
+ #
+@@ -89,6 +106,11 @@ connect_from_port_20=3DYES
+ # (default follows)
+ #banned_email_file=3D/etc/vsftpd.banned_emails
+ #
++# You may restrict local users to their home directories.  See the FAQ =
for
++# the possible risks in this before using chroot_local_user or
++# chroot_list_enable below.
++#chroot_local_user=3DYES
++#
+ # You may specify an explicit list of local users to chroot() to their =
home
+ # directory. If chroot_local_user is YES, then this list becomes a list=
 of
+ # users to NOT chroot().
+@@ -103,12 +125,20 @@ connect_from_port_20=3DYES
+ # the presence of the "-R" option, so there is a strong case for enabli=
ng it.
+ #ls_recurse_enable=3DYES
+ #
+-# When "listen" directive is enabled, vsftpd runs in standalone mode an=
d
+-# listens on IPv4 sockets. This directive cannot be used in conjunction
+-# with the listen_ipv6 directive.
+-listen=3DYES
++# Customization
+ #
+-# This directive enables listening on IPv6 sockets. To listen on IPv4 a=
nd IPv6
+-# sockets, you must run two copies of vsftpd with two configuration fil=
es.
+-# Make sure, that one of the listen options is commented !!
+-#listen_ipv6=3DYES
++# Some of vsftpd's settings don't fit the filesystem layout by
++# default.
++#
++# This option should be the name of a directory which is empty.  Also, =
the
++# directory should not be writable by the ftp user. This directory is u=
sed
++# as a secure chroot() jail at times vsftpd does not require filesystem
++# access.
++secure_chroot_dir=3D/var/run/vsftpd/empty
++#
++# This string is the name of the PAM service vsftpd will use.
++pam_service_name=3Dvsftpd
++#
++# This option specifies the location of the RSA certificate to use for =
SSL
++# encrypted connections.
++rsa_cert_file=3D/etc/ssl/private/vsftpd.pem
+diff -Naurp vsftpd.orig/vsftpd.conf.5 vsftpd/vsftpd.conf.5
+--- vsftpd.orig/vsftpd.conf.5	2009-11-06 08:41:11.000000000 +0100
++++ vsftpd/vsftpd.conf.5	2009-11-06 13:37:10.000000000 +0100
+@@ -940,7 +940,7 @@ Default: nobody
+ .B pam_service_name
+ This string is the name of the PAM service vsftpd will use.
+=20
+-Default: ftp
++Default: vsftpd
+ .TP
+ .B pasv_address
+ Use this option to override the IP address that vsftpd will advertise i=
n
+@@ -969,7 +969,7 @@ This option should be the name of a dire
+ directory should not be writable by the ftp user. This directory is use=
d
+ as a secure chroot() jail at times vsftpd does not require filesystem a=
ccess.
+=20
+-Default: /usr/share/empty
++Default: /var/run/vsftpd/empty
+ .TP
+ .B ssl_ciphers
+ This option can be used to select which SSL ciphers vsftpd will allow f=
or
diff -Naur empty/vsftpd/03-db-doc.patch vsftpd/vsftpd/03-db-doc.patch
--- empty/vsftpd/03-db-doc.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/03-db-doc.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,19 @@
+Author: shaul Karl <shaulkarl@yahoo.com>
+Description:
+ A short explanation how to find out the right db version (Closes: #4782=
82).
+
+diff -Naurp vsftpd.orig/EXAMPLE/VIRTUAL_USERS/README vsftpd/EXAMPLE/VIRT=
UAL_USERS/README
+--- vsftpd.orig/EXAMPLE/VIRTUAL_USERS/README	2009-01-31 00:02:36.0000000=
00 +0000
++++ vsftpd/EXAMPLE/VIRTUAL_USERS/README	2009-01-31 01:38:11.000000000 +0=
000
+@@ -21,7 +21,10 @@ NOTE: Many systems have multiple version
+ need to use e.g. db3_load for correct operation. This is known to affec=
t
+ some Debian systems. The core issue is that pam_userdb expects its logi=
n
+ database to be a specific db version (often db3, whereas db4 may be ins=
talled
+-on your system).
++on your system). You might check ahead what specific db version you'll =
need
++by looking at the dependcies of the pam module. Some methods to do that=
 is to
++run ldd on the pam_userdb.so or look at the dependencies of the package=
 with
++the pam modules.
+=20
+ This will create /etc/vsftpd_login.db. Obviously, you may want to make =
sure
+ the permissions are restricted:
diff -Naur empty/vsftpd/04-link-local.patch vsftpd/vsftpd/04-link-local.p=
atch
--- empty/vsftpd/04-link-local.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/04-link-local.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,91 @@
+Author: Michael Stapelberg <michael@stapelberg.de>
+Description:
+ vsftpd does not accept IPv6 scope identifier in listen_address6
+ (Closes: #544993).
+ .
+ When specifying a link-local address, you need a scope identifier (tha =
name of
+ the index usually), thus you cannot use the following:
+ listen_address6=3Dfe80::21f:16ff:fe06:3aab
+ but you have to use:
+ listen_address6=3Dfe80::21f:16ff:fe06:3aab%eth0
+ so that it is clear on which interface this link-local address should b=
e used.
+ .
+ Unfortunately, vsftpd does not correctly parse the address mentioned ab=
ove and
+ thus fails to be useful in link-local-only environments.
+ .
+ This patch fixes it.
+
+diff -Naurp vsftpd.orig/standalone.c vsftpd/standalone.c
+--- vsftpd.orig/standalone.c	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/standalone.c	2009-10-17 17:10:02.000000000 +0200
+@@ -7,6 +7,8 @@
+  * Code to listen on the network and launch children servants.
+  */
+=20
++#include <net/if.h>
++
+ #include "standalone.h"
+=20
+ #include "parseconf.h"
+@@ -111,8 +113,17 @@ vsf_standalone_main(void)
+     else
+     {
+       struct mystr addr_str =3D INIT_MYSTR;
++      struct mystr scope_id =3D INIT_MYSTR;
+       const unsigned char* p_raw_addr;
++      unsigned int if_index =3D 0;
++
++      /* See if we got a scope id */
+       str_alloc_text(&addr_str, tunable_listen_address6);
++      str_split_char(&addr_str, &scope_id, '%');
++      if (str_getlen(&scope_id) > 0) {
++        if_index =3D if_nametoindex(str_getbuf(&scope_id));
++        str_free(&scope_id);
++      }
+       p_raw_addr =3D vsf_sysutil_parse_ipv6(&addr_str);
+       str_free(&addr_str);
+       if (!p_raw_addr)
+@@ -120,6 +131,7 @@ vsf_standalone_main(void)
+         die2("bad listen_address6: ", tunable_listen_address6);
+       }
+       vsf_sysutil_sockaddr_set_ipv6addr(p_sockaddr, p_raw_addr);
++      vsf_sysutil_sockaddr_set_ipv6scope(p_sockaddr, if_index);
+     }
+     retval =3D vsf_sysutil_bind(listen_sock, p_sockaddr);
+     vsf_sysutil_free(p_sockaddr);
+diff -Naurp vsftpd.orig/sysutil.c vsftpd/sysutil.c
+--- vsftpd.orig/sysutil.c	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/sysutil.c	2009-10-17 17:10:02.000000000 +0200
+@@ -2039,6 +2039,19 @@ vsf_sysutil_sockaddr_set_ipv6addr(struct
+   }
+ }
+=20
++int
++vsf_sysutil_sockaddr_get_ipv6scope(struct vsf_sysutil_sockaddr* p_sockp=
tr)
++{
++  return p_sockptr->u.u_sockaddr_in6.sin6_scope_id;
++}
++
++void
++vsf_sysutil_sockaddr_set_ipv6scope(struct vsf_sysutil_sockaddr* p_sockp=
tr,
++                                  const int scope_id)
++{
++  p_sockptr->u.u_sockaddr_in6.sin6_scope_id =3D scope_id;
++}
++
+ const void*
+ vsf_sysutil_sockaddr_ipv6_v4(const struct vsf_sysutil_sockaddr* p_addr)
+ {
+diff -Naurp vsftpd.orig/sysutil.h vsftpd/sysutil.h
+--- vsftpd.orig/sysutil.h	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/sysutil.h	2009-10-17 17:10:02.000000000 +0200
+@@ -228,6 +228,9 @@ void vsf_sysutil_sockaddr_set_ipv4addr(s
+                                        const unsigned char* p_raw);
+ void vsf_sysutil_sockaddr_set_ipv6addr(struct vsf_sysutil_sockaddr* p_s=
ockptr,
+                                        const unsigned char* p_raw);
++void vsf_sysutil_sockaddr_set_ipv6scope(struct vsf_sysutil_sockaddr* p_=
sockptr,
++                                      const int scope_id);
++int vsf_sysutil_sockaddr_get_ipv6scope(struct vsf_sysutil_sockaddr* p_s=
ockptr);
+ void vsf_sysutil_sockaddr_set_any(struct vsf_sysutil_sockaddr* p_sockad=
dr);
+ unsigned short vsf_sysutil_sockaddr_get_port(
+     const struct vsf_sysutil_sockaddr* p_sockptr);
diff -Naur empty/vsftpd/05-whitespaces.patch vsftpd/vsftpd/05-whitespaces=
.patch
--- empty/vsftpd/05-whitespaces.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/05-whitespaces.patch	2012-01-26 14:12:34.564586767 +010=
0
@@ -0,0 +1,81 @@
+Author: Jiri Skala <jskala@redhat.com>
+Description: trim white spaces from option values (Closes: #419857, #536=
803).
+
+diff -Naurp vsftpd.orig/parseconf.c vsftpd/parseconf.c
+--- vsftpd.orig/parseconf.c	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/parseconf.c	2009-10-18 11:28:31.000000000 +0200
+@@ -275,7 +275,7 @@ vsf_parseconf_load_setting(const char* p
+         }
+         else
+         {
+-          *p_curr_setting =3D str_strdup(&s_value_str);
++          *p_curr_setting =3D str_strdup_trimmed(&s_value_str);
+         }
+         return;
+       }
+diff -Naurp vsftpd.orig/str.c vsftpd/str.c
+--- vsftpd.orig/str.c	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/str.c	2009-10-18 11:28:31.000000000 +0200
+@@ -89,6 +89,18 @@ str_strdup(const struct mystr* p_str)
+   return vsf_sysutil_strdup(str_getbuf(p_str));
+ }
+=20
++const char*
++str_strdup_trimmed(const struct mystr* p_str)
++{
++  const char* p_trimmed =3D str_getbuf(p_str);
++  int h, t, newlen;
++
++  for (h =3D 0; h < (int)str_getlen(p_str) && vsf_sysutil_isspace(p_tri=
mmed[h]); h++) ;
++  for (t =3D str_getlen(p_str) - 1; t >=3D 0 && vsf_sysutil_isspace(p_t=
rimmed[t]); t--) ;
++  newlen =3D t - h + 1;
++  return newlen ? vsf_sysutil_strndup(p_trimmed+h, (unsigned int)newlen=
) : 0L;
++}
++
+ void
+ str_alloc_alt_term(struct mystr* p_str, const char* p_src, char term)
+ {
+diff -Naurp vsftpd.orig/str.h vsftpd/str.h
+--- vsftpd.orig/str.h	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/str.h	2009-10-18 11:28:31.000000000 +0200
+@@ -31,6 +31,7 @@ void str_alloc_ulong(struct mystr* p_str
+ void str_alloc_filesize_t(struct mystr* p_str, filesize_t the_filesize)=
;
+ void str_copy(struct mystr* p_dest, const struct mystr* p_src);
+ const char* str_strdup(const struct mystr* p_str);
++const char* str_strdup_trimmed(const struct mystr* p_str);
+ void str_empty(struct mystr* p_str);
+ void str_free(struct mystr* p_str);
+ void str_trunc(struct mystr* p_str, unsigned int trunc_len);
+diff -Naurp vsftpd.orig/sysutil.c vsftpd/sysutil.c
+--- vsftpd.orig/sysutil.c	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/sysutil.c	2009-10-18 11:28:31.000000000 +0200
+@@ -1033,6 +1033,18 @@ vsf_sysutil_strdup(const char* p_str)
+   return strdup(p_str);
+ }
+=20
++char*
++vsf_sysutil_strndup(const char* p_str, unsigned int p_len)
++{
++  char *new =3D (char *)malloc(p_len+1);
++
++  if (new =3D=3D NULL)
++    return NULL;
++
++  new[p_len]=3D'\0';
++  return (char *)memcpy(new, p_str, p_len);
++}
++
+ void
+ vsf_sysutil_memclr(void* p_dest, unsigned int size)
+ {
+diff -Naurp vsftpd.orig/sysutil.h vsftpd/sysutil.h
+--- vsftpd.orig/sysutil.h	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/sysutil.h	2009-10-18 11:28:31.000000000 +0200
+@@ -186,6 +186,7 @@ int vsf_sysutil_wait_get_exitcode(
+ /* Various string functions */
+ unsigned int vsf_sysutil_strlen(const char* p_text);
+ char* vsf_sysutil_strdup(const char* p_str);
++char* vsf_sysutil_strndup(const char* p_str, unsigned int p_len);
+ void vsf_sysutil_memclr(void* p_dest, unsigned int size);
+ void vsf_sysutil_memcpy(void* p_dest, const void* p_src,
+                         const unsigned int size);
diff -Naur empty/vsftpd/06-greedy.patch vsftpd/vsftpd/06-greedy.patch
--- empty/vsftpd/06-greedy.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/06-greedy.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,32 @@
+Author: Martin Nagy <mnagy@redhat.com>
+Description: Fix file listing issue with wildcard (Bugzilla: #392181).
+
+diff -Naurp vsftpd.orig/ls.c vsftpd/ls.c
+--- vsftpd.orig/ls.c	2009-10-02 14:15:18.000000000 +0200
++++ vsftpd/ls.c	2009-10-18 11:48:29.000000000 +0200
+@@ -281,6 +281,25 @@ vsf_filename_passes_filter(const struct=20
+       {
+         goto out;
+       }
++      if (!must_match_at_current_pos)
++      {
++        struct mystr scan_fwd =3D INIT_MYSTR;
++
++        str_mid_to_end(&name_remain_str, &scan_fwd,
++                        indexx + str_getlen(&s_match_needed_str));
++        /* We're allowed to be greedy, test if it match further along
++         * keep advancing indexx while we can still match.
++         */
++        while( (locate_result =3D str_locate_str(&scan_fwd, &s_match_ne=
eded_str)),
++            locate_result.found )
++        {
++          indexx +=3D locate_result.index + str_getlen(&s_match_needed_=
str);
++          str_mid_to_end(&scan_fwd, &temp_str,
++                         locate_result.index + str_getlen(&s_match_need=
ed_str));
++          str_copy(&scan_fwd, &temp_str);
++        }
++       str_free(&scan_fwd);
++      }
+       /* Chop matched string out of remainder */
+       str_mid_to_end(&name_remain_str, &temp_str,
+                      indexx + str_getlen(&s_match_needed_str));
diff -Naur empty/vsftpd/07-utf8.patch vsftpd/vsftpd/07-utf8.patch
--- empty/vsftpd/07-utf8.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/07-utf8.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,58 @@
+Author: Chuck Short <zulcss@ubuntu.com>
+Description: Adding support for UTF8.
+
+diff -Naurp vsftpd.orig/features.c vsftpd/features.c
+--- vsftpd.orig/features.c	2008-12-04 06:00:47.000000000 +0000
++++ vsftpd/features.c	2010-02-25 13:28:06.000000000 +0000
+@@ -21,6 +21,10 @@ handle_feat(struct vsf_session* p_sess)
+     vsf_cmdio_write_raw(p_sess, " AUTH SSL\r\n");
+     vsf_cmdio_write_raw(p_sess, " AUTH TLS\r\n");
+   }
++  if (tunable_utf8_filesystem)
++  {
++     vsf_cmdio_write_raw(p_sess, " UTF8\r\n");
++  }
+   if (tunable_port_enable)
+   {
+     vsf_cmdio_write_raw(p_sess, " EPRT\r\n");
+diff -Naurp vsftpd.orig/parseconf.c vsftpd/parseconf.c
+--- vsftpd.orig/parseconf.c	2009-08-07 18:46:40.000000000 +0000
++++ vsftpd/parseconf.c	2010-02-25 13:28:06.000000000 +0000
+@@ -28,6 +28,7 @@ static struct parseconf_bool_setting
+ parseconf_bool_array[] =3D
+ {
+   { "anonymous_enable", &tunable_anonymous_enable },
++  { "utf8_filesystem", &tunable_utf8_filesystem },
+   { "local_enable", &tunable_local_enable },
+   { "pasv_enable", &tunable_pasv_enable },
+   { "port_enable", &tunable_port_enable },
+diff -Naurp vsftpd.orig/tunables.c vsftpd/tunables.c
+--- vsftpd.orig/tunables.c	2009-07-15 20:08:27.000000000 +0000
++++ vsftpd/tunables.c	2010-02-25 13:28:06.000000000 +0000
+@@ -10,6 +10,7 @@
+=20
+ int tunable_anonymous_enable;
+ int tunable_local_enable;
++int tunable_utf8_filesystem;
+ int tunable_pasv_enable;
+ int tunable_port_enable;
+ int tunable_chroot_local_user;
+@@ -146,6 +147,7 @@ tunables_load_defaults()
+ {
+   tunable_anonymous_enable =3D 1;
+   tunable_local_enable =3D 0;
++  tunable_utf8_filesystem =3D 0;
+   tunable_pasv_enable =3D 1;
+   tunable_port_enable =3D 1;
+   tunable_chroot_local_user =3D 0;
+diff -Naurp vsftpd.orig/tunables.h vsftpd/tunables.h
+--- vsftpd.orig/tunables.h	2009-07-07 01:37:28.000000000 +0000
++++ vsftpd/tunables.h	2010-02-25 13:28:06.000000000 +0000
+@@ -11,6 +11,7 @@ void tunables_load_defaults();
+ /* Booleans */
+ extern int tunable_anonymous_enable;          /* Allow anon logins */
+ extern int tunable_local_enable;              /* Allow local logins */
++extern int tunable_utf8_filesystem;           /* Server uses UTF8 Files=
ystem */
+ extern int tunable_pasv_enable;               /* Allow PASV */
+ extern int tunable_port_enable;               /* Allow PORT */
+ extern int tunable_chroot_local_user;         /* Restrict local to home=
 dir */
diff -Naur empty/vsftpd/08-manpage.patch vsftpd/vsftpd/08-manpage.patch
--- empty/vsftpd/08-manpage.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/08-manpage.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,23 @@
+Author: Daniel Baumann <daniel.baumann@progress-technologies.net>
+Description: Fixing manpage formating.
+
+diff -Naurp vsftpd.orig/vsftpd.8 vsftpd/vsftpd.8
+--- vsftpd.orig/vsftpd.8	2009-07-17 20:56:23.000000000 +0000
++++ vsftpd/vsftpd.8	2010-04-08 05:18:00.000000000 +0000
+@@ -57,4 +57,3 @@ setting and any identical setting that w
+ .Pa /etc/vsftpd.conf
+ .Sh SEE ALSO
+ .Xr vsftpd.conf 5
+-.end
+diff -Naurp vsftpd.orig/vsftpd.conf.5 vsftpd/vsftpd.conf.5
+--- vsftpd.orig/vsftpd.conf.5	2009-10-19 02:46:30.000000000 +0000
++++ vsftpd/vsftpd.conf.5	2010-04-08 05:18:08.000000000 +0000
+@@ -404,7 +404,7 @@ reuse (which proves that they know the s
+ channel). Although this is a secure default, it may break many FTP clie=
nts,
+ so you may want to disable it. For a discussion of the consequences, se=
e
+ http://scarybeastsecurity.blogspot.com/2009/02/vsftpd-210-released.html
+-(Added in v2.1.0).
++ (Added in v2.1.0).
+=20
+ Default: YES
+ .TP
diff -Naur empty/vsftpd/09-s390.patch vsftpd/vsftpd/09-s390.patch
--- empty/vsftpd/09-s390.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/09-s390.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,15 @@
+Author: Philipp Kern <pkern@debian.org>
+Description: Fix vsftpd on s390 (Closes: #602726).
+
+diff -Naurp vsftpd.orig/sysdeputil.c vsftpd/sysdeputil.c
+--- vsftpd.orig/sysdeputil.c	2011-09-05 16:03:18.728857644 +0200
++++ vsftpd/sysdeputil.c	2011-09-05 16:05:12.909423834 +0200
+@@ -64,7 +64,7 @@
+ #include <utmpx.h>
+=20
+ /* BEGIN config */
+-#if defined(__linux__)
++#if defined(__linux__) && !defined(__s390__)
+   #include <errno.h>
+   #include <syscall.h>
+   #define VSF_SYSDEP_HAVE_LINUX_CLONE
diff -Naur empty/vsftpd/10-remote-dos.patch vsftpd/vsftpd/10-remote-dos.p=
atch
--- empty/vsftpd/10-remote-dos.patch	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/10-remote-dos.patch	2012-01-26 14:12:34.564586767 +0100
@@ -0,0 +1,69 @@
+Author: Ben Hutchings <ben@decadent.org.uk>
+Description: Remote DoS on Linux 2.6.32 (Closes: #629373).
+
+diff -Naurp vsftpd.orig/sysdeputil.c vsftpd/sysdeputil.c
+--- vsftpd.orig/sysdeputil.c	2010-03-26 04:25:33.000000000 +0100
++++ vsftpd/sysdeputil.c	2011-09-05 15:16:05.347070790 +0200
+@@ -25,6 +25,11 @@
+   #define _LARGEFILE64_SOURCE 1
+ #endif
+=20
++#ifdef __linux__
++  #include <stdio.h>
++  #include <sys/utsname.h>
++#endif
++
+ /* For INT_MAX */
+ #include <limits.h>
+=20
+@@ -1259,11 +1264,36 @@ vsf_set_term_if_parent_dies()
+ #endif
+ }
+=20
++#ifdef VSF_SYSDEP_HAVE_LINUX_CLONE
++/* On Linux versions <2.6.35, netns cleanup may be so slow that
++ * creating a netns per connection allows a remote denial-of-service.
++ * We therefore do not use CLONE_NEWNET on these versions.
++ */
++static int
++vsf_sysutil_netns_cleanup_is_fast(void)
++{
++#ifdef __linux__
++  struct utsname utsname;
++  int r1, r2, r3 =3D 0;
++  return (uname(&utsname) =3D=3D 0 &&
++	  sscanf(utsname.release, "%d.%d.%d", &r1, &r2, &r3) >=3D 2 &&
++	  ((r1 << 16) | (r2 << 8) | r3) >=3D ((2 << 16) | (6 << 8) | 35));
++#else
++  /* Assume any other kernel that has the feature don't have this probl=
em */
++  return 1;
++#endif
++}
++#endif
++
+ int
+ vsf_sysutil_fork_isolate_all_failok()
+ {
+ #ifdef VSF_SYSDEP_HAVE_LINUX_CLONE
+-  static int cloneflags_work =3D 1;
++  static int cloneflags_work =3D -1;
++  if (cloneflags_work < 0)
++  {
++    cloneflags_work =3D vsf_sysutil_netns_cleanup_is_fast();
++  }
+   if (cloneflags_work)
+   {
+     int ret =3D syscall(__NR_clone,
+@@ -1309,7 +1339,11 @@ int
+ vsf_sysutil_fork_newnet()
+ {
+ #ifdef VSF_SYSDEP_HAVE_LINUX_CLONE
+-  static int cloneflags_work =3D 1;
++  static int cloneflags_work =3D -1;
++  if (cloneflags_work < 0)
++  {
++    cloneflags_work =3D vsf_sysutil_netns_cleanup_is_fast();
++  }
+   if (cloneflags_work)
+   {
+     int ret =3D syscall(__NR_clone, CLONE_NEWNET | SIGCHLD, NULL);
diff -Naur empty/vsftpd/vsftpd.conf vsftpd/vsftpd/vsftpd.conf
--- empty/vsftpd/vsftpd.conf	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/vsftpd.conf	2011-01-20 19:03:00.234171002 +0100
@@ -0,0 +1,105 @@
+# Opendreambox /etc/vsftpd.conf
+#
+# Please see vsftpd.conf.5 for all compiled in defaults.
+#
+# READ THIS: This example file is NOT an exhaustive list of vsftpd optio=
ns.
+# Please read the vsftpd.conf.5 manual page to get a full idea of vsftpd=
's
+# capabilities.
+#
+# Allow anonymous FTP? (Beware - allowed by default if you comment this =
out).
+anonymous_enable=3DNO
+#
+# Uncomment this to allow local users to log in.
+local_enable=3DYES
+#
+# Uncomment this to enable any form of FTP write command.
+write_enable=3DYES
+#
+# Default umask for local users is 077. You may wish to change this to 0=
22,
+# if your users expect that (022 is used by most other ftpd's)
+#local_umask=3D022
+#
+# Uncomment this to allow the anonymous FTP user to upload files. This o=
nly
+# has an effect if the above global write enable is activated. Also, you=
 will
+# obviously need to create a directory writable by the FTP user.
+#anon_upload_enable=3DYES
+#
+# Uncomment this if you want the anonymous FTP user to be able to create
+# new directories.
+#anon_mkdir_write_enable=3DYES
+#
+# Activate directory messages - messages given to remote users when they
+# go into a certain directory.
+dirmessage_enable=3DYES
+#
+# Activate logging of uploads/downloads.
+#xferlog_enable=3DYES
+#
+# Make sure PORT transfer connections originate from port 20 (ftp-data).
+connect_from_port_20=3DYES
+#
+# If you want, you can arrange for uploaded anonymous files to be owned =
by
+# a different user. Note! Using "root" for uploaded files is not
+# recommended!
+#chown_uploads=3DYES
+#chown_username=3Dwhoever
+#
+# You may override where the log file goes if you like. The default is s=
hown
+# below.
+#xferlog_file=3D/var/log/vsftpd.log
+#
+# If you want, you can have your log file in standard ftpd xferlog forma=
t
+#xferlog_std_format=3DYES
+#
+# You may change the default value for timing out an idle session.
+#idle_session_timeout=3D600
+#
+# You may change the default value for timing out a data connection.
+#data_connection_timeout=3D120
+#
+# It is recommended that you define on your system a unique user which t=
he
+# ftp server can use as a totally isolated and unprivileged user.
+#nopriv_user=3Dftpsecure
+#
+# Enable this and the server will recognise asynchronous ABOR requests. =
Not
+# recommended for security (the code is non-trivial). Not enabling it,
+# however, may confuse older FTP clients.
+async_abor_enable=3DYES
+#
+# By default the server will pretend to allow ASCII mode but in fact ign=
ore
+# the request. Turn on the below options to have the server actually do =
ASCII
+# mangling on files when in ASCII mode.
+# Beware that turning on ascii_download_enable enables malicious remote =
parties
+# to consume your I/O resources, by issuing the command "SIZE /big/file"=
 in
+# ASCII mode.
+# These ASCII options are split into upload and download because you may=
 wish
+# to enable ASCII uploads (to prevent uploaded scripts etc. from breakin=
g),
+# without the DoS risk of SIZE and ASCII downloads. ASCII mangling shoul=
d be
+# on the client anyway..
+#ascii_upload_enable=3DYES
+#ascii_download_enable=3DYES
+#
+# You may fully customise the login banner string:
+ftpd_banner=3DWelcome to the OpenDreambox FTP service.
+#
+# You may specify a file of disallowed anonymous e-mail addresses. Appar=
ently
+# useful for combatting certain DoS attacks.
+#deny_email_enable=3DYES
+# (default follows)
+#banned_email_file=3D/etc/vsftpd.banned_emails
+#
+# You may specify an explicit list of local users to chroot() to their h=
ome
+# directory. If chroot_local_user is YES, then this list becomes a list =
of
+# users to NOT chroot().
+#chroot_list_enable=3DYES
+# (default follows)
+#chroot_list_file=3D/etc/vsftpd.chroot_list
+#
+# You may activate the "-R" option to the builtin ls. This is disabled b=
y
+# default to avoid remote users being able to cause excessive I/O on lar=
ge
+# sites. However, some broken FTP clients such as "ncftp" and "mirror" a=
ssume
+# the presence of the "-R" option, so there is a strong case for enablin=
g it.
+ls_recurse_enable=3DYES
+#
+secure_chroot_dir=3D/dev/shm
+local_root=3D/
diff -Naur empty/vsftpd/vsftpd.xinetd.in vsftpd/vsftpd/vsftpd.xinetd.in
--- empty/vsftpd/vsftpd.xinetd.in	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd/vsftpd.xinetd.in	2012-02-17 15:39:22.120206970 +0100
@@ -0,0 +1,7 @@
+service ftp
+{
+	socket_type =3D stream
+	user =3D root
+	server =3D @SBINDIR@/vsftpd
+	wait =3D no
+}
diff -Naur empty/vsftpd_2.3.5.bb vsftpd/vsftpd_2.3.5.bb
--- empty/vsftpd_2.3.5.bb	1970-01-01 01:00:00.000000000 +0100
+++ vsftpd/vsftpd_2.3.5.bb	2012-02-17 15:41:49.472207488 +0100
@@ -0,0 +1,95 @@
+DESCRIPTION =3D "lightweight, efficient FTP server written for security"
+HOMEPAGE =3D "https://security.appspot.com/vsftpd.html"
+SECTION =3D "console/network"
+LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271"
+DEPENDS =3D "libcap openssl"
+DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
+
+SRC_URI =3D " \
+        https://security.appspot.com/downloads/${BP}.tar.gz \
+        file://vsftpd.xinetd.in \
+        file://01-builddefs.patch \
+        file://02-config.patch \
+        file://03-db-doc.patch \
+        file://04-link-local.patch \
+        file://05-whitespaces.patch \
+        file://06-greedy.patch \
+        file://07-utf8.patch \
+        file://08-manpage.patch \
+        file://09-s390.patch \
+        file://10-remote-dos.patch \
+"
+SRC_URI[md5sum] =3D "01398a5bef8e85b6cf2c213a4b011eca"
+SRC_URI[sha256sum] =3D "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca96=
5f6e2f60879e54f1"
+
+S =3D "${WORKDIR}/${BP}"
+
+inherit useradd
+
+CFLAGS =3D "${TARGET_CFLAGS}"
+CFLAGS +=3D "-DVSF_BUILD_SSL=3D1"
+CFLAGS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', '-DVSF_BUILD_PAM=
=3D1', '', d)}"
+
+LIBS =3D "-lcap -lcrypt -lssl -lcrypto"
+LIBS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', '-lpam', '', d)}"
+
+LINK =3D "${TARGET_LDFLAGS}"
+
+SECURE_CHROOT_DIR =3D "${datadir}/${BPN}/chroot"
+RSA_CERT_FILE =3D "${sysconfdir}/ssl/private/${BPN}.pem"
+
+do_configure() {
+        rm -f builddefs.h
+        touch builddefs.h
+        set_default() {
+                NAME=3D$1
+                VALUE=3D$2
+                sed -e "s,^#\?${NAME}=3D.*,${NAME}=3D${VALUE}," -i vsftp=
d.conf
+        }
+        set_default listen NO
+        set_default listen_ipv6 NO
+        set_default anonymous_enable NO
+        set_default local_enable YES
+        set_default write_enable YES
+        set_default anon_upload_enable NO
+        set_default anon_mkdir_write_enable NO
+        set_default dirmessage_enable NO
+        set_default use_localtime YES
+        set_default xferlog_enable NO
+        set_default connect_from_port_20 YES
+        set_default chown_uploads NO
+        set_default nopriv_user vsftpd
+        set_default async_abor_enable YES
+        set_default ascii_upload_enable NO
+        set_default ascii_download_enable NO
+        set_default ftpd_banner "Welcome to the ${DISTRO_NAME} FTP servi=
ce!"
+        set_default chroot_local_user NO
+        set_default chroot_list_enable NO
+        set_default ls_recurse_enable YES
+        set_default secure_chroot_dir "${SECURE_CHROOT_DIR}"
+        set_default rsa_cert_file "${RSA_CERT_FILE}"
+
+	sed -e 's,@SBINDIR@,${sbindir},' ${WORKDIR}/vsftpd.xinetd.in > vsftpd.x=
inetd
+}
+do_compile() {
+        oe_runmake 'CFLAGS=3D${CFLAGS}' 'LIBS=3D${LIBS}' 'LINK=3D${LINK}=
'
+}
+do_install() {
+        install -d ${D}${sysconfdir}
+        install -m 644 vsftpd.conf ${D}${sysconfdir}
+        install -d ${D}${sbindir}
+        install -m 755 vsftpd ${D}${sbindir}/vsftpd
+        install -d ${D}${mandir}/man8
+        install -m 644 vsftpd.8 ${D}${mandir}/man8/vsftpd.8
+        install -d ${D}${mandir}/man5
+        install -m 644 vsftpd.conf.5 ${D}${mandir}/man5/vsftpd.conf.5
+        install -d ${D}${sysconfdir}/xinetd.d
+        install -m 644 vsftpd.xinetd ${D}${sysconfdir}/xinetd.d/vsftpd
+        install -d ${D}${SECURE_CHROOT_DIR}
+}
+
+RDEPENDS_${PN} =3D "xinetd"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM_${PN} =3D "--home-dir ${SECURE_CHROOT_DIR} --no-create-hom=
e --system --shell /bin/false --user-group vsftpd"



