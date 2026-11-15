Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3837.1794729068028292415
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BvgNdyrf;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2982725eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729067; x=1795333867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wv3bSHtybDxrY8+pRyhI8qYgkOpDUpY9+8XerGqiM6k=;
        b=BvgNdyrfgrIQs5phqF6FYzbIWqBk1LLSr8xt9ZvPSi1XhLyafG6QKyA2Lr0rxQd3n9
         /AmYh0qOY3Prz1spIoeY723XisL9pmjVo79gXOvufMh7RD0W2mJxxeba3GSvFE7UFe+z
         dgXIADY3TaQow2uHkFHLqL8kcOAuvmnHvyi1lOyYqAQs3jCDcrlc+zS5KCzR5MSeXk4w
         im7yzgvi1AzXleZExiplU1csapnHEnDApuDuIDJ4X8lt5yQJCAusFPzeE8dbS1zo0QT8
         ixOTIx9+HRkD1c93IZRIvwls/lyTAfqnW7qJAPu1n+8uB/hjJJWJI8AJNZtUDdgucsZT
         SsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729067; x=1795333867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wv3bSHtybDxrY8+pRyhI8qYgkOpDUpY9+8XerGqiM6k=;
        b=dT7XBF7Q/B4KF1TM5M09JN1zojB8c5QV1fE/JqIQhTTsN/cCQwQFTLfqLSgMpJWq8Y
         t3T25cnTgQ0Xx6sCArC79fMDZerkvHY4eLAK5p4YZWINlrHT8OMSSPZOY2rXwbKJTkPp
         g3B+87MLz8tUWCF0rRRFA0xpO2FmsAc6snn8dpm5/4Cc/bx1LzevacGml2AQlbQuw41/
         kI5XA/mw6bxFoGg1qU4Xx3Qod5zld0k6/Lg17OSqrSfAdlfiLADWaoDk0dDTngGteG/X
         32g+FqAwEZpt6LSXiuetnTVIMmqS9AHx6GDsGKtk1Z6UxdD9XUahF9Ds+BTXaXuRtuv/
         kXNQ==
X-Gm-Message-State: APuU4Z/iSeJ34YrL+XC9jdEqep71mcF3OIj7H5wl9/FCOoA5+0PYLkLR
	eqZaxPQJrWu7/sQVSNbFhIIJ5eXl65VF8WbvjvohJJlnBXuLHZyaaoOs8CPsTRyS
X-Gm-Gg: AYBFou3rb+jp6CPBhux//igPHOyo015oO/zDlmpvK60TuSv5TWorJ0lVhVSCebt6bFx
	iAyhTig6t4Q4dljCBSN3sd6BaHAaE0aG16ZK7YgXPF3jt9dXiknuIxUa2fjSxV/SRGhciJaUaeC
	1NB8yS7wslYcLDGQkeaz8SSVMjG9brpnFsAPodIFiP/4OZSTI9sPGyLWz6Vup0mrKc1LtvrXtUe
	Y+B6LLCEFxwxly/ChFyUUZmvaxnbMySvbMPB7emn0+LfhD+oLzcfoMx6qoDH2jMYU3HNosI2SG4
	cWUWE52OWE+HuSEwmiu/f+y9nnQ+MQRn2f7DC8t9KJgYWmNco5kGh2hZsS0T/ycGzvd+KGbAAYo
	TVUmNDF/6U63aJ1NoH16VntveyWoenP9J3HrFMCplAtN8hTxiRvB8gjC/k2VIvzwMQZ/JhM5KVp
	stu5RTSO6TDp7Ie5FYAOcRnDRXePfTxblQ3ITdSJ5jbhVjNkKt75nkSwvH2DHzSs1HN/K58z+94
	8eki3i4C1fqCnkEV4pyjJjJQpuU5D/+/QUBd4Ons3UbQKv8+mX4UHj4/rD1QyBge8pwSfoymgWh
	ITRmVGDQ28KFvES6YK9wu5fOX49DiFPGAmyplyB/midow49Q2Ac5uCUomfGD1rHRp+a1dtBMogx
	/4beIO1zf77YfekMhCRDziU3ipPjlBcPODP/HhlrbziLp7dxPZcGZiARZN3zIU8nORoKIhQVjbq
	OwhsWhbiSVt4Own6ctA+TYntSyqph7cyA1Y6ilIZGlqzNNg0y5NpLWpV7JMEoMU8+qegdn3IkwQ
	upAV5jcfZiCTcAL9Z+KvT+2gmeVc/v2132a3FoBX9epmFH7C5nHQwNDM5DoNok8ysxMer4c+LEm
	lzDGFw==
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr8597327eec.34.1794729066289;
        Sat, 14 Nov 2026 23:51:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 65/96] rclone: upgrade 1.75.1 -> 1.76.0
Date: Sat, 14 Nov 2026 23:48:43 -0800
Message-ID: <20261115074918.2932593-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132335
Content-Type: text/plain; charset="utf-8"

Regenerate rclone-go-mods.inc and rclone-licenses.inc with
bitbake -c update_modules. github.com/stretchr/testify internal/difflib
is BSD-3-Clause.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/rclone/rclone-go-mods.inc | 256 ++++++++++--------
 .../rclone/rclone-licenses.inc                | 217 ++++++++-------
 .../{rclone_1.75.1.bb => rclone_1.76.0.bb}    |   2 +-
 3 files changed, 253 insertions(+), 222 deletions(-)
 rename meta-oe/recipes-support/rclone/{rclone_1.75.1.bb => rclone_1.76.0.bb} (92%)

diff --git a/meta-oe/recipes-support/rclone/rclone-go-mods.inc b/meta-oe/recipes-support/rclone/rclone-go-mods.inc
index df7a92d8c0..b5e6784125 100644
--- a/meta-oe/recipes-support/rclone/rclone-go-mods.inc
+++ b/meta-oe/recipes-support/rclone/rclone-go-mods.inc
@@ -6,19 +6,20 @@
 
 SRC_URI += "\
     gomod://bazil.org/fuse;version=v0.0.0-20230120002735-62a210ff1fd5;sha256sum=19365a1af7ccf66edf0a454e609133c52e71391c1756e381f988b716afe667cd \
-    gomod://cloud.google.com/go/auth;version=v0.20.0;sha256sum=06371584193bbb88a8f2c2931d85efaf45666cc52643be5b8aada6b053672f3a \
-    gomod://cloud.google.com/go/auth/oauth2adapt;version=v0.2.8;sha256sum=4cd64264bafc4dd05f645452d6e1485adf92309130bd82b4c595db10cd534963 \
-    gomod://cloud.google.com/go/compute/metadata;version=v0.9.0;sha256sum=f97e35d1c96239b8574054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca \
-    gomod://github.com/Azure/azure-sdk-for-go/sdk/azcore;version=v1.22.0;sha256sum=df94ae5d1b516886927962ee029be26832eb8d9ca6a81f14c568560c886387e0 \
-    gomod://github.com/Azure/azure-sdk-for-go/sdk/azidentity;version=v1.14.0;sha256sum=044868f3512461266db8282dde160e28cb465daf58b040349e13cc45f651a5d9 \
-    gomod://github.com/Azure/azure-sdk-for-go/sdk/internal;version=v1.12.0;sha256sum=27800de3838500d4f3a0aaacea147fb49e0da3a7a6079a595c3e9d42df116ecf \
-    gomod://github.com/Azure/azure-sdk-for-go/sdk/storage/azblob;version=v1.8.0;sha256sum=ff9c0d8c7a937cfb47bca75d86cf61642537886fb0352d1f119d478257cd5921 \
-    gomod://github.com/Azure/azure-sdk-for-go/sdk/storage/azfile;version=v1.7.0;sha256sum=f3d0a89e9b4c03104d37b77626377084e250cb67981bd88e13e3c4d6e8be8530 \
+    gomod://cloud.google.com/go/auth;version=v0.24.1-0.20261001053825-dbc26066f70a;sha256sum=7dc5ed5fe3bb149bfa02d8dd76264cbe79e496db03c2a8fd90178c8934fc686c \
+    gomod://cloud.google.com/go/auth/oauth2adapt;version=v0.3.0;sha256sum=4c991104cea02fe9f2aba1d177a691b57f5988ecf63aee4aefa05b77b0fd405a \
+    gomod://cloud.google.com/go/compute/metadata;version=v0.10.0;sha256sum=5814f9cc62d49d73e213091485cf977037ec4c219d1d831422c24f2f40735346 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/azcore;version=v1.23.3;sha256sum=47732460ab9b5cfb89763342002059dad4ef59d333caf1405e0eda737a235697 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/azidentity;version=v1.15.0;sha256sum=818f833ae8f19c24b0f5f8c34f31ef910c5d4280802dda1f43a8a60cc07a6ae4 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/internal;version=v1.13.0;sha256sum=206818577e4ffcc34cbd55da36e52194226dc3a561817b4df422f42870506113 \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/storage/azblob;version=v1.8.2;sha256sum=9ab633b8de7a7cb057eb8e403ac51428d81e065b4310ea8becc6bab7532d659b \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/storage/azfile;version=v1.7.1;sha256sum=3f60305d6c3ad1e591199b161296f44b9045183bd3e202a1da2e0add24a2f51b \
+    gomod://github.com/Azure/azure-sdk-for-go/sdk/storage/internal;version=v0.1.0;sha256sum=ed9ddcf29aa291539b96dd81e93c66ed556cec018fdee0d93116efcb49e6d4cc \
     gomod://github.com/Azure/go-ntlmssp;version=v0.1.1;sha256sum=3b80d75f2e559d6568163e6da8119cb7118fc60288b0f62c80829ea855e1b4e5 \
-    gomod://github.com/AzureAD/microsoft-authentication-library-for-go;version=v1.7.2;sha256sum=dcd0ef2964e09743ceb7b6cff837253caab8f28ba92a40bfc6948eea4f667913 \
+    gomod://github.com/AzureAD/microsoft-authentication-library-for-go;version=v1.10.1;sha256sum=adc8dd050c3f5b194f49b40ff9c9138da3e67b112f76c1fb77d8ce650def4e41 \
     gomod://github.com/FilenCloudDienste/filen-sdk-go;version=v0.0.39;sha256sum=dcc9ed019edc82f111f212477de7077751da7851468e119d8af988bb1fc9f8e8 \
     gomod://github.com/Files-com/files-sdk-go/v3;version=v3.3.194;sha256sum=ba4078f3eb828d13e93c5094e16bd0c44bce9a5a25ecd71b7c37218038b299f6 \
-    gomod://github.com/IBM/go-sdk-core/v5;version=v5.23.1;sha256sum=a6cb35cfdc492fb2032e3598c8ccd2b81ac90dc8ed8538caabf7f44d31b94839 \
+    gomod://github.com/IBM/go-sdk-core/v5;version=v5.25.1;sha256sum=8a2fb6ec88c76b142b98e1d4a292e033b66c29ef54c2e80dfad90d42894c80ac \
     gomod://github.com/Max-Sum/base32768;version=v0.0.0-20230304063302-18e6ce5945fd;sha256sum=884da69f365e677c1f1aa18e5404ae79324428c8063f61e9b5f01f29274fb997 \
     gomod://github.com/Microsoft/go-winio;version=v0.5.2;mod=1;sha256sum=19b8fbe9d4419278bb1e9d0cf2fd5aec879e42829c53ba3efd5656b8d1b35ae7 \
     gomod://github.com/Microsoft/go-winio;version=v0.6.2;mod=1;sha256sum=47fb19990ebb31954f3aa784ff45f4c93a9e86ac3e1297d7ca87c614aeffe2cb \
@@ -26,7 +27,7 @@ SRC_URI += "\
     gomod://github.com/ProtonMail/bcrypt;version=v0.0.0-20211005172633-e235017c1baf;sha256sum=2d641d9fcf6c238813e254df6bb93724dc46543516df4071efaf22f68ba337b0 \
     gomod://github.com/ProtonMail/gluon;version=v0.17.1-0.20230724134000-308be39be96e;sha256sum=3fa88ebf957192f2061c9bdcd2f8e313311e131246d23dedc2a596682cbb4645 \
     gomod://github.com/ProtonMail/go-crypto;version=v0.0.0-20230321155629-9a39f2531310;mod=1;sha256sum=739bad42da3a041b6eadcdda6546affd42b35a87a23c8cd97f96594f3eb120db \
-    gomod://github.com/ProtonMail/go-crypto;version=v1.4.1;sha256sum=70bbdc0f9e926738193aed968f7901efab41493752277c4c94c9b751aa55c42a \
+    gomod://github.com/ProtonMail/go-crypto;version=v1.5.2;sha256sum=6ce5df4da97350b69637df5918fa1431816180ca1ab3a9850b3f69c14575a7e8 \
     gomod://github.com/ProtonMail/go-srp;version=v0.0.7;sha256sum=aaac72038a9ee29162137acf24e1c17ef0c2601d5fcaefd434c3da57be4471b8 \
     gomod://github.com/ProtonMail/gopenpgp/v3;version=v3.4.1;sha256sum=fbb45e4963cec3542c90f3a17f3611daec672f2d623a7e5de06469a93b48d7d5 \
     gomod://github.com/PuerkitoBio/goquery;version=v1.12.0;sha256sum=a27ad64d6aa446c8943fb7097fb2bb5e22c806343016de82b0e99bfe85930b28 \
@@ -34,37 +35,34 @@ SRC_URI += "\
     gomod://github.com/a1ex3/zstd-seekable-format-go/pkg;version=v0.10.0;sha256sum=f848512376f410f227ff39e9368c6981a9fb23f6b707f40973f38b5185c5a2c4 \
     gomod://github.com/a8m/tree;version=v0.0.0-20240104212747-2c8764a5f17e;sha256sum=f80124210d32debcfbc545727eee84cad848c24df45ff3aed4df6981d5b3cd33 \
     gomod://github.com/aalpar/deheap;version=v1.1.2;sha256sum=9557721af9303b535cc4255a1f92f5237ff17d069c9110be8bfd177bf363e8b8 \
-    gomod://github.com/abbot/go-http-auth;version=v0.4.0;sha256sum=8204bca24734f55f179dd1c0b820ae5be83151268693a147086f33cd2d4d473c \
     gomod://github.com/adrg/xdg;version=v0.5.3;sha256sum=52847b48afcd46cfd312bc857a8df08643cfffc4103d59a40c3ce648e0196c13 \
     gomod://github.com/akavel/rsrc;version=v0.10.2;mod=1;sha256sum=18b7d6652beec9ed8b5a3e7d27a8765e5c3718fc819ee73b9e3b14effc15fdba \
-    gomod://github.com/anacrolix/dms;version=v1.7.2;sha256sum=bc2ecc4f895eb32e194d3b30bb885265dc1bceb34f5087368404c2cc566dfbc4 \
-    gomod://github.com/anacrolix/generics;version=v0.2.0;sha256sum=4c72f083082130d4a1622a47516e6a2d79d19379aadcbe510224955ba8a15219 \
-    gomod://github.com/anacrolix/log;version=v0.17.0;sha256sum=e9d0085bf19492bf2d973e1688b1f5d8c3498cef17c601d29db7fa92541046e0 \
+    gomod://github.com/anacrolix/dms;version=v1.8.0;sha256sum=2e64ae1a7fffd43d96758baea2523e7925351d54abf95fd1de64f3dd96805581 \
     gomod://github.com/anchore/go-lzo;version=v0.1.1;sha256sum=75cbab209e61945e91335de0a8ef98ba91f5ac27c47fa4fb385e5c5f9747848f \
-    gomod://github.com/andybalholm/brotli;version=v1.2.2;sha256sum=9443ca8c077ea0395906f9f25fd19c23a2fa61636ee43595aa811d7326d34390 \
+    gomod://github.com/andybalholm/brotli;version=v1.2.7;sha256sum=e7b105fd7ca3cc32bee46a23133e9fc2d81b324fec2440c698eb7cc8f03bfc13 \
     gomod://github.com/andybalholm/cascadia;version=v1.3.4;sha256sum=b9c323146f294f32009a95edd68d3513911858aa18ddde903ccff2394abe90a4 \
     gomod://github.com/apache/arrow-go/v18;version=v18.7.0;sha256sum=3c0ac1b2e30e5fcfce25116880f30cbfd6d70437f593ba209e29211f9d40a542 \
     gomod://github.com/appscode/go-querystring;version=v0.0.0-20170504095604-0126cfb3f1dc;sha256sum=2b5f4c89fad59f1c218a4953b1507b572438fef6d907d4da667882d44e941215 \
     gomod://github.com/atotto/clipboard;version=v0.1.4;sha256sum=d67b2c36c662751309fd2ec351df3651584bea840bd27be9a90702c3a238b43f \
-    gomod://github.com/aws/aws-sdk-go-v2;version=v1.43.7;sha256sum=8d2f7e68f25252204268db2fa4fc8df2d93a98dbb3d52236fd15fc8c97d7538b \
-    gomod://github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream;version=v1.7.18;sha256sum=df6b679e2d32e966cdd363be28264f226e25e1ad35030e793add3816c11cc517 \
-    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.32.30;sha256sum=51d36687bcd16c9578543d9b34cfa739189050878d394679b8658be20aa693bb \
-    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.19.29;sha256sum=78d6f8c2a19a544ead82afe3e531e61693e7736a075d6c60eda053b5b0a58408 \
-    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.18.30;sha256sum=cf1fa965930afc3ab87e044a9e76b0a29862a50c9469187457fb10ebf804597c \
-    gomod://github.com/aws/aws-sdk-go-v2/feature/s3/manager;version=v1.22.34;sha256sum=ba9958fc98e3dfa8ed0d7225ce75f78e93244cc3e7309b7b2f7d52a89a8d763a \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.4.38;sha256sum=fd438497aeb6d2391eaf6ebe315913f0ab5f7acab905a005f820cecf8b479bc6 \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.7.38;sha256sum=13e1f7fdfc742b42aff702ed59a347a795e30d55002f78d4cd75a8c8149defe8 \
-    gomod://github.com/aws/aws-sdk-go-v2/internal/v4a;version=v1.4.39;sha256sum=a2c9e46719e9283b448f99f1cee71c54140d13271da51263d485cdaa92e2e11a \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.17;sha256sum=5da6d06e605d71ee3202d46bf2b11c20512210a9c641cb34541690995dcbb6d9 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/checksum;version=v1.9.31;sha256sum=4e65275e95fd6a167f3603bc16f19309cf7916ddc715332e996375f4646e66cb \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.13.38;sha256sum=9ae38588863d5ba8797d2023091970a8e0cb89f4f09160c311d0584fcf8c5cf0 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/internal/s3shared;version=v1.19.39;sha256sum=134b908a404a1bba4c03d1539bbf083941e1141b3c9dceb2ed847321f173a434 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/s3;version=v1.107.3;sha256sum=cfdb98d4e7d9384b709e2975d9411cc427cb5ef3894123cfa572332681924d8e \
-    gomod://github.com/aws/aws-sdk-go-v2/service/signin;version=v1.4.1;sha256sum=150e3d58f7048813adb66afa3c2ffe5751a0033eaed76cd4e4215ed6e42be00a \
-    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.32.1;sha256sum=77951e65c854f249ce5c36355b97ed4c9feb5f9b40c3b56b2cc5e8a42ee5ee22 \
-    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.37.1;sha256sum=ad084079a7752992adbac8f1243757c08dba609b5c941a593048f999f1ffd60c \
-    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.44.1;sha256sum=0a254a1fc91c4acffa69833dc9be50bc2d999c6db3b415172f619aeb1d22c115 \
-    gomod://github.com/aws/smithy-go;version=v1.27.8;sha256sum=831b02e1447db3c2d47cefb15b184bd522f26db41cfd28e2635da87e030fdf69 \
+    gomod://github.com/aws/aws-sdk-go-v2;version=v1.47.3;sha256sum=4aa8e34e3474deed9df61edcd8d7bae09ec46b941ab2ff5805960dcdcfcd5db4 \
+    gomod://github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream;version=v1.7.22;sha256sum=9838bb7dbc62b12d9501d3498cc4be519e7c20f1364a6ded627bacf1a4f61a2a \
+    gomod://github.com/aws/aws-sdk-go-v2/config;version=v1.33.9;sha256sum=8d05a0e25881b396f8e406207c0423098272c7a8b2be53af3d88a41d42d76747 \
+    gomod://github.com/aws/aws-sdk-go-v2/credentials;version=v1.20.9;sha256sum=4fffbed9c3b57fc3ad268cda6133c572f2d079c2da0a906fdd46ae06b0608c43 \
+    gomod://github.com/aws/aws-sdk-go-v2/feature/ec2/imds;version=v1.20.3;sha256sum=0e4cc47e1e3fa7f5f901f180a01c98c94c8e4d0d0a7012053f873e6f1eed2390 \
+    gomod://github.com/aws/aws-sdk-go-v2/feature/s3/manager;version=v1.23.14;sha256sum=8c36cea3d2d260eddfd0b6a157a5db19d36046329d10127bc6322d52686ff373 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/configsources;version=v1.5.6;sha256sum=6649de0f595b31e30d039bf01a2f9c9880ed4c64dacfb148e21275d48d778343 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/endpoints/v2;version=v2.8.6;sha256sum=718ee2f8eeeae766f6850c8c00b3f248feddd79d8a51d7f1e93cb2d13dbb57b7 \
+    gomod://github.com/aws/aws-sdk-go-v2/internal/v4a;version=v1.5.6;sha256sum=32b153f6d725a3e9ccfec87ad1b79fe3d39db5749e9a53bc20654214ecb46053 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding;version=v1.13.21;sha256sum=297f64a3671e46441e17b0e4e489ccf9d58057d123266944161738e8e52f6740 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/checksum;version=v1.11.7;sha256sum=56f6b390c267596845fc1955ce68487174ff7b4528ff5435b9d1a3188d135dff \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/presigned-url;version=v1.14.6;sha256sum=16a518a3698a2eaff3788cea50fa31347e16811cbb8b8eaa60350d097c550901 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/internal/s3shared;version=v1.20.6;sha256sum=22e58ddf4744df2353f0fa8d90eb2bb99e16f084a2fcee242a3d7962af85f71f \
+    gomod://github.com/aws/aws-sdk-go-v2/service/s3;version=v1.114.3;sha256sum=d80e9e310f21b27d0af761f4d63191e8124b1fc20006116bcc7f6445f13d41ed \
+    gomod://github.com/aws/aws-sdk-go-v2/service/signin;version=v1.10.4;sha256sum=b5547650b2389db84e435d2f84cb43ceb53cfbbfcac3c29d7fe0673451e19c89 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sso;version=v1.38.4;sha256sum=5d43b1f76b9bbbe9dd209b5052796faf1a5e5a3d0af176a75d8248d397d89215 \
+    gomod://github.com/aws/aws-sdk-go-v2/service/ssooidc;version=v1.43.4;sha256sum=460b52896bc218d8a3ad32ca6055458d50303ba284953295fdbcba4f8947746e \
+    gomod://github.com/aws/aws-sdk-go-v2/service/sts;version=v1.51.4;sha256sum=24030bc57bdae661b027adb927507ae10f5261a9059a30f20f8554bac1d69e21 \
+    gomod://github.com/aws/smithy-go;version=v1.28.5;sha256sum=2827daaa4ec0f109abe9c7f74772163561e4d24efea938b7051cf541b4ff8552 \
     gomod://github.com/bahlo/generic-list-go;version=v0.2.0;sha256sum=e773fa812176a62f1d27d7a1e7589683f5e5af2d36628fa6a5a522e59474c504 \
     gomod://github.com/beorn7/perks;version=v1.0.1;sha256sum=25bd9e2d94aca770e6dbc1f53725f84f6af4432f631d35dd2c46f96ef0512f1a \
     gomod://github.com/bodgit/plumbing;version=v1.3.0;sha256sum=15c80dc98fd6b972798a6c24a002f6fb00b28abdc9928185206a5abc5e56a089 \
@@ -79,11 +77,12 @@ SRC_URI += "\
     gomod://github.com/calebcase/tmpfile;version=v1.0.3;sha256sum=44bb89c6e03a2cdbb36e7616392ebb96daf0d8bc0d3d91ce3709e62e4636d5e5 \
     gomod://github.com/cespare/xxhash/v2;version=v2.3.0;sha256sum=145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3 \
     gomod://github.com/chilts/sid;version=v0.0.0-20190607042430-660e94789ec9;sha256sum=1a317f6b4c4fb11e90f5661c34703ba8b8a4ba248eaf3b4b6fe8a3c11226b9b6 \
+    gomod://github.com/clipperhouse/displaywidth;version=v0.11.0;sha256sum=27830c91cdfb2a648748db21f7a2734dcb50d21c620edde51d488ba4e7967e3d \
     gomod://github.com/clipperhouse/uax29/v2;version=v2.7.0;sha256sum=67b1278f1ffb4e4d783a390e48fe7396864650138e785d4b4bfca5914333f761 \
     gomod://github.com/cloudflare/circl;version=v1.1.0;mod=1;sha256sum=1db9d0f112f9ae8a72a06841f4f191d3545c144c6e05ed3cd816018a5882281a \
     gomod://github.com/cloudflare/circl;version=v1.6.4;sha256sum=bc44d9316fad1a8657714cbf91ed2103bcc47934765e8ee471e174e8722e9242 \
-    gomod://github.com/cloudinary/cloudinary-go/v2;version=v2.16.0;sha256sum=184f3b799461381544c4fdf815262b21e17e56a4ec3110cf8659930eb86557f5 \
-    gomod://github.com/cloudsoda/go-smb2;version=v0.0.0-20260701064823-d8c5600d73b8;sha256sum=0fd8b798fa487f674b7795ac2baf4c9742d99ef3edf0967d584da98674f15224 \
+    gomod://github.com/cloudinary/cloudinary-go/v2;version=v2.16.1;sha256sum=f00d7f9fb353e676b20c7f510afb3b80cbab73517189c7e56c11a4808a3ab3aa \
+    gomod://github.com/cloudsoda/go-smb2;version=v0.0.0-20260918041005-0c5d69b69701;sha256sum=4985391f60e801e0606d011b651371711e80331b48e66735a3222afdaa4b389e \
     gomod://github.com/cloudsoda/sddl;version=v0.0.0-20250224235906-926454e91efc;sha256sum=4d8eb7d3d840c63755c01ed2e1500df655503b466b6410208479debf4df98c16 \
     gomod://github.com/colinmarc/hdfs/v2;version=v2.4.0;sha256sum=b996584b71a7e8f337bb528cce3a28740687251d0dde7624b5487c447a7439f9 \
     gomod://github.com/coreos/go-semver;version=v0.3.1;sha256sum=e72820542b5913afe0a52e956e0b3834e9fbb080641fed183117f862fab74e8a \
@@ -95,77 +94,87 @@ SRC_URI += "\
     gomod://github.com/cronokirby/saferith;version=v0.33.1-0.20250226174546-1f11f94ce488;sha256sum=63f9e49ce347804cc181503a1b7e9b5a3a485c98907af3b94ef3dcf81900ee5a \
     gomod://github.com/davecgh/go-spew;version=v1.1.0;mod=1;sha256sum=bcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
     gomod://github.com/davecgh/go-spew;version=v1.1.1;mod=1;sha256sum=bcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
-    gomod://github.com/davecgh/go-spew;version=v1.1.2-0.20180830191138-d8f796af33cc;sha256sum=b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128 \
     gomod://github.com/diskfs/go-diskfs;version=v1.9.4;sha256sum=4f8acbe8da9b3fb057bcaff97ea2e2906a4c5e588d5c112420be6ced0b106934 \
     gomod://github.com/dop251/scsu;version=v0.0.0-20220106150536-84ac88021d00;mod=1;sha256sum=e277ed1de33f7d9ede927776393645279a4ee03396603a6f792b4bd0babfbac9 \
     gomod://github.com/dromara/dongle;version=v1.0.1;sha256sum=c0070691c99d3b163bf44c1e1dd8dd0564099515be1919d7e7af71a59c3d939c \
-    gomod://github.com/dropbox/dropbox-sdk-go-unofficial/v6;version=v6.4.0;sha256sum=9a574ccb65b9ad177baa0cd33fd149ec2c1211e15709287531556cbf3033fb81 \
+    gomod://github.com/dropbox/dropbox-sdk-go-unofficial/v6;version=v6.6.2;sha256sum=d9c09285b819d7c19b887dd5af6d489d34a981a71f4b73c343b56752936a47a9 \
     gomod://github.com/dsnet/compress;version=v0.0.2-0.20230904184137-39efe44ab707;sha256sum=bc6111029c5b2a663b69e6d622d1082ccaf114b31162ea046681c2e4b689ee43 \
     gomod://github.com/dsnet/golib;version=v0.0.0-20171103203638-1ea166775780;mod=1;sha256sum=3b5266f69965a715f27de5d5e34da0ff809eb54a2ae6d7f5453d064d5a3dd5df \
     gomod://github.com/dustin/go-humanize;version=v1.0.1;mod=1;sha256sum=4325999d0a6841031258a2561c22879d9fbdf77abc6b32a17b1cb6edf0810fb2 \
-    gomod://github.com/ebitengine/purego;version=v0.10.1;mod=1;sha256sum=4920ecc5239d79446d9b61542c3749c7389d2178d3a142e557e0379051866514 \
+    gomod://github.com/ebitengine/purego;version=v0.11.1;mod=1;sha256sum=b63c9137b0c2608c4cd43a0234cbaeb777bc0d43a29744f2058c1da82b6d358e \
     gomod://github.com/emersion/go-message;version=v0.18.2;sha256sum=7bccb8ee87c818306ca54a4e868e7066985a51c523bf059a8aee142978cb1384 \
     gomod://github.com/emersion/go-vcard;version=v0.0.0-20260618161152-d854b7e0e2d3;sha256sum=1c7f72fa119795c21f68b263dc2b887acc599ee4f510489e80ecdcdff1bf9175 \
     gomod://github.com/emmansun/gmsm;version=v0.15.5;mod=1;sha256sum=a57191060d493eb463ea7e1b413ce439978d3c9f9d61fb6237a2e57511048c12 \
     gomod://github.com/felixge/httpsnoop;version=v1.1.0;sha256sum=e3405a361843f8e69f64e41b523512925cd50fd5ea108b7912534922c31b00e7 \
     gomod://github.com/flynn/noise;version=v1.1.0;sha256sum=4925ada24731484e19b32ca5b06c46d1e102a0b7a8eaab750b11ef88ad8e661e \
-    gomod://github.com/gabriel-vasile/mimetype;version=v1.4.13;sha256sum=03b46aaa7bd4403d65dc23fb9d7e9b61214bb429491c864ee638490a42d55013 \
+    gomod://github.com/fsnotify/fsnotify;version=v1.4.7;mod=1;sha256sum=ea2d0a6a0e84f5d39d0c05711a55dafb1d56a974a1a9187fb24e8657196c5454 \
+    gomod://github.com/fsnotify/fsnotify;version=v1.4.9;mod=1;sha256sum=0dab08a9d390fa423979b281c8a30adf6368579945519dffa568ebe6f754a036 \
+    gomod://github.com/gabriel-vasile/mimetype;version=v1.4.15;sha256sum=33ca0896cfdc7e0b412d7b676ed461428b28a952f86170cea545e112a5e86ef1 \
     gomod://github.com/gdamore/encoding;version=v1.0.1;sha256sum=e584303c743306ae55be21a5703900d0628aa2ef840ce49d5f0bbf7c51379e33 \
-    gomod://github.com/gdamore/tcell/v2;version=v2.9.0;sha256sum=e36d0cb01474c5456b4fd28dc6b0c1dc115d1788ed174885afd4bf5fa2b9af42 \
+    gomod://github.com/gdamore/tcell/v3;version=v3.6.0;sha256sum=f8455638cccdd7de893d8c35d503eba0e2120377ad5efad4a03ed5b9848d3da2 \
     gomod://github.com/geoffgarside/ber;version=v1.2.0;sha256sum=cb29a3bef361e331d34f6aa5045d52d2fd0e50881814130c2e1985288131a4a7 \
-    gomod://github.com/go-chi/chi/v5;version=v5.3.1;sha256sum=ea5f747c50955a7011224da8347e802b65d05800af39104670eaa950011b794f \
+    gomod://github.com/go-chi/chi/v5;version=v5.5.0;sha256sum=39f8416f36d5b177b0ce5d48cf21b3f460df9260feafab1fb8c1410fde0901dc \
     gomod://github.com/go-darwin/apfs;version=v0.0.0-20211011131704-f84b94dbf348;mod=1;sha256sum=c2ce3c59e1bfeb7fda32827ee8a776e9ba74b7db92d97e7b11d345a26540f982 \
-    gomod://github.com/go-git/go-billy/v5;version=v5.9.0;sha256sum=36f9638d2f60c2ef960881b5908cb17b215da8fff8a7c267b4b1200a3561fc60 \
+    gomod://github.com/go-git/go-billy/v5;version=v5.9.2;sha256sum=9974a305102f61aca7626622e24d9dbe307d7b62c1e690be648af326c1f274af \
     gomod://github.com/go-logr/logr;version=v1.2.2;mod=1;sha256sum=519b1d6da5eeef675b4a1857d628f05f110a2b8cb3c423b715fea80d0975a518 \
-    gomod://github.com/go-logr/logr;version=v1.4.3;sha256sum=523d7a3587fe73f61ef41c8bc627f7d7f38de8104d46278154b307e60770ad70 \
+    gomod://github.com/go-logr/logr;version=v1.4.4;sha256sum=3ab107c1d280ce798eaa744efd595982fa709d4023f3f38d24189827483c1710 \
     gomod://github.com/go-logr/stdr;version=v1.2.2;sha256sum=9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef \
     gomod://github.com/go-ole/go-ole;version=v1.2.6;mod=1;sha256sum=de7da59858d6121956da002ded711242cc14ecf597e932a8625246418fd3bbaa \
     gomod://github.com/go-ole/go-ole;version=v1.3.0;mod=1;sha256sum=fcf0840f2ff50fbc3b5a54b9d4cb240c64d47003ab03e420aeff0057015a8953 \
-    gomod://github.com/go-openapi/errors;version=v0.22.8;sha256sum=29105371e583abec5440063d20b77c67f67bf6b017c959c88934a5da6e65ae92 \
-    gomod://github.com/go-openapi/strfmt;version=v0.27.0;sha256sum=6e830c668d22047156cd9d1e991e9e2603a55fd2fbd7331ee2e4691e9646797e \
-    gomod://github.com/go-playground/locales;version=v0.14.1;sha256sum=f33b53f2eef290d8b43b1011285f1f9cfcb1295c690defcb452598773baace7b \
-    gomod://github.com/go-playground/universal-translator;version=v0.18.1;sha256sum=77fc966f2d045c208ddeaa8343924f83688841b6f4c2ae005dc9ea5550c7d171 \
-    gomod://github.com/go-playground/validator/v10;version=v10.30.3;sha256sum=94b5f35c278e7f96b5a2ec2dfdbfafc554ac512e035af92b8663590cc7e8b052 \
+    gomod://github.com/go-openapi/errors;version=v0.22.9;sha256sum=051d8685c61791cb57083da18eff3639f0a00dc4357c28b1598b675cf29bcc59 \
+    gomod://github.com/go-openapi/strfmt;version=v0.27.3;sha256sum=dffb8a8f44e20852fdd67608911c88d84d9b840c6b4ee59e6631d1f6e9e87317 \
+    gomod://github.com/go-playground/locales;version=v0.14.2;sha256sum=44c84d533c1c7b628dc11d8f885b27f096ab0e57ef5e775f10bf19b3694188f7 \
+    gomod://github.com/go-playground/universal-translator;version=v0.18.2;sha256sum=56dd8c231c3c8814a9875c8791a4ed22bfae85da5b4445dd755c69fc3c1262d9 \
+    gomod://github.com/go-playground/validator/v10;version=v10.30.5;sha256sum=5cc6c31eb911f55169cd181158945535a0b500969aa99684a89c58468b158c6a \
     gomod://github.com/go-resty/resty/v2;version=v2.17.2;sha256sum=424588a1577747a23273e5ef9f75fdb9178b8d2a42fa37f2e0ed90bb2b957cd8 \
+    gomod://github.com/go-task/slim-sprig;version=v0.0.0-20210107165309-348f09dbbbc0;mod=1;sha256sum=875203669c50efd369628daa4876f494a1829fbe7f388b566d6d77c4df1228a1 \
     gomod://github.com/go-viper/mapstructure/v2;version=v2.5.0;sha256sum=326f8e00f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547 \
     gomod://github.com/goccy/go-json;version=v0.10.6;sha256sum=2296e77cc44facf3596ddd7a5866578a8450b59ad1583cbb70bfbfa77fe0dadc \
-    gomod://github.com/gofrs/flock;version=v0.13.0;sha256sum=171560e83110e199cc9f4f8959d442c563c8ab6b26c100dd67b7a2fe265339ce \
+    gomod://github.com/gofrs/flock;version=v0.13.1;sha256sum=2d8bab9666100e0b92ff6dfa9054be287feb295fababc4eb2daeef94cb7c033c \
     gomod://github.com/gogo/protobuf;version=v1.3.2;sha256sum=dd2b73f163c8183941626360196c8f844addd95423d341a0412e1b22d0104ff7 \
-    gomod://github.com/golang-jwt/jwt/v4;version=v4.5.2;sha256sum=ec5ee69a31fd478fc197fddce7c06dad1abe7543095a55c4ee6546ae79d99a0f \
+    gomod://github.com/golang/protobuf;version=v1.2.0;mod=1;sha256sum=c0a2031bf277087749d8ccc432449f6b1375787eac8641dd2f930074231aafb4 \
+    gomod://github.com/golang/protobuf;version=v1.4.0;mod=1;sha256sum=0d092f7aa2877feb9e55aee2668286ebbf7e3d0711b1702d84c9225e4cca73f8 \
+    gomod://github.com/golang/protobuf;version=v1.4.0-rc.1;mod=1;sha256sum=eb386ed18bb8d6092974524bd0cda610ad87bee1a4485c9f01bccb713e7dab1e \
+    gomod://github.com/golang/protobuf;version=v1.4.0-rc.1.0.20200221234624-67d41d38c208;mod=1;sha256sum=78c95913aee9dfebd1e84f8b862e98bb1848d1d3e9f22aaf909c4ef4f7e7293d \
+    gomod://github.com/golang/protobuf;version=v1.4.0-rc.2;mod=1;sha256sum=e2622048b96cd87173bd9aeb801a1010807a412e89529509e9a5099f1fc69ab4 \
+    gomod://github.com/golang/protobuf;version=v1.4.0-rc.4.0.20200313231945-b860323f09d0;mod=1;sha256sum=1edf9512236391b88764083bde0391fc49864738432acfdcdd3229572dc71be1 \
+    gomod://github.com/golang/protobuf;version=v1.4.2;mod=1;sha256sum=4bf5885d1ebdc6d270958379a741cd3b4f7aca016e874d8e8b1059110dfe9e15 \
     gomod://github.com/golang-jwt/jwt/v5;version=v5.3.1;sha256sum=5c9a74494e2bc746cee56558b5473252af5767f7ea4044caa9ea0fa2a056fec7 \
     gomod://github.com/google/btree;version=v1.1.3;sha256sum=11b736bc8252b52fecdf346d3707ccf3a2b6d458ba21b4f843616fc12eeb30b2 \
     gomod://github.com/google/flatbuffers;version=v25.12.19+incompatible;sha256sum=e029cc5ea5f0661de945a92a8eeaa8372e6af5d0aac4c87e9bbe883ad57afd96 \
+    gomod://github.com/google/go-cmp;version=v0.3.0;mod=1;sha256sum=81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
+    gomod://github.com/google/go-cmp;version=v0.3.1;mod=1;sha256sum=81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
+    gomod://github.com/google/go-cmp;version=v0.4.0;mod=1;sha256sum=4036ab5636aa42bd313296cd3bfcb4c88912760c56a9e6655ae422d8767c80da \
     gomod://github.com/google/go-cmp;version=v0.5.5;mod=1;sha256sum=4036ab5636aa42bd313296cd3bfcb4c88912760c56a9e6655ae422d8767c80da \
-    gomod://github.com/google/s2a-go;version=v0.1.9;sha256sum=bf8f4b159d3fc201477822ed2514e4f05f58c764b78ffed73ec0accce5fb7f07 \
+    gomod://github.com/google/s2a-go;version=v0.1.11;sha256sum=ee48fb249912b3e655080ad30d938d6b8f9864e1d16242879a69f51519745f86 \
     gomod://github.com/google/uuid;version=v1.6.0;sha256sum=d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed \
-    gomod://github.com/googleapis/enterprise-certificate-proxy;version=v0.3.18;sha256sum=e77fe2aae601a0efca13a72cc746dbcc5d2be1fede0f73d424f070979d41b643 \
-    gomod://github.com/googleapis/gax-go/v2;version=v2.22.0;sha256sum=800a18188bf1222e7ce7b4a31c22ab807136e6d194507aa8cd822ba9dff00696 \
+    gomod://github.com/googleapis/enterprise-certificate-proxy;version=v0.3.23;sha256sum=32ff02358b87b237ed6eb6edb7e76aa6b1ade05fbd3c6cd88426323ea72a23a6 \
+    gomod://github.com/googleapis/gax-go/v2;version=v2.26.2;sha256sum=97c16d0f59fa00739d6ec77c6e21337f25c93162fc3e232b50173476579c8d0d \
     gomod://github.com/gorilla/schema;version=v1.4.1;sha256sum=63885f95be210851d623d464698326a202274e191f53f7b7905a150e9cf04494 \
     gomod://github.com/gorilla/securecookie;version=v1.1.1;mod=1;sha256sum=ab87561203a98c2835787e44695890be78b7b961c04bad7241c83c0cc6b1d7a6 \
     gomod://github.com/gorilla/sessions;version=v1.2.1;mod=1;sha256sum=6772f11c4667facb2f2a3b95b48072cab336f996a5735308d3d286c94f24f3ae \
-    gomod://github.com/hanwen/go-fuse/v2;version=v2.10.1;sha256sum=6945a37ef334da27a747ddd6aacda04423d462d662e5035e367adec7ca8f4642 \
-    gomod://github.com/hashicorp/errwrap;version=v1.0.0;sha256sum=ccdf4c90f894d8a5fde4e79d5828c5d27a13e9f7ce3006dd72ce76e6e17cdeb2 \
+    gomod://github.com/hanwen/go-fuse/v2;version=v2.11.0;sha256sum=0e68bc0c0c1a570d9c5f7d09a1fdc6fdc9c7030a85638565734bd971c8cf553b \
     gomod://github.com/hashicorp/go-cleanhttp;version=v0.5.2;sha256sum=e9f3dcfcb33172ba499b4f8e888169252d7f1e072082182124a6e2053523f7df \
-    gomod://github.com/hashicorp/go-multierror;version=v1.1.1;sha256sum=972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c \
     gomod://github.com/hashicorp/go-retryablehttp;version=v0.7.8;sha256sum=9e2c175e4af37cdfeba28ed89250ad1fd691eda0fab167fafa9928222646b71e \
     gomod://github.com/hashicorp/go-uuid;version=v1.0.2;mod=1;sha256sum=1c4a96ad155de1eab04062a5be4010bb9aaa371252aed524217c2e69c14adecf \
     gomod://github.com/hashicorp/go-uuid;version=v1.0.3;sha256sum=5e9dc2bb3785d69a65d287a4b3fa7e9f583a127e41c6a2fd095ac862fed71dad \
     gomod://github.com/hashicorp/golang-lru/v2;version=v2.0.7;sha256sum=2eb92ff13970bccd460efae14255bfc03bb51474da0137e477a60f95561acc30 \
+    gomod://github.com/hpcloud/tail;version=v1.0.0;mod=1;sha256sum=0005c9955199580a5b950e2a03416555cc0dd8d362ed9a919b4a266b837e209a \
     gomod://github.com/inconshreveable/mousetrap;version=v1.1.0;mod=1;sha256sum=1c1b15911aa8a0bd5cd0f6670ec23d1086496f3615fdf53306aff2b476ce9be1 \
-    gomod://github.com/internxt/rclone-adapter;version=v0.0.0-20260708165336-dd6561bacfa2;sha256sum=cb356c6d3d7b525efbc14341d2651d20948085a99d062b57bd4fc81dbd51ec4d \
+    gomod://github.com/internxt/rclone-adapter;version=v0.1.0;sha256sum=f3e2dc76bb88e12042dec6571dbeacf447ef2a30378b10324349af1e0dc52c55 \
     gomod://github.com/jcmturner/aescts/v2;version=v2.0.0;sha256sum=717a211ad4aac248cf33cadde73059c13f8e9462123a0ab2fed5c5e61f7739d7 \
     gomod://github.com/jcmturner/dnsutils/v2;version=v2.0.0;sha256sum=f9188186b672e547cfaef66107aa62d65054c5d4f10d4dcd1ff157d6bf8c275d \
     gomod://github.com/jcmturner/gofork;version=v1.7.6;sha256sum=b7e42a499d6be8dd07069c031f9291a5615aa0d59660c7e322cff585ce39e8a2 \
     gomod://github.com/jcmturner/goidentity/v6;version=v6.0.1;sha256sum=243e6fd6ea9f3094eea32c55febade6d8aaa1b563db655b0c5327940e4719beb \
     gomod://github.com/jcmturner/gokrb5/v8;version=v8.4.4;sha256sum=8e468a1161302cb12b6e3f16bf31cd3b093f57c14325e11b348df1472860e313 \
     gomod://github.com/jcmturner/rpc/v2;version=v2.0.3;sha256sum=90c595355e5e2c9dc1e1ae71a88491a04c34d8791180098da103217cbf5f5574 \
-    gomod://github.com/jlaffaye/ftp;version=v0.2.1-0.20251026020404-6602e981a1bb;sha256sum=9092783cd95e376018b0f96aa4c3f31a1011fe6e589d14d906add196b11fa642 \
+    gomod://github.com/jlaffaye/ftp;version=v0.2.4;sha256sum=5b5dba00fcb45a32f2bcb3e0aa1afc451c18982387976dfadc49e073ace47be3 \
     gomod://github.com/josephspurrier/goversioninfo;version=v1.7.0;mod=1;sha256sum=d9b53badba01479688b78f3318c5a6dc931e9c9300cb74ab5c0da7a3eac67c2c \
     gomod://github.com/jtolio/noiseconn;version=v0.0.0-20231127013910-f6d9ecbf1de7;sha256sum=b7731fe9263cd320fd4ab4f537eaf904a01714c8afb0f718ef1c0d6d1ab376f7 \
     gomod://github.com/jzelinskie/whirlpool;version=v0.0.0-20201016144138-0675e54bb004;sha256sum=171380cee0b81436609d30e101fab6b51cd291eb0f1dfb119e840b042b12959c \
     gomod://github.com/kisielk/errcheck;version=v1.5.0;mod=1;sha256sum=107d26460d41b5322b6911c9b5eb233117421943b3a1453ba99f01c4fdf2f8e8 \
     gomod://github.com/kisielk/gotool;version=v1.0.0;mod=1;sha256sum=77aca7bffc0ec29fc9f088d5962ab3128f405d7b10c7ceb9693ff7a08958955d \
-    gomod://github.com/klauspost/compress;version=v1.19.0;sha256sum=2eaca328cea81dd4797b6eeadc0fe56cfe501e43fca5d1512f12b39d47e0d8f6 \
+    gomod://github.com/klauspost/compress;version=v1.20.3;sha256sum=1eb710a814c44bf21332a512a19f496fb5c489ca8eb72244bb9c49f80900848f \
     gomod://github.com/klauspost/compress;version=v1.4.1;mod=1;sha256sum=28a209d31984fd50b6724085eda0425f5d7b40de3b692bd98b296eac29fd1ed0 \
     gomod://github.com/klauspost/cpuid;version=v1.2.0;mod=1;sha256sum=9b443b5b06355eca91f4e773a4df7d8a3bf0c9abad5ff472d6973e688e6a9392 \
     gomod://github.com/klauspost/cpuid/v2;version=v2.0.1;mod=1;sha256sum=66180bc563c8890e28b69ba64fbe6e1d2879a8574a3ffce7e597f1915f78bc6c \
@@ -179,22 +188,21 @@ SRC_URI += "\
     gomod://github.com/kr/pty;version=v1.1.1;mod=1;sha256sum=6da4c9c7364446894e5ef877e19f985cd51d671ce6e8f4ca87862b449f6dd7f6 \
     gomod://github.com/kr/text;version=v0.1.0;mod=1;sha256sum=2fba9529e5c13dde62f371ef7383baf04d7132501dac6aa08e910f9ec0bf85c5 \
     gomod://github.com/kylelemons/godebug;version=v1.1.0;sha256sum=dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13 \
-    gomod://github.com/lanrat/extsort;version=v1.4.2;sha256sum=b2bd246108536fdb504a9d6a2c6c2ee7b14e35ee250027b7443111d9b0d46781 \
-    gomod://github.com/leodido/go-urn;version=v1.4.0;sha256sum=948fe5f705b9eab6c3bc7e34a3ad2549ead87a8f5f73e5a85a8c66f347612ab2 \
+    gomod://github.com/lanrat/extsort;version=v1.5.0;sha256sum=75c33cd09df04730071ba686152230182dc055cb1301e4f27c72ef10f258fd9d \
+    gomod://github.com/leodido/go-urn;version=v1.5.0;sha256sum=ceb338b7fe7c8e45fd8da9fa3c26005de833d9968d21415ebaaba603ea36f44a \
     gomod://github.com/lpar/calendar;version=v0.2.0;sha256sum=bd283ed0c979f83c8ec9882245961507e9f59a4c41e5a9ffc6d83911d56b8860 \
-    gomod://github.com/lucasb-eyer/go-colorful;version=v1.4.0;sha256sum=f2c9689fc5ca32b6ed1436bcce879b44e7b9d14f670681ab41974213f2acb217 \
+    gomod://github.com/lucasb-eyer/go-colorful;version=v1.4.1;sha256sum=399a71ecf3e3aaa0af96a779f1c106688b095dbfd0a85455a7c706d3d7ff9ebd \
     gomod://github.com/lufia/plan9stats;version=v0.0.0-20260627054121-477a66015f15;mod=1;sha256sum=37a53f16d9ab910339d4395983695afb4490aae01435c0a59980675c45d0bd95 \
     gomod://github.com/mailru/easyjson;version=v0.9.2;sha256sum=b9df0a16e05ca83bd12e36f11fb6d35622fffdda8d18b83ab7c030d11903af73 \
-    gomod://github.com/mattn/go-colorable;version=v0.1.15;sha256sum=221144f51cc5eeda0a72bd7b5832181b94240c1d760bde0b3428895e63e63339 \
+    gomod://github.com/mattn/go-colorable;version=v0.1.16;sha256sum=1b43236db9dc34e69edf02373e3ba86c058cc34c672f3e3610425cadcf6efd57 \
     gomod://github.com/mattn/go-isatty;version=v0.0.23;sha256sum=670cdaa44183b9b7aac0078b1a4cba34a74a0a85e2b92d2434a6b2ccf3387fa6 \
     gomod://github.com/mattn/go-runewidth;version=v0.0.12;mod=1;sha256sum=4136aaa23fcb3176a292822f2a8a98ccc7b2fde38a59922c152b006f59d59695 \
-    gomod://github.com/mattn/go-runewidth;version=v0.0.24;sha256sum=d517d2a2c73f75892a25c895ed40313b4906264e76a64509e3c2215800d34210 \
-    gomod://github.com/mattn/go-runewidth;version=v0.0.3;mod=1;sha256sum=7243936b0a7aadc7539411eb64063495df65b7a36f42d7ffef2eeba9f8c80acd \
+    gomod://github.com/mattn/go-runewidth;version=v0.0.31;sha256sum=96e004d61b6755f0190ae250c3ce8aa2d2e73968d0b31236f4dc54477d65bc00 \
     gomod://github.com/mholt/archives;version=v0.1.5;sha256sum=634be5320d8da86e249cf0dcf01f00f6842651fb515f4519f0fb8a4c3e779254 \
     gomod://github.com/mikelolasagasti/xz;version=v1.0.1;sha256sum=a4672995fd823a9d6793bcb8de131739d629438fe787c99985c69cf8638da8d5 \
     gomod://github.com/minio/crc64nvme;version=v1.1.1;mod=1;sha256sum=27baad099eaa74eba11eb31490c260ea4eac9b94439ff92129b8a3ad6efc3f61 \
     gomod://github.com/minio/md5-simd;version=v1.1.2;mod=1;sha256sum=7665f075b83ccb81c66de980da5f23e54e1479472aadd4166dfc26f8148a2fa3 \
-    gomod://github.com/minio/minio-go/v7;version=v7.2.1;mod=1;sha256sum=9ffdadc09db1dfce5d4986a06910b68d6941737658aec86a06afc4af5af6a7ce \
+    gomod://github.com/minio/minio-go/v7;version=v7.4.1;mod=1;sha256sum=c257fe571adc791fd926ebfc4add90d3e5024ac25a7de811daca30841f6cfd5b \
     gomod://github.com/minio/minlz;version=v1.2.0;sha256sum=63f406470535699c14af9b35486472c6e8fc8e894adbd4c8bde7635f80eea38e \
     gomod://github.com/minio/xxml;version=v0.0.3;sha256sum=eec7f98185f849ac85b798a4a7b2b1cbd5aea8ea360f563b47e715ee7fbb5c6d \
     gomod://github.com/mitchellh/go-homedir;version=v1.1.0;sha256sum=fffec361fc7e776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade184 \
@@ -203,40 +211,47 @@ SRC_URI += "\
     gomod://github.com/munnerz/goautoneg;version=v0.0.0-20191010083416-a7dc8b61c822;sha256sum=3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636afd9 \
     gomod://github.com/ncw/swift/v2;version=v2.0.5;sha256sum=0c2253cdfda2fe22b1b8d1ac23b504a00d48f7e2ddd9d98bc12f3d1b8b1bbee2 \
     gomod://github.com/nwaples/rardecode/v2;version=v2.2.5;sha256sum=f3aade153b27b75d29a1fef232f4937c65fe629eac8a1676deb98ee3899e66f0 \
-    gomod://github.com/oklog/ulid/v2;version=v2.1.1;sha256sum=312b5fea3f68df920adaffc327440efbaba43ad6a8df2f7e0c9e365743f6ff89 \
-    gomod://github.com/oracle/oci-go-sdk/v65;version=v65.121.0;sha256sum=bb8fe697adc6490e435b82ddc84bec5bf109f9c17b49f21fb74161a3a383ac4b \
+    gomod://github.com/nxadm/tail;version=v1.4.4;mod=1;sha256sum=1532073a05144c8d5fa18410f9aa0d8315341bdf73c17cc26ccdee168a7a3249 \
+    gomod://github.com/nxadm/tail;version=v1.4.8;mod=1;sha256sum=a65f8a958855bf707d326b76b72f9c428bd226304ab8cc317a67315333b4e4c7 \
+    gomod://github.com/oklog/ulid/v2;version=v2.1.2;sha256sum=0af1a4847c9dcf0084230afbe6d9265f433d9f45e2507ce155e3dbbd312aa7c3 \
+    gomod://github.com/onsi/ginkgo;version=v1.12.1;mod=1;sha256sum=fb18b454a04c8755624038635e1738f8341417dc865def8cfa5f86a49b63b9b7 \
+    gomod://github.com/onsi/ginkgo;version=v1.16.5;mod=1;sha256sum=25631b029f86dc1d5bc8aeae5e0450955c05e4abfaa70df298e6cb1f7ac54097 \
+    gomod://github.com/onsi/ginkgo;version=v1.6.0;mod=1;sha256sum=edfaa65a8835fd58b75c994930a210417b77add7c697c906fbf591cc22fe1ee6 \
+    gomod://github.com/onsi/gomega;version=v1.10.1;mod=1;sha256sum=146ef256f42914392998641b2c4e382703cea0566d00e3f6835350a8b08f5746 \
+    gomod://github.com/onsi/gomega;version=v1.7.1;mod=1;sha256sum=d875dc4a1daced467a45dbe909ca6be439d130e8cb36e0c2e6d9542a42ffd2a3 \
+    gomod://github.com/oracle/oci-go-sdk/v65;version=v65.127.0;sha256sum=6882ed55cd34bca6e9186503c6e004c6ac4316fc4e032a5e3756c58f340e1cb3 \
     gomod://github.com/panjf2000/ants/v2;version=v2.12.1;sha256sum=d770202456acd0bd6ab95e01454e17097d22ef5575c3c7451475cb46697f3c87 \
     gomod://github.com/patrickmn/go-cache;version=v2.1.0+incompatible;sha256sum=d5d1c13e3c9cfeb04a943f656333ec68627dd6ce136af67e2aa5881ad7353c55 \
     gomod://github.com/pborman/getopt;version=v0.0.0-20170112200414-7148bc3a4c30;mod=1;sha256sum=35411c4b33e0d9eb3a694855ac64f9889d85c957f86a4984ed7dcc123952ec9f \
     gomod://github.com/pengsrc/go-shared;version=v0.2.1-0.20190131101655-1999055a4a14;sha256sum=27b2ba03dd2cdb2d83ecc4dd35dd9c9c620528d965c56cf3760ecafca5598af8 \
-    gomod://github.com/peterh/liner;version=v1.2.2;sha256sum=e5fd4f6cfd85c7162f41df79f528f941e0a3e45031582e7b2ff2e921b15fbe77 \
+    gomod://github.com/peterh/liner;version=v1.2.3;sha256sum=16f1031cd5816dcc2c310c6a05f042adde9e98ad75c0ef775ff0682c84e94522 \
     gomod://github.com/philhofer/fwd;version=v1.2.0;mod=1;sha256sum=3b980d413f4498590980f5e907f60c3a9b35e9ffdd78be493bec3e4a15e83ae6 \
-    gomod://github.com/pierrec/lz4/v4;version=v4.1.27;sha256sum=702ad206ffeec8d3ac8bc1ce7e2d0b201fbc7683c8ab8758210172c54f03353f \
+    gomod://github.com/pierrec/lz4/v4;version=v4.1.28;sha256sum=fce878a0449ddb0d348893efd408aeaa9524d8103d13f092ebc97405c01ea5ee \
     gomod://github.com/pkg/browser;version=v0.0.0-20240102092130-5ac0b6a4141c;sha256sum=8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1 \
     gomod://github.com/pkg/diff;version=v0.0.0-20200914180035-5b29258ca4f7;mod=1;sha256sum=2404460a2259f7655b158d4826a61bd2de218b1f5114625e32bbadf6acaf40e2 \
     gomod://github.com/pkg/errors;version=v0.9.1;sha256sum=d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07 \
     gomod://github.com/pkg/sftp;version=v1.13.11;sha256sum=f22fb06ecb083adb09981b0a4554fa370f2cb5accc4837cdd038312008a384b5 \
     gomod://github.com/pkg/xattr;version=v0.4.12;sha256sum=3657614c6f28f6298164935f48af2515835ae04190ed9f6954b5cdf89b1aee21 \
     gomod://github.com/pmezard/go-difflib;version=v1.0.0;mod=1;sha256sum=74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2 \
-    gomod://github.com/pmezard/go-difflib;version=v1.0.1-0.20181226105442-5d4384ee4fb2;sha256sum=24ff45e356f638a53bd0c89fff961fbeaecfdb0dc5e482ceed0a2230e0e5f3b7 \
-    gomod://github.com/power-devops/perfstat;version=v0.0.0-20240221224432-82ca36839d55;mod=1;sha256sum=05744a9262bcd294613e65624f3f8bae83d79a58aa48b8328c7df91190aa07bf \
+    gomod://github.com/pmezard/go-difflib;version=v1.0.1-0.20181226105442-5d4384ee4fb2;mod=1;sha256sum=74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2 \
+    gomod://github.com/power-devops/perfstat;version=v0.0.0-20260805114148-88456608a4f6;mod=1;sha256sum=05744a9262bcd294613e65624f3f8bae83d79a58aa48b8328c7df91190aa07bf \
     gomod://github.com/pquerna/otp;version=v1.5.0;sha256sum=9b28aa98d40a2d00fe4477d2468c933112ba1818782be349999ea98b5b44d885 \
-    gomod://github.com/prometheus/client_golang;version=v1.23.2;sha256sum=dfcc6c52ad09e3d0dca2e9f41de7f8d1c0dde7baae4b867353d112918a1511de \
-    gomod://github.com/prometheus/client_model;version=v0.6.2;sha256sum=67017b19f220c6ab91ecfdd10a93824e2a8b09fcb6390054dbdc49df3354a9ca \
-    gomod://github.com/prometheus/common;version=v0.70.0;sha256sum=e2d490e176cf115b087c97b5adcbf40af9e413c1e017bd4fe0c6fd8b25cae4e3 \
-    gomod://github.com/prometheus/procfs;version=v0.21.1;sha256sum=b417ab3081ad334ce4c6b367b2d5e74dea49e2eb3b5431c1dd5a65e1256736f9 \
+    gomod://github.com/prometheus/client_golang;version=v1.25.0;sha256sum=677986b15218e6e5f740fd0801a6024726e71bf909ca1a504417eae281df4519 \
+    gomod://github.com/prometheus/client_model;version=v0.6.3;sha256sum=92f5d9a39b75bdc3f6733563934438148a3c3661420a8f742fea8cbf40d39abe \
+    gomod://github.com/prometheus/common;version=v0.72.0;sha256sum=7ba7a7e373c9c87626224e24526d664972848b24a00f36923b94e2e93a6fe182 \
+    gomod://github.com/prometheus/procfs;version=v0.22.0;sha256sum=e13d43da4a9773cecdfa8b86e745bbd8efda07b005402c673a1e882b6dbb6804 \
     gomod://github.com/putdotio/go-putio/putio;version=v0.0.0-20200123120452-16d982cac2b8;sha256sum=f69549147425ebbc5cfff2fd75f0dfcf9cfdb2c2ffd1870688915b20641b424a \
     gomod://github.com/quasilyte/go-ruleguard/dsl;version=v0.3.23;mod=1;sha256sum=2eff6aad7ded457fae06d7032b7725eaf5cbb49e2307106b3c8a8cec3448be85 \
     gomod://github.com/rasky/go-xdr;version=v0.0.0-20170124162913-1a41d1a06c93;sha256sum=b5ebee6d3d7abb3c8c11933dcf7e40982a9c37b975f9f1763b26357217cfa019 \
     gomod://github.com/rclone/Proton-API-Bridge;version=v1.0.5;sha256sum=7ecba409df35dbf570e345aab599cb7d1bc7ee57740bd8044e0a21d241853423 \
     gomod://github.com/rclone/go-proton-api;version=v1.0.4;sha256sum=478b8876f9dbc1df7ca769d6119eeddf52786e5cae1a262462ec7c7eedcb50f9 \
-    gomod://github.com/rclone/gofakes3;version=v0.0.9;sha256sum=74d6164da0d0514d7b109268c605beffcdcc863adfd8f7f7c66655b85250ce33 \
+    gomod://github.com/rclone/gofakes3;version=v0.0.12;sha256sum=c08a69d8fad15f6c1208247582895b20c2cc7e8bb57e83519fb927bea6889d0b \
     gomod://github.com/relvacode/iso8601;version=v1.7.0;sha256sum=044c39693337c25aeca570891dd334f9576d5f6b5d26be9c7e436de483a4d317 \
     gomod://github.com/rfjakob/eme;version=v1.2.0;sha256sum=e233157a745ba698a268b6b6630e923286b550a0caaeb8849b03f30841ed4dd0 \
     gomod://github.com/rivo/uniseg;version=v0.1.0;mod=1;sha256sum=6c7318a27a8d5473a8eb661e75fb00528176e0efc59310ed277ca13bd12a53f1 \
     gomod://github.com/rivo/uniseg;version=v0.2.0;mod=1;sha256sum=6c7318a27a8d5473a8eb661e75fb00528176e0efc59310ed277ca13bd12a53f1 \
     gomod://github.com/rivo/uniseg;version=v0.4.7;sha256sum=b995e4aa0cc1e5779cc61138ac925cb8c1e963e40c80e4b93ee8553812ebb792 \
-    gomod://github.com/rogpeppe/go-internal;version=v1.15.0;mod=1;sha256sum=1ffa3f3c1d2ad9d40513af6610c21d52ae2839628679854df421212f6a29ec27 \
+    gomod://github.com/rogpeppe/go-internal;version=v1.16.0;mod=1;sha256sum=1ffa3f3c1d2ad9d40513af6610c21d52ae2839628679854df421212f6a29ec27 \
     gomod://github.com/rs/xid;version=v1.6.0;mod=1;sha256sum=2ebd8a4c48bf66680d0fba5ca0d9ea1ec134396497802c75f3b39683e6e662ef \
     gomod://github.com/russross/blackfriday/v2;version=v2.1.0;sha256sum=7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae \
     gomod://github.com/ryszard/goskiplist;version=v0.0.0-20150312221310-2dfbae5fcf46;sha256sum=12c65729fc31d5a9bf246eb387bd4c268d0d68bf33b913cccd81bebd47d6f80d \
@@ -244,9 +259,9 @@ SRC_URI += "\
     gomod://github.com/samber/lo;version=v1.53.0;sha256sum=4969cf0094a1736a16ca0f89c42dea92369ba0ebacdbd9b22f1299ff7fe1f579 \
     gomod://github.com/sergi/go-diff;version=v1.0.0;mod=1;sha256sum=3c33ca6c34b55597876e1b3ec55b717f899d94d66ad78d6f084b48e6e19b406e \
     gomod://github.com/shabbyrobe/gocovmerge;version=v0.0.0-20230507112040-c3350d9342df;mod=1;sha256sum=2d6cd5793ecd79794e9af1213be49ec7bc770d617bb4885da6a50faefe524482 \
-    gomod://github.com/shirou/gopsutil/v4;version=v4.26.6;sha256sum=76049a616fbe980670f733d430a1a3d4ee5d585cf22459fff9ae3b3b902936c4 \
+    gomod://github.com/shirou/gopsutil/v4;version=v4.26.9;sha256sum=2206a841e6e5ca18b4b88d10f90a05c0714528cdec5bdd0801b9c02ed76e0ab6 \
+    gomod://github.com/sirupsen/logrus;version=v1.10.2;sha256sum=73a40737da86682dd536ec2c87dff0f589eeeed81873362b08ed009818747b52 \
     gomod://github.com/sirupsen/logrus;version=v1.7.0;mod=1;sha256sum=da2caaacef970c4c3f36c137d5567faef9403e6f62194804c7672a3975219322 \
-    gomod://github.com/sirupsen/logrus;version=v1.9.4;sha256sum=3847d00c5ee6948f1ff0d0120bc343c55ce852becb7720f8f08f53eecfe9e437 \
     gomod://github.com/skratchdot/open-golang;version=v0.0.0-20200116055534-eef842397966;sha256sum=3ad7f856621f78b370a47bb05ce12c31bdee1014e596b7f565ee20dc8ac80c66 \
     gomod://github.com/smartystreets/goconvey;version=v1.8.1;mod=1;sha256sum=6e40d14f291ab6e567a4a260dab1c818cdcd8d580d375db33f5bb26bfe80e52c \
     gomod://github.com/sony/gobreaker/v2;version=v2.4.0;sha256sum=c1fb3bde7fee65b6162e0d9e59950a6789464ad4e4cfd2fdf28477a29c968434 \
@@ -261,11 +276,13 @@ SRC_URI += "\
     gomod://github.com/stretchr/objx;version=v0.4.0;mod=1;sha256sum=31b2fdcdee870f0f61bffafafb96220967e5bca08a76a920d574216fc1f91355 \
     gomod://github.com/stretchr/objx;version=v0.5.0;mod=1;sha256sum=cb326540efcb1274a6e4e970d7fc9de2e8062f08a058fc296d859025e62e807a \
     gomod://github.com/stretchr/objx;version=v0.5.2;mod=1;sha256sum=58eca54d26728427806f40908828e8762d352cc3b0a0b0b60dc60ce61767fff6 \
-    gomod://github.com/stretchr/testify;version=v1.11.1;sha256sum=b7325b561ead5304b72b9f32aebc871ff49b3823667d530a49fd6c8f3adfc96e \
+    gomod://github.com/stretchr/testify;version=v1.11.1;mod=1;sha256sum=5846af204043f29df285026109bf32db6519c3d7e1d5c3a65fefb174f9d81d33 \
+    gomod://github.com/stretchr/testify;version=v1.12.1;sha256sum=6874ed1c4b0b7e9feb27989b16c179b36590020633436ae260cefc5f5565589f \
     gomod://github.com/stretchr/testify;version=v1.2.2;mod=1;sha256sum=4ab463f68c370041f950c10cab5104903d4598c50cf824f9aad1b7b7f69255af \
     gomod://github.com/stretchr/testify;version=v1.3.0;mod=1;sha256sum=ab063d5154a8e8730bced4c52698e5770eb50bfae347bebc35eca488b8e3f6e3 \
     gomod://github.com/stretchr/testify;version=v1.3.1-0.20190311161405-34c6fa2dc709;mod=1;sha256sum=ab063d5154a8e8730bced4c52698e5770eb50bfae347bebc35eca488b8e3f6e3 \
     gomod://github.com/stretchr/testify;version=v1.4.0;mod=1;sha256sum=6b0c7b71030d4fc55d4e6e6e24c0bfc025621341f76141e3aec0044c4ce89950 \
+    gomod://github.com/stretchr/testify;version=v1.5.1;mod=1;sha256sum=e3a11c2a6c5fe06f8a221e7289684917ac49ad01233f81b51c8360773707e700 \
     gomod://github.com/stretchr/testify;version=v1.6.1;mod=1;sha256sum=fff8168d98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf \
     gomod://github.com/stretchr/testify;version=v1.7.0;mod=1;sha256sum=fff8168d98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf \
     gomod://github.com/stretchr/testify;version=v1.7.1;mod=1;sha256sum=fff8168d98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf \
@@ -277,13 +294,12 @@ SRC_URI += "\
     gomod://github.com/tinylib/msgp;version=v1.6.4;mod=1;sha256sum=0a9f1c371dd41cbf543da2eadbade60b906ff1a80cb63c0939af7f89e5a28b8a \
     gomod://github.com/tklauser/go-sysconf;version=v0.4.0;mod=1;sha256sum=29bd839dcc5736ea8ebc4c2f4013db82c57cacd15a010d389579cde04f3336ae \
     gomod://github.com/tklauser/numcpus;version=v0.12.0;mod=1;sha256sum=03fbc174711500112a8ab1675893ecdbea2e155f3dcd5e357fb4a5619ed6b0d4 \
-    gomod://github.com/tyler-smith/go-bip39;version=v1.1.0;sha256sum=418226d3b0e8c7b1c869beb473d0d61445d9d9d3259e6fecb19aa94dc8898a3e \
     gomod://github.com/ulikunitz/xz;version=v0.5.15;sha256sum=ca1830f9abc6c99a003ad28f2b145ea0af0c99d5769ddff08d23ce055959fd12 \
     gomod://github.com/ulikunitz/xz;version=v0.5.8;mod=1;sha256sum=393876046d63d90f35f21c1bb4651b0985e76d8f14a48a7279ff947b96956e7b \
     gomod://github.com/unknwon/goconfig;version=v1.0.0;sha256sum=1a9cf2086052925a275d5d25683bce7fd2f4458423e6888a447dba618967dae3 \
     gomod://github.com/willscott/go-nfs;version=v0.0.4;sha256sum=dbdf4f05fe8dc5c2abf94f282e26d7435f878299d88c0db76510ccfe25d68132 \
     gomod://github.com/willscott/go-nfs-client;version=v0.0.0-20251022144359-801f10d98886;sha256sum=c8d9eae7a99ef6a603ac1ac93c923047402428ca6e62b87765df8a24e3eb524a \
-    gomod://github.com/winfsp/cgofuse;version=v1.6.1-0.20260126094232-f2c4fccdb286;mod=1;sha256sum=e54d3ca8174a2765799c43985663080595fbd21923042bd4ea036e807c1eb0e4 \
+    gomod://github.com/winfsp/cgofuse;version=v1.6.1-0.20260531120352-2fa812d1bdc7;mod=1;sha256sum=e54d3ca8174a2765799c43985663080595fbd21923042bd4ea036e807c1eb0e4 \
     gomod://github.com/wk8/go-ordered-map/v2;version=v2.1.8;sha256sum=c1781435c64e4cd92dd3ca585d5075eda12c0bb719a0c5f9e6ed272b65282e38 \
     gomod://github.com/xanzy/ssh-agent;version=v0.3.3;sha256sum=19a86c2623b20cc98687bddd89e3f023db0ca51c8bc9e38b9ad9c56e5b7d110d \
     gomod://github.com/youmark/pkcs8;version=v0.0.0-20240726163527-a2c0da244d78;sha256sum=cdcf5e96850f9f60bc96ab512e4bd06ee19dd2dbe855260c3589c6c79a1bcfb5 \
@@ -297,12 +313,13 @@ SRC_URI += "\
     gomod://github.com/zeebo/xxh3;version=v1.1.0;sha256sum=0cd36657902317f81f3d31b217ebaca6f98dfb665f1af611d1db0904a689bcd1 \
     gomod://go.etcd.io/bbolt;version=v1.5.0;sha256sum=2c350ca36afba707b917529a8049b001c71915c99c152d5e2600ed4bac6fbc37 \
     gomod://go.opentelemetry.io/auto/sdk;version=v1.2.1;sha256sum=a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335 \
-    gomod://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp;version=v0.69.0;sha256sum=6f2e1d300fe09d55ef13886efa33b06e9bcbd4d5f04f0014b0a2871402a28a28 \
-    gomod://go.opentelemetry.io/otel;version=v1.44.0;sha256sum=4b7ef50caaf3dc6fc1a058f9ce2ccda6aad2ab3e8657acc4c8bb3102f79c53bc \
-    gomod://go.opentelemetry.io/otel/metric;version=v1.44.0;sha256sum=4442ba5f269f81251f549acb14ac16176f23967f4a0706163440b0df91592f96 \
-    gomod://go.opentelemetry.io/otel/trace;version=v1.44.0;sha256sum=cd1abf8dcec62fe9788fae9105760db1711e6e994d2e31cdda57ccb467e7ceec \
+    gomod://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp;version=v0.70.0;sha256sum=5afae012c182ed95c9068c4b4de772677fbfecb9fbe41605046f907abba8bc92 \
+    gomod://go.opentelemetry.io/otel;version=v1.45.0;sha256sum=65b5fc93c93f4eaef740b4bba81fd2543f248d5df85cf4d1ddf9ab459b30f7a2 \
+    gomod://go.opentelemetry.io/otel/metric;version=v1.45.0;sha256sum=8f30ef0039306bf3a4421b8c08e3fc8922d13503dce53b3438e860b3628faecd \
+    gomod://go.opentelemetry.io/otel/trace;version=v1.45.0;sha256sum=32d7d64ea5991378184b03a9ed7b7822b17691a239508a6905fdd73819cb6c6f \
     gomod://go.yaml.in/yaml/v2;version=v2.4.4;sha256sum=1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576 \
-    gomod://go.yaml.in/yaml/v3;version=v3.0.4;sha256sum=0317dae56eaa9e9954467c8768fd6a89ba2005f1534e2c26fce5163ad8d2ef31 \
+    gomod://go.yaml.in/yaml/v3;version=v3.0.4;mod=1;sha256sum=2989f8b800605890ad40cf49109b0b6a972bda79d92df236d40ddb798093127e \
+    gomod://go.yaml.in/yaml/v3;version=v3.0.5;sha256sum=f2d70caa35f66283aec58b889af8c5f07c374c5934be27a738c1215263e19205 \
     gomod://go4.org;version=v0.0.0-20260112195520-a5071408f32f;sha256sum=11c8ccd8e5a90213e32b76666fa3d73cd481afc3d31c57669b76a186bd1aabe4 \
     gomod://goftp.io/server/v2;version=v2.0.3;sha256sum=3d9a67bf908360f30c27b0ea389c54b63234aa8eec9a390fe2904619a6c0c10b \
     gomod://golang.org/x/crypto;version=v0.0.0-20190308221718-c2843e01d9a2;mod=1;sha256sum=33ed070a5a66e0960685ac5386440e1b59899e74d8a38a1180685e72a2195ded \
@@ -312,63 +329,71 @@ SRC_URI += "\
     gomod://golang.org/x/crypto;version=v0.0.0-20210921155107-089bfa567519;mod=1;sha256sum=cd6311612a2aa4d0d7e03c41b3aa1fbc2d5f895ab3f61089fab80bfe9f8f5485 \
     gomod://golang.org/x/crypto;version=v0.0.0-20220622213112-05595931fe9d;mod=1;sha256sum=af2c88eebff03e3a2afecb1b03669fc54e9d122c88f7b2ecfed051ec5dbc8bbb \
     gomod://golang.org/x/crypto;version=v0.4.0;mod=1;sha256sum=a0249fae75d3543f8f30d70966302ccfb3f61fc438a0ec860733a22df7f950c1 \
-    gomod://golang.org/x/crypto;version=v0.56.0;sha256sum=fdffb67dc8c0ecea55664eb42c323c2e3b5af9fa72cd120939106c2cdc11dcb4 \
+    gomod://golang.org/x/crypto;version=v0.58.0;sha256sum=b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95 \
     gomod://golang.org/x/crypto;version=v0.6.0;mod=1;sha256sum=1b6a683455a3b882b6ac53f22752960e87bd91040a94d6f2c5cb61261e2389d8 \
     gomod://golang.org/x/crypto;version=v0.7.0;mod=1;sha256sum=c89fe22e73dac26a00a656ac11ff4c6e1a6b6cd2abcc57edcdacdec3fbdad82d \
-    gomod://golang.org/x/exp;version=v0.0.0-20260709172345-9ea1abe57597;sha256sum=ffad724cf4b26cfc6b7c2fd02401375d82725f419a4765bc50be0560c281bf97 \
-    gomod://golang.org/x/image;version=v0.45.0;sha256sum=e6988c7fd5f3ec02ae27d07e6ae6542e0d9ed7a6844b4e6a952518eafc618d8e \
-    gomod://golang.org/x/mobile;version=v0.0.0-20260709172247-6129f5bee9d5;mod=1;sha256sum=0e6228cdca3a9f8026a2fbb4ff68a1206adbb3e01683c4248e31d3c55469aae3 \
+    gomod://golang.org/x/exp;version=v0.0.0-20260813180055-c1d0aacb2297;sha256sum=560fccf306507f7fae3e6bee628dfdba8a806c7707cd0f3a3f28e8a2034ca20d \
+    gomod://golang.org/x/image;version=v0.47.0;sha256sum=3666e9fe5b8d6110471d649641e680bb117c86495d0aa2c4d8673e87d9ac6c3c \
+    gomod://golang.org/x/mobile;version=v0.0.0-20261011034528-197770444867;mod=1;sha256sum=4c5b54ac6230766f76d6347edc231cb7f5077f480db9dcbcffc8cecd14606df3 \
     gomod://golang.org/x/mod;version=v0.2.0;mod=1;sha256sum=b288f088fd851885a6d348339e2f588e58a94e6c76e5e634ae1d67c2749eb413 \
     gomod://golang.org/x/mod;version=v0.3.0;mod=1;sha256sum=b288f088fd851885a6d348339e2f588e58a94e6c76e5e634ae1d67c2749eb413 \
     gomod://golang.org/x/mod;version=v0.4.0;mod=1;sha256sum=b288f088fd851885a6d348339e2f588e58a94e6c76e5e634ae1d67c2749eb413 \
     gomod://golang.org/x/mod;version=v0.6.0-dev.0.20220419223038-86c51ed26bb4;mod=1;sha256sum=42d19023ff8f2eae700bc5495f371ecd998a22d19ba985d0af5f69900b254083 \
     gomod://golang.org/x/mod;version=v0.8.0;mod=1;sha256sum=624567459c6e9947ac4abde0b7034ee61dcbb6a9373f5970094c0bb3e8121964 \
+    gomod://golang.org/x/net;version=v0.0.0-20180906233101-161cd47e91fd;mod=1;sha256sum=3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccde0aa7df81 \
     gomod://golang.org/x/net;version=v0.0.0-20190404232315-eb5bcb51f2a3;mod=1;sha256sum=f7046769daac02beb57cbcc481280df59fb403c96fe8262282aba858c7f7fa4d \
     gomod://golang.org/x/net;version=v0.0.0-20190620200207-3b0461eec859;mod=1;sha256sum=e6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca2b4ab41da \
     gomod://golang.org/x/net;version=v0.0.0-20200114155413-6afb5195e5aa;mod=1;sha256sum=e6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca2b4ab41da \
     gomod://golang.org/x/net;version=v0.0.0-20200226121028-0de0cce0169b;mod=1;sha256sum=e6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca2b4ab41da \
+    gomod://golang.org/x/net;version=v0.0.0-20200520004742-59133d7f0dd7;mod=1;sha256sum=8b201486a1108f485943bf9bb67c78cde9aff4dcba53323bd3e28f2885041e09 \
     gomod://golang.org/x/net;version=v0.0.0-20201021035429-f5854403a974;mod=1;sha256sum=66fc44a0644a506da780f7a22a5d73dd025d44a6e58740b62d27f74d7c3a4948 \
     gomod://golang.org/x/net;version=v0.0.0-20210226172049-e18ecbb05110;mod=1;sha256sum=fef5896d103a0bce5055fdb5e96e830944334792437865347718edceb633348a \
     gomod://golang.org/x/net;version=v0.0.0-20211112202133-69e39bad7dc2;mod=1;sha256sum=fa915f5d022cfb0cb865aa2ee37d3a7741b406f84eb4a837862e29cc69ab4ef4 \
     gomod://golang.org/x/net;version=v0.0.0-20220722155237-a158d28d115b;mod=1;sha256sum=b315c52647d2da2f76e5cdb9d367e1d6727784236a9bffb612192b19b10a128d \
     gomod://golang.org/x/net;version=v0.3.0;mod=1;sha256sum=3c360a3368c25f0b39a64b630fe74ed998df00e6abee93fd49f56ffe7590a131 \
-    gomod://golang.org/x/net;version=v0.57.0;sha256sum=f8d652c629374b43846ef4f2efd419e8d1c81779eb728306d09f0de1cc1bab80 \
     gomod://golang.org/x/net;version=v0.6.0;mod=1;sha256sum=41ec76ea2172f3ee3031e38f9a535939a584d6bb35ef480854fdcb8c2026701b \
+    gomod://golang.org/x/net;version=v0.62.0;sha256sum=50e869800f4921e910eb6550369f937c7187d130a7f7f78a26ef9b589a7071a6 \
     gomod://golang.org/x/net;version=v0.7.0;mod=1;sha256sum=41ec76ea2172f3ee3031e38f9a535939a584d6bb35ef480854fdcb8c2026701b \
     gomod://golang.org/x/net;version=v0.8.0;mod=1;sha256sum=eb6ef9bd6405ace3d99e4381d0256ce41f83c66d1a20b4e2830a4c776245f71a \
-    gomod://golang.org/x/oauth2;version=v0.36.0;sha256sum=15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504 \
+    gomod://golang.org/x/oauth2;version=v0.37.0;sha256sum=82b0472ff31d57867bfb95e28c2906acd54764949a215b6a01bda40f4ae4c3bd \
+    gomod://golang.org/x/sync;version=v0.0.0-20180314180146-1d60e4601c6f;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
     gomod://golang.org/x/sync;version=v0.0.0-20190423024810-112230192c58;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
     gomod://golang.org/x/sync;version=v0.0.0-20190911185100-cd5d95a43a6e;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
     gomod://golang.org/x/sync;version=v0.0.0-20201020160332-67f06af15bc9;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
     gomod://golang.org/x/sync;version=v0.0.0-20220722155255-886fb9371eb4;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
     gomod://golang.org/x/sync;version=v0.1.0;mod=1;sha256sum=421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52686794161c \
-    gomod://golang.org/x/sync;version=v0.22.0;sha256sum=4bc67d258ce7867cfc1a43765c43d98b4c49b90c46dd0b86f896a5a4909fade0 \
+    gomod://golang.org/x/sync;version=v0.24.0;sha256sum=ca3fcf3ea8259e75891f7947e1a816a5b89402c542d45d8bbbd9e061b0c58019 \
+    gomod://golang.org/x/sys;version=v0.0.0-20180909124046-d0be0721c37e;mod=1;sha256sum=8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb50fffc8c1 \
     gomod://golang.org/x/sys;version=v0.0.0-20190215142949-d0b11bdaac8a;mod=1;sha256sum=8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb50fffc8c1 \
     gomod://golang.org/x/sys;version=v0.0.0-20190412213103-97732733099d;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
+    gomod://golang.org/x/sys;version=v0.0.0-20190904154756-749cb33beabd;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20190916202348-b4ddaad3f8a3;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
+    gomod://golang.org/x/sys;version=v0.0.0-20191005200804-aed5e4c7ecf9;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20191026070338-33540a1f6037;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
+    gomod://golang.org/x/sys;version=v0.0.0-20191120155948-bd437916bb0e;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
+    gomod://golang.org/x/sys;version=v0.0.0-20200323222414-85ca7c5b95cd;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20200930185726-fdedc70b468f;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20201119102817-f84b799fce68;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20201204225414-ed752295db88;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
+    gomod://golang.org/x/sys;version=v0.0.0-20210112080510-489259a85091;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20210124154548-22da62e12c0c;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20210423082822-04245dca01da;mod=1;sha256sum=181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4742aec343 \
     gomod://golang.org/x/sys;version=v0.0.0-20210514084401-e8d321eab015;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.0.0-20210615035016-665e8c7367d1;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.0.0-20211007075335-d3039528d8ac;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.0.0-20211117180635-dee7805ff2e1;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.0.0-20220408201424-a24fb2fb8a0f;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.0.0-20220520151302-bc2c85ada10a;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.0.0-20220715151400-c0bba94af5f8;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.0.0-20220722155257-8c9f86f7a55f;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.1.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.3.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
-    gomod://golang.org/x/sys;version=v0.47.0;sha256sum=cdac013ddced0262926ec29ffcda645da39670e61c7e5b761e572b6b1809bb1b \
+    gomod://golang.org/x/sys;version=v0.49.0;sha256sum=e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31 \
     gomod://golang.org/x/sys;version=v0.5.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/sys;version=v0.6.0;mod=1;sha256sum=f033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
     gomod://golang.org/x/term;version=v0.0.0-20201126162022-7de9c90e9dd1;mod=1;sha256sum=4cbab14f7706771b271d995a1b3cc131fe5a246aadc7ee6d1ba6f0bd894781fa \
     gomod://golang.org/x/term;version=v0.0.0-20210927222741-03fcf44c2211;mod=1;sha256sum=740794e2914f5cc87e25656c5843222b2c65665821205f45632a0477c8d3f79b \
     gomod://golang.org/x/term;version=v0.3.0;mod=1;sha256sum=1e561f7413b74b4d30ca2d6c9874ccd13bb8c94daa0e6c2377bad9e9cf6dbe58 \
-    gomod://golang.org/x/term;version=v0.45.0;sha256sum=b3a3af689728b43012ae1b21482571a35c033c545e98e021606bd4fcf1f79108 \
+    gomod://golang.org/x/term;version=v0.47.0;sha256sum=d990d5ab94dfa41ba980645b721bba7490064337a01bb03e6cacace70e8df0bf \
     gomod://golang.org/x/term;version=v0.5.0;mod=1;sha256sum=0d6f58228aadc1a6528e6755da018516566e3ae5c5201f7ade1773f56fa8d934 \
     gomod://golang.org/x/term;version=v0.6.0;mod=1;sha256sum=64359b9c653708478f020729885044ff3d8007186d9d441125fe874817e71201 \
     gomod://golang.org/x/text;version=v0.14.0;mod=1;sha256sum=971579f17e9abc5926ab76214f533bd517cf4925c885243ac4755a1a0a7c69ef \
@@ -376,43 +401,54 @@ SRC_URI += "\
     gomod://golang.org/x/text;version=v0.3.3;mod=1;sha256sum=fbb7a88ed140515e790eca7a10ffd319c9786b11c6a6c7e59f80f7fb37bb4542 \
     gomod://golang.org/x/text;version=v0.3.6;mod=1;sha256sum=fbb7a88ed140515e790eca7a10ffd319c9786b11c6a6c7e59f80f7fb37bb4542 \
     gomod://golang.org/x/text;version=v0.3.7;mod=1;sha256sum=c45d669089427bc4635d07b185f9b9680332d1c48c75b3c49cb715b81a04a5b0 \
-    gomod://golang.org/x/text;version=v0.41.0;sha256sum=e63f35daaae749d0ffff97a295ad8f4837a662938a46b7a87f18a88e85a5cbf9 \
+    gomod://golang.org/x/text;version=v0.43.0;sha256sum=b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863 \
     gomod://golang.org/x/text;version=v0.5.0;mod=1;sha256sum=15929e76fce04aea4c92a354426bb43370684645a4ee03f2e75d0c2eb1466304 \
     gomod://golang.org/x/text;version=v0.7.0;mod=1;sha256sum=15929e76fce04aea4c92a354426bb43370684645a4ee03f2e75d0c2eb1466304 \
     gomod://golang.org/x/text;version=v0.8.0;mod=1;sha256sum=436f592e77b593b02fbea374e23ad3369c8623ff0d29c91de7de1e6672db9a41 \
-    gomod://golang.org/x/time;version=v0.15.0;sha256sum=8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad9da27f84 \
+    gomod://golang.org/x/time;version=v0.16.0;sha256sum=ac27777be8088859ba3b1bea3648064dc95ff8bac3023b1b059d1ab126dc729e \
     gomod://golang.org/x/tools;version=v0.0.0-20180917221912-90fa682c2a6e;mod=1;sha256sum=a0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0337392b52af \
     gomod://golang.org/x/tools;version=v0.0.0-20190829051458-42f498d34c4d;mod=1;sha256sum=88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5ab0b3501aca1 \
     gomod://golang.org/x/tools;version=v0.0.0-20191119224855-298f0cb1881e;mod=1;sha256sum=88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5ab0b3501aca1 \
     gomod://golang.org/x/tools;version=v0.0.0-20200619180055-7c47624df98f;mod=1;sha256sum=ef6e2f94244214971780f9ba31d90806928ad410c82b04d8888f815341f7a667 \
     gomod://golang.org/x/tools;version=v0.0.0-20201211185031-d93e913c1a58;mod=1;sha256sum=25d72c03e7aa571136087ebafc9e83d004d0bd8cd3864d78c2f5813e122aba81 \
+    gomod://golang.org/x/tools;version=v0.0.0-20201224043029-2b0845dc783e;mod=1;sha256sum=25d72c03e7aa571136087ebafc9e83d004d0bd8cd3864d78c2f5813e122aba81 \
     gomod://golang.org/x/tools;version=v0.0.0-20210106214847-113979e3529a;mod=1;sha256sum=25d72c03e7aa571136087ebafc9e83d004d0bd8cd3864d78c2f5813e122aba81 \
     gomod://golang.org/x/tools;version=v0.1.12;mod=1;sha256sum=2a8b9365898f0822face65ba089a1353e68a65d342f300ca317cceccde6421f3 \
-    gomod://golang.org/x/tools;version=v0.48.0;mod=1;sha256sum=e6b55566a172ecfd21e5f4a8750f2d25665287288b24ff8d4e6cea5d5078c608 \
+    gomod://golang.org/x/tools;version=v0.52.0;mod=1;sha256sum=b4272bcb2c99901b1878e04a56c8a584ac1dce9d5844a3c1cc68a627546fe6fe \
     gomod://golang.org/x/tools;version=v0.6.0;mod=1;sha256sum=830ed78dcd3e9927c412e2641230308447749d513d31024d276e2443b2016609 \
     gomod://golang.org/x/xerrors;version=v0.0.0-20190717185122-a985d3407aa7;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
     gomod://golang.org/x/xerrors;version=v0.0.0-20191011141410-1b5146add898;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
     gomod://golang.org/x/xerrors;version=v0.0.0-20191204190536-9bdfabe68543;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
     gomod://golang.org/x/xerrors;version=v0.0.0-20200804184101-5ec99f83aff1;mod=1;sha256sum=aa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27e78882db3d7f5 \
-    gomod://google.golang.org/api;version=v0.279.0;sha256sum=ff75d285ffbf326f59417ed9c1b5576f2ad408bf6c890b8a57afbd1770a22e53 \
-    gomod://google.golang.org/genproto/googleapis/rpc;version=v0.0.0-20260715232425-e75dac1f907d;sha256sum=ed5609068b408088bd42fe63eb4cdb5762e6f61378b90d60313f5e491c2adfb0 \
-    gomod://google.golang.org/grpc;version=v1.84.0-dev.0.20260723093437-b6eac429d7b6;sha256sum=66d8132f153efca923ecbc7b342e62d4b1dede50394eef8c984a1d27446628b7 \
-    gomod://google.golang.org/protobuf;version=v1.36.11;sha256sum=14983d36c56a814ed91b6d652f2b8f895baba1b84eb43b28a0b132c8637cd274 \
+    gomod://google.golang.org/api;version=v0.304.0;sha256sum=d8d89b9b5d9fb55e25f3072adf0501abd0e6bf0af50411be149fcd7d41c22307 \
+    gomod://google.golang.org/genproto/googleapis/rpc;version=v0.0.0-20261005182115-fad411399dd8;sha256sum=ddd82f3672cef445a8e673be7aa41d402f44cadc50ef02b72fe319e9fbabef9d \
+    gomod://google.golang.org/grpc;version=v1.84.0;sha256sum=a14bebefbac1ec115d9e1f8042006c185d65adf43a91644f3e58df0688831b95 \
+    gomod://google.golang.org/protobuf;version=v0.0.0-20200109180630-ec00e32a8dfd;mod=1;sha256sum=a23990efb67ee10bb16d1d1936109cefa4e4262ae3da8d0748efb691614dbb78 \
+    gomod://google.golang.org/protobuf;version=v0.0.0-20200221191635-4d8936d0db64;mod=1;sha256sum=a6d950dd2a7eb82e51cf459d3f61f614b09d730adb9e8094d5bf96b043f38174 \
+    gomod://google.golang.org/protobuf;version=v0.0.0-20200228230310-ab0ca4ff8a60;mod=1;sha256sum=3b808d19947fb29e4db24ed5cb88941afc1927f538d80ad6f880ae4664a5d016 \
+    gomod://google.golang.org/protobuf;version=v1.20.1-0.20200309200217-e05f789c0967;mod=1;sha256sum=420ec9fba7793b96dff1c5ae9983656e72e1c0bd1d14dda2398aec1b294780ff \
+    gomod://google.golang.org/protobuf;version=v1.21.0;mod=1;sha256sum=a532d488ff1097b330ff2e2929f39ecff8c2fa09dc7650b66ca5430c2d8303fb \
+    gomod://google.golang.org/protobuf;version=v1.23.0;mod=1;sha256sum=394a49462cbf6dca4dd86f3cf0e8ddcbb9adc9397f73e82fecae54c79e9e4d53 \
+    gomod://google.golang.org/protobuf;version=v1.36.12;sha256sum=68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6 \
     gomod://gopkg.in/check.v1;version=v0.0.0-20161208181325-20d25e280405;mod=1;sha256sum=5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb45ee40c33f \
     gomod://gopkg.in/check.v1;version=v1.0.0-20201130134442-10cb98267c6c;mod=1;sha256sum=6e6e2fca40eb8fe1455e6a08cd39833c7c2e9a2341a81fb181b89d0b1c725f48 \
+    gomod://gopkg.in/fsnotify.v1;version=v1.4.7;mod=1;sha256sum=25e8db5f993b882b3c6ef286c481937ea5d527df3a92051fd9e4b29b716dbfbc \
     gomod://gopkg.in/ini.v1;version=v1.67.3;mod=1;sha256sum=bbaaff022cbbee98f0c099e7217d0bde01261a518980d118423ed656406a5abf \
     gomod://gopkg.in/natefinch/lumberjack.v2;version=v2.2.1;sha256sum=e28804b050e7debf4f5b2dd8d241d804f5d592d0519b6e7a3dc9d4cce6f075b3 \
+    gomod://gopkg.in/tomb.v1;version=v1.0.0-20141024135613-dd632973f1e7;mod=1;sha256sum=3663081d0d18fd2eccbdbe45e90193d3194d587441f7afafb33674d68702e0aa \
     gomod://gopkg.in/validator.v2;version=v2.0.1;sha256sum=71ba069ff408d982210bd0c9cedc2b42582d7fc7eeee8d5fca369b4574e5215c \
     gomod://gopkg.in/yaml.v2;version=v2.2.2;mod=1;sha256sum=88d979d2f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
+    gomod://gopkg.in/yaml.v2;version=v2.2.4;mod=1;sha256sum=88d979d2f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
+    gomod://gopkg.in/yaml.v2;version=v2.3.0;mod=1;sha256sum=88d979d2f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
     gomod://gopkg.in/yaml.v2;version=v2.4.0;sha256sum=ede49e27c4cca6cdd2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd \
     gomod://gopkg.in/yaml.v3;version=v3.0.0-20200313102051-9f266ea9e77c;mod=1;sha256sum=21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939 \
     gomod://gopkg.in/yaml.v3;version=v3.0.1;sha256sum=aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015 \
     gomod://moul.io/http2curl/v2;version=v2.3.0;sha256sum=a622f88e882a55c2120029b6a688258692dcda47b60f3e66bb9283b29f7bdffa \
     gomod://sigs.k8s.io/yaml;version=v1.6.0;sha256sum=cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052 \
-    gomod://storj.io/common;version=v0.0.0-20260629224719-ba1bff0a7846;sha256sum=825ec543e1ecb8bd7cf78f73044f62b5a7a7f2fd749b9fbbf1b29e19bf70d1fa \
+    gomod://storj.io/common;version=v0.0.0-20260818140313-d38275a3768b;sha256sum=b5836d8beaecb28724368aca8c9933fc0d50c87e074ad5620f16cb078465ab35 \
     gomod://storj.io/drpc;version=v1.0.0;sha256sum=9d1c86e384bb543306c2429b8b7fe3b3369f378939052e85b4565c119e20f50e \
     gomod://storj.io/eventkit;version=v0.0.0-20260716074419-6861a92e2aa5;sha256sum=0b3fe22f730d257e44a7a224255b885aed61f485fa00017ec3d2124b06db62f7 \
-    gomod://storj.io/infectious;version=v0.0.2;sha256sum=453d3f5787155a1e3227228a1ee77c37d5f1c6a3aeaf0be17288e64d6e7fb655 \
+    gomod://storj.io/infectious;version=v1.0.1;sha256sum=02794ef6702b22f6f716bfec5f42009a79352926eebc223aa46d4b11b95523dc \
     gomod://storj.io/picobuf;version=v0.0.4;sha256sum=7f054dd3ec5472b63f5b5390c6c7b6c429c38bd37286de540839a0e32137ccd1 \
-    gomod://storj.io/uplink;version=v1.14.3;sha256sum=1170c4b061d02f6beed75c1ad8ba5ff4150c2076b6a5b24319b3e89665b0476b \
+    gomod://storj.io/uplink;version=v1.14.5;sha256sum=1a02ce7aed9631faefbad62cca10241b995bb5be0b6c1bd1a90f2e6bad047229 \
 "
diff --git a/meta-oe/recipes-support/rclone/rclone-licenses.inc b/meta-oe/recipes-support/rclone/rclone-licenses.inc
index 76ab8005bf..61c3bab734 100644
--- a/meta-oe/recipes-support/rclone/rclone-licenses.inc
+++ b/meta-oe/recipes-support/rclone/rclone-licenses.inc
@@ -8,23 +8,24 @@ LICENSE += "AND 0BSD AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND CC0-1.
 
 LIC_FILES_CHKSUM += "\
     file://pkg/mod/bazil.org/fuse@v0.0.0-20230120002735-62a210ff1fd5/LICENSE;md5=383dc9a9437856075082259af51e3b6d;spdx=BSD-3-Clause \
-    file://pkg/mod/cloud.google.com/go/auth/oauth2adapt@v0.2.8/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/cloud.google.com/go/auth@v0.20.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.9.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/!azure!a!d/microsoft-authentication-library-for-go@v1.7.2/LICENSE;md5=e74f78882cab57fd1cc4c5482b9a214a;spdx=MIT \
-    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/azcore@v1.22.0/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
-    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/azidentity@v1.14.0/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
-    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/internal@v1.12.0/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
-    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/storage/azblob@v1.8.0/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
-    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/storage/azfile@v1.7.0/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
+    file://pkg/mod/cloud.google.com/go/auth/oauth2adapt@v0.3.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/auth@v0.24.1-0.20261001053825-dbc26066f70a/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.10.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!azure!a!d/microsoft-authentication-library-for-go@v1.10.1/LICENSE;md5=e74f78882cab57fd1cc4c5482b9a214a;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/azcore@v1.23.3/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/azidentity@v1.15.0/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/internal@v1.13.0/LICENSE.txt;md5=a93cb0863fda8e7f177e09f6943951b4;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/storage/azblob@v1.8.2/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/storage/azfile@v1.7.1/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
+    file://pkg/mod/github.com/!azure/azure-sdk-for-go/sdk/storage/internal@v0.1.0/LICENSE.txt;md5=261d8686a7cf1ce9570cdc99746659f8;spdx=MIT \
     file://pkg/mod/github.com/!azure/go-ntlmssp@v0.1.1/LICENSE;md5=7f7cc56311d298677f304d0ffce374d8;spdx=MIT \
     file://pkg/mod/github.com/!filen!cloud!dienste/filen-sdk-go@v0.0.39/LICENSE;md5=d8588c672c152b20b432865bd837f410;spdx=MIT \
     file://pkg/mod/github.com/!files-com/files-sdk-go/v3@v3.3.194/LICENSE;md5=5b1e5439f3483c0b3e5af1d44889d0f7;spdx=MIT \
-    file://pkg/mod/github.com/!i!b!m/go-sdk-core/v5@v5.23.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/!i!b!m/go-sdk-core/v5@v5.25.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/github.com/!max-!sum/base32768@v0.0.0-20230304063302-18e6ce5945fd/LICENSE;md5=53a7faa559b046b1571765e974438d2c;spdx=MIT \
     file://pkg/mod/github.com/!proton!mail/bcrypt@v0.0.0-20211005172633-e235017c1baf/LICENSE;md5=94d9bbe24b03be19e69b3e9e8e7521a1;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/!proton!mail/gluon@v0.17.1-0.20230724134000-308be39be96e/COPYING_NOTES.md;md5=3c7f65cc939ed17774f55642f2a27c2b;spdx=MIT \
-    file://pkg/mod/github.com/!proton!mail/go-crypto@v1.4.1/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/!proton!mail/go-crypto@v1.5.2/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/!proton!mail/go-srp@v0.0.7/LICENSE.txt;md5=fdd3dd2144c32a9e32bd64b8170c4585;spdx=MIT \
     file://pkg/mod/github.com/!proton!mail/gopenpgp/v3@v3.4.1/LICENSE;md5=1081df8b971c929caed0f3de2bd9c235;spdx=MIT \
     file://pkg/mod/github.com/!puerkito!bio/goquery@v1.12.0/LICENSE;md5=4ee9bef45920e3fbd01226d1224b8215;spdx=BSD-3-Clause \
@@ -32,39 +33,35 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/a1ex3/zstd-seekable-format-go/pkg@v0.10.0/LICENSE;md5=0301ea677edf4adc894d9e217774f8e5;spdx=MIT \
     file://pkg/mod/github.com/a8m/tree@v0.0.0-20240104212747-2c8764a5f17e/LICENSE;md5=3e88c68744f3946210bf9235cc30f23d;spdx=MIT \
     file://pkg/mod/github.com/aalpar/deheap@v1.1.2/LICENSE;md5=e725ea0e59f9ea35163ae19e4a6c23fd;spdx=MIT \
-    file://pkg/mod/github.com/abbot/go-http-auth@v0.4.0/LICENSE;md5=ff253ad767462c46be284da12dda33e8;spdx=Apache-2.0 \
     file://pkg/mod/github.com/adrg/xdg@v0.5.3/LICENSE;md5=65a17e806f0d53da7257b100b42d2dba;spdx=MIT \
-    file://pkg/mod/github.com/anacrolix/dms@v1.7.2/LICENSE;md5=d0d54f2866dcc7a433a172dc95bfa18b;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/anacrolix/generics@v0.2.0/LICENSE;md5=9741c346eef56131163e13b9db1241b3;spdx=MPL-2.0 \
-    file://pkg/mod/github.com/anacrolix/log@v0.17.0/LICENSE;md5=9741c346eef56131163e13b9db1241b3;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/anacrolix/dms@v1.8.0/LICENSE;md5=d0d54f2866dcc7a433a172dc95bfa18b;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/anchore/go-lzo@v0.1.1/LICENSE;md5=766db377f975691ab09c03aeb015fd5a;spdx=MIT \
-    file://pkg/mod/github.com/andybalholm/brotli@v1.2.2/LICENSE;md5=941ee9cd1609382f946352712a319b4b;spdx=MIT \
-    file://pkg/mod/github.com/andybalholm/brotli@v1.2.2/flate/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/andybalholm/brotli@v1.2.7/LICENSE;md5=941ee9cd1609382f946352712a319b4b;spdx=MIT \
     file://pkg/mod/github.com/andybalholm/cascadia@v1.3.4/LICENSE;md5=fd61b1ebe511f46d0dfcbbcc3f7d083a;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/apache/arrow-go/v18@v18.7.0/LICENSE.txt;md5=6809686fee171a5b91c0fa6a6600ff14;spdx=Apache-2.0 \
     file://pkg/mod/github.com/appscode/go-querystring@v0.0.0-20170504095604-0126cfb3f1dc/LICENSE;md5=29f156828ca5f2df0d1c12543a75f12a;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/atotto/clipboard@v0.1.4/LICENSE;md5=489200b65f13bcbcb890a96b99a58a6f;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream@v1.7.18/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.32.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.19.29/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.18.30/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/s3/manager@v1.22.34/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.4.38/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.7.38/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/v4a@v1.4.39/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.17/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/checksum@v1.9.31/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.13.38/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/s3shared@v1.19.39/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/s3@v1.107.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/signin@v1.4.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.32.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.37.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.44.1/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.43.7/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.43.7/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/aws/smithy-go@v1.27.8/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/aws/smithy-go@v1.27.8/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream@v1.7.22/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/config@v1.33.9/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/credentials@v1.20.9/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/ec2/imds@v1.20.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/feature/s3/manager@v1.23.14/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/configsources@v1.5.6/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2@v2.8.6/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/internal/v4a@v1.5.6/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding@v1.13.21/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/checksum@v1.11.7/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url@v1.14.6/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/internal/s3shared@v1.20.6/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/s3@v1.114.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/signin@v1.10.4/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sso@v1.38.4/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/ssooidc@v1.43.4/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2/service/sts@v1.51.4/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.47.3/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/aws-sdk-go-v2@v1.47.3/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/aws/smithy-go@v1.28.5/LICENSE;md5=34400b68072d710fecd0a2940a0d1658;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/aws/smithy-go@v1.28.5/internal/sync/singleflight/LICENSE;md5=bdc234595bc2fe370918f5de5077c8e9;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/bahlo/generic-list-go@v0.2.0/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/beorn7/perks@v1.0.1/LICENSE;md5=0d0738f37ee8dc0b5f88a32e83c60198;spdx=MIT \
     file://pkg/mod/github.com/bodgit/plumbing@v1.3.0/LICENSE;md5=c0bea59ab9d214598eed569eb9e710dc;spdx=BSD-3-Clause \
@@ -77,10 +74,11 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/calebcase/tmpfile@v1.0.3/LICENSE;md5=b35144eeb03d15b22d2450d1a7e9d674;spdx=MIT \
     file://pkg/mod/github.com/cespare/xxhash/v2@v2.3.0/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
     file://pkg/mod/github.com/chilts/sid@v0.0.0-20190607042430-660e94789ec9/LICENSE;md5=d05a98b9fccf30c831030b5a399905d0;spdx=MIT \
+    file://pkg/mod/github.com/clipperhouse/displaywidth@v0.11.0/LICENSE;md5=5650f352443b7675de3495a7be2c7454;spdx=MIT \
     file://pkg/mod/github.com/clipperhouse/uax29/v2@v2.7.0/LICENSE;md5=39b00daa69674119df37aadf8ab34aeb;spdx=MIT \
     file://pkg/mod/github.com/cloudflare/circl@v1.6.4/LICENSE;md5=71d73ee3b01fb1fe8499f3da2593ecc7;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/cloudinary/cloudinary-go/v2@v2.16.0/LICENSE;md5=9edb0b9f9cb1c9f76179099ba77ec01b;spdx=MIT \
-    file://pkg/mod/github.com/cloudsoda/go-smb2@v0.0.0-20260701064823-d8c5600d73b8/LICENSE;md5=25ce52c09e04c514b0d7f783066437b2;spdx=BSD-2-Clause \
+    file://pkg/mod/github.com/cloudinary/cloudinary-go/v2@v2.16.1/LICENSE;md5=9edb0b9f9cb1c9f76179099ba77ec01b;spdx=MIT \
+    file://pkg/mod/github.com/cloudsoda/go-smb2@v0.0.0-20260918041005-0c5d69b69701/LICENSE;md5=25ce52c09e04c514b0d7f783066437b2;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/cloudsoda/sddl@v0.0.0-20250224235906-926454e91efc/LICENSE;md5=3000208d539ec061b899bce1d9ce9404;spdx=LGPL-3.0-only \
     file://pkg/mod/github.com/colinmarc/hdfs/v2@v2.4.0/LICENSE.txt;md5=1f6732eb0b60117407685b62c5eef861;spdx=MIT \
     file://pkg/mod/github.com/coreos/go-semver@v0.3.1/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
@@ -88,78 +86,75 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/cpuguy83/go-md2man/v2@v2.0.7/LICENSE.md;md5=80794f9009df723bbc6fe19234c9f517;spdx=MIT \
     file://pkg/mod/github.com/creasty/defaults@v1.8.0/LICENSE;md5=2a8ec4176ecc68c1924bb7a5d481fe4c;spdx=MIT \
     file://pkg/mod/github.com/cronokirby/saferith@v0.33.1-0.20250226174546-1f11f94ce488/LICENSE;md5=12ae33e24b984e0e17c6d247eda9372f;spdx=MIT \
-    file://pkg/mod/github.com/davecgh/go-spew@v1.1.2-0.20180830191138-d8f796af33cc/LICENSE;md5=c06795ed54b2a35ebeeb543cd3a73e56;spdx=ISC \
     file://pkg/mod/github.com/diskfs/go-diskfs@v1.9.4/LICENSE;md5=a346cc99f8bdb4f2cb18021ef39dedba;spdx=MIT \
     file://pkg/mod/github.com/dromara/dongle@v1.0.1/LICENSE;md5=b4252112929b7d12372b544e19b8d4fc;spdx=MIT \
-    file://pkg/mod/github.com/dropbox/dropbox-sdk-go-unofficial/v6@v6.4.0/LICENSE;md5=efb2aa1cf82f675adabe9c3b0843a00c;spdx=MIT \
+    file://pkg/mod/github.com/dropbox/dropbox-sdk-go-unofficial/v6@v6.6.2/LICENSE;md5=efb2aa1cf82f675adabe9c3b0843a00c;spdx=MIT \
     file://pkg/mod/github.com/dsnet/compress@v0.0.2-0.20230904184137-39efe44ab707/LICENSE.md;md5=f9a9166bea9f7824860e08378d6ca5e3;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/emersion/go-message@v0.18.2/LICENSE;md5=9b0a3b8006be4b746c6677242184c65b;spdx=MIT \
     file://pkg/mod/github.com/emersion/go-vcard@v0.0.0-20260618161152-d854b7e0e2d3/LICENSE;md5=ac5a2269482607202afa3fc8d061665e;spdx=MIT \
     file://pkg/mod/github.com/felixge/httpsnoop@v1.1.0/LICENSE.txt;md5=684da2bf3eed8fc8860e75ad84638225;spdx=MIT \
     file://pkg/mod/github.com/flynn/noise@v1.1.0/LICENSE;md5=1dc4e7f9b3fd35ee39d507e94280bdfb;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/gabriel-vasile/mimetype@v1.4.13/LICENSE;md5=df3ca1fbe5632f81387306d9558a61c4;spdx=MIT \
+    file://pkg/mod/github.com/gabriel-vasile/mimetype@v1.4.15/LICENSE;md5=df3ca1fbe5632f81387306d9558a61c4;spdx=MIT \
     file://pkg/mod/github.com/gdamore/encoding@v1.0.1/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/gdamore/tcell/v2@v2.9.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/gdamore/tcell/v3@v3.6.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/geoffgarside/ber@v1.2.0/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/go-chi/chi/v5@v5.3.1/LICENSE;md5=eef59fdf1c5117072cbf52b79c6ea691;spdx=MIT \
-    file://pkg/mod/github.com/go-git/go-billy/v5@v5.9.0/LICENSE;md5=7b6086dcb6977f0ca57a7c47167999e7;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/go-logr/logr@v1.4.3/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-chi/chi/v5@v5.5.0/LICENSE;md5=eef59fdf1c5117072cbf52b79c6ea691;spdx=MIT \
+    file://pkg/mod/github.com/go-git/go-billy/v5@v5.9.2/LICENSE;md5=7b6086dcb6977f0ca57a7c47167999e7;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-logr/logr@v1.4.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/github.com/go-logr/stdr@v1.2.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/go-openapi/errors@v0.22.8/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/go-openapi/strfmt@v0.27.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/go-playground/locales@v0.14.1/LICENSE;md5=3ccbda375ee345400ad1da85ba522301;spdx=MIT \
-    file://pkg/mod/github.com/go-playground/universal-translator@v0.18.1/LICENSE;md5=2e2b21ef8f61057977d27c727c84bef1;spdx=MIT \
-    file://pkg/mod/github.com/go-playground/validator/v10@v10.30.3/LICENSE;md5=a718a0f318d76f7c5d510cbae84f0b60;spdx=MIT \
+    file://pkg/mod/github.com/go-openapi/errors@v0.22.9/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-openapi/strfmt@v0.27.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/go-playground/locales@v0.14.2/LICENSE;md5=3ccbda375ee345400ad1da85ba522301;spdx=MIT \
+    file://pkg/mod/github.com/go-playground/universal-translator@v0.18.2/LICENSE;md5=2e2b21ef8f61057977d27c727c84bef1;spdx=MIT \
+    file://pkg/mod/github.com/go-playground/validator/v10@v10.30.5/LICENSE;md5=a718a0f318d76f7c5d510cbae84f0b60;spdx=MIT \
     file://pkg/mod/github.com/go-resty/resty/v2@v2.17.2/LICENSE;md5=1fd20eb7ff613b50e8e31a0006518a76;spdx=MIT \
     file://pkg/mod/github.com/go-viper/mapstructure/v2@v2.5.0/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd;spdx=MIT \
     file://pkg/mod/github.com/goccy/go-json@v0.10.6/LICENSE;md5=33a07164132d795872805bfc53f6097d;spdx=MIT \
-    file://pkg/mod/github.com/gofrs/flock@v0.13.0/LICENSE;md5=f852ccc601f58d934aff3a71b042ba08;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/gofrs/flock@v0.13.1/LICENSE;md5=f852ccc601f58d934aff3a71b042ba08;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/gogo/protobuf@v1.3.2/LICENSE;md5=38be95f95200434dc208e2ee3dab5081;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/golang-jwt/jwt/v4@v4.5.2/LICENSE;md5=a21b708d8b320c68979c44ac9dba9b0d;spdx=MIT \
     file://pkg/mod/github.com/golang-jwt/jwt/v5@v5.3.1/LICENSE;md5=a21b708d8b320c68979c44ac9dba9b0d;spdx=MIT \
     file://pkg/mod/github.com/google/btree@v1.1.3/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/flatbuffers@v25.12.19+incompatible/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/google/s2a-go@v0.1.9/LICENSE.md;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/google/s2a-go@v0.1.11/LICENSE.md;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/google/uuid@v1.6.0/LICENSE;md5=88073b6dd8ec00fe09da59e0b6dfded1;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0.3.18/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.22.0/LICENSE;md5=0dd48ae8103725bd7b401261520cdfbb;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0.3.23/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.26.2/LICENSE;md5=0dd48ae8103725bd7b401261520cdfbb;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/gorilla/schema@v1.4.1/LICENSE;md5=c30eee78985cf2584cded5f89ba3d787;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/hanwen/go-fuse/v2@v2.10.1/LICENSE;md5=184af88d5a6fdee1755dfff3df14a56f;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/hashicorp/errwrap@v1.0.0/LICENSE;md5=b278a92d2c1509760384428817710378;spdx=MPL-2.0 \
+    file://pkg/mod/github.com/hanwen/go-fuse/v2@v2.11.0/LICENSE;md5=184af88d5a6fdee1755dfff3df14a56f;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/hashicorp/go-cleanhttp@v0.5.2/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea;spdx=MPL-2.0 \
-    file://pkg/mod/github.com/hashicorp/go-multierror@v1.1.1/LICENSE;md5=d44fdeb607e2d2614db9464dbedd4094;spdx=MPL-2.0 \
     file://pkg/mod/github.com/hashicorp/go-retryablehttp@v0.7.8/LICENSE;md5=bffc21c92b5f3adcbbb06f8e0067e786;spdx=MPL-2.0 \
     file://pkg/mod/github.com/hashicorp/go-uuid@v1.0.3/LICENSE;md5=1694f6ca1fdc81a15c1fd408542d47e6;spdx=MPL-2.0 \
     file://pkg/mod/github.com/hashicorp/golang-lru/v2@v2.0.7/LICENSE;md5=dc2f3ee49116a594755b22b853cc8b6b;spdx=MPL-2.0 \
     file://pkg/mod/github.com/hashicorp/golang-lru/v2@v2.0.7/simplelru/LICENSE_list;md5=36e7e1c318b6301bd0c13090ed16adb2;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/internxt/rclone-adapter@v0.0.0-20260708165336-dd6561bacfa2/LICENSE;md5=44a591f7bb5950c0dc3b63cd148ebfa7;spdx=MIT \
+    file://pkg/mod/github.com/internxt/rclone-adapter@v0.1.0/LICENSE;md5=45a0b1e011b90edf3d8754f97c862926;spdx=MIT \
+    file://pkg/mod/github.com/internxt/rclone-adapter@v0.1.0/internal/bip39/LICENSE;md5=9380d72a13094f603bec718c10f56b4b;spdx=MIT \
     file://pkg/mod/github.com/jcmturner/aescts/v2@v2.0.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/github.com/jcmturner/dnsutils/v2@v2.0.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/github.com/jcmturner/gofork@v1.7.6/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/jcmturner/goidentity/v6@v6.0.1/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/github.com/jcmturner/gokrb5/v8@v8.4.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/github.com/jcmturner/rpc/v2@v2.0.3/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/jlaffaye/ftp@v0.2.1-0.20251026020404-6602e981a1bb/LICENSE;md5=cfa6042baa2778b246a276734c00aa4d;spdx=ISC \
+    file://pkg/mod/github.com/jlaffaye/ftp@v0.2.4/LICENSE;md5=cfa6042baa2778b246a276734c00aa4d;spdx=ISC \
     file://pkg/mod/github.com/jtolio/noiseconn@v0.0.0-20231127013910-f6d9ecbf1de7/LICENSE;md5=2e448287a2cf31846927205ee5737298;spdx=MIT \
     file://pkg/mod/github.com/jzelinskie/whirlpool@v0.0.0-20201016144138-0675e54bb004/LICENSE;md5=56ba9a7139fb128d57668c048a3231dd;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.0/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.0/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.0/s2/LICENSE;md5=2460814a2b25a7277556c2d89de915d1;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/klauspost/compress@v1.19.0/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.3/LICENSE;md5=d0fd9ebda39468b51ff4539c9fbb13a8;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.3/internal/snapref/LICENSE;md5=b8b79c7d4cda128290b98c6a21f9aac6;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.3/s2/LICENSE;md5=2460814a2b25a7277556c2d89de915d1;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/compress@v1.20.3/zstd/internal/xxhash/LICENSE.txt;md5=802da049c92a99b4387d3f3d91b00fa9;spdx=MIT \
     file://pkg/mod/github.com/klauspost/cpuid/v2@v2.4.0/LICENSE;md5=00d6f962401947482d082858f7ba2ff3;spdx=MIT \
     file://pkg/mod/github.com/klauspost/pgzip@v1.2.6/GO_LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/koofr/go-httpclient@v0.0.0-20240520111329-e20f8f203988/LICENSE;md5=deb90a5b0cb13878aacdfd6572bc06d9;spdx=MIT \
     file://pkg/mod/github.com/koofr/go-koofrclient@v0.0.0-20221207135200-cbd7fc9ad6a6/LICENSE;md5=deb90a5b0cb13878aacdfd6572bc06d9;spdx=MIT \
     file://pkg/mod/github.com/kr/fs@v0.1.0/LICENSE;md5=591778525c869cdde0ab5a1bf283cd81;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/kylelemons/godebug@v1.1.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/lanrat/extsort@v1.4.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/leodido/go-urn@v1.4.0/LICENSE;md5=8f50db5538ec1148a9b3d14ed96c3418;spdx=MIT \
+    file://pkg/mod/github.com/lanrat/extsort@v1.5.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/leodido/go-urn@v1.5.0/LICENSE;md5=8f50db5538ec1148a9b3d14ed96c3418;spdx=MIT \
     file://pkg/mod/github.com/lpar/calendar@v0.2.0/LICENSE;md5=e52edf7e7ab720f605e5559f588f568c;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/lucasb-eyer/go-colorful@v1.4.0/LICENSE;md5=00a5466a69069b14448ded7ed1f3125f;spdx=MIT \
+    file://pkg/mod/github.com/lucasb-eyer/go-colorful@v1.4.1/LICENSE;md5=00a5466a69069b14448ded7ed1f3125f;spdx=MIT \
     file://pkg/mod/github.com/mailru/easyjson@v0.9.2/LICENSE;md5=819e81c2ec13e1bbc47dc5e90bb4d88b;spdx=MIT \
-    file://pkg/mod/github.com/mattn/go-colorable@v0.1.15/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
+    file://pkg/mod/github.com/mattn/go-colorable@v0.1.16/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
     file://pkg/mod/github.com/mattn/go-isatty@v0.0.23/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6;spdx=MIT \
-    file://pkg/mod/github.com/mattn/go-runewidth@v0.0.24/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
+    file://pkg/mod/github.com/mattn/go-runewidth@v0.0.31/LICENSE;md5=24ce168f90aec2456a73de1839037245;spdx=MIT \
     file://pkg/mod/github.com/mholt/archives@v0.1.5/LICENSE;md5=f8877224ca7a9c0bcc6cc552d818d0f7;spdx=MIT \
     file://pkg/mod/github.com/mikelolasagasti/xz@v1.0.1/LICENSE;md5=72c66b9ca7bb05f3e2296b4a3f2dd56b;spdx=0BSD \
     file://pkg/mod/github.com/minio/minlz@v1.2.0/LICENSE;md5=559ed6d517f29f7a76202348f1068d09;spdx=Apache-2.0 \
@@ -169,29 +164,28 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/munnerz/goautoneg@v0.0.0-20191010083416-a7dc8b61c822/LICENSE;md5=0c241922fc69330e2e5590de114f3bf5;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/ncw/swift/v2@v2.0.5/COPYING;md5=bed161b82a1ecab65ff7ba3c3b960439;spdx=MIT \
     file://pkg/mod/github.com/nwaples/rardecode/v2@v2.2.5/LICENSE;md5=00a9bc473bdc1f677bde54c760134fbe;spdx=BSD-2-Clause \
-    file://pkg/mod/github.com/oklog/ulid/v2@v2.1.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/oracle/oci-go-sdk/v65@v65.121.0/LICENSE.txt;md5=8653873de1e9aacad9580639298c0be8;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/oklog/ulid/v2@v2.1.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/oracle/oci-go-sdk/v65@v65.127.0/LICENSE.txt;md5=8653873de1e9aacad9580639298c0be8;spdx=Apache-2.0 \
     file://pkg/mod/github.com/panjf2000/ants/v2@v2.12.1/LICENSE;md5=6a4f7c52f1a52fc5da45e1529063dfe4;spdx=MIT \
     file://pkg/mod/github.com/patrickmn/go-cache@v2.1.0+incompatible/LICENSE;md5=ad59632c93a4b0296b360ba542decb5e;spdx=MIT \
     file://pkg/mod/github.com/pengsrc/go-shared@v0.2.1-0.20190131101655-1999055a4a14/LICENSE;md5=5d9119906713a6bff1bfa119605244ec;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/peterh/liner@v1.2.2/COPYING;md5=7316a33df6826d7cc2854e686cb9279f;spdx=MIT \
-    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.27/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/peterh/liner@v1.2.3/COPYING;md5=7316a33df6826d7cc2854e686cb9279f;spdx=MIT \
+    file://pkg/mod/github.com/pierrec/lz4/v4@v4.1.28/LICENSE;md5=09ece85f3c312a63b522bfc6ebd44943;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/pkg/browser@v0.0.0-20240102092130-5ac0b6a4141c/LICENSE;md5=2c6b03e6a9b13bd75b50a8dbeed074da;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/pkg/errors@v0.9.1/LICENSE;md5=6fe682a02df52c6653f33bd0f7126b5a;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/pkg/sftp@v1.13.11/LICENSE;md5=452fc5cc5a9127a0e828d73423d45035;spdx=BSD-2-Clause \
     file://pkg/mod/github.com/pkg/xattr@v0.4.12/LICENSE;md5=4efd8bdbab9cff00dcd75f2c3ee4e190;spdx=BSD-2-Clause \
-    file://pkg/mod/github.com/pmezard/go-difflib@v1.0.1-0.20181226105442-5d4384ee4fb2/LICENSE;md5=e9a2ebb8de779a07500ddecca806145e;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/pquerna/otp@v1.5.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/prometheus/client_golang@v1.23.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/prometheus/client_golang@v1.23.2/internal/github.com/golang/gddo/LICENSE;md5=4c728948788b1a02f33ae4e906546eef;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/prometheus/client_model@v0.6.2/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/prometheus/common@v0.70.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/github.com/prometheus/procfs@v0.21.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/prometheus/client_golang@v1.25.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/prometheus/client_golang@v1.25.0/internal/github.com/golang/gddo/LICENSE;md5=4c728948788b1a02f33ae4e906546eef;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/prometheus/client_model@v0.6.3/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/prometheus/common@v0.72.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
+    file://pkg/mod/github.com/prometheus/procfs@v0.22.0/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
     file://pkg/mod/github.com/putdotio/go-putio/putio@v0.0.0-20200123120452-16d982cac2b8/LICENSE;md5=843b68ce2d9f6f51c6bd8ba3835d5531;spdx=MIT \
     file://pkg/mod/github.com/rasky/go-xdr@v0.0.0-20170124162913-1a41d1a06c93/LICENSE;md5=b48d4a6f448d246b1fe4e0600e79d0bf;spdx=ISC \
     file://pkg/mod/github.com/rclone/!proton-!a!p!i-!bridge@v1.0.5/LICENSE;md5=065cf81dcdc1d304be9de4cc73f65b0d;spdx=MIT \
     file://pkg/mod/github.com/rclone/go-proton-api@v1.0.4/COPYING_NOTES.md;md5=7f616df7d323e03661a85766286d1781;spdx=MIT \
-    file://pkg/mod/github.com/rclone/gofakes3@v0.0.9/LICENSE;md5=b88274ccba75507dd63977b43dac8874;spdx=MIT \
+    file://pkg/mod/github.com/rclone/gofakes3@v0.0.12/LICENSE;md5=b88274ccba75507dd63977b43dac8874;spdx=MIT \
     file://pkg/mod/github.com/relvacode/iso8601@v1.7.0/LICENSE;md5=6c960305dc52f06752fe6d11bb000648;spdx=MIT \
     file://pkg/mod/github.com/rfjakob/eme@v1.2.0/LICENSE;md5=6fee026f0b48abb4d7cd72e25032503c;spdx=MIT \
     file://pkg/mod/github.com/rivo/uniseg@v0.4.7/LICENSE.txt;md5=4393c339bf180cf6e188b6ea32d8b93c;spdx=MIT \
@@ -199,8 +193,8 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/ryszard/goskiplist@v0.0.0-20150312221310-2dfbae5fcf46/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
     file://pkg/mod/github.com/sabhiram/go-gitignore@v0.0.0-20210923224102-525f6e181f06/LICENSE;md5=bc1bb35f6ed8f35d0af3848bd675d349;spdx=MIT \
     file://pkg/mod/github.com/samber/lo@v1.53.0/LICENSE;md5=1cce9fea1bd9690afd75f9941813586f;spdx=MIT \
-    file://pkg/mod/github.com/shirou/gopsutil/v4@v4.26.6/LICENSE;md5=ae6de3dee02712a1e55b280671be53bf;spdx=BSD-3-Clause \
-    file://pkg/mod/github.com/sirupsen/logrus@v1.9.4/LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0;spdx=MIT \
+    file://pkg/mod/github.com/shirou/gopsutil/v4@v4.26.9/LICENSE;md5=ae6de3dee02712a1e55b280671be53bf;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/sirupsen/logrus@v1.10.2/LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0;spdx=MIT \
     file://pkg/mod/github.com/skratchdot/open-golang@v0.0.0-20200116055534-eef842397966/LICENSE;md5=bda6b231b2cd2a50379525e90c9e5040;spdx=MIT \
     file://pkg/mod/github.com/sony/gobreaker/v2@v2.4.0/LICENSE;md5=bc9754edcba199de9bf88b85ff7d5d2c;spdx=MIT \
     file://pkg/mod/github.com/sorairolake/lzip-go@v0.3.8/LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
@@ -209,9 +203,10 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/spf13/cobra@v1.10.2/LICENSE.txt;md5=920d76114a32b0fb75b3f2718c5a91be;spdx=Apache-2.0 \
     file://pkg/mod/github.com/spf13/pflag@v1.0.10/LICENSE;md5=1e8b7dc8b906737639131047a590f21d;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/stangelandcl/ppmd@v0.1.1/LICENSE;md5=6c5d96735d0135b701102478cf086eb0;spdx=MIT \
-    file://pkg/mod/github.com/stretchr/testify@v1.11.1/LICENSE;md5=188f01994659f3c0d310612333d2a26f;spdx=MIT \
+    file://pkg/mod/github.com/stretchr/testify@v1.12.1/LICENSE;md5=188f01994659f3c0d310612333d2a26f;spdx=MIT \
+    file://pkg/mod/github.com/stretchr/testify@v1.12.1/internal/difflib/LICENSE;md5=37bee94299cc4febcbc4c52da854074d;spdx=BSD-3-Clause \
+    file://pkg/mod/github.com/stretchr/testify@v1.12.1/internal/spew/LICENSE;md5=c06795ed54b2a35ebeeb543cd3a73e56;spdx=ISC \
     file://pkg/mod/github.com/t3rm1n4l/go-mega@v0.0.0-20260717075258-c6acd6a5bd04/LICENSE;md5=297dcd2957399448294b4cfa17d4031f;spdx=MIT \
-    file://pkg/mod/github.com/tyler-smith/go-bip39@v1.1.0/LICENSE;md5=9380d72a13094f603bec718c10f56b4b;spdx=MIT \
     file://pkg/mod/github.com/ulikunitz/xz@v0.5.15/LICENSE;md5=3c82255323cf3d48815acdbf9068b715;spdx=BSD-3-Clause \
     file://pkg/mod/github.com/unknwon/goconfig@v1.0.0/LICENSE;md5=554f1a8b845d7b28c73f36b711b506be;spdx=Apache-2.0 \
     file://pkg/mod/github.com/willscott/go-nfs-client@v0.0.0-20251022144359-801f10d98886/LICENSE_BSD-2.txt;md5=862147293f339bce315b57b5953a1620;spdx=BSD-2-Clause \
@@ -225,42 +220,42 @@ LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/zeebo/xxh3@v1.1.0/LICENSE;md5=aaba05447288333a478938c7e45c0cb2;spdx=BSD-2-Clause \
     file://pkg/mod/go.etcd.io/bbolt@v1.5.0/LICENSE;md5=13b2a308eefa10d841e3bf2467dbe07a;spdx=MIT \
     file://pkg/mod/go.opentelemetry.io/auto/sdk@v1.2.1/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327;spdx=Apache-2.0 \
-    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp@v0.69.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
-    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.44.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
-    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.44.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
-    file://pkg/mod/go.opentelemetry.io/otel@v1.44.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp@v0.70.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
+    file://pkg/mod/go.opentelemetry.io/otel@v1.45.0/LICENSE;md5=24dad3abbe7a8f390afc8ab967bfefa7;spdx=Apache-2.0 \
     file://pkg/mod/go.yaml.in/yaml/v2@v2.4.4/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
-    file://pkg/mod/go.yaml.in/yaml/v3@v3.0.4/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c;spdx=Apache-2.0 \
+    file://pkg/mod/go.yaml.in/yaml/v3@v3.0.5/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c;spdx=Apache-2.0 \
     file://pkg/mod/go4.org@v0.0.0-20260112195520-a5071408f32f/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc;spdx=Apache-2.0 \
     file://pkg/mod/goftp.io/server/v2@v2.0.3/LICENSE;md5=f13b0a36d11207262f14b7acef69dc2c;spdx=MIT \
-    file://pkg/mod/golang.org/x/crypto@v0.56.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/exp@v0.0.0-20260709172345-9ea1abe57597/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/image@v0.45.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/net@v0.57.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/oauth2@v0.36.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sync@v0.22.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/sys@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/term@v0.45.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/text@v0.41.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/golang.org/x/time@v0.15.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
-    file://pkg/mod/google.golang.org/api@v0.279.0/LICENSE;md5=a651bb3d8b1c412632e28823bb432b40;spdx=BSD-3-Clause \
-    file://pkg/mod/google.golang.org/api@v0.279.0/internal/third_party/uritemplates/LICENSE;md5=4ee4feb2b545c2231749e5c54ace343e;spdx=BSD-3-Clause \
-    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-20260715232425-e75dac1f907d/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/google.golang.org/grpc@v1.84.0-dev.0.20260723093437-b6eac429d7b6/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
-    file://pkg/mod/google.golang.org/protobuf@v1.36.11/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/crypto@v0.58.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/exp@v0.0.0-20260813180055-c1d0aacb2297/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/image@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.62.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.37.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.24.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.49.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.47.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.43.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.16.0/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.304.0/LICENSE;md5=a651bb3d8b1c412632e28823bb432b40;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.304.0/internal/third_party/uritemplates/LICENSE;md5=4ee4feb2b545c2231749e5c54ace343e;spdx=BSD-3-Clause \
+    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-20261005182115-fad411399dd8/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/google.golang.org/grpc@v1.84.0/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57;spdx=Apache-2.0 \
+    file://pkg/mod/google.golang.org/protobuf@v1.36.12/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
     file://pkg/mod/gopkg.in/natefinch/lumberjack.v2@v2.2.1/LICENSE;md5=574cdb55b81249478f5af5f789e9e29f;spdx=MIT \
     file://pkg/mod/gopkg.in/validator.v2@v2.0.1/LICENSE;md5=6c4db32a2fa8717faffa1d4f10136f47;spdx=Apache-2.0 \
     file://pkg/mod/gopkg.in/yaml.v2@v2.4.0/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e;spdx=Apache-2.0 \
     file://pkg/mod/gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3c91c17266710e16afdbb2b6d15c761c;spdx=Apache-2.0 \
     file://pkg/mod/moul.io/http2curl/v2@v2.3.0/COPYRIGHT;md5=cd9599a564a6135dff208e43a4692cf4;spdx=MIT \
     file://pkg/mod/sigs.k8s.io/yaml@v1.6.0/LICENSE;md5=b5d30dd5bc47d1b56b678ac06dead1c7;spdx=MIT \
-    file://pkg/mod/storj.io/common@v0.0.0-20260629224719-ba1bff0a7846/LICENSE;md5=b418b8bf34c5c954ad8d78427714088c;spdx=MIT \
-    file://pkg/mod/storj.io/common@v0.0.0-20260629224719-ba1bff0a7846/base58/LICENSE;md5=7546df84e6da78f268b76fbaff6643a4;spdx=ISC \
-    file://pkg/mod/storj.io/common@v0.0.0-20260629224719-ba1bff0a7846/internal/hmacsha512/GO_LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
+    file://pkg/mod/storj.io/common@v0.0.0-20260818140313-d38275a3768b/LICENSE;md5=b418b8bf34c5c954ad8d78427714088c;spdx=MIT \
+    file://pkg/mod/storj.io/common@v0.0.0-20260818140313-d38275a3768b/base58/LICENSE;md5=7546df84e6da78f268b76fbaff6643a4;spdx=ISC \
+    file://pkg/mod/storj.io/common@v0.0.0-20260818140313-d38275a3768b/internal/hmacsha512/GO_LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
     file://pkg/mod/storj.io/drpc@v1.0.0/LICENSE;md5=b418b8bf34c5c954ad8d78427714088c;spdx=MIT \
     file://pkg/mod/storj.io/eventkit@v0.0.0-20260716074419-6861a92e2aa5/LICENSE;md5=2e448287a2cf31846927205ee5737298;spdx=MIT \
-    file://pkg/mod/storj.io/infectious@v0.0.2/LICENSE;md5=a6e9ba58e808402fa1cadfd609314d58;spdx=MIT \
+    file://pkg/mod/storj.io/infectious@v1.0.1/LICENSE;md5=a6e9ba58e808402fa1cadfd609314d58;spdx=MIT \
     file://pkg/mod/storj.io/picobuf@v0.0.4/LICENSE;md5=1e43191ed0cdbce85d6e8687d5ce0c11;spdx=MIT \
     file://pkg/mod/storj.io/picobuf@v0.0.4/internal/protowire/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956;spdx=BSD-3-Clause \
-    file://pkg/mod/storj.io/uplink@v1.14.3/LICENSE;md5=b418b8bf34c5c954ad8d78427714088c;spdx=MIT \
+    file://pkg/mod/storj.io/uplink@v1.14.5/LICENSE;md5=b418b8bf34c5c954ad8d78427714088c;spdx=MIT \
 "
diff --git a/meta-oe/recipes-support/rclone/rclone_1.75.1.bb b/meta-oe/recipes-support/rclone/rclone_1.76.0.bb
similarity index 92%
rename from meta-oe/recipes-support/rclone/rclone_1.75.1.bb
rename to meta-oe/recipes-support/rclone/rclone_1.76.0.bb
index ccf774359a..9a3a319613 100644
--- a/meta-oe/recipes-support/rclone/rclone_1.75.1.bb
+++ b/meta-oe/recipes-support/rclone/rclone_1.76.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/COPYING;md5=bed161b82a1ecab65ff7ba3c3b960439"
 
 SRC_URI = "git://${GO_IMPORT};protocol=https;nobranch=1;tag=v${PV};destsuffix=${GO_SRCURI_DESTSUFFIX}"
-SRCREV = "687d264b689b8c49a67e2e52a8a5e0caa01c04ce"
+SRCREV = "e982ff36668f5130d94b4f70409babb3d964df42"
 
 require ${BPN}-licenses.inc
 require ${BPN}-go-mods.inc
