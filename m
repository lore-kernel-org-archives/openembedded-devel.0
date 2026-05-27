Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43579CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:54 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16813.1779875386103718741
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Er+H5dSh;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6870a4688eeso936062a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779875384; x=1780480184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMFcSJRuoICol33KKbGPURFj2/yWGeiEJWUu/8tBMWw=;
        b=Er+H5dShdrVjKSlyZDZ9Q/eCKAZDDe0nO4ZChIbJEMhFjRniXc0yQhEwfEjQUuq0jK
         2Y5ZocxpQjowOSJjoH7PMDR5wl0lHiEzWHwdPJJhaEUR8nYQzPTN+IACEXdkZaoyWREj
         mYB0LBy7kuYt3L2tsOS3xfKXqDhWli3/vmZGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875384; x=1780480184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMFcSJRuoICol33KKbGPURFj2/yWGeiEJWUu/8tBMWw=;
        b=j+NgiQC2elJd3ok7H0D0I+4pK441+PfAXkgs9cpnzX0bsh0cRgCod8hDk8uzi3bdA2
         XY51RelMt6AT8oTXT/I3RxLomo/eWzb48IBDbQSaM1BpF/eRPyuiN6LHKRQZjvi07//D
         kc6US6N1XTKWihbL4EHhNHwcM84ntgAW2qRHHi2ofdDMyaAwOK7aMhgq4cuhp9eO+yvT
         kWca7U2Q1vaWcbSN3T8ywR7B2EL8ELJmKSl5EptAUDpd1Q1QJp6n7Eb/PeTJoHWf9tGP
         avtRy4WWo7EZVuWPiHJpoNSHef/LUrIA6ywnqM6N7CV8cq2XsL4foguQ/D0qDmN99lty
         +Y9w==
X-Gm-Message-State: AOJu0Ywahs21DGOifewm0+1vouvKaUoKQCD+OHIqSb0iTztSyeR0AP0c
	6ddsz26k3HgVku5ipAyLi0DlDhyNR2ZInJSfmxGPDxBX54M13tJGj+8DHKyiWJmfTPlRp30X46s
	Pcj0j
X-Gm-Gg: Acq92OEIlQkR63JuFvU40+p5YEM7z1j9iNGDUvwHbiMncQ2YT8665gWe0PcFxM8YU2/
	FmSHAIzwc1IRmrfBNq1Aa2Hx9VCIa2RcpGmrScmcozkgpCQyQs0czUvNsw40F0spWrsmRnFt7aN
	wX9wJajow4ebk73Ee6k0YQ/sJxFRL3OWoShuKVrLYUypY1h/rwGXwg0jfZmdRlnVcZkCpT3T2jw
	ACJS6oIHih1n4ibs3Xw6/uz1MggSLT7XwUjyv/itQ53TPvMXLEQ9db6aZg1mgXS6YzjAZ7cNXik
	DaKQS6tnE1NbELm8WUGvqgZxL9GIQOCUUJVmMUQsCet8GLeAB5EWdNbbCkfuArt4hahpwVRbnE/
	4EFXnp3gM/1O2pBaUvltW+yrzMjr5b5kZJXfpsWJ6n7ZbCEEobNADd4gZ5jtDt/MHTuTEVUHzik
	OXFJVxL/pPxCHMlZz0uzD4W/mi/D3v4QAgOpZeg4vma2OkiMecBG6Sdhs3qN0ScjOV1neVSjUah
	TSzkZS7N7GNIorXFD+VwLntd+SsxLFEuBmJWIYkE+0n5EHBDBrPyMpBKvNBKH4lCcWHHsDQADWI
	S4yPHphBt2wmq4ZK1E7wtw==
X-Received: by 2002:a17:907:1c8e:b0:bd3:19d8:8c2d with SMTP id a640c23a62f3a-bdd283a42b3mr513885466b.8.1779875384056;
        Wed, 27 May 2026 02:49:44 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264e419sm584639966b.12.2026.05.27.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:49:43 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] tailscale: upgrade 1.94.2 -> 1.98.3
Date: Wed, 27 May 2026 11:49:42 +0200
Message-ID: <20260527094942.858727-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127260

  -Regenerate go module dependencies and license checksums
  -Manually verify and complete Unknown license entries

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../tailscale/tailscale-go-mods.inc           | 31 ++++++++--------
 .../tailscale/tailscale-licenses.inc          | 35 ++++++++++---------
 ...ailscale_1.94.2.bb => tailscale_1.98.3.bb} |  4 +--
 3 files changed, 36 insertions(+), 34 deletions(-)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.94.2.bb => tailscale_1.98.3.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
index 1f9bff8c39..7e2e91bb56 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc
@@ -5,7 +5,7 @@
 # running the update-modules task.
 
 SRC_URI += "\
-    gomod://filippo.io/edwards25519;version=v1.1.0;sha256sum=9ac43a686d06fdebd719f7af3866c87eb069302272dfb131007adf471c308b65 \
+    gomod://filippo.io/edwards25519;version=v1.2.0;sha256sum=98f2d3ca9b88daa031b0fb2fb521b7ea386af1fed61b6f445a20bef7fa381c17 \
     gomod://fyne.io/systray;version=v1.11.1-0.20250812065214-4856ac3adc3c;sha256sum=7782bef2e30904a5e34477f713a4c598b1ddf3b3a70deead056549ad22248311 \
     gomod://github.com/Kodeworks/golang-image-ico;version=v0.0.0-20141118225523-73f0f4cfade9;sha256sum=1d677069e35c4a3e4f290e68c6e2391f6237aee9ce3f39448ed09a2ddab274b0 \
     gomod://github.com/anmitsu/go-shlex;version=v0.0.0-20200514113438-38f4b401e2be;sha256sum=2a5cf7c9a2709f649fd508cbacb2be96e4fba4d534a28a122ee4d7574af40b5e \
@@ -27,12 +27,12 @@ SRC_URI += "\
     gomod://github.com/coder/websocket;version=v1.8.12;sha256sum=ad8d323970c04679f4566ee7db98946508c37cdd21a46a875d5257d631a9e990 \
     gomod://github.com/coreos/go-iptables;version=v0.7.1-0.20240112124308-65c67c9f46e6;sha256sum=6d0ae6344f1d355f72e6aaba583ce73822861511337ca92cc1c4727fc8ba66dd \
     gomod://github.com/creachadair/msync;version=v0.7.1;sha256sum=ee8dd1d2cc8a1e555fcfaecc7407425216ee87cd4414093d9a3d8d50fc622e5d \
-    gomod://github.com/creack/pty;version=v1.1.23;sha256sum=2151b7121020954864de83eacf854634866cca0a3bfe33a2ebffa2edebc25df3 \
+    gomod://github.com/creack/pty;version=v1.1.24;sha256sum=754e25253e76a5583b80d57d3add3afe68fc4d9f2a490968a9d1eda8c8fd8815 \
     gomod://github.com/digitalocean/go-smbios;version=v0.0.0-20180907143718-390a4f403a8e;sha256sum=2bc498a09aa55b3417bebacce448b2d2ab757981e59b6b016d08cf97e4a7bdde \
     gomod://github.com/djherbis/times;version=v1.6.0;sha256sum=21d69060967bc03ea3c39ff8c0b1a95511e96eccd3749a2daef1a02af1bc0a85 \
     gomod://github.com/fogleman/gg;version=v1.3.0;sha256sum=792f7a3ea9eea31b7947dabaf9d5a307389245069078e4bf435d76cb0505439c \
     gomod://github.com/fxamacker/cbor/v2;version=v2.9.0;sha256sum=5b0ec6424bd522aeeeab30cbdcad6f40bf976a9a2ddf125ab27b97826140d97a \
-    gomod://github.com/gaissmai/bart;version=v0.18.0;sha256sum=566f2401988b2536055d87f6851ea596518377ee4592176375b84a5ca791fc77 \
+    gomod://github.com/gaissmai/bart;version=v0.26.1;sha256sum=7cead7fb3f4be36f3864efaf1344d72ca7ba03ab5a557338c80ca6d4bda59cca \
     gomod://github.com/go-json-experiment/json;version=v0.0.0-20250813024750-ebf49471dced;sha256sum=e20ad9cf462e43db906cd2dc237061d6a5b575d10bd4ece52f1857b15a107006 \
     gomod://github.com/godbus/dbus/v5;version=v5.1.1-0.20230522191255-76236955d466;sha256sum=262f43ec87570238a0e770e7fa656dda70fe6050a7edf5addc30287cb64b21a6 \
     gomod://github.com/golang/freetype;version=v0.0.0-20170609003504-e2365dfdc4a0;sha256sum=cdcb9e6a14933dcbf167b44dcd5083fc6a2e52c4fae8fb79747c691efeb7d84e \
@@ -48,7 +48,7 @@ SRC_URI += "\
     gomod://github.com/jmespath/go-jmespath;version=v0.4.0;sha256sum=d1f77b6790d7c4321a74260f3675683d3ac06b0a614b5f83e870beae0a8b2867 \
     gomod://github.com/jsimonetti/rtnetlink;version=v1.4.0;sha256sum=81625291f4d0a08718dfd2170873d1adfd8fc2248657584f520c4de6de9e2e4d \
     gomod://github.com/kballard/go-shellquote;version=v0.0.0-20180428030007-95032a82bc51;sha256sum=ae4cb7b097dc4eb0c248dff00ed3bbf0f36984c4162ad1d615266084e58bd6cc \
-    gomod://github.com/klauspost/compress;version=v1.18.2;sha256sum=f6f550ecff746f6585db9529a29109e70da0038a8e0e142959567f2207183490 \
+    gomod://github.com/klauspost/compress;version=v1.18.5;sha256sum=e1fdde95d97978146243f1e793ce18a09b107d6cd6032347fcb5b9115181497d \
     gomod://github.com/kortschak/wol;version=v0.0.0-20200729010619-da482cc4850a;sha256sum=09c15500a0ef54af0796f37282dd5377d2b866e4c36c87dcb6b2894cf3114dc5 \
     gomod://github.com/kr/fs;version=v0.1.0;sha256sum=d376bd98e81aea34585fc3b04bab76363e9e87cde69383964e57e9779f2af81e \
     gomod://github.com/mattn/go-colorable;version=v0.1.13;sha256sum=08be322dcc584a9fcfde5caf0cf878b4e11cd98f252e32bc704e92c5a4ba9d15 \
@@ -59,16 +59,17 @@ SRC_URI += "\
     gomod://github.com/mdlayher/socket;version=v0.5.0;sha256sum=931626341956178fe6015b128fdda22283480d05dc964675307eb61ed39c29fe \
     gomod://github.com/mitchellh/go-ps;version=v1.0.0;sha256sum=f2f0400b1d5e136419daed275c27a930b0f5447ac12bb8acd3ddbe39547b2834 \
     gomod://github.com/peterbourgon/ff/v3;version=v3.4.0;sha256sum=b49537268ce67eb755d773fdd2a3e1c9c6dec0731993a4f742080416eb9b12a6 \
-    gomod://github.com/pierrec/lz4/v4;version=v4.1.21;sha256sum=bd2e8ef13800ca42205b0d4085a927a6d012b82cfa831769be4830036e953bec \
+    gomod://github.com/pierrec/lz4/v4;version=v4.1.25;sha256sum=f8a08e363b7ac3835d6785281e7b26bee4928dade20b2750286397180e5c7a75 \
     gomod://github.com/pires/go-proxyproto;version=v0.8.1;sha256sum=a979a2f26160bfcb6f3829dd546d5f53c8b1879e7ad84466e359cf3f6237aa4c \
     gomod://github.com/pkg/sftp;version=v1.13.6;sha256sum=0cdf6bd0edef9db8137ce398c9bbe514713e42cf2d4d415b5025f4a3c33f249d \
     gomod://github.com/safchain/ethtool;version=v0.3.0;sha256sum=bfa1a3fe314a3f2ac4c4385a6c4694708e4881bfd86c34668eca92656e398590 \
     gomod://github.com/skip2/go-qrcode;version=v0.0.0-20200617195104-da1b6568686e;sha256sum=3fc1c4d11c79001d1cc2df0de87493b324b9af141cc59ae8c212612dd2c90e90 \
-    gomod://github.com/tailscale/hujson;version=v0.0.0-20221223112325-20486734a56a;sha256sum=8e65bacebfc0a1edc067fd97f839fcfeb93c1e7b8cc0186d1773cff4e125d9d5 \
+    gomod://github.com/tailscale/gliderssh;version=v0.3.4-0.20260330083525-c1389c70ff89;sha256sum=b80328e5c37bd7f6f8a3c304d8938ade18e12b035b753cd50db265147814befd \
+    gomod://github.com/tailscale/hujson;version=v0.0.0-20260302212456-ecc657c15afd;sha256sum=9f9c320dd90c86880b26107b931d6c056e99642d4c4e50fafcdf7de8ea0989e6 \
     gomod://github.com/tailscale/netlink;version=v1.1.1-0.20240822203006-4d49adab4de7;sha256sum=a5195ef600f8d9a0fb8501eea85e4fe0321a74bd57dec88f07b8569d0ee4f55e \
     gomod://github.com/tailscale/peercred;version=v0.0.0-20250107143737-35a0c7bd7edc;sha256sum=87d0f4f3b1d59ea45c9a87b775b615bebd721a5870dafedc63cc860ec4aac281 \
     gomod://github.com/tailscale/web-client-prebuilt;version=v0.0.0-20250124233751-d4cd19a26976;sha256sum=1d02f0804bb41e0743b7d889b8e2dbd8466a89793f03997f4c1fd10f9e8974c3 \
-    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20250716170648-1d0488a3d7da;sha256sum=1f2957ab7cac9bc031c570ce8420b100171f5068bd5feee084bf6bccdfc9740d \
+    gomod://github.com/tailscale/wireguard-go;version=v0.0.0-20260427181203-e3ac4a0afb4e;sha256sum=2b648406d9e57b06178836db6b2e3e9a7c5e25fefe256978a11d91d34a4a5581 \
     gomod://github.com/tailscale/xnet;version=v0.0.0-20240729143630-8497ac4dab2e;sha256sum=438abf28ce5fb03adf529c2cb57a451f9b243c4a2a181d9d06cdb61bb10960e7 \
     gomod://github.com/toqueteos/webbrowser;version=v1.2.0;sha256sum=1227d3ebeab16d8232a304a10b087984a96ad30f7439b6687bab2f5747d308cf \
     gomod://github.com/u-root/u-root;version=v0.14.0;sha256sum=a65c0a06236b10a0cea50e603fef0ced0c7e343a66ef957a45ebcd51f304d286 \
@@ -78,17 +79,17 @@ SRC_URI += "\
     gomod://go.yaml.in/yaml/v2;version=v2.4.2;sha256sum=ed63e181cbb5a991c104639b0e6d48d45fd951f22b47d4c5d1a36156d8ed06ee \
     gomod://go4.org/mem;version=v0.0.0-20240501181205-ae6ca9944745;sha256sum=9b5037a57122457fdc5c2c0a31e3996b44cf9dfcdee5c53ed72adfd88d077795 \
     gomod://go4.org/netipx;version=v0.0.0-20231129151722-fdeea329fbba;sha256sum=e15f57de368c92b826010181906f26112ba3a0d7fde7d94c8a8c60c525dc4044 \
-    gomod://golang.org/x/crypto;version=v0.46.0;sha256sum=5f2921ccdf7252ffbe26046948c6044ab0917e500a34710e0ba6664260d6a460 \
+    gomod://golang.org/x/crypto;version=v0.50.0;sha256sum=aaf9503dd088d2727e08f213d23424ebc75a52ee609f084ec4c726f3590c0ea5 \
     gomod://golang.org/x/exp;version=v0.0.0-20250620022241-b7579e27df2b;sha256sum=fdaae8f1b98727b49d10228492b2dee1b8c68d12f640a4f17f0fb175581bf547 \
     gomod://golang.org/x/image;version=v0.27.0;sha256sum=db4846c8edb8cdcb556d205840361f62382df9bd5946b756e700c5fb43d90332 \
-    gomod://golang.org/x/net;version=v0.48.0;sha256sum=cf5206797e66bbe72fc13542d53a57d069a563cebb6d045c07a870eb4fd888c9 \
-    gomod://golang.org/x/oauth2;version=v0.32.0;sha256sum=64c855b335cc2e90b2d88c1fe6c3a31de53c3ca76fc9c89e6ce266c7334b768b \
-    gomod://golang.org/x/sync;version=v0.19.0;sha256sum=25211fe2cffd8020bb405b9adb7a90f5e06760f2818b8fb2e74aaaa21a66ed9e \
-    gomod://golang.org/x/sys;version=v0.40.0;sha256sum=d7f9fe44300fc8d47b30d06cd001d9c62c54c6119818a19a2e33a93538971669 \
-    gomod://golang.org/x/term;version=v0.38.0;sha256sum=00cec8beae98bb5a15c9ee9e8e705b7cab9c50269e7858bff98df0533b317363 \
-    gomod://golang.org/x/text;version=v0.32.0;sha256sum=bc6c70d37c37bc625a83abd48ee32372b459a8c559a1cf5f25dfbf7c7941f81b \
+    gomod://golang.org/x/net;version=v0.53.0;sha256sum=3808b07d64ba58f58ca91737f0a165439f72b03a512ea901bad2aa1e168092d5 \
+    gomod://golang.org/x/oauth2;version=v0.36.0;sha256sum=15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504 \
+    gomod://golang.org/x/sync;version=v0.20.0;sha256sum=7179d4d68800f6fdcadb9d4bbf11cbb5df9b40360c89305c203fe20723cbd375 \
+    gomod://golang.org/x/sys;version=v0.43.0;sha256sum=cb8b073934cf7e579c9f80c4d12619d5f96fcf97af6f07fdc649e7acec0aaddf \
+    gomod://golang.org/x/term;version=v0.42.0;sha256sum=c69cf2bf68d1d73e15a31c1c9a687316edef5c4ef9b6bb35aaedc08c6204f3c2 \
+    gomod://golang.org/x/text;version=v0.36.0;sha256sum=15c60227cf084605a0256b8eacd9cfaf411109fe80c9e68b14a9367a5e42b23c \
     gomod://golang.org/x/time;version=v0.12.0;sha256sum=cdcb04c43b112919c5e0d0fa1d90769124ad56918a44e6cb0747876ed7e5015c \
-    gomod://gvisor.dev/gvisor;version=v0.0.0-20250205023644-9414b50a5633;sha256sum=b373e677e77f28c095b43ed976f5d9ca885d3b1b5407a71a5691e4a47e813bd0 \
+    gomod://gvisor.dev/gvisor;version=v0.0.0-20260224225140-573d5e7127a8;sha256sum=2335e73d1effb8e5601be32b322e5d39bf1efc1eef2d296a8e054bd37a72b47f \
     gomod://k8s.io/client-go;version=v0.34.0;sha256sum=3ede34d9df9dcb02779a631ca9c653f92db3714ee887c6fdd86a66bc4889d2c0 \
     gomod://sigs.k8s.io/yaml;version=v1.6.0;sha256sum=cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052 \
     gomod://software.sslmate.com/src/go-pkcs12;version=v0.4.0;sha256sum=55019a391e5302a51ba62e98909e006224b81207866da90beaf582ec0dee036f \
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
index f1adacfc09..54690f464e 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
@@ -7,7 +7,7 @@
 LICENSE += "& Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT"
 
 LIC_FILES_CHKSUM += "\
-    file://pkg/mod/filippo.io/edwards25519@v1.1.0/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
+    file://pkg/mod/filippo.io/edwards25519@v1.2.0/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/fyne.io/systray@v1.11.1-0.20250812065214-4856ac3adc3c/LICENSE;md5=a2be13cb34e811436f5388f0a19cc0b0;spdx=Apache-2.0 \
     file://pkg/mod/github.com/!kodeworks/golang-image-ico@v0.0.0-20141118225523-73f0f4cfade9/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/anmitsu/go-shlex@v0.0.0-20200514113438-38f4b401e2be/LICENSE;md5=45a47c50f5b33ff9ab3347c7db1bfb6a;spdx=MIT \
@@ -31,12 +31,12 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/coder/websocket@v1.8.12/LICENSE.txt;md5=bc0b6f68116166556efe7184edfda3e9;spdx=ISC \
     file://pkg/mod/github.com/coreos/go-iptables@v0.7.1-0.20240112124308-65c67c9f46e6/LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5;spdx=Apache-2.0 \
     file://pkg/mod/github.com/creachadair/msync@v0.7.1/LICENSE;md5=b8be277519c5ee121454d43de171668a;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/creack/pty@v1.1.23/LICENSE;md5=93958070863d769117fa33b129020050;spdx=MIT \
+    file://pkg/mod/github.com/creack/pty@v1.1.24/LICENSE;md5=93958070863d769117fa33b129020050;spdx=MIT \
     file://pkg/mod/github.com/digitalocean/go-smbios@v0.0.0-20180907143718-390a4f403a8e/LICENSE.md;md5=c1653934903ab2785c09c2bdd7344526;spdx=Apache-2.0 \
     file://pkg/mod/github.com/djherbis/times@v1.6.0/LICENSE;md5=3cafd141825e7a44b1c6a047b2320012;spdx=MIT \
     file://pkg/mod/github.com/fogleman/gg@v1.3.0/LICENSE.md;md5=1630f0e1bac38694fdc4dcb6a9218f4a;spdx=MIT \
     file://pkg/mod/github.com/fxamacker/cbor/v2@v2.9.0/LICENSE;md5=827f5a2fa861382d35a3943adf9ebb86;spdx=MIT \
-    file://pkg/mod/github.com/gaissmai/bart@v0.18.0/LICENSE;md5=05779e437ec35570aca43cc66a95e056;spdx=MIT \
+    file://pkg/mod/github.com/gaissmai/bart@v0.26.1/LICENSE;md5=05779e437ec35570aca43cc66a95e056;spdx=MIT \
     file://pkg/mod/github.com/go-json-experiment/json@v0.0.0-20250813024750-ebf49471dced/LICENSE;md5=9d210c7471ce08e3db5261f33bf8fce6;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/godbus/dbus/v5@v5.1.1-0.20230522191255-76236955d466/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/golang/freetype@v0.0.0-20170609003504-e2365dfdc4a0/LICENSE;md5=8e050e4860234723098ceeefa49edd05;spdx=BSD-3-Clause \
@@ -52,9 +52,9 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/jmespath/go-jmespath@v0.4.0/LICENSE;md5=9abfa8353fce3f2cb28364e1e9016852;spdx=Apache-2.0 \
     file://pkg/mod/github.com/jsimonetti/rtnetlink@v1.4.0/LICENSE.md;md5=75a8090d4c02945ad9d61c7cce77ed48;spdx=MIT \
     file://pkg/mod/github.com/kballard/go-shellquote@v0.0.0-20180428030007-95032a82bc51/LICENSE;md5=9d95d1ad917c814c23909addb8692eeb;spdx=MIT \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.2/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.2/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.18.2/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.5/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.5/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.18.5/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
     file://pkg/mod/github.com/kortschak/wol@v0.0.0-20200729010619-da482cc4850a/LICENSE;md5=5a0acdb344844a21e2df8bc2e1fe5f2d;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/kr/fs@v0.1.0/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/mattn/go-colorable@v0.1.13/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
@@ -65,16 +65,17 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/mdlayher/socket@v0.5.0/LICENSE.md;md5=bdcb2fcb7aea8a34d189ef572a59ff88;spdx=MIT \
     file://pkg/mod/github.com/mitchellh/go-ps@v1.0.0/LICENSE.md;md5=56da355a12d4821cda57b8f23ec34bc4;spdx=MIT \
     file://pkg/mod/github.com/peterbourgon/ff/v3@v3.4.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.21/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.25/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/pires/go-proxyproto@v0.8.1/LICENSE;md5=ebfe2201eab4c067477cc534908ac12f;spdx=Apache-2.0 \
     file://pkg/mod/github.com/pkg/sftp@v1.13.6/LICENSE;md5=452fc5cc5a9127a0e828d73423d45035;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/safchain/ethtool@v0.3.0/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
     file://pkg/mod/github.com/skip2/go-qrcode@v0.0.0-20200617195104-da1b6568686e/LICENSE;md5=515c25e1450ede2834397875c18439d4;spdx=MIT \
-    file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20221223112325-20486734a56a/LICENSE;md5=073f7ac93b9172ac4e1d258584fc0271;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/gliderssh@v0.3.4-0.20260330083525-c1389c70ff89/LICENSE;md5=ac631f842784b8ec269293a49121236b;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/tailscale/hujson@v0.0.0-20260302212456-ecc657c15afd/LICENSE;md5=073f7ac93b9172ac4e1d258584fc0271;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/netlink@v1.1.1-0.20240822203006-4d49adab4de7/LICENSE;md5=2ade771c7d7211af507864e8dd520529;spdx=Apache-2.0 \
     file://pkg/mod/github.com/tailscale/peercred@v0.0.0-20250107143737-35a0c7bd7edc/LICENSE;md5=94eaeed21686fd9816f57f86b9914071;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/tailscale/web-client-prebuilt@v0.0.0-20250124233751-d4cd19a26976/LICENSE;md5=a672713a9eb730050e491c92edf7984d;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20250716170648-1d0488a3d7da/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
+    file://pkg/mod/github.com/tailscale/wireguard-go@v0.0.0-20260427181203-e3ac4a0afb4e/LICENSE;md5=995598bc9de2b4c987c2cb87fc24f341;spdx=MIT \
     file://pkg/mod/github.com/tailscale/xnet@v0.0.0-20240729143630-8497ac4dab2e/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/toqueteos/webbrowser@v1.2.0/LICENSE.md;md5=6072d29ffa4b14338ff8fd68f17f6851;spdx=MIT \
     file://pkg/mod/github.com/u-root/u-root@v0.14.0/LICENSE;md5=bf431bf303eaf01f17bef6624d9f2208;spdx=BSD-3-Clause \
@@ -84,17 +85,17 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/go.yaml.in/yaml/v2@v2.4.2/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/mem@v0.0.0-20240501181205-ae6ca9944745/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
     file://pkg/mod/go4.org/netipx@v0.0.0-20231129151722-fdeea329fbba/LICENSE;md5=628df198dc9e033b86b8eedff039ff86;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/crypto@v0.46.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.50.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/exp@v0.0.0-20250620022241-b7579e27df2b/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/image@v0.27.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.48.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/oauth2@v0.32.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.19.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.40.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/term@v0.38.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.32.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.53.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.20.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.43.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.42.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
     file://pkg/mod/golang.org/x/time@v0.12.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20250205023644-9414b50a5633/LICENSE;md5=fbbaf7613c100c84b8f20701859dee2d;spdx=MIT+%26+Apache-2.0 \
+    file://pkg/mod/gvisor.dev/gvisor@v0.0.0-20260224225140-573d5e7127a8/LICENSE;md5=e566fe37b81dd469e93876dc021ca01c;spdx=Apache-2.0 \
     file://pkg/mod/k8s.io/client-go@v0.34.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=b5d30dd5bc47d1b56b678ac06dead1c7;spdx=BSD-3-Clause \
     file://pkg/mod/software.sslmate.com/src/go-pkcs12@v0.4.0/LICENSE;md5=259f3802525423b1a33efb1b85f64e18;spdx=BSD-3-Clause \
diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.94.2.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.98.3.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/tailscale/tailscale_1.94.2.bb
rename to meta-networking/recipes-connectivity/tailscale/tailscale_1.98.3.bb
index 7a60d6833c..a352c5cf58 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.94.2.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.98.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tailscale/tailscale"
 SECTION = "networking"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a672713a9eb730050e491c92edf7984d"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=cadeae10a8856ddfdb129866b75b33e3"
 require ${BPN}-licenses.inc
 
 MAJOR_MINOR = "${@oe.utils.trim_version('${PV}', 2)}"
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=releas
            file://default \
            file://tailscaled.init \
            "
-SRCREV = "2de4d317a8c2595904f1563ebd98fdcf843da275"
+SRCREV = "8f2c8d6a14419e95fb9d02d6bf6113893daef5c3"
 SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
 require ${BPN}-go-mods.inc
 
-- 
2.54.0


