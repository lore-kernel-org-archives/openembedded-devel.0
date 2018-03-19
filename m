Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7F878945
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 19:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1lK3IgyaP8ToXppx0fPGdeHfTGfA04l6laIzXYJe5+Y=; 
	b=lYLEt5Uaa1+Hr87pdEnt+G3CIE2LTjuZmcVqxXJz2ysqrA1tElIyeZ5snHKke5J1WWv9uUXGY2ZExQn6Fevf4mtTEv3bR6mWFdjdpLzbz4sD6zUXyPtcoTVbSVRfG6Pe3GG4mQ4SheYTZ+Y3AYVvsqmJAZbgkeS9gE2vtivzWv4s3Ft1d3IpYxKmJu4i2ZzSWLCPBSNOq0WscoJqRkVQpQgRgaH+5bp0q5GEJra+pjPs3A8v2YRCZNmsRWcLPWirjNLJd8pEG6whKk0pRjhTCt+ZKuOGsBv71h4DKWfgeE3YxWM5eVcrIdP3aTpec94mE/QnkSG5AWnRdVXLhafqXw==;
Received: from [192.168.10.146] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1ey0GI-0003zh-MS; Mon, 19 Mar 2018 20:16:03 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20180313222055.47545-1-psaavedra@igalia.com>
	<CAMKF1sozid9-1t8Yi7bJzvhFVMYW4VPmR8FC_mE-JJW8YQq1EA@mail.gmail.com>
From: Pablo Saavedra <psaavedra@igalia.com>
Message-ID: <4ea8d30f-01d9-d2b2-8c3e-38d5f1446033@igalia.com>
Date: Mon, 19 Mar 2018 20:16:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sozid9-1t8Yi7bJzvhFVMYW4VPmR8FC_mE-JJW8YQq1EA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] networkmanager upgrade to 1.10.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 19:16:04 -0000
X-Groupsio-MsgNum: 71342
Content-Type: multipart/mixed; boundary="------------04460EE54C9FBB161FBE5C29"
Content-Language: en-GB

--------------04460EE54C9FBB161FBE5C29
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15/03/18 21:11, Khem Raj wrote:
> On Tue, Mar 13, 2018 at 3:20 PM, Pablo Saavedra <psaavedra@igalia.com> =
wrote:
>> * Upgraded to latest stable version [1]
>> * Forward-port of the Yocto patches
>> * Disabled 0004-Define-missing-features-to-cater-for-musl.patch
>> * This version keeps fixed 'Fixed setting 802-1x.password-raw
>>   property in nmcli' error. Fixed on 1.6.4 [2].
>>
> I see that you disabled
> 0004-Define-missing-features-to-cater-for-musl.patch but did not
> delete it, secondly it seems to be refreshed so it might be changes as
> well.
> did you build this on musl based target ?
>

No, I didn't it, TBH. ... but I completed it few moments ago and it is
more complex than I expected I must admit.

First of all, the commented up patch can be re-added again with this
simple change (I will do if you OK):

=C2=A0 https://pastebin.com/aFrWzZr8

In second, I made was forced to do this new adaptations required in
other parts of the code (also included in the patch attached
0008-tmp.patch):

* Replace __register_atfork by pthread_atfork in process-util.c :
https://pastebin.com/0an4inyz
* In libnm-core/nm-json.c (L103):

=C2=A0 --- a/NetworkManager-1.10.6/libnm-core/nm-json.c =C2=A0 =C2=A0=C2=A0=
 =C2=A0 2018-03-19
17:49:41.875543465 +0100
=C2=A0 +++ b/NetworkManager-1.10.6/libnm-core/nm-json.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2018-03-19
17:49:55.519603264 +0100
=C2=A0 @@ -104,7 +104,7 @@
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bind_symbols (RTLD_DEFAUL=
T))
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
=C2=A0
=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle =3D dlopen (JANSSON_S=
ONAME, RTLD_LAZY | RTLD_LOCAL |
RTLD_NODELETE | RTLD_DEEPBIND);
=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle =3D dlopen (JANSSON_S=
ONAME, RTLD_LAZY | RTLD_LOCAL |
RTLD_NODELETE);
=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (!handle)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto out;

* Skipped `include <net/ethernet.h>` in other libs not GLIBC


* Finally, a hack in the configure.ac due to a compilation error which
stuck me during a big chunk of time today:

=C2=A0=C2=A0=C2=A0 BB_NUMBER_THREADS=3D'1' PARALLEL_MAKE=3D'-j 1' bitbake=
=C2=A0 networkmanager

=2E/i586-poky-linux-musl-libtool=C2=A0 --tag=3DCC=C2=A0=C2=A0 --mode=3Dli=
nk
i586-poky-linux-musl-gcc=C2=A0 -m32 -march=3Di586
--sysroot=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-poky-linux-m=
usl/networkmanager/1.10.6-r0/recipe-sysroot=C2=A0
-fdata-sections -ffunction-sections -Wl,--gc-sections=C2=A0 -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-pok=
y-linux-musl/networkmanager/1.10.6-r0=3D/usr/src/debug/networkmanager/1.1=
0.6-r0
-fdebug-prefix-map=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-pok=
y-linux-musl/networkmanager/1.10.6-r0/recipe-sysroot-native=3D
-fdebug-prefix-map=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-pok=
y-linux-musl/networkmanager/1.10.6-r0/recipe-sysroot=3D=C2=A0=C2=A0
-fno-strict-aliasing
-Wl,--version-script=3D"../NetworkManager-1.10.6/libnm/libnm.ver"=C2=A0
-version-info "1:0:1" -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o
libnm/libnm.la -rpath /usr/lib=C2=A0=C2=A0=C2=A0
libnm/libnm_libnm_la-nm-access-point.lo
libnm/libnm_libnm_la-nm-active-connection.lo
libnm/libnm_libnm_la-nm-client.lo
libnm/libnm_libnm_la-nm-dbus-helpers.lo
libnm/libnm_libnm_la-nm-device-adsl.lo
libnm/libnm_libnm_la-nm-device-bond.lo
libnm/libnm_libnm_la-nm-device-bridge.lo
libnm/libnm_libnm_la-nm-device-bt.lo
libnm/libnm_libnm_la-nm-device-dummy.lo
libnm/libnm_libnm_la-nm-device-ethernet.lo
libnm/libnm_libnm_la-nm-device-generic.lo
libnm/libnm_libnm_la-nm-device-infiniband.lo
libnm/libnm_libnm_la-nm-device-ip-tunnel.lo
libnm/libnm_libnm_la-nm-device-macsec.lo
libnm/libnm_libnm_la-nm-device-macvlan.lo
libnm/libnm_libnm_la-nm-device-modem.lo
libnm/libnm_libnm_la-nm-device-olpc-mesh.lo
libnm/libnm_libnm_la-nm-device-ovs-interface.lo
libnm/libnm_libnm_la-nm-device-ovs-port.lo
libnm/libnm_libnm_la-nm-device-ovs-bridge.lo
libnm/libnm_libnm_la-nm-device-ppp.lo
libnm/libnm_libnm_la-nm-device-team.lo
libnm/libnm_libnm_la-nm-device-tun.lo
libnm/libnm_libnm_la-nm-device-vlan.lo
libnm/libnm_libnm_la-nm-device-vxlan.lo
libnm/libnm_libnm_la-nm-device-wifi.lo
libnm/libnm_libnm_la-nm-device-wimax.lo
libnm/libnm_libnm_la-nm-device.lo libnm/libnm_libnm_la-nm-dhcp-config.lo
libnm/libnm_libnm_la-nm-dhcp4-config.lo
libnm/libnm_libnm_la-nm-dhcp6-config.lo
libnm/libnm_libnm_la-nm-dns-manager.lo
libnm/libnm_libnm_la-nm-ip-config.lo
libnm/libnm_libnm_la-nm-ip4-config.lo
libnm/libnm_libnm_la-nm-ip6-config.lo libnm/libnm_libnm_la-nm-manager.lo
libnm/libnm_libnm_la-nm-object.lo
libnm/libnm_libnm_la-nm-remote-connection.lo
libnm/libnm_libnm_la-nm-remote-settings.lo
libnm/libnm_libnm_la-nm-secret-agent-old.lo
libnm/libnm_libnm_la-nm-vpn-connection.lo
libnm/libnm_libnm_la-nm-vpn-plugin-old.lo
libnm/libnm_libnm_la-nm-vpn-editor.lo
libnm/libnm_libnm_la-nm-vpn-service-plugin.lo
libnm/libnm_libnm_la-nm-wimax-nsp.lo=C2=A0
libnm/libnm_libnm_la-nm-enum-types.lo libnm/libnm-utils.la none required
-lgio-2.0 -lgobject-2.0 -Wl,--export-dynamic -lgmodule-2.0 -pthread
-lglib-2.0 -luuid -ludev
i586-poky-linux-musl-libtool: link: i586-poky-linux-musl-gcc -m32
-march=3Di586
--sysroot=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-poky-linux-m=
usl/networkmanager/1.10.6-r0/recipe-sysroot
-fdata-sections -ffunction-sections -Wl,--gc-sections -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-pok=
y-linux-musl/networkmanager/1.10.6-r0=3D/usr/src/debug/networkmanager/1.1=
0.6-r0
-fdebug-prefix-map=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-pok=
y-linux-musl/networkmanager/1.10.6-r0/recipe-sysroot-native=3D
-fdebug-prefix-map=3D/home/igalia/psaavedra/yocto/build/tmp/work/i586-pok=
y-linux-musl/networkmanager/1.10.6-r0/recipe-sysroot=3D
-fno-strict-aliasing
-Wl,--version-script=3D../NetworkManager-1.10.6/linker-script-binary.ver
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o src/nm-iface-helper
src/src_nm_iface_helper-nm-iface-helper.o -Wl,--export-dynamic -pthread
none required=C2=A0 src/.libs/libNetworkManagerBase.a -luuid -lssl3 -lsmi=
me3
-lnss3 -lsoftokn3 -lnssutil3 -lplds4 -lplc4 -lnspr4 -lpthread -ldl
src/.libs/libsystemd-nm.a -lgio-2.0 -lgobject-2.0 -lgmodule-2.0
-lglib-2.0 -ludev -lnl-3 -lnl-genl-3 -lnl-nf-3 -lnl-route-3 -lndp -pthrea=
d
i586-poky-linux-musl-gcc: error: none: No such file or directory
i586-poky-linux-musl-gcc: error: required: No such file or directory


=C2=A0 After a while debugging with 'bitbake -cdevshell networkmanager' I=

saw, in the generated Makefile the following definition:

=C2=A0 =C2=A0 DL_LIBS =3D none required

=C2=A0 which is generated in the auto configure (configure log):

=C2=A0 =C2=A0 checking for library containing dlopen... none required


=C2=A0 to fix this, my idea, is reuse the next patch from [1] (also inclu=
ded
in the attached file):

=C2=A0=C2=A0=C2=A0 --- a/configure.ac
=C2=A0=C2=A0=C2=A0 +++ b/configure.ac
=C2=A0=C2=A0=C2=A0 @@ -306,6 +306,7 @@ dnl
=C2=A0 =C2=A0 dnl Checks for libdl - on certain platforms its part of lib=
c
=C2=A0 =C2=A0 dnl
=C2=A0 =C2=A0 AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=
=3D])
=C2=A0=C2=A0=C2=A0 +AS_IF([test "$ac_cv_search_dlopen" =3D "none
required"],[ac_cv_search_dlopen=3D""])
=C2=A0 =C2=A0 AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")

=C2=A0 =C2=A0 PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >=3D 2.37.6 gmodule-2=
=2E0],

=C2=A0 Any better idea =C2=BF?

BTW, Thanks in advance for the review. If you OK, I'd very happy to send
a 2# version of the patch for the networkmanager package with these chang=
es

[1]
https://github.com/voidlinux/void-packages/blob/master/srcpkgs/NetworkMan=
ager/patches/musl-dlopen-configure-ac.patch

--------------04460EE54C9FBB161FBE5C29
Content-Type: text/x-patch;
 name="0008-tmp.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0008-tmp.patch"

diff --git a/configure.ac b/configure.ac
index c9d3e56..fbf965d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -306,6 +306,7 @@ dnl
 dnl Checks for libdl - on certain platforms its part of libc
 dnl
 AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=3D])
+AS_IF([test "$ac_cv_search_dlopen" =3D "none required"],[ac_cv_search_dlop=
en=3D""])
 AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
=20
 PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >=3D 2.37.6 gmodule-2.0],
diff --git a/libnm-core/nm-json.c b/libnm-core/nm-json.c
index f9042b1..134c6d3 100644
--- a/libnm-core/nm-json.c
+++ b/libnm-core/nm-json.c
@@ -104,7 +104,7 @@ nm_jansson_load (void)
 	if (!bind_symbols (RTLD_DEFAULT))
 		goto out;
=20
-	handle =3D dlopen (JANSSON_SONAME, RTLD_LAZY | RTLD_LOCAL | RTLD_NODELETE=
 | RTLD_DEEPBIND);
+	handle =3D dlopen (JANSSON_SONAME, RTLD_LAZY | RTLD_LOCAL | RTLD_NODELETE=
);
 	if (!handle)
 		goto out;
=20
diff --git a/src/systemd/src/basic/process-util.c b/src/systemd/src/basic/p=
rocess-util.c
index 272030d..c07d02d 100644
--- a/src/systemd/src/basic/process-util.c
+++ b/src/systemd/src/basic/process-util.c
@@ -23,6 +23,7 @@
 #include <errno.h>
 #include <limits.h>
 #include <linux/oom.h>
+#include <pthread.h>
 #include <sched.h>
 #include <signal.h>
 #include <stdbool.h>
@@ -1015,11 +1016,6 @@ static void reset_cached_pid(void) {
         cached_pid =3D CACHED_PID_UNSET;
 }
=20
-/* We use glibc __register_atfork() + __dso_handle directly here, as they =
are not included in the glibc
- * headers. __register_atfork() is mostly equivalent to pthread_atfork(), =
but doesn't require us to link against
- * libpthread, as it is part of glibc anyway. */
-extern int __register_atfork(void (*prepare) (void), void (*parent) (void)=
, void (*child) (void), void * __dso_handle);
-extern void* __dso_handle __attribute__ ((__weak__));
=20
 pid_t getpid_cached(void) {
         pid_t current_value;
@@ -1042,7 +1038,7 @@ pid_t getpid_cached(void) {
=20
                 new_pid =3D getpid();
=20
-                if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_=
handle) !=3D 0) {
+                if (pthread_atfork(NULL, NULL, reset_cached_pid) !=3D 0) {
                         /* OOM? Let's try again later */
                         cached_pid =3D CACHED_PID_UNSET;
                         return new_pid;
diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/sys=
temd/sd-dhcp-client.h
index 5e46d8d..33d40f5 100644
--- a/src/systemd/src/systemd/sd-dhcp-client.h
+++ b/src/systemd/src/systemd/sd-dhcp-client.h
@@ -21,7 +21,9 @@
 ***/
=20
 #include <inttypes.h>
+#ifdef __GLIBC__
 #include <net/ethernet.h>
+#endif
 #include <netinet/in.h>
 #include <sys/types.h>
=20
diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/syst=
emd/sd-dhcp-lease.h
index 7ab99cc..19937be 100644
--- a/src/systemd/src/systemd/sd-dhcp-lease.h
+++ b/src/systemd/src/systemd/sd-dhcp-lease.h
@@ -22,7 +22,9 @@
 ***/
=20
 #include <inttypes.h>
+#ifdef __GLIBC__
 #include <net/ethernet.h>
+#endif
 #include <netinet/in.h>
 #include <sys/types.h>
=20
diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/sy=
stemd/sd-dhcp6-client.h
index 7819f0d..e09b90f 100644
--- a/src/systemd/src/systemd/sd-dhcp6-client.h
+++ b/src/systemd/src/systemd/sd-dhcp6-client.h
@@ -21,7 +21,9 @@
 ***/
=20
 #include <inttypes.h>
+#ifdef __GLIBC__
 #include <net/ethernet.h>
+#endif
 #include <sys/types.h>
=20
 #include "sd-dhcp6-lease.h"
diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/=
sd-ipv4ll.h
index 5ba9208..3714fe7 100644
--- a/src/systemd/src/systemd/sd-ipv4ll.h
+++ b/src/systemd/src/systemd/sd-ipv4ll.h
@@ -20,7 +20,9 @@
   along with systemd; If not, see <http://www.gnu.org/licenses/>.
 ***/
=20
+#ifdef __GLIBC__
 #include <net/ethernet.h>
+#endif
 #include <netinet/in.h>
=20
 #include "sd-event.h"

--------------04460EE54C9FBB161FBE5C29--
