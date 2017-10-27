Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 475 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Oct 2017 11:51:39 UTC
Received: from smtp113.iad3a.emailsrvr.com (smtp113.iad3a.emailsrvr.com
	[173.203.187.113])
	by mail.openembedded.org (Postfix) with ESMTP id A9D257827D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 11:51:39 +0000 (UTC)
Received: from smtp23.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp23.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	830022531E for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 07:43:45 -0400 (EDT)
Received: from app51.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140])
	by smtp23.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	749592530C for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 07:43:45 -0400 (EDT)
X-Sender-Id: scott@jumpnowtek.com
Received: from app51.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140]) by 0.0.0.0:25 (trex/5.7.12);
	Fri, 27 Oct 2017 07:43:45 -0400
Received: from jumpnowtek.com (localhost.localdomain [127.0.0.1])
	by app51.wa-webapps.iad3a (Postfix) with ESMTP id 6736941087
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 07:43:45 -0400 (EDT)
Received: by apps.rackspace.com (Authenticated sender: scott@jumpnowtek.com,
	from: scott@jumpnowtek.com) 
	with HTTP; Fri, 27 Oct 2017 07:43:45 -0400 (EDT)
X-Auth-ID: scott@jumpnowtek.com
Date: Fri, 27 Oct 2017 07:43:45 -0400 (EDT)
From: "Scott Ellis" <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
Message-ID: <1509104625.420326963@apps.rackspace.com>
X-Mailer: webmail/12.9.6-RC
Subject: mesa-gl build failing for RPi0
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
X-List-Received-Date: Fri, 27 Oct 2017 11:51:39 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Using rocko=0A=0A...=0A| glsl/.libs/libstandalone.a(libmesautil_la-disk_cac=
he.o): In function `evict_lru_item':=0A| /usr/src/debug/mesa-gl/2_17.1.7-r0=
/mesa-17.1.7/src/util/disk_cache.c:615: undefined reference to `__atomic_fe=
tch_add_8'=0A| glsl/.libs/libstandalone.a(libmesautil_la-disk_cache.o): In =
function `cache_put':=0A| /usr/src/debug/mesa-gl/2_17.1.7-r0/mesa-17.1.7/sr=
c/util/disk_cache.c:886: undefined reference to `__atomic_fetch_add_8'=0A| =
glsl/.libs/libstandalone.a(libmesautil_la-disk_cache.o): In function `disk_=
cache_remove':=0A| /usr/src/debug/mesa-gl/2_17.1.7-r0/mesa-17.1.7/src/util/=
disk_cache.c:637: undefined reference to `__atomic_fetch_add_8'=0A| collect=
2: error: ld returned 1 exit status=0A| Makefile:2076: recipe for target 'g=
lsl_compiler' failed=0A| make[4]: *** [glsl_compiler] Error 1=0A| make[4]: =
Leaving directory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-g=
nueabi/mesa-gl/2_17.1.7-r0/build/src/compiler'=0A| Makefile:1528: recipe fo=
r target 'all' failed=0A| make[3]: *** [all] Error 2=0A| make[3]: Leaving d=
irectory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-gnueabi/me=
sa-gl/2_17.1.7-r0/build/src/compiler'=0A| Makefile:840: recipe for target '=
all-recursive' failed=0A| make[2]: *** [all-recursive] Error 1=0A| make[2]:=
 Leaving directory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-=
gnueabi/mesa-gl/2_17.1.7-r0/build/src'=0A| Makefile:631: recipe for target =
'all' failed=0A| make[1]: *** [all] Error 2=0A| make[1]: Leaving directory =
'/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-gnueabi/mesa-gl/2_1=
7.1.7-r0/build/src'=0A| Makefile:631: recipe for target 'all-recursive' fai=
led=0A| make: *** [all-recursive] Error 1=0A| ERROR: oe_runmake failed=0A=
=0A=0AThe solution used for armv5 boards in mesa.inc works for armv6=0A=0A =
 CFLAGS_append_armv6 =3D " -DMISSING_64BIT_ATOMICS"=0A=0A=0AI'm using it in=
 a private layer bbappend, but might belong=0Ain mesa.inc alongside the arm=
v5 line.=0A=0A=0ASome discussion of the bug here=0A=0A  https://bugs.debian=
.org/cgi-bin/bugreport.cgi?bug=3D874531=0A


