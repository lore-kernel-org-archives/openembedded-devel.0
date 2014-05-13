Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f176.google.com (unknown [209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id BE35D605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:50:29 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lg15so35216vcb.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=zTwH5eT6Fho7W6XSpCZizrW/HEFgr4+nTGoSQNdQsGY=;
	b=rjE0tbxm9RRaW6bAdxPZlsJQZb9+OltIbBp1Z0B9Dm7RdlQXLXnUH32Wb7TEbJjqFb
	YY3dxvWk49OU3DWCpu06sKpM4DHrZ5Xprr4gNf0DPdSAMp4z88nrzl5GQXJCtRl2zx1b
	oJrKSVtok1LqlMMKF3algRdTZ7VaYkrylQ2XEvTqmAhsAOucqYhZ49ce/hbRstMpALIu
	KvDhCkpwXS/n/iOwxRjGMvC6gSTSLxXSW7tGjSgLiePd4/1AJBxH1/eKroRI4oEHZRyB
	RLOPnIM9klbZux5Qt94+Z0z9umbiM78sVYGWSCK7N+bvSFuawGhu5tRTzHSrMy+XP/0B
	XLuw==
X-Received: by 10.52.95.171 with SMTP id dl11mr5306714vdb.36.1399971030151;
	Tue, 13 May 2014 01:50:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	it5sm27468765vdb.24.2014.05.13.01.50.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 01:50:28 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 May 2014 10:50:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513085055.GM22774@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: abiword and libssh broken by last libgcryp upgrade
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
X-List-Received-Date: Tue, 13 May 2014 08:50:33 -0000
X-Groupsio-MsgNum: 49894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline

--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If you care about one of these, then please send patches:

libssh:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c: In fu=
nction 'libgcrypt_thread_init':
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:72:26:=
 error: 'struct gcry_thread_cbs' has no member named 'mutex_init'
|   gcrypt_threads_callbacks.mutex_init=3Duser_callbacks->mutex_init;
|                           ^
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:73:26:=
 error: 'struct gcry_thread_cbs' has no member named 'mutex_destroy'
|   gcrypt_threads_callbacks.mutex_destroy=3Duser_callbacks->mutex_destroy;
|                           ^
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:74:26:=
 error: 'struct gcry_thread_cbs' has no member named 'mutex_lock'
|   gcrypt_threads_callbacks.mutex_lock=3Duser_callbacks->mutex_lock;
|                           ^
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:75:26:=
 error: 'struct gcry_thread_cbs' has no member named 'mutex_unlock'
|   gcrypt_threads_callbacks.mutex_unlock=3Duser_callbacks->mutex_unlock;
|                           ^
| make[2]: *** [src/CMakeFiles/ssh_shared.dir/threads.c.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| Building C object src/CMakeFiles/ssh_shared.dir/server.c.o
| cd /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/build/src && /home/je=
nkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bi=
n/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc  -DLIBSSH_EXPORTS -march=3D=
armv5te -marm -mthumb-interwork  --sysroot=3D/home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-=
debug-types -std=3Dgnu99 -pedantic -pedantic-errors -Wall -Wextra -Wshadow =
-Wmissing-prototypes -Wdeclaration-after-statement -Wunused -Wfloat-equal -=
Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute=
 -fPIC -fstack-protector -fPIC -I/home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5=
f07-r0/build/src -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/w=
ork/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src=
 -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-l=
inux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/include -I/home/jen=
kins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi=
/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/build -I/home/jenkins/oe/shr-core-b=
ranches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include    -fvisibility=3D=
hidden -o CMakeFiles/ssh_shared.dir/server.c.o   -c /home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+=
gitrAUTOINC+43914a5f07-r0/git/src/server.c
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07=
-r0/build'
| make[1]: *** [src/CMakeFiles/ssh_shared.dir/all] Error 2
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07=
-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libs=
sh/0.5.5+gitrAUTOINC+43914a5f07-r0/temp/log.do_compile.10360)
NOTE: recipe libssh-0.5.5+gitrAUTOINC+43914a5f07-r0: task do_compile: Failed
ERROR: Task 16288 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openemb=
edded/meta-oe/recipes-support/libssh/libssh_git.bb, do_compile) failed with=
 exit code '1'

abiword:
| tls_tunnel.cpp:126:31: warning: 'gcry_thread_cbs' is deprecated (declared=
 at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm=
/usr/include/gcrypt.h:213) [-Wdeprecated-declarations]
|  static struct gcry_thread_cbs gcry_threads_tunnel =3D
|                                ^
| tls_tunnel.cpp:130:50: error: too many initializers for 'gcry_thread_cbs'
|    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL };
|                                                   ^
| tls_tunnel.cpp: In member function 'tls_tunnel::session_ptr_t tls_tunnel:=
:ClientProxy::setup_tls_session(tls_tunnel::socket_ptr_t)':
| tls_tunnel.cpp:485:20: warning: 'int gnutls_kx_set_priority(gnutls_sessio=
n_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h:298) =
[-Wdeprecated-declarations]
|   return_val_if_neg(gnutls_kx_set_priority(*session_ptr,PRIORITIES), sess=
ion_ptr_t());
|                     ^
| tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
|  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
|                                          ^
| tls_tunnel.cpp:485:66: warning: 'int gnutls_kx_set_priority(gnutls_sessio=
n_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-core-bran=
ches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h:298) =
[-Wdeprecated-declarations]
|   return_val_if_neg(gnutls_kx_set_priority(*session_ptr,PRIORITIES), sess=
ion_ptr_t());
|                                                                   ^
| tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
|  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
|                                          ^
| tls_tunnel.cpp:486:20: warning: 'int gnutls_cipher_set_priority(gnutls_se=
ssion_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h:2=
90) [-Wdeprecated-declarations]
|   return_val_if_neg(gnutls_cipher_set_priority(*session_ptr,CIPHERS), ses=
sion_ptr_t());
|                     ^
| tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
|  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
|                                          ^
| tls_tunnel.cpp:486:67: warning: 'int gnutls_cipher_set_priority(gnutls_se=
ssion_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h:2=
90) [-Wdeprecated-declarations]
|   return_val_if_neg(gnutls_cipher_set_priority(*session_ptr,CIPHERS), ses=
sion_ptr_t());
|                                                                    ^
| tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
|  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
|                                          ^
| tls_tunnel.cpp:502:18: warning: 'gnutls_x509_crt' is deprecated (declared=
 at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm=
/usr/include/gnutls/compat.h:89) [-Wdeprecated-declarations]
|   gnutls_x509_crt cert;
|                   ^
| tls_tunnel.cpp:503:22: warning: 'gnutls_datum' is deprecated (declared at=
 /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/us=
r/include/gnutls/compat.h:112) [-Wdeprecated-declarations]
|   const gnutls_datum* cert_list;
|                       ^
| make[6]: *** [tls_tunnel.lo] Error 1
| make[6]: *** Waiting for unfinished jobs....
| make[6]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/plug=
ins/collab/backends/service/xp'
| make[5]: *** [all-recursive] Error 1
| make[5]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/plug=
ins/collab/backends/service'
| make[4]: *** [all-recursive] Error 1
| make[4]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/plug=
ins/collab/backends'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/plug=
ins/collab'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/plug=
ins'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiw=
ord/3.0.0-r0/temp/log.do_compile.12530)
NOTE: recipe abiword-3.0.0-r0: task do_compile: Failed
ERROR: Task 20957 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openemb=
edded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do_compile) failed=
 with exit code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNx3O8ACgkQN1Ujt2V2gBykEgCfazK9mFxsgUrVwYzIauvvfAsR
MOcAoLem9q1NOjfNHfr4MEQ4UH/JjO1i
=viQ9
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--
