Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by mx.groups.io with SMTP id smtpd.web10.2748.1588185837301880760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 11:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=a2A/Mp8O;
 spf=pass (domain: gmx.net, ip: 212.227.15.19, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1588185835;
	bh=H5B/ALNg8TCKPWwcRa27HPekcwVRihyrc+thM+r4hQg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=a2A/Mp8OxiQ49gsozEElFsyr2gRfvjevKzy/4GDXKZH020/MDu/Mgc6+j1GJka7pQ
	 v48rWgAARGH0tE6RJUtOdB8nRJXkCWvNmBoU/GvGd0UrFVBdTTw53FDA0dGDbGTB0w
	 He4setcc8UbB7f8fnKWs+GrWORbayKqTefbiNsMw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mg6e4-1iyODl2R14-00hgv5; Wed, 29 Apr 2020 20:43:55 +0200
From: n.jeker@gmx.net
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Jeker <n.jeker@gmx.net>
Subject: [meta-oe][zeus][PATCH] collectd: Fix compatibility with lmsensors 3.5
Date: Wed, 29 Apr 2020 20:43:53 +0200
Message-Id: <20200429184353.174650-1-n.jeker@gmx.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:2zk3KkkQRsIS5Qi+QgYpVGQWDykIbNKGLxeXNvWH5EPFIfLmxzz
 nQB9urj8tr0HdheUk8oZ4QZSe3wtbbD8c/wC7FQLo/hbDjzyrZ15+20asR6OG6JLi7YtOzd
 lAFsf4yqMUl/hWFvmQpWLLSa0v/plllBsooZLxEEdBSLG7ez/VSz22srqkY0coDtWxNkCL1
 LZCsWkgDo22efXp6SAGhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+jRnehJJgZ0=:NoUXfi2hYe23eaewFsLKr+
 dQWXzxewBZVhzw9tzaXU8Hy7DMFly3+BJeMZHR01yZIuq/N0QCp0a/tmMMzoCbu9AJ/0ksSk+
 ztgxutuqfYB8JOKIGkBcu5DPZ+z8Pmx7mgNW67ueltJpG5OFtogiw0yiNz7Eahbi8iRm03+Bn
 LoHMPEAPSdtm2w1wydSGNBQY9Opwt60Hiy9Rja2uKcbjY8VX1o5u+YjidOmmAN97krLkYrNaP
 NcQB3s6/H+5auj5jVMdWS19GaAqaXpJZb0yk340jS+sc4iqbJgzSJUCdL5Kw26zTpX/RxRMp5
 j3pXC6blC/O8uQ5E8PQja/oOxf9MJrNcztf/Gv+Z95SFNdNLIvAd/zWgczfFvSGBG7OcT9gHJ
 4WuDPQOXCrnwMQ7zgaRK5nMX1fDpuQuBBPQ6XKBPJb8byxWpeL89jwrl4jNOfVT4eXnGZ1fVl
 3cmEcluxO2c6XB04099du5F0mHDa/xF1dBz8d9aEYrkIf2gr2/6R1Yyd3egHfoFslX3nvbwyQ
 Sel9LXfDl3h3O5rEPf4472XHfc2zCIPM9Gn0sHyDRwuWIXAV3H3psOcWgF6nOdxJf/PYZoyGD
 OA7rgStz3lWc6KR309fQuuh6OKSOUBWG6yqZUtzsiTc7fDEg63rXEeKwVhtQdIKAuvXxtXiCo
 lAmsTkaz9Uv69dZKD9Fim1J7CCTa5SbQq8a/hNHtE4dqeWxOTZIOEULGLwStPY+oQlRMXfTcR
 ze5Sw6TN7xpYh63CIxWLMltIt+w68/l7Zor15p0rh8PzZvzEhxaDybb7LUJUWQfJhHm5LfuSh
 W+zx5wCtE7vwY/a+biCyUPTWxBC2AUYSt1e8EoJFumjA1mHkP/RBoqcnZ3zKs2zpx4HKQHu46
 +hPN8ZLISayJs47ChmT+MUS1AZlvI6i7tfZr6eKThmMi9y95Kc9K6BmYJvyCtWPJ+ccfdrRD9
 1bs/LcexxRFDulv+S1KUSsdTJx92MY+QjjFOH7L//U6oS+qbsIdjXsgumBny1ljXLeQLzsBfj
 gvurnqECWpnnF/xQZRQqmeLP3QvuqOMrV24cRyfiZknkxT4fElxwJ6cbr0BNvf3ELXpa4l+Ch
 w8R2WNV7UbiVl4p5FDe6PRLzMSqrKt9ZKZSlH2Ol4/rYfIUiSXQieZ6H/rPlQE5F1fGoOqHbd
 Ua723Z70+t0XyN2LNErVFs4rE/N6JO5glSU+WPyOwRV2KNTtfM7etMRA7JTl96nB1aHy5xJFm
 FSJ35sdyUyCDNDKQD
Content-Transfer-Encoding: quoted-printable

Collectd with the 'sensors' PACKAGECONFIG enabled fails to build because
of an incompatibility with the lmsensors version in meta-oe. This is
a backport of the relevant patch from collectd, which actually just
removes the lmsensors version checks.

  ../collectd-5.8.1/src/sensors.c:165:2: error: #error "This version of li=
bsensors is not supported yet. Please report this " "as bug."
=2D--
 ...checks-for-upper-limit-of-SENSORS_AP.patch | 90 +++++++++++++++++++
 .../collectd/collectd_5.8.1.bb                |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-sensor=
s-Removed-checks-for-upper-limit-of-SENSORS_AP.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-sensors-Remov=
ed-checks-for-upper-limit-of-SENSORS_AP.patch b/meta-oe/recipes-extended/c=
ollectd/collectd/0001-sensors-Removed-checks-for-upper-limit-of-SENSORS_AP=
.patch
new file mode 100644
index 000000000..6d4aa4335
=2D-- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-sensors-Removed-chec=
ks-for-upper-limit-of-SENSORS_AP.patch
@@ -0,0 +1,90 @@
+From 1d6dbbfc5b548fcd8ad542a5d29d59bae5da4ed8 Mon Sep 17 00:00:00 2001
+From: Nicolas Jeker <n.jeker@gmx.net>
+Date: Wed, 29 Apr 2020 18:53:06 +0200
+Subject: [PATCH] sensors: Removed checks for upper limit of
+ SENSORS_API_VERSION
+
+That makes no more sense after lm-sensors got new maintainers.
+
+Issue: #3006
+
+Backported to collectd 5.8.1
+
+Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
+---
+ src/sensors.c | 17 ++++++-----------
+ 1 file changed, 6 insertions(+), 11 deletions(-)
+
+diff --git a/src/sensors.c b/src/sensors.c
+index f4ecda5e..33982e06 100644
+--- a/src/sensors.c
++++ b/src/sensors.c
+@@ -149,7 +149,7 @@ typedef struct featurelist {
+ static char *conffile =3D SENSORS_CONF_PATH;
+ /* #endif SENSORS_API_VERSION < 0x400 */
+
+-#elif (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x500)
++#elif (SENSORS_API_VERSION >=3D 0x400)
+ typedef struct featurelist {
+   const sensors_chip_name *chip;
+   const sensors_feature *feature;
+@@ -159,11 +159,6 @@ typedef struct featurelist {
+
+ static char *conffile =3D NULL;
+ static _Bool use_labels =3D 0;
+-/* #endif (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x5=
00) */
+-
+-#else /* if SENSORS_API_VERSION >=3D 0x500 */
+-#error "This version of libsensors is not supported yet. Please report t=
his " \
+-	"as bug."
+ #endif
+
+ static featurelist_t *first_feature =3D NULL;
+@@ -223,7 +218,7 @@ static int sensors_config(const char *key, const char=
 *value) {
+     if (IS_TRUE(value))
+       ignorelist_set_invert(sensor_list, 0);
+   }
+-#if (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x500)
++#if (SENSORS_API_VERSION >=3D 0x400)
+   else if (strcasecmp(key, "UseLabels") =3D=3D 0) {
+     use_labels =3D IS_TRUE(value) ? 1 : 0;
+   }
+@@ -353,7 +348,7 @@ static int sensors_load_conf(void) {
+   }   /* while sensors_get_detected_chips */
+ /* #endif SENSORS_API_VERSION < 0x400 */
+
+-#elif (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x500)
++#elif (SENSORS_API_VERSION >=3D 0x400)
+   chip_num =3D 0;
+   while ((chip =3D sensors_get_detected_chips(NULL, &chip_num)) !=3D NUL=
L) {
+     const sensors_feature *feature;
+@@ -410,7 +405,7 @@ static int sensors_load_conf(void) {
+       } /* while (subfeature) */
+     }   /* while (feature) */
+   }     /* while (chip) */
+-#endif /* (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x5=
00) */
++#endif /* (SENSORS_API_VERSION >=3D 0x400) */
+
+   if (first_feature =3D=3D NULL) {
+     sensors_cleanup();
+@@ -485,7 +480,7 @@ static int sensors_read(void) {
+   } /* for fl =3D first_feature .. NULL */
+ /* #endif SENSORS_API_VERSION < 0x400 */
+
+-#elif (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x500)
++#elif (SENSORS_API_VERSION >=3D 0x400)
+   for (featurelist_t *fl =3D first_feature; fl !=3D NULL; fl =3D fl->nex=
t) {
+     double value;
+     int status;
+@@ -528,7 +523,7 @@ static int sensors_read(void) {
+
+     sensors_submit(plugin_instance, type, type_instance, value);
+   } /* for fl =3D first_feature .. NULL */
+-#endif /* (SENSORS_API_VERSION >=3D 0x400) && (SENSORS_API_VERSION < 0x5=
00) */
++#endif /* (SENSORS_API_VERSION >=3D 0x400) */
+
+   return 0;
+ } /* int sensors_read */
+--
+2.26.2
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb b/meta-oe=
/recipes-extended/collectd/collectd_5.8.1.bb
index 0951ac076..aa63f2559 100644
=2D-- a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "http://collectd.org/files/collectd-${PV}.ta=
r.bz2 \
            file://0005-Disable-new-gcc8-warnings.patch \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch=
 \
            file://0001-Remove-including-sys-sysctl.h-on-glibc-based-syste=
ms.patch \
+           file://0001-sensors-Removed-checks-for-upper-limit-of-SENSORS_=
AP.patch \
            "
 SRC_URI[md5sum] =3D "bfce96c42cede5243028510bcc57c1e6"
 SRC_URI[sha256sum] =3D "e796fda27ce06377f491ad91aa286962a68c2b54076aa77a2=
9673d53204453da"
=2D-
2.26.2

