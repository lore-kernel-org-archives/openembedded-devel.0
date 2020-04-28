Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.2372.1588054459063830193
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 23:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=KmTwXI6D;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=3809a76ea=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588054459; x=1619590459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s2FeCCclzLp4L+5zRQJsPdGd90Wc20Gpsb1u7QBf6Mk=;
  b=KmTwXI6DOzmSSmDqaIjyU4gOezwsy/waKYko/1p3jDPSybMWA1K7barS
   8o1oV0h6aF+Pk0TmqaDOUko72Uf9KmtimIMzEIKViVCqBoHE7xfOYQTE1
   QqKLGZVmQZu0Kl/5PfME/1CIb1fTh7ol/vlIzXqFJz/mauR/6ho+LrmKr
   g4o6pxv6YDkP8jmWmzQW6+5k/kcp6nKlN2Ol1Ctup+lSMqyqlNiz+WTsO
   AZZXQuEPs12DRmSozbIeFrU7DOErp5eQ1S8wD/CI4hqO1sh/lrK5YH9pL
   uZdW9mLlO8uASkswEu8Rspb+UacrCYOZ/JMbxNYYtXFfeZZfOqPCgmK0i
   g==;
IronPort-SDR: Hb0Oa6InsAZbcW0CmYnt1svrIIhOwLpng3yInVlq4OKKVz50TXCOvP/7vTCcMIJBGYZEqDXaWP
 CW/oomTvmd4AfQ7nhcN2aR7WAdGe86K6t4wZCxuh3yeZ5X5u4xndkr2hOX4Cnr94M7Iw+Wm/yn
 4zM8UzIXH+E5bedKr5afySjvNdRttRe6bmTZ6iZ0rZZLiULugEqdjSC2fUmXZ+bkNeDCPAfoF7
 4CFb8rVU3uog5tJhRELu67rLlRDZIwmeSQVfx54w5bPIUsjFTb/P+B6LxfpQ1/XuVFy0+G5xlU
 e5I=
X-IronPort-AV: E=Sophos;i="5.73,327,1583190000"; 
   d="scan'208";a="24025831"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jacob.kroon@gmail.com>, Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH v2] openjdk-8: update to latest ga version 252
Date: Tue, 28 Apr 2020 08:14:02 +0200
Message-ID: <20200428061402.106880-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch also drops the md5 checksums as sha256 checksums are sufficient.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
CHANGES v2:
 + added missing openjre recipe update
---
 ...-native_242.bb => openjdk-8-native_252.bb} |  0
 .../openjdk/openjdk-8-release-aarch32.inc     | 26 +++++++------------
 .../openjdk/openjdk-8-release-aarch64.inc     | 26 +++++++------------
 recipes-core/openjdk/openjdk-8-release.inc    | 24 ++++++-----------
 .../{openjdk-8_242.bb => openjdk-8_252.bb}    |  0
 .../{openjre-8_242.bb => openjre-8_252.bb}    |  0
 6 files changed, 26 insertions(+), 50 deletions(-)
 rename recipes-core/openjdk/{openjdk-8-native_242.bb => openjdk-8-native_252.bb} (100%)
 rename recipes-core/openjdk/{openjdk-8_242.bb => openjdk-8_252.bb} (100%)
 rename recipes-core/openjdk/{openjre-8_242.bb => openjre-8_252.bb} (100%)

diff --git a/recipes-core/openjdk/openjdk-8-native_242.bb b/recipes-core/openjdk/openjdk-8-native_252.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8-native_242.bb
rename to recipes-core/openjdk/openjdk-8-native_252.bb
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch32.inc b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
index 686b562..62dc866 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch32.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch32.inc
@@ -4,39 +4,31 @@ COMPATIBLE_HOST = "^$"
 COMPATIBLE_HOST_armv7a = "arm"
 COMPATIBLE_HOST_armv7ve = "arm"
 
-CHANGESET_ID="200120"
+CHANGESET_ID="20200415"
 
 CORBA_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[corba.md5sum]    = "2abf6d5394d9c5310af1e4ca6cec4355"
-SRC_URI[corba.sha256sum] = "52e83dfa2fa4fcc8c71f3b2959cca2136099b9c575d3726148c02b9cf7d06324"
+SRC_URI[corba.sha256sum] = "e8dab3ffbc39fec724604b8c65408f32dcca1682769077c5b4f71b571938fe26"
 
 HOTSPOT_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[hotspot.md5sum]    = "e252af6c20d6190e0613f39c6066e3cc"
-SRC_URI[hotspot.sha256sum] = "bfff2ef23ee80acd73a0774e7011028c3598e75d2ee8b3271524ec8ea54801ae"
+SRC_URI[hotspot.sha256sum] = "7aebf690a05746e4fbcdcd75ac4e67acb2f0b087bba3bcb064675468626f5822"
 
 JAXP_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jaxp.md5sum]    = "56dc7a99589582b18bbbb5c4464022c8"
-SRC_URI[jaxp.sha256sum] = "430e49ba485737c02312557f4deb8562853e58be19ed175ea63b396307f140ce"
+SRC_URI[jaxp.sha256sum] = "44883e0e836ee5fa2fcb4df936bafcfad69c57d05876d44ecefc5b3cb6b085c0"
 
 JAXWS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jaxws.md5sum]    = "2bbcba759f24f5dcec0c33cd62382e4f"
-SRC_URI[jaxws.sha256sum] = "c350716ff8782cc311ca17450e2d198d707d3fb71de9dc3394df39766979559f"
+SRC_URI[jaxws.sha256sum] = "34f6cf3eb34c0c310e0cc31b876b189fd6b2e2c2dcc1066af5347f3a0873d2d3"
 
 JDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[jdk.md5sum]    = "e17f3f4ea8a409e4a1b09a12b3b5309d"
-SRC_URI[jdk.sha256sum] = "dfa4a7e7f8ab8daf34343b1c33544b6209e422c74d5be1dbbd8ef80e2365c8aa"
+SRC_URI[jdk.sha256sum] = "f89688b5673ed75b1bebfd530a979788a4cbe942ce39eb38784f8c9e1303012b"
 
 LANGTOOLS_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[langtools.md5sum]    = "06ca78c1d4e058f277876f4e6177d9b0"
-SRC_URI[langtools.sha256sum] = "59ccafa433f5510c91835efcafbe9ff9c707034ec3305dc3a4c1a85fac65ab0c"
+SRC_URI[langtools.sha256sum] = "18357720e3b924dea2f171235ae06e753aeef7958a3ce7a2a8d41fa6e2c90454"
 
 NASHORN_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[nashorn.md5sum]    = "1958e204f3984abeb2cf9e7c57aa7839"
-SRC_URI[nashorn.sha256sum] = "e964721e539807a38bdcbce7259d235f873974a686badbc274b7368a288f0021"
+SRC_URI[nashorn.sha256sum] = "abd6ccf28278ce5775eebada339228fe2e3380d57d009179acdd7026adb21448"
 
 OPENJDK_CHANGESET_arm = "jdk8u${PV}-ga-aarch32-${CHANGESET_ID}"
-SRC_URI[openjdk.md5sum]    = "9aceb3b4cd710cdda55be4fe6a5303c9"
-SRC_URI[openjdk.sha256sum] = "9691291b26a650d854ce0feacf32dfb3b956165c5d2db6e1ff46dd44f4c517cf"
+SRC_URI[openjdk.sha256sum] = "06d141aa01b80aa0c167167081e2139b3edf5af764cf17bbe9e1b57bf4f585ab"
 
 PACKAGECONFIG_append_armv7a = " client"
 PACKAGECONFIG_append_armv7ve = " client"
diff --git a/recipes-core/openjdk/openjdk-8-release-aarch64.inc b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
index d08892d..86dffff 100644
--- a/recipes-core/openjdk/openjdk-8-release-aarch64.inc
+++ b/recipes-core/openjdk/openjdk-8-release-aarch64.inc
@@ -2,36 +2,28 @@ require openjdk-8-release-common.inc
 
 COMPATIBLE_HOST = "aarch64"
 
-CHANGESET_ID="b07"
+CHANGESET_ID="b09"
 
 CORBA_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[corba.md5sum]    = "d6dfd6f0c3bf4c6dc1f867dc7bcf8730"
-SRC_URI[corba.sha256sum] = "e80dae94f21ca9de2269bc9de72f1098d417e9f7d6ff69d047e26669e31b1bc4"
+SRC_URI[corba.sha256sum] = "13ce2345dec4390a7ed61066275528c1d4fe246abb3ffc16bdfd93c0e8ead193"
 
 HOTSPOT_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[hotspot.md5sum]    = "44731f82f6e2a0697f414ae62f9eff54"
-SRC_URI[hotspot.sha256sum] = "3acb0bfa3eda0137e3c70ab10b59f139e0720116ed6ecf3f9c8633ebc36947b1"
+SRC_URI[hotspot.sha256sum] = "80dd8b1289905252f5f9d97ba2302fe4b77a76851709f10d429848750b709c66"
 
 JAXP_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jaxp.md5sum]    = "7fb4207ba9277e109439101961223fc7"
-SRC_URI[jaxp.sha256sum] = "22616e56825c611c70968c34a229661d4cb910fdb0c3936ae3c75de2330abfb5"
+SRC_URI[jaxp.sha256sum] = "a52f5497318980f379ce05ff8e638a0ae0ce7265d8922ddfb731d26989faf161"
 
 JAXWS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jaxws.md5sum]    = "a27379cbd6253408eee4aa0b8a551042"
-SRC_URI[jaxws.sha256sum] = "b6eb69d867694002284712a28058770170d885e6de6872cba260061d001b77ae"
+SRC_URI[jaxws.sha256sum] = "1db8876408222a8eec8432bd9778559ea80cae36a2c6dead32723279d1622741"
 
 JDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[jdk.md5sum]    = "2e64397ef1f35309aa7de00d46c2c751"
-SRC_URI[jdk.sha256sum] = "d470d24eddc314e5c30035881f3af6f0c48a3360accc0644ec26d9d32d9ea0e6"
+SRC_URI[jdk.sha256sum] = "abc7a1eec87ac330bebfa8ec4a3db72c27b63aa50175abfade580a46b7f2d865"
 
 LANGTOOLS_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[langtools.md5sum]    = "71c2ce819538b0acc443c0519dfa43c1"
-SRC_URI[langtools.sha256sum] = "219919b7980d863cc26abd87341012f4802dd12a11a45f6627309ec365a9e838"
+SRC_URI[langtools.sha256sum] = "c4e3dd471372dad5a545ec038104c7706fa02da452275ce118ad7e38e418a57a"
 
 NASHORN_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[nashorn.md5sum]    = "6ee9418598ca411fe0b2339fa1a3a272"
-SRC_URI[nashorn.sha256sum] = "6d86c23301d2cbc1ea72474730336e089eb4c3d3014bdf0f3a9d3b5976a75f58"
+SRC_URI[nashorn.sha256sum] = "956ef3a52dc97fb28aeeeb9ccbd371c2b7f14e253fd63d1f98bb1bf87ddf1929"
 
 OPENJDK_CHANGESET_aarch64 = "aarch64-shenandoah-jdk8u${PV}-${CHANGESET_ID}"
-SRC_URI[openjdk.md5sum]    = "188b5d7ef0976cfc1a4258d1dc8ccce0"
-SRC_URI[openjdk.sha256sum] = "7c32399a85f56bda2c740fc6834b8b5d648e75271a5376c2fa968bd713e3fec8"
+SRC_URI[openjdk.sha256sum] = "b7b933ff2b8c0ee17eb6dbd02beb8769e7dfe15c50ab2fdeef55666e4b12cbe7"
diff --git a/recipes-core/openjdk/openjdk-8-release.inc b/recipes-core/openjdk/openjdk-8-release.inc
index 170338f..ddbd8c9 100644
--- a/recipes-core/openjdk/openjdk-8-release.inc
+++ b/recipes-core/openjdk/openjdk-8-release.inc
@@ -7,33 +7,25 @@ COMPATIBLE_HOST_armv7a = "^$"
 COMPATIBLE_HOST_armv7ve = "^$"
 
 CORBA_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[corba.md5sum]    = "e269b1b01c00bec6c9f2684d7e3e6540"
-SRC_URI[corba.sha256sum] = "45433c179dd5ee117b8097c75f475feb5a2d2fae052be3e582c59511696a5d0e"
+SRC_URI[corba.sha256sum] = "97513397015ca62953c6afa3ba925b1dabc0238d47f3a2b81c2bd5b683d4d050"
 
 HOTSPOT_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[hotspot.md5sum]    = "105c2a6bdfecc2f1fe09aac65748bf47"
-SRC_URI[hotspot.sha256sum] = "08729033233b3a42bf1fa3d2a2c0cdf1c950c682cc27bd486f7c19ae28d34ef7"
+SRC_URI[hotspot.sha256sum] = "80a91f421bbe750f5e8c66b74f77fb79f31cce2f6e9e1cfe8407d773bb1ed57d"
 
 JAXP_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jaxp.md5sum]    = "a9fb321b6c466e83b9ad23da0d9674c5"
-SRC_URI[jaxp.sha256sum] = "8e52661976169fca3fe567b269be5852dff378cb2e66e9f8a4e9f40aaa8d89e4"
+SRC_URI[jaxp.sha256sum] = "ead123b56c1c5d4c381665da6c0858cd9b11c69b8afc7494f9831980bc71bc92"
 
 JAXWS_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jaxws.md5sum]    = "6ee14ea4974b93bff075499cd820413b"
-SRC_URI[jaxws.sha256sum] = "95a14275db59e0c1a8fa4ca4861b8761b1598f0ed7f3ef2f2cef7c619df1eb83"
+SRC_URI[jaxws.sha256sum] = "ef6532ac77e7e4333283c09c87b6923fbaa91b8bca6770f06494c3bb1643455e"
 
 JDK_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[jdk.md5sum]    = "57d2bc331d9506fa652fac686c6b64c1"
-SRC_URI[jdk.sha256sum] = "3ecb62288df04d05f541a26da32464c04558a951b2962290f08b149d614ae020"
+SRC_URI[jdk.sha256sum] = "7203ded24a10843ac8e84269ad8ac347f29b1dd950f7e0bb9739ddcb8280b8fb"
 
 LANGTOOLS_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[langtools.md5sum]    = "5456b86c13a21c8e73a088af5723ba06"
-SRC_URI[langtools.sha256sum] = "ffaf18753935cd03b2d581f17789172f4cfdc093d62ca764bf14068d7e30599c"
+SRC_URI[langtools.sha256sum] = "6e2329e3f15c0fd23da47cd8f454cb49cdae0b12c951eb2910061fa95acb8ea4"
 
 NASHORN_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[nashorn.md5sum]    = "0716fb438451ac45285a0cd8c17cc27b"
-SRC_URI[nashorn.sha256sum] = "3a572a5d5c2e8b590c9ac2c65905069a991f7e168f5bbe15e7dbb924b10ab96d"
+SRC_URI[nashorn.sha256sum] = "195237fd89f34c27bf98c3a8bfda64bbc799a014e83907062a8b4e10bd4f2021"
 
 OPENJDK_CHANGESET = "jdk8u${PV}-ga"
-SRC_URI[openjdk.md5sum]    = "5f5cf2638bba1b4f9b4915be9973077e"
-SRC_URI[openjdk.sha256sum] = "633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece"
+SRC_URI[openjdk.sha256sum] = "a83f8daa2afece63bf7ae95cfbca91ef765424c40b9f5b45e4a3c2d4da0f7a95"
diff --git a/recipes-core/openjdk/openjdk-8_242.bb b/recipes-core/openjdk/openjdk-8_252.bb
similarity index 100%
rename from recipes-core/openjdk/openjdk-8_242.bb
rename to recipes-core/openjdk/openjdk-8_252.bb
diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_252.bb
similarity index 100%
rename from recipes-core/openjdk/openjre-8_242.bb
rename to recipes-core/openjdk/openjre-8_252.bb
-- 
2.25.4

