Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (unknown [209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D7F6665FE3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 00:49:34 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id lx4so1174127iec.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 17:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2X6qxgj7iAGlFNQN+ZSTB97QqCixGuLGacbpzy9koso=;
	b=lpsLBcqM1yYXwGJj3H0T/NdEFNBtVDh3wFXpc8Wt1pGD4Q1kL6ldKbsuy15l62d4nz
	rh6Pkcf/fAkNUj7ERpYumnWI3HAoj6WIZQIdede++L5m+gKiFfztqOy1m1uzy80petXd
	qtpnngYeN+YrjGpEJBaFpKiaZEB/j6iEnfA5bDCVVv8B5JanHFHHwwGoWyTXTKSSMNLi
	lgZDpQNuUiO9H9yTbqc6MBxgc2lxzXsFisF5dA9mPhimLA5iFJyPSaPQXw+FQx/MopVl
	OLqfGKIDUQATRVWMOXamhCUST1vQuaHSaBt5KpcdUKM+KN2Q3RwrJesUKmt4nV581LtT
	QcKQ==
X-Received: by 10.50.78.201 with SMTP id d9mr61468245igx.17.1400028575145;
	Tue, 13 May 2014 17:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Tue, 13 May 2014 17:49:04 -0700 (PDT)
In-Reply-To: <20140513085055.GM22774@jama>
References: <20140513085055.GM22774@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 May 2014 17:49:04 -0700
Message-ID: <CAMKF1sqNit4Yb+qUdb7_F5234HhdUcWJcJ=Z6mPHO99UvntOFg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: abiword and libssh broken by last libgcryp upgrade
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
X-List-Received-Date: Wed, 14 May 2014 00:49:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 1:50 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> If you care about one of these, then please send patches:

I guess libgcrypt got updated in OE-Core. We have to get better at
testing OE-core proposed patches
in-flight to catch these kind of problems and thereby create better
harmony between OE-Core and other layers
I consider them to be a OE-Core APIs for other layers and we have to
help get it tested before such updates land there.

>
> libssh:
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c: In =
function 'libgcrypt_thread_init':
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:72:2=
6: error: 'struct gcry_thread_cbs' has no member named 'mutex_init'
> |   gcrypt_threads_callbacks.mutex_init=3Duser_callbacks->mutex_init;
> |                           ^
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:73:2=
6: error: 'struct gcry_thread_cbs' has no member named 'mutex_destroy'
> |   gcrypt_threads_callbacks.mutex_destroy=3Duser_callbacks->mutex_destro=
y;
> |                           ^
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:74:2=
6: error: 'struct gcry_thread_cbs' has no member named 'mutex_lock'
> |   gcrypt_threads_callbacks.mutex_lock=3Duser_callbacks->mutex_lock;
> |                           ^
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/src/threads.c:75:2=
6: error: 'struct gcry_thread_cbs' has no member named 'mutex_unlock'
> |   gcrypt_threads_callbacks.mutex_unlock=3Duser_callbacks->mutex_unlock;
> |                           ^
> | make[2]: *** [src/CMakeFiles/ssh_shared.dir/threads.c.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | Building C object src/CMakeFiles/ssh_shared.dir/server.c.o
> | cd /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-=
oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/build/src && /home/=
jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc  -DLIBSSH_EXPORTS -march=
=3Darmv5te -marm -mthumb-interwork  --sysroot=3D/home/jenkins/oe/shr-core-b=
ranches/shr-core/tmp-eglibc/sysroots/qemuarm  -O2 -pipe -g -feliminate-unus=
ed-debug-types -std=3Dgnu99 -pedantic -pedantic-errors -Wall -Wextra -Wshad=
ow -Wmissing-prototypes -Wdeclaration-after-statement -Wunused -Wfloat-equa=
l -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attrib=
ute -fPIC -fstack-protector -fPIC -I/home/jenkins/oe/shr-core-branches/shr-=
core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+4391=
4a5f07-r0/build/src -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/=
src -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-o=
e-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/git/include -I/home/=
jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnue=
abi/libssh/0.5.5+gitrAUTOINC+43914a5f07-r0/build -I/home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include    -fvisibility=
=3Dhidden -o CMakeFiles/ssh_shared.dir/server.c.o   -c /home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5=
.5+gitrAUTOINC+43914a5f07-r0/git/src/server.c
> | make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f=
07-r0/build'
> | make[1]: *** [src/CMakeFiles/ssh_shared.dir/all] Error 2
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libssh/0.5.5+gitrAUTOINC+43914a5f=
07-r0/build'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/li=
bssh/0.5.5+gitrAUTOINC+43914a5f07-r0/temp/log.do_compile.10360)
> NOTE: recipe libssh-0.5.5+gitrAUTOINC+43914a5f07-r0: task do_compile: Fai=
led
> ERROR: Task 16288 (/home/jenkins/oe/shr-core-branches/shr-core/meta-opene=
mbedded/meta-oe/recipes-support/libssh/libssh_git.bb, do_compile) failed wi=
th exit code '1'
>
> abiword:
> | tls_tunnel.cpp:126:31: warning: 'gcry_thread_cbs' is deprecated (declar=
ed at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm/usr/include/gcrypt.h:213) [-Wdeprecated-declarations]
> |  static struct gcry_thread_cbs gcry_threads_tunnel =3D
> |                                ^
> | tls_tunnel.cpp:130:50: error: too many initializers for 'gcry_thread_cb=
s'
> |    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL };
> |                                                   ^
> | tls_tunnel.cpp: In member function 'tls_tunnel::session_ptr_t tls_tunne=
l::ClientProxy::setup_tls_session(tls_tunnel::socket_ptr_t)':
> | tls_tunnel.cpp:485:20: warning: 'int gnutls_kx_set_priority(gnutls_sess=
ion_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h:298=
) [-Wdeprecated-declarations]
> |   return_val_if_neg(gnutls_kx_set_priority(*session_ptr,PRIORITIES), se=
ssion_ptr_t());
> |                     ^
> | tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
> |  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
> |                                          ^
> | tls_tunnel.cpp:485:66: warning: 'int gnutls_kx_set_priority(gnutls_sess=
ion_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h:298=
) [-Wdeprecated-declarations]
> |   return_val_if_neg(gnutls_kx_set_priority(*session_ptr,PRIORITIES), se=
ssion_ptr_t());
> |                                                                   ^
> | tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
> |  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
> |                                          ^
> | tls_tunnel.cpp:486:20: warning: 'int gnutls_cipher_set_priority(gnutls_=
session_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h=
:290) [-Wdeprecated-declarations]
> |   return_val_if_neg(gnutls_cipher_set_priority(*session_ptr,CIPHERS), s=
ession_ptr_t());
> |                     ^
> | tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
> |  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
> |                                          ^
> | tls_tunnel.cpp:486:67: warning: 'int gnutls_cipher_set_priority(gnutls_=
session_t, const int*)' is deprecated (declared at /home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/gnutls/compat.h=
:290) [-Wdeprecated-declarations]
> |   return_val_if_neg(gnutls_cipher_set_priority(*session_ptr,CIPHERS), s=
ession_ptr_t());
> |                                                                    ^
> | tls_tunnel.cpp:31:41: note: in definition of macro 'return_val_if_neg'
> |  #define return_val_if_neg(C, val) { if (C < 0) {return val;} }
> |                                          ^
> | tls_tunnel.cpp:502:18: warning: 'gnutls_x509_crt' is deprecated (declar=
ed at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm/usr/include/gnutls/compat.h:89) [-Wdeprecated-declarations]
> |   gnutls_x509_crt cert;
> |                   ^
> | tls_tunnel.cpp:503:22: warning: 'gnutls_datum' is deprecated (declared =
at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/include/gnutls/compat.h:112) [-Wdeprecated-declarations]
> |   const gnutls_datum* cert_list;
> |                       ^
> | make[6]: *** [tls_tunnel.lo] Error 1
> | make[6]: *** Waiting for unfinished jobs....
> | make[6]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/pl=
ugins/collab/backends/service/xp'
> | make[5]: *** [all-recursive] Error 1
> | make[5]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/pl=
ugins/collab/backends/service'
> | make[4]: *** [all-recursive] Error 1
> | make[4]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/pl=
ugins/collab/backends'
> | make[3]: *** [all-recursive] Error 1
> | make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/pl=
ugins/collab'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0/pl=
ugins'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/abiword/3.0.0-r0/abiword-3.0.0'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/ab=
iword/3.0.0-r0/temp/log.do_compile.12530)
> NOTE: recipe abiword-3.0.0-r0: task do_compile: Failed
> ERROR: Task 20957 (/home/jenkins/oe/shr-core-branches/shr-core/meta-opene=
mbedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do_compile) fail=
ed with exit code '1'
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

