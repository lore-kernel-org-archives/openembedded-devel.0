Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4aAZ-0008Gb-Jn
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 14:36:15 +0200
Received: by ewy20 with SMTP id 20so1481037ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=WtUVtDWtcK28nVQBZsYLa9HmZawGGd5dLNuW2unTizM=;
	b=L5ysUfc6h/F1X7M6Xtz5IqORA0L+F5PgDUKZQc4+biJshFxyChsll6jH+rnDfNitF7
	3jHrQDIoXT74iyJwmdDUY3eFiOupwbqRMOi7rjAcxgA3larLm0+Nbq+yw201j2VfwSm3
	3aLWC9vgASeq5KXZLrZHdM2P/nnEcaXF9psqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=o41vHgUt7ZAHroe9nOtgZa0OWF6Q5U0KaOKkdmvYJjXuLb19nI547Upyp/gwKUeFwO
	MnABTpkn4djE90phgKLwu6uQMGVHK+pKRepEH2OqyewGRB0DyqlzHA3VAKivQEvF/wvo
	7mw+sU3eDeqcnoL0EX8uNPEgZs7FMObkYxgrs=
Received: by 10.210.127.13 with SMTP id z13mr3685167ebc.83.1242304163287;
	Thu, 14 May 2009 05:29:23 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 24sm1900047eyx.43.2009.05.14.05.29.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 May 2009 05:29:21 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 May 2009 14:29:18 +0200
Message-Id: <1242304158-21337-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] checksums.ini: sync with .dev
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
X-List-Received-Date: Thu, 14 May 2009 12:36:15 -0000

From: Koen Kooi <koen@openembedded.org>

---
 conf/checksums.ini |  272 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 272 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 395dcd9..e42c704 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -58,6 +58,10 @@ sha256=7a960180e7873b1bdb522e76b0423b5c2c1b8efe1d30d7ca80c41eb97d822b2d
 md5=24b0e5bbfe21ea9c5a5c589bcc79c0f2
 sha256=ab877846c6caaff32efbf5be6fc5c63b7dec97a2e78c57c525da7705d2052bfc
 
+[ftp://download.dre.vanderbilt.edu/previous_versions/ACE-5.6.8.tar.bz2]
+md5=81c1ff761c3431cd12c81337aa80d558
+sha256=96b70582d931a7e83c3ca31b3bc7e23957391e16dee4ae6ddf938c9574d50b27
+
 [http://www.amd.com/files/connectivitysolutions/geode/geode_lx/AES_Linux_LX_02.01.0100.tar.gz]
 md5=12cb241a9037fffe31ba7c68a48ed614
 sha256=a6068b4aa0e2330eed6e4741bad3191dc9ca7d7326f7bfab578ac55e2b8b91a2
@@ -178,6 +182,10 @@ sha256=fe044ec9817a31f2b76f701b2cfd980809676943a901ba3d49200162807fa1f9
 md5=82c698151f934eb28c65d1838cee7d9e
 sha256=d392567cb39b4ea606c0e0acafd8ed72320311b995336ece5fcefcf9b150e9d7
 
+[http://hal.freedesktop.org/releases/DeviceKit-003.tar.gz]
+md5=8b311547f4a2c8c6b6598e3318d66cd7
+sha256=d2d21f995d1a152ca2d8beea6d37f31e48cca034b82ceb7322f39422e849e9cf
+
 [http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-2.11.tar.gz]
 md5=2449bfe21d6589c96eebf94dae24df6b
 sha256=3cebe0a6894daee3bfa5d9619fc90e7619cb6a77ac1b04d027341cd6033ae989
@@ -1682,6 +1690,10 @@ sha256=d5b93fb8dbfa73e4a542bb8ad7d61c8b48dcf79948da26da9e9ef3b1a49c4221
 md5=c6b1aa28bfecdd0c693a2afc43d7679e
 sha256=d5b93fb8dbfa73e4a542bb8ad7d61c8b48dcf79948da26da9e9ef3b1a49c4221
 
+[http://www.auto.tuwien.ac.at/~mkoegler/eib/argp-standalone-1.3.tar.gz]
+md5=8a336796eeb2a765b76f68e3312adaab
+sha256=8b9067e77812c67c1e1b96ab9d92ab9af3a97e991d3c385b6e241d97f0e3cd28
+
 [http://downloads.sourceforge.net/argtable/argtable2-7.tar.gz]
 md5=a84130293aab3bc09631cbee717ede93
 sha256=f7bd2786309b6a7ce9c1e2b3fbdd75419ef0bcabfaa4444362bbe40897959f45
@@ -2374,6 +2386,10 @@ sha256=68039d59a38379d7b65ea3fc72276c43ba234776460e14361af35771bcaab295
 md5=437a39c6008ea6987af1bbaf2252e7b9
 sha256=a2e482900eb45154653a692565d81ddeb4b59cd438628c1b14beb822499afef7
 
+[http://www.auto.tuwien.ac.at/~mkoegler/eib/bcusdk_0.0.4.tar.gz]
+md5=14138f457d6530bf45cf6a966fde9d5f
+sha256=4d5cec9ae2d45e17ef2f566cb84f6895ae49255c86aacebc5af40839f1b5c0e9
+
 [http://xorg.freedesktop.org/releases/individual/app/bdftopcf-1.0.0.tar.bz2]
 md5=41f4ac6760ef5e671ba8d4baa7236f12
 sha256=8c01b85eab01f35ed6bc9d597d4c6c76cf9ddbe2596d9120d66e66135df1f9a1
@@ -2582,6 +2598,10 @@ sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7
 md5=09a8c5821a2dfdbb20665bc0bd680791
 sha256=3e8225b4d7ace0a2039de752e11fd6922d3b89a7259a292c347391c4788739f6
 
+[http://kernel.org/pub/linux/devel/binutils/binutils-2.19.51.0.3.tar.bz2]
+md5=c55a2b1eadf818d38e963060412fadca
+sha256=11a53d332d2295f447ab49402a34d82875bbf5da8dc239ebb909eafdf3c26a36
+
 [ftp://ftp.gnu.org/gnu/binutils/binutils-2.19.tar.bz2]
 md5=17a52219dee5a76c1a9d9b0bfd337d66
 sha256=bd2ea10ffc2bf62a917b05f4fbe3d02212589c2bc177fa0c51a9c874d3da528a
@@ -2718,6 +2738,14 @@ sha256=1c46b6e219aec9bbd3286e9366de7e6dd05f68ed33b7487fbd211397c890fc40
 md5=5919d6383cd9446f8b90fdca748dc961
 sha256=e5e592de95f50a1569d3e4a95c8b955a2535e265e24869e3ce30e19b0949b465
 
+[http://www.kernel.org/pub/linux/bluetooth/bluez-4.37.tar.gz]
+md5=c1106f56f8e5562cf7c49d3455d2c5f7
+sha256=2bfc5db7703cbcaaa4be2576609136450e1dac5d4782707dd0dc81754e3c2489
+
+[http://www.kernel.org/pub/linux/bluetooth/bluez-4.39.tar.gz]
+md5=ba06291b737077332e914d6d653501c6
+sha256=924dc4b8ae78da2c8f3af9c36ab85d08ee7f8ec0ae4dfe58840ae70041580063
+
 [http://www.kernel.org/pub/linux/bluetooth/bluez-4.7.tar.gz]
 md5=2aa806940d2c841e57a9b2ab7302b750
 sha256=ed384dea4f5f21157758fcd7db64db19ce0b410509c26630706e4a3c779287a0
@@ -2734,6 +2762,10 @@ sha256=e03a131c26f1f1c51b8cadb4e68db8a3d0f64c43b4aefc706b07129336ebe5c2
 md5=54334e3d7af70846eb4916191e46081c
 sha256=056ec158ea09b6be8b9ea07f37d8b58f6dec28da6dcb33f789ce9b3f932eb7cd
 
+[http://www.kernel.org/pub/linux/bluetooth/bluez-gnome-1.8.tar.gz]
+md5=7f34a08e36aa77d4476d0919c52b59b6
+sha256=481b48f3cde1f896650195b75c25994df11eca05bb6e8d1951a46b603228811a
+
 [http://bluez.sourceforge.net/download/bluez-hcidump-1.26.tar.gz]
 md5=6eca8534fd6f0384d29f04198363f19c
 sha256=cd016375e9082268af224b26891cbea162fac5cf83a984f3e3988e6cee380a56
@@ -3010,6 +3042,10 @@ sha256=c93b9fab6b12a80bcf69114aab66d1d298455e9269c44f9e5f6430c142f9e349
 md5=1e6cff57ac90d7ab984d9512fdd9f2dd
 sha256=c93b9fab6b12a80bcf69114aab66d1d298455e9269c44f9e5f6430c142f9e349
 
+[http://downloads.sourceforge.net/bridge/bridge-utils-1.4.tar.gz]
+md5=0182fcac3a2b307113bbec34e5f1c673
+sha256=876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd5933
+
 [http://www.ludd.luth.se/~torger/files/brutefir-1.0i.tar.gz]
 md5=33fcf84a41d38f5aac24c57a66a2c3ee
 sha256=e0f3988afb0a84a89f38153fd5617615e9bcf32bb747ee981c99c44d3c4236f6
@@ -3538,6 +3574,10 @@ sha256=f98edecae40473c142fe49a0e02f5ff7fb28d778c4bd510dad747d208d20cb00
 md5=60152bf1e24b3fbdf0473794199e5215
 sha256=f98edecae40473c142fe49a0e02f5ff7fb28d778c4bd510dad747d208d20cb00
 
+[http://downloads.sourceforge.net/clamav/clamav-0.94.2.tar.gz]
+md5=1181e6d62341b84708f126cc353f7ebf
+sha256=1aec7fecff375958d067aceeb9782d3ff0be7c13bed0eecf6240fb089f8d268c
+
 [http://memberwebs.com/nielsen/software/clamsmtp/clamsmtp-1.8.tar.gz]
 md5=04da6aab94934641fcf9e7a7598346fb
 sha256=c09b24c82f858845e235df4c8b2639240a7b786de66b595e351be86ab60663a5
@@ -3682,6 +3722,10 @@ sha256=4999d3054a04e6cf4847a72316e32e9e98e6152b1fd72adc87d15e305f990f27
 md5=5ba47a94ce276f326abca1fd72a7e7c6
 sha256=3c3af80526a32bc2afed616e8f486b847144f2fa3a8e441908bd39c38b146450
 
+[http://www.cmake.org/files/v2.6/cmake-2.6.4.tar.gz]
+md5=50f387d0436696c4a68b5512a72c9cde
+sha256=9cdd2152e37b05d0d40d334a1bb2dfc0250021797360f971c6ea3d457ac9fdf2
+
 [http://install.tarball.in.source.dir/codec_engine_2_10_01.tar.gz]
 md5=32b0df93b285ee094e053552d9301cb6
 sha256=eb9f4b4b5973f444d16920201dfea217fb30542fea23107cf80a1f189408b321
@@ -3694,6 +3738,10 @@ sha256=d391829686eb002ace3ffbfed75c35e877b42c1884c9359791634b5b57126797
 md5=d8f3bbfbcc337d9776991d9561f451f3
 sha256=773ce12045ce98c3be4b1845547435f1b7798996fa3170dea72c7c15aa5ca79d
 
+[http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz]
+md5=581f548714a53d818ac355a1e4aacfa4
+sha256=32c96ec23642d827bcbc865ac490fe7f2eeec2e04448980c4eb70d0fb25f74d8
+
 [http://www.informatik.hu-berlin.de/~tkunze/zaurus/patches/collie-kexec-r1.patch]
 md5=ed96c1bddce4b7e40a40bad1d3cd63b5
 sha256=c178b3a7460cfaeb58c11ef9641d72ee912818b2ecbf1c09edf628d9168c0971
@@ -3858,6 +3906,10 @@ sha256=79e7d8948e11b94ced41f030c495706baca4bd9dafdfe730cf537fd0907ed3ef
 md5=c7d5cbcdaaf98f194c2a59b26436ce34
 sha256=73f3b92c0f85ab2bf0f9bb18f928a8b84cacdbb459f3a530df540d4ddf134405
 
+[http://www.kernel.org/pub/linux/network/connman/connman-0.16.tar.gz]
+md5=7bc5c89870d47c88f407fcfd666c739d
+sha256=102bb7a5d329dd6831bc8a923fa0b5d7634efa215e3d15377630d9b738df49da
+
 [ftp://ftp.moblin.org/connman/releases/connman-0.2.tar.gz]
 md5=bf48aa07d3c1e5fe272c7f139bc01fc9
 sha256=eacc3c57cffb411b09d834d2225323cde5676165b5d2fc2a27b16cde98e3ba97
@@ -3962,6 +4014,10 @@ sha256=efa27532ec6dc12a21f703ad4a0f612e613e9cc2575147685db81cc701952ac9
 md5=cbb2b3d1718ee1237b808e00b5c11b1e
 sha256=813cb19fa19a885f342664109c7c5810f0081b624ff317bba8d1b6ccd83c2a05
 
+[ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz]
+md5=427c2914d3eab956f317c9ec6a45e62a
+sha256=dd77bfec92e5a3ad48abd8a5bda3f8d40149c4e24744e4173abc3cc6a731fdb2
+
 [http://www.rpsys.net/openzaurus/patches/archive/corgi_rearrange_lcd-r0.patch]
 md5=c1bec44c92f5da5abad97137c73b1365
 sha256=d4dc8f0583e616e74ea41b103d5f6a29b6d079ce37eaf9f362825514c7082490
@@ -4358,6 +4414,10 @@ sha256=e870d8cd619834eda066e37fe69b441d629f9ad3a871ef2854fbbcd753b3abe2
 md5=d3b716a7e798faa1c6a867675f00306a
 sha256=8bc083faaf3efdd444a8a44bbcbfea501a7b547736fda3c2d83bfdc9b5b672a3
 
+[http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.78.tar.gz]
+md5=d4aa04b9df35b4bd663be38e959941c8
+sha256=ca366fed6035f75c6ca038f99b780260a0e19f282067b2dd20243ba54105fc21
+
 [http://dbus.freedesktop.org/releases/dbus-java/dbus-java-2.3.tar.gz]
 md5=eeec2c3ae0a857c75fd3ac96e0612921
 sha256=6ca8464a04d08232968d1ffca3d3f777f55dc39326040c487f50f52d4272e820
@@ -4598,6 +4658,10 @@ sha256=902da1b1e9d90dfda8aa1864846db8ad12386e7521fc9f8b18c8ba220dd0123a
 md5=7b81b22baa2df55efe4845865dddc7b6
 sha256=7bb43d8b0cb287d728ea479fb65d1b57b8530af773018214e7f312dceed34237
 
+[ftp://invisible-island.net/dialog/dialog-1.1-20080819.tgz]
+md5=3caebd641a9f337b980becb4444336c5
+sha256=c5d49b39c5998bcecd124c05cc6f096d22ccdc378ad455214611ae41a2f4b7d9
+
 [ftp://ftp.us.debian.org/debian/pool/main/d/dialog/dialog_1.0-20050306.orig.tar.gz]
 md5=8ce5945be0660bd3152bd9eb0827f945
 sha256=e3968765ed916b348fce5e309029d25d068a61e1d422a69a506d0fc80ee6e976
@@ -5198,6 +5262,10 @@ sha256=fefd63c13ca28713f7f03320c1e341430ea2d016d3ab3e49163a12f4df2123e7
 md5=ec8690ff84b364d2df5b2443a01ba529
 sha256=e0360be0eecee68649246c022825dd5422f895958ffa736886dd2a0b9ec7ebda
 
+[http://ftp.gnome.org/pub/GNOME/sources/ekiga/3.2/ekiga-3.2.0.tar.bz2]
+md5=01c4c944a1b900b5b3bfa95d3a820b22
+sha256=998b50e3920546cb43cd281d519394a2db23f5bf10223cac49120296407b3c6d
+
 [http://effbot.org/media/downloads/elementtree-1.2.7-20070827-preview.zip]
 md5=30e2fe5edd143f347e03a8baf5d60f8a
 sha256=5071431068c58c1f56dcc8fff37f8a213351f3b45c012d3adb640ec9418053ad
@@ -5266,6 +5334,10 @@ sha256=ad2c7ca228cdc79405c3853e7fdbfd5c239a6e9ad9a1a237e7e1b0c0b10f3ad4
 md5=89e6dc430ad198c8044f261645d8bc6c
 sha256=5e73cfe9bbe862391386b4d60776a22fc765c48fe9f2bfad17ebd691571da2b9
 
+[http://ftp.gnome.org/pub/GNOME/sources/empathy/2.26/empathy-2.26.1.tar.bz2]
+md5=1edc492c0fd339dc30f0a443adad5fbe
+sha256=bb3b3663b11e3e573a13dd1b51d8a5b02797a43c53a64efc529f6604f40503c7
+
 [http://download.berlios.de/emul/emul-1.0.5.tar.gz]
 md5=f713b4d3c6a733b429de2673e4427483
 sha256=b91c7fb6420f6787d34b88b1e0d2e705e1006b5bce17235356f84a3c14329612
@@ -5754,6 +5826,10 @@ sha256=1e0aa136693a3e9f4b43ebd71e7bd934cea31817a4a6cba2edc7aac353b8a93f
 md5=2aaf871471a9ec037763c5dc7c193c57
 sha256=6b9785167934948a582839f9723e37214cab1607a9764c35f10d555f8e662575
 
+[http://farsight.freedesktop.org/releases/farsight2/farsight2-0.0.9.tar.gz]
+md5=f2d4fad95009bc7eae29f97c6f560dcd
+sha256=84553ff12c5245705806107448e85c96950b4b7a5eaf85461c89987be8ea644d
+
 [http://download.savannah.nongnu.org/releases/fastjar/fastjar-0.95.tar.gz]
 md5=92a70f9e56223b653bce0f58f90cf950
 sha256=ca03811490c965abc9f466e75418ae48bb71f14d8e8ed4c43e8109207b85ce54
@@ -5818,6 +5894,10 @@ sha256=517fa062d7b2d367f931a1c6ebb2bef84907077f0ce3f0c899e34490bbea9338
 md5=e97c609af171cceb85d08f366406374a
 sha256=112ba595859ad6e42f5ad522ada27a08da7702e3ea8c84df48ae1c5d6177ae8e
 
+[http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz]
+md5=3e466375b930ec22be44f1041e77b55d
+sha256=9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c
+
 [http://sdgsystems.com/download/fbvncserver-0.9.4.tar.gz]
 md5=01a37f17857641253541307f59dd8cc5
 sha256=e22ed10ecba059904649f344be260512fdb3cbecbd95ca965f8b5cc3ea1785b5
@@ -5974,6 +6054,10 @@ sha256=5382518ad10313c4c22fbfd2bf5cbf1a6e88160e7e29ab5dcd07362147d04c8d
 md5=c315e06cdfe9ee76aa4831ece1ed5df3
 sha256=402ca3641f1724f5a4ec1ac3e283cd1334bd85c4b5de7744bd267454ef31259e
 
+[http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/3.5b4-candidates/build1/source/firefox-3.5b4-source.tar.bz2]
+md5=ff6bf463300cb56bcf750973b2af3d80
+sha256=b653f2fa8dfdd0a54a6b8c576769719cf9014ca6b09f8e9d351721a51766d95d
+
 [http://handhelds.org/~zecke/oe_packages/fish_V1.1.0.tar.gz]
 md5=78770f1abce09fbbaa0a46ce8ccc607f
 sha256=9d13db38c065d70f48ce70580c7d8cd940d923192c04bc3cb356cc98879b5788
@@ -6030,6 +6114,10 @@ sha256=701353279a17655d78e3b3678ad78d0375f5bf45877ad8b3507d589c42427f26
 md5=e7737236f1eccadd4cf8cfcc0c82e005
 sha256=ca7653a03f562057098c9fb956de34021a14017c2a44eedd3ab0963dc877e7e5
 
+[http://download.dajobe.org/flickcurl/flickcurl-1.9.tar.gz]
+md5=d701fcc8d764e634ee979f18ff9db322
+sha256=573ae52509289ed366a161facf390aa6ce530da143c760ca546868c8b0a0d034
+
 [http://www.speech.cs.cmu.edu/flite/packed/flite-1.2/flite-1.2-release.tar.bz2]
 md5=24c1576f5b3eb23ecedf4bebde96710f
 sha256=10ff42ce08a628c7fd84d26b5228d549e9eecb1eb03cb158e87d8be66bc58ae2
@@ -6058,6 +6146,10 @@ sha256=855a97e35da823f205253b865758715872cd2c7720e4dcf134a3b6dc18bfb96a
 md5=e146fd264e1001b1313acfd41ef75552
 sha256=facba5a97a20ca92b32504174474775c6b12fb67a6f646fa0de18db709c3edde
 
+[http://ftp.easysw.com/pub/fltk/snapshots/fltk-2.0.x-r6671.tar.bz2]
+md5=6bcef5fd51eb3bc4dd0702f3ae6da6ba
+sha256=4c9a67f0d32c05af92bf95d5feec8eb4a8d56bfbfe2cd4364b32009cfd609b54
+
 [http://members.cheese.at/woody/fltk-chess/fltk-chess-0.5.tgz]
 md5=ee34788a2dc9fdc088a6dc66c31eba34
 sha256=c789b355d0ba03b018513c3904bba6d6fab01b3a83a460fbe1b20a79052f46a4
@@ -7038,6 +7130,10 @@ sha256=309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
 md5=cc3c5565fdb9ab87a05ddb106ba0bd1f
 sha256=309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
 
+[ftp://ftp.gnu.org/gnu/gcc/gcc-4.4.0/gcc-4.4.0.tar.bz2]
+md5=cf5d787bee57f38168b74d65a7c0e6fd
+sha256=c5fe6f4c62ee7288765c3800ec9d21ad936bdcb5a04374cc09bd5a4232b836c9
+
 [http://downloads.sourceforge.net/mingw/gcc-ada-3.4.5-20060117-2-src.tar.gz]
 md5=30154205636c12c6abcc462ce07550cf
 sha256=404358fe19326679f602de6f7d6a2db180e27af83813150f58ab28eec197b646
@@ -7130,6 +7226,10 @@ sha256=719f2bbd79d55cdd6f5e31b49cec49df71ddb32a4439dba678de0e09330096da
 md5=18be4e7a1ac713bda93d00fee20bbef8
 sha256=c119ce82f0e42d3412420c42c1ead75e0b9de67131a5c9dd3cdab509f65ddfdd
 
+[http://avr32linux.org/twiki/pub/Main/GDBPatches/gdb-6.7.1.atmel.1.0.3.tar.bz2]
+md5=8a5cf43042a84ec0da0aca301bd1dae4
+sha256=2c8bbd8cc3323899e698fad071cc0e4e8880c178deaa849073ca4a2c9bc176f2
+
 [ftp://ftp.gnu.org/gnu/gdb/gdb-6.7.1.tar.gz]
 md5=7a74dcafdd39d18678e5b5cc2c50bb0c
 sha256=66e6ff871a7ed71ea433b8341ffebbe48590119e43a42953d392f5ce517c95e4
@@ -7646,6 +7746,10 @@ sha256=3ded3a3c3ba2cf02d72479a5cc0829c7c261a9d0934e49a79233de9fa276ec22
 md5=065c5952b439deba40083ccd67bcc8f7
 sha256=4224a522ac4ee0fd89eb337e7505e280dfb05e2fe1ad44339ba8874081c0451a
 
+[ftp://ftp.gnu.org/pub/gnu/glibc/glibc-2.9.tar.bz2]
+md5=fc62e989cf31d015f31628609fc3757a
+sha256=098baa84c74af5b21d27ec6e8ba6f1a393de88327cefbcd9e90c9b4edda9a36c
+
 [http://www.kegel.com/crosstool/crosstool-0.43/patches/glibc-2.3.6/glibc-fp-byteorder.patch]
 md5=c89aac92d100761a767b9d5619fe582f
 sha256=3033d84fd9a62d20a8cb0d42645d7cd5a28d2d108afcb4cc2d89db3dc1e328df
@@ -7666,6 +7770,10 @@ sha256=67c98ca1299f5f25eaece256d033e0e63bcf6876b920ca62a1fe61ac62c5c451
 md5=226809992fb1f3dc6ea23e0f26952ea4
 sha256=07de78810a5320d696792b67131c4cf3d6654aee015a6b74820d66fb00799000
 
+[ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-2.9.tar.bz2]
+md5=99536b508af988e7cc6275944d12b491
+sha256=27ac255ee701036191118f7a6a4191b24741f5909dccfc9eec4ab611a39e182f
+
 [ftp://ftp.gnu.org/gnu/glibc/glibc-linuxthreads-2.2.5.tar.gz]
 md5=c766a79a51668d7fa33f175a249655b4
 sha256=c027824ee6593a838e0883bdd4bf8bd455b3dcf4ff0aa77fe82452819d882f47
@@ -7882,6 +7990,10 @@ sha256=9605f7aee1b8d58cac10dd514c2bdfa340089d85b149db828816d18ac3ebaff8
 md5=4a7c977086af47fe43ea08b29ab93503
 sha256=939c8a8f819b8c39e4e355a764b2a47c6959d57029c5134a51a282d7cccd60c5
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-bluetooth/2.27/gnome-bluetooth-2.27.4.tar.bz2]
+md5=e34180aa90d5d718b819572b21b76d08
+sha256=250fede462d5ec0576c0ab9c7f965fb56dc5de6e1180405da8cf0e867a2eca3a
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-common/2.18/gnome-common-2.18.0.tar.bz2]
 md5=567172e685fc0783b1d6ab9843a85d6a
 sha256=ba28c1017e7e4212db16ada3f44cb446b6637c9c4fe16c0e2c2a51c94c46bc5b
@@ -8014,6 +8126,10 @@ sha256=3c9eb7f45dd0026340635b9e1ee18c36a47541610aa5a7ef604ca645aa4763f9
 md5=0395fcf79b990465030a2795dcddacb9
 sha256=7acda11db2eb07b2f68a1a506203fe95141954acb10c394850418fd04ed80a07
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-media/2.26/gnome-media-2.26.0.tar.bz2]
+md5=3d519bc7d812aed8f6e4288b6d3cdf26
+sha256=39e7646d0790e05a010da1eb2d7552dcb5311abd72f001477c9c465d7146b9f7
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-menus/2.10/gnome-menus-2.10.2.tar.bz2]
 md5=97b0ad03ea219cc8f5c02585db1d237e
 sha256=0968a399590d94cf9e1640b647cc10f972a3a802cbd9602c0839f56fd2864193
@@ -8198,6 +8314,10 @@ sha256=77cb4bd39a4cec2aa3d61b0519134f9e4a65613960b3b3ee34dd2452d5e12ba7
 md5=ce1171f19a40256cfdd31f42c979d91c
 sha256=77cb4bd39a4cec2aa3d61b0519134f9e4a65613960b3b3ee34dd2452d5e12ba7
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnote/0.1/gnote-0.1.2.tar.bz2]
+md5=905a8df3513a519096bcf7d8efc35118
+sha256=f08d0f214db875eac602bec37b20042f0ee4f14427f9559477a040ef39003538
+
 [ftp://ftp.gnu.org/gnu/ghostscript/gnu-ghostscript-8.16.tar.gz]
 md5=c42dfaebc37fe81eab0b5676b124ab63
 sha256=417922d35e66ee90cf93cf3e93fdf281ec6b92de4f7436c9c1a97c0cc35b94a8
@@ -8374,6 +8494,10 @@ sha256=8895c046511d06c47dcc8d8608cb220e0b608cede1ea169174ab3bc451d111c5
 md5=74ca3a6e37c9d9ae9fe2c50fc6d8350f
 sha256=63490b00244b0e6d7b54205e0d27ab22784ad0b328c7fa3e56aa0133677884fe
 
+[http://gpe.linuxtogo.org/download/source/gpe-announce-0.14.tar.gz]
+md5=4ec782fb49dd0e5549817d9e8601f9fc
+sha256=447c23943d4c004ceb25c7079058f79e270915cf6650e31c92498865dbed22a6
+
 [http://gpephone.linuxtogo.org/download/gpephone/gpe-applauncher-0.10/gpe-applauncher-0.10.tar.bz2]
 md5=466f9316024ed82ee1921b56376f04ce
 sha256=916ef522cbd2af8cc9623c2e4a34a8d1e45f9852bbb63a40ac056ba2c773eada
@@ -8518,6 +8642,10 @@ sha256=2d40ea6851c2b90261b88941dc7a8ee83c4a333e7a2acdd4eb0afbc87b5e5da1
 md5=75e087fcf8345cf1bfde7e172844e949
 sha256=0070e1c622f3f0cf9c40556f551de3e6059c7f8b3070516c0e4173dd09f57759
 
+[http://gpe.linuxtogo.org/download/source/gpe-clock-0.27.tar.gz]
+md5=93fcd53df14e2005edbadeb128d0a274
+sha256=c4c8a6d759e06ce9fd339ccd75479c8b62c9da434c4bb1246832419e5068e1df
+
 [http://gpe.linuxtogo.org/download/source/gpe-conf-0.2.3.tar.bz2]
 md5=beec965857c6fb5f55dd2a322cae7e37
 sha256=75bfe61f49bad95ff4220581c04af4fa3617cb639d98141d833e6aef68b77468
@@ -8758,6 +8886,10 @@ sha256=980320814b23cc51303436afb110397b15b950896f7f229484005f81d5cb6346
 md5=41b1ef201e4583e55a7462f1404de70d
 sha256=f8eb8f0c3af15acd5ad8c17fcc6d1ed2a43c35877d68a403eeb5bc1a1f0b3ccf
 
+[http://gpe.linuxtogo.org/download/source/gpe-mixer-0.50.tar.bz2]
+md5=67765a32def3ee408e84b9814b4e9759
+sha256=e7a13c0fd3eb0768034008778cb724aed8fbdf63d460d4df7212c3d2c14325b9
+
 [http://gpe.linuxtogo.org/download/source/gpe-nmf-0.17.tar.gz]
 md5=3fd22f7d95f9e1f328d768dedf7313a5
 sha256=6c11e7af568bf13602dec79cba5aacea590a2ec585f96dc96f87fa8950ffc31d
@@ -10002,6 +10134,10 @@ sha256=bbe44edc3d519028761a22b282b912ab8f43db2003c6791c295c4a52f5db48bf
 md5=31d1f505afe3ba1b351e18612aa57a70
 sha256=bbe44edc3d519028761a22b282b912ab8f43db2003c6791c295c4a52f5db48bf
 
+[http://downloads.sourceforge.net/haserl/haserl-0.9.25.tar.gz]
+md5=906c634a2af4ac3a4b656ef4e244c4cd
+sha256=d33ba27082c8bc4427ccebd8a56cf9aef190391f0361398197efb03210910f0e
+
 [http://www.server-side.de/download/havp-0.82.tar.gz]
 md5=9e6a16b7d074782d1c62f1f7316e56ab
 sha256=e2db8d3383cd8eca6a18ebee85875de895f3ac7414eab091a87f052d79a87b09
@@ -10910,6 +11046,10 @@ sha256=004f8358f4f84d90a260a76ac46ce8512126ac490d73460fcee6c11effd34362
 md5=b5493f7a2997130a4f86c486c9993b86
 sha256=25d45acf19e3acd09745df47581ac7a13e3694ee51fe4e642108f9f228cacca9
 
+[http://ftp.de.debian.org/debian/pool/main/i/iputils/iputils_20071127.orig.tar.gz]
+md5=a1d0aca33da380d6045c5c0e5002c09d
+sha256=9e4ab143828fefb3b67ce2bc3ad63a91cacc45d97161822915778683fb80343b
+
 [http://ipython.scipy.org/dist/ipython-0.9.1.tar.gz]
 md5=8a1bd1a9be272f4ddf4de99e5c1ad0dc
 sha256=5540bc1a01f11ca66c3d7c31a43af670fd0f0044b8e38d142614872956548006
@@ -12310,6 +12450,10 @@ sha256=97f63ed9c2d685a25306bd5ffa4bdf0a5e296c9ad28fd7210e6e53f75cf6dcc4
 md5=2623370bfcecaeecaeb85e5ec445f340
 sha256=b0e3cb59e605412a52352cf9cf36344b165463d4e65916c95deb73fc51838272
 
+[http://0pointer.de/lennart/projects/libcanberra/libcanberra-0.12.tar.gz]
+md5=01a1952e861defa6de9d193558f2a732
+sha256=04a70135de89ec7971a7ffa6516cf7699329cc01056595d524a6250a9d049709
+
 [http://kernel.org//pub/linux/libs/security/linux-privs/kernel-2.4/libcap-1.10.tar.bz2]
 md5=4426a413128142cab89eb2e6f13d8571
 sha256=66c3f033fdc8f9ba0bd9d0ae2d1f2c11f9fa51bf0d1418e5cb75e29e6577a5bc
@@ -13490,6 +13634,10 @@ sha256=9cd2317dac67fd2161565a21c7b3f9f43b6b6cd93441233226310478ffd4bf50
 md5=9233cb77876eb642374a0d2bcaba1170
 sha256=c2ae0a07d863536261b8a0562f3f77aa224fa1f413d85d824a765d00e37c5de4
 
+[http://nice.freedesktop.org/releases/libnice-0.0.6.tar.gz]
+md5=055e3eedf735ee1257fd4bb9ce86d04e
+sha256=adf3612367456328609c65ecc39c9bb08c0fef84cebbd1a3b5fcfe5e9614ac82
+
 [http://downloads.sourceforge.net/libnids/libnids-1.18.tar.gz]
 md5=9ee6dcdfac97bae6fe611aa27d2594a5
 sha256=b0275c914197a53c6ccf631eac756fd37ec6f2d8f09f15757061495cf9be0fcd
@@ -14510,6 +14658,10 @@ sha256=477b72ba4968e9a49c78e08a5335df7f71f71d787222224345f33f0b888f801b
 md5=4f5644788dfd6ba87ce7c9b6cc28890d
 sha256=dcb0cc5d1871e91859071a0bfa9de1a66703f0482ef5fc745300aa1a2df04cbf
 
+[http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.26/libxml++-2.26.0.tar.bz2]
+md5=a52fc7e6e44bb5cc187672930b843f72
+sha256=3287545d7e40bb24451f1afac6c77d545433d7efaf01ca8a60bcf9f6eacaf80a
+
 [ftp://xmlsoft.org/libxml2/old/libxml2-2.6.10.tar.gz]
 md5=299da4545913212ec4d82429d74314b9
 sha256=09f5452cd3007737e98644e4bcd4001e499efd35267657e91c62c0c3c63f3ec5
@@ -14602,6 +14754,10 @@ sha256=62d5997fdb41afa9400adcdb040d04a1f5fa950045df96e3e3f593e8f0de5739
 md5=5db3204d57436a032f899ff9dbce793f
 sha256=97d0ac5957745eeaf311ec38ebbbf3b30a5316b01c320a759af47129c994c20c
 
+[http://www.lighttpd.net/download/lighttpd-1.4.22.tar.gz]
+md5=949c33a81e83f7718a47280bef21b90c
+sha256=197bd2b57c5e2b9bfc30bb565a4c44fbea82daa20a31fa8ba490dd61dad69f2a
+
 [http://www-users.cs.york.ac.uk/~aw/pylinda/dist/linda-0.6.tar.gz]
 md5=c3e1b6c428218968e2963182c1df1fdc
 sha256=cba8ac22d77bbf8f6ed4a98933242b89ee2426cbc216f54415eafcac1274547a
@@ -14618,6 +14774,10 @@ sha256=cfde4a06df9fb4f26f8629d4ed3320ea813ba05a25217ec4ff55bbe5da04f504
 md5=fc1d3add18afbb8e61b8277b89c525c6
 sha256=cfde4a06df9fb4f26f8629d4ed3320ea813ba05a25217ec4ff55bbe5da04f504
 
+[http://downloads.sourceforge.net/linknx/linknx-0.0.1.26.tar.gz]
+md5=21956fe0ca7072e08b8fe096c61c4f2d
+sha256=cbc7e781fad9ac4704b7bf24b95e3de480fbcce6884e595109d18d0027d3b2fa
+
 [http://links.twibright.com/download/links-2.1pre26.tar.bz2]
 md5=841af2540c789e254b8465e07e24c684
 sha256=c89f10d42be2a0be8a017e1084897b1aabc5bca76817e9dab43b758dff051c56
@@ -15162,6 +15322,10 @@ sha256=361a2861a5cd5bc7bd3320b60165c3bede06056ade7d75ab370d13a6b203d629
 md5=d9504bb4251d4e5b32cb379debda634d
 sha256=67cad76c18a138b9b55bf6ff88a5796128371cf9339b3761b36f79fb4e7459d7
 
+[http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/lowlevel_topas910.tar.bz2]
+md5=3959ea1a2acaae196173b0283541c428
+sha256=b1f136a1d89daa4b1b9711eb81ad120b53c9357d159f262021b84ef8c9d128be
+
 [http://www.ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz]
 md5=b5ce6a74abc9b9eb2af94dffdfd372a4
 sha256=c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1
@@ -16042,6 +16206,10 @@ sha256=4a84422c270625162f6e9e1e4e8151d9546457d64c61c2b3c896cbf43fb54ce5
 md5=dccaddeb49d7def8a19cf497cb7eabf8
 sha256=cea3848006631801709588b8ae6808dbc768f62b6da4085073075f276309fd0d
 
+[http://goodies.xfce.org/releases/midori/midori-0.1.6.tar.bz2]
+md5=afed64074b2ed195aae171b2178650e1
+sha256=e6cc1b6da8a7af99ba9298e0cb4aac790595f04e04497ea8c2bb4b48c44feb5f
+
 [http://git.xfce.org/kalikiana/midori/snapshot/midori-abbfc163a39d7f1f01725fe2cfe3df516f9fa0f4.tar.bz2]
 md5=d50f0a9683dee60685bcd48e04970949
 sha256=c5eb824148935697cf4fc36f11cfd7a05fbe6a3392d8f32e296e2cdfd21de3ee
@@ -16606,6 +16774,10 @@ sha256=2e56fe35b6f3b93dac201c55764b8bf6d899c995e0d165381368cfca886c6739
 md5=66fa4f8efdeb993b2f280e1bdc664130
 sha256=0ae0d53ecafdaa9cac7c62aafe8898fe0f5df30ee128385a4895be552721d524
 
+[http://downloads.sourceforge.net/sourceforge/mtkbabel/mtkbabel-0.8.tar.gz]
+md5=d5518b678bffb58ceeae898d950ee27e
+sha256=591597c0787822c9fd56c7a3da214e81edd3c98f32d16858221e02dfc0f63779
+
 [http://mtools.linux.lu/mtools-3.9.11.tar.gz]
 md5=3c0ae05b0d98a5d3bd06d3d72fcaf80d
 sha256=3415d425d37338aa4e18e7d60147db23cfbe6192565c697f201f44426665ce42
@@ -16750,6 +16922,10 @@ sha256=86c8839ad5c8a1c5674eb3617bbe15e9c9bb2358a7435a0e2d22cd25ab7718ff
 md5=50c5732c0c9736b7026bce1c6b0007dc
 sha256=83f1d6623e142af30a9b3fa9135ecf973fbb8c89f1dc36a218de0c0fef6ddf07
 
+[http://ftp.gnome.org/pub/GNOME/sources/nautilus-cd-burner/2.24/nautilus-cd-burner-2.24.0.tar.bz2]
+md5=eb211dd03d0518263fa4eadccc3caa88
+sha256=d4ff952115a2fca28c613ce6a2b46740ce1000b0c213c482bcf3f127ceab99ad
+
 [http://ftp.gnome.org/pub/GNOME/sources/nautilus-cd-burner/2.8/nautilus-cd-burner-2.8.5.tar.bz2]
 md5=970173a3f93270950ca9fd247bdf07a7
 sha256=978d470f5f0cc314fab20ad8b4f771c568915fb78e933960bf33444ac44f9a39
@@ -16962,6 +17138,10 @@ sha256=1d09b1c133e4eed9d2df07ead4eba813e6993875c39e66d7b4081287029d4033
 md5=76ee9274c2b867839427eba91b327f03
 sha256=1d09b1c133e4eed9d2df07ead4eba813e6993875c39e66d7b4081287029d4033
 
+[http://sysoev.ru/nginx/nginx-0.7.51.tar.gz]
+md5=c2455e4c8656b72eb31abcf6a9798df7
+sha256=f155372c309ccd1cfc3bcdd2e7e705cdbbbeb034dbe7b3393604d4755daed818
+
 [http://downloads.sourceforge.net/ngrep/ngrep-1.42.tar.bz2]
 md5=35e821cfd888e9523a90fb7e5074a072
 sha256=fd5a85b48613452fbfc9ce6d6e3fa3f37992731422eb2843235fbf4e02d6f1e9
@@ -17370,6 +17550,10 @@ sha256=3ed39e1dc74b4e1adb3d8a3430b18bcfd19d21406375faf420cbdcd5499a4594
 md5=7a1e7424b346ee0a0b719217a1081cfd
 sha256=c11daf4e0baf1bc70d30411944f9a3238d61e3c1972c33443dbe0cb078cfe2d7
 
+[http://downloads.sourceforge.net/opalvoip/opal-3.6.1.tar.bz2]
+md5=c2b4f12822cef2182267ea0d020bddf6
+sha256=e6b48a294b35449c851c2a6ea6969041ed7f4148e92b3faa03a330b7bb5a59af
+
 [http://www.openal.org/openal_webstf/downloads/openal-0.0.8.tar.gz]
 md5=641cf53761f35ee979f3e888614797a0
 sha256=723e2c57c3cdffa7ff11f9b6b5478d6cb4af017e5a1ee7a56032969c39c1c2fe
@@ -17622,6 +17806,10 @@ sha256=2997613ab33ad42dc8269a63b7c40a6938b3552e196780a4a269cc7340dd23bd
 md5=9613e6be14ba7a0ca5d42a88e6ed3516
 sha256=45145ea27333be1552624065297b4d9d76feadf2a4a89fdf0ddafc830ced3a98
 
+[http://download.savannah.nongnu.org/releases/linphone/ortp/sources/ortp-0.13.1.tar.gz]
+md5=293f16da6dd434e68652f0f725b7f97c
+sha256=2ba471a2a4f1d7f10fb70de5b68dbb7d32b43494efcecb88b3bd8445f630494c
+
 [http://download.savannah.nongnu.org/releases/linphone/ortp/sources/ortp-0.7.1.tar.gz]
 md5=e69ba3f5a2ac76e3b6117826d0c536b2
 sha256=2f2fc74a13df58f560c40385cd78683c66623d7a8271cb17941a9de7be07d43f
@@ -17778,6 +17966,10 @@ sha256=225a63cdebb1490a47f3af5d17d301cd3e9382395f21776c5b04e4cf17fdf2b7
 md5=798eb3a03c519bd5f829775f5b219a91
 sha256=49b2e7ecaac26c3d87ccd26279bc0536baa50f1e140b36e14fbeedde76aad0ef
 
+[http://downloads.sourceforge.net/owfs/owfs-2.7p21.tar.gz]
+md5=8aea6f3bb0dc9fdb52ed3f0e9d84fa79
+sha256=070a3368e9400e900618f8a704f487baf3671f6764715b4de04b151c66d3306d
+
 [http://openzaurus.org/mirror/oz-compat_0.5.tar.gz]
 md5=0005d4068b2227e26f4583c1a7415e97
 sha256=8db9b3948c607315f0ba0df61b32f747bec5479c38051d3e0e55b31b82c81af5
@@ -18194,10 +18386,22 @@ sha256=035bbd4c1ac9c5b3a42e58777446e0370ca66d9258dc30a9f4c5ad48ebfacd65
 md5=05daeda25430fd13bbdb47b3481f7320
 sha256=5ed217591fefb043f4deb7b66a9b6351195dfb9405c0d2f5ec0f4d43a30aa9b2
 
+[http://kernel.org/pub/linux/kernel/v2.6/testing/patch-2.6.30-rc3.bz2]
+md5=cd69d16ea42bbf20d0a505690be45868
+sha256=7d07783e7ba793c8e043a83a2aabcf23ef29174a1963643a407f3a02fcb4542b
+
+[http://kernel.org/pub/linux/kernel/v2.6/testing/patch-2.6.30-rc5.bz2]
+md5=2f399a5e286a9fe7cb40bfd3d42a7a3d
+sha256=79a9913a74e58af6431bb952aac2cf0a1f4422287f420844f24ca6bc5ed0fdc4
+
 [http://www.muru.com/linux/omap/patches/patch-2.6.9-omap1.bz2]
 md5=d6249654087f0bcafaa860ac573316a4
 sha256=91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f2971090d9ac
 
+[http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2]
+md5=092957fc9e029010106c4fa59ef2c098
+sha256=eefecb157633d2be256c0f6a2d46ab764027bbb906cf5c250be67b95e80767bb
+
 [http://www.holgerschurig.de/files/linux/patcher-20040913.tar.bz2]
 md5=08649756a41358b24e1857201a90f8bf
 sha256=bad7cc70c773ecc05edf7d511f37f50a3e753fa8cddea0a81f2fc8f582a10489
@@ -19054,6 +19258,10 @@ sha256=2f18dc8e553b2eb9e40e429ccc829e2b8e25d2f82929cfbc4149b1147d00eee1
 md5=9cb4a25331a4c4db866a31cbe507c793
 sha256=72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232
 
+[https://www.auto.tuwien.ac.at/~mkoegler/pth/pthsem-2.0.7.tar.gz]
+md5=b277716ee1224ca9925176fa29e1f0c5
+sha256=6226f92f3a0950c6f3da8f9dcb7c76d08634515519bf35cd916b3cdcc1aeb130
+
 [http://www.ekiga.org/admin/downloads/latest/sources/ekiga_3.0.2/ptlib-2.4.4.tar.bz2]
 md5=221ea2f96ff6bae9cf604d8766eae526
 sha256=c9ef4267490507fc9699634551b50c0c1c225d48e0c095a81be6fa5a1fa96a3a
@@ -19062,6 +19270,10 @@ sha256=c9ef4267490507fc9699634551b50c0c1c225d48e0c095a81be6fa5a1fa96a3a
 md5=7d8dcd999827d51ad4a15afe74aad181
 sha256=c99897464bd07c73dbb72095a9806ddc0c26141230e34b181d7e742e78259e4b
 
+[http://downloads.sourceforge.net/opalvoip/ptlib-2.6.1.tar.bz2]
+md5=122ab96fcc44110ce05153f259b3285a
+sha256=b8301389c1ee9968df8075942061665e33198d3865f92d8fb26e519068517305
+
 [http://pypi.python.org/packages/source/p/ptrace/ptrace-0.3.2.tar.gz]
 md5=8108c2474bef16d126e956dce3c5073b
 sha256=634fe75e195179adafb6218040724f38252bd0fc8f796bb3e3e9bdba065890c5
@@ -19754,6 +19966,10 @@ sha256=c85ba04c9459cbc283a6f04ced730b49dc9966cf749808e8f960305116d525e6
 md5=a31f12647c5bb5f93c81465b4e5ff25a
 sha256=5795b9d619142e2d01016130c7ac71298aa1cabda4806f11762bb8fd489293af
 
+[http://download.savannah.gnu.org/releases/qemu/qemu-0.10.3.tar.gz]
+md5=320d6c536c8a1288cdc6c809f487e6d7
+sha256=89540d7a8c880a6ae33f8a55d55d580f3f03c10b02e32b7323719b3354f7b077
+
 [http://fabrice.bellard.free.fr/qemu/qemu-0.9.1.tar.gz]
 md5=6591df8e9270eb358c881de4ebea1262
 sha256=4756d0b4a4dc7dd88354bc6b37d381e4462dd328d0feef94803e90c0455835a5
@@ -19926,6 +20142,10 @@ sha256=05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39
 md5=3bd081c940c8580ecaabc1bd898e48f0
 sha256=4f6319c6031af47ef81fef08f465e4db61c0f169f5eb9bbc8f060cc3db3ffafa
 
+[ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-4.5.1.tar.bz2]
+md5=43e7384c59625af0830032348f672a1d
+sha256=f525ad885675f4c2413d67d9a5efaf7c34862d88c796fe7e7e2d05a42a1a66c8
+
 [ftp://ftp.trolltech.com/qt/source/qt-x11-free-3.3.5.tar.bz2]
 md5=05d04688c0c0230ed54e89102d689ca4
 sha256=aac89e862c74b2f3ead768e50e9fa7ada1e4225fe9d1d9e05723a3279259eb96
@@ -19978,6 +20198,10 @@ sha256=79ea9fb46d75c3759e3e98ab0064a47eaa5bdbbc2a53d923d60bd8e9cd0bc5c6
 md5=d6d1555b7a074e0a746f6247af402e11
 sha256=61831af6b71c7bd4e1ef542071225835d8c741fa8e079bceab8c83f712e396a1
 
+[ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.5.1.tar.gz]
+md5=f81a94e2ab7713b2d375d4e5cfc8e051
+sha256=aa3f5a459d042681a321f33e8d99468337a00674d68b8a512e0078625c1f51da
+
 [ftp://ftp.trolltech.com/qt/source/qtopia-core-opensource-src-4.2.0.tar.gz]
 md5=9519eccf0638c9962f73a7b20da77e0e
 sha256=8fdbc7da376b22796879d6e3b756f71a8800ed1b35fc88aa76cddffd6f1fd883
@@ -20058,6 +20282,10 @@ sha256=de7290f334baf631a14d031df304ee94cfb550aa69e7512aa589d21c2381c7d8
 md5=4508546d1ed0257ef7c128b6121b7208
 sha256=47bf030565bb462840db694acc183273455714028c74974c5b3a3bd4ad29ad89
 
+[http://download.savannah.gnu.org/releases/quilt/quilt-0.48.tar.gz]
+md5=f77adda60039ffa753f3c584a286f12b
+sha256=73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc
+
 [http://download.savannah.nongnu.org/releases/qwo/qwo-0.4.tar.gz]
 md5=72811b7d7fecfbdca45d5a74394daa4f
 sha256=c3b9bffd3e27090d4c0623ef61f48257343d0f6ea1cf573f5296250ab7551e5d
@@ -21178,6 +21406,10 @@ sha256=7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1
 md5=597d7ff7edb42a18421c806ffd18a136
 sha256=7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1
 
+[http://downloads.sourceforge.net/siproxd/siproxd-0.7.1.tar.gz]
+md5=45e5a44803181e2bf3361d562060c904
+sha256=5eef70f4e0a8f0f4628550807da3036f8b3086864bf4bcf5ab6d22ac3a6efd81
+
 [http://download.berlios.de/sipsak/sipsak-0.9.6-1.tar.gz]
 md5=c4eb8e282902e75f4f040f09ea9d99d5
 sha256=5064c56d482a080b6a4aea71821b78c21b59d44f6d1aa14c27429441917911a9
@@ -21498,6 +21730,10 @@ sha256=47daba209bd3bcffa1c5fcd5fdfc4f524eae619b4fa855aeeb1bbbc8bd2bb04f
 md5=903c9e935c538af392364a9172a3d98d
 sha256=1673b9218ec318067a662315c161ae123088cad319231ec079018acb4717e8bb
 
+[http://www.sqlite.org/sqlite-3.6.13.tar.gz]
+md5=652a01797e7538811e4997a5847bc026
+sha256=2ca2591847df72224dd6f99c8fffe35bb63bf41a8519d8e15ad48141aa841bfa
+
 [http://www.sqlite.org/sqlite-3.6.2.tar.gz]
 md5=46f92e42243bc51aaa3871645ce78bd5
 sha256=cb07a9801a128e2f42cf49b7e9d577b092ab54aa05242655af93491a73a91a1f
@@ -21550,6 +21786,10 @@ sha256=8423027a1e7dc238d27ec227f47ce22d1317b4c9a0a9ee49a38b6e6f8da8a5c8
 md5=95c40fca0d886893631b5de14a0af25b
 sha256=8423027a1e7dc238d27ec227f47ce22d1317b4c9a0a9ee49a38b6e6f8da8a5c8
 
+[http://downloads.sourceforge.net/squashfs/squashfs4.0.tar.gz]
+md5=a3c23391da4ebab0ac4a75021ddabf96
+sha256=18948edbe06bac2c4307eea99bfb962643e4b82e5b7edd541b4d743748e12e21
+
 [http://www.squid-cache.org/Versions/v2/2.6/squid-2.6.STABLE14.tar.bz2]
 md5=eadb138d48320df8b99349121159c6bf
 sha256=dcb0c10965430862721b675e2f9f6a30819880e03124b5e9403bfce2c7f3b69a
@@ -22174,6 +22414,10 @@ sha256=a7147079740acef2df0d2caab164062b12806d988216aa03667198d1100f5eb2
 md5=c28db354576aaec2152970b06d534640
 sha256=a7147079740acef2df0d2caab164062b12806d988216aa03667198d1100f5eb2
 
+[http://telepathy.freedesktop.org/releases/telepathy-farsight/telepathy-farsight-0.0.7.tar.gz]
+md5=882c9630ab28706d34d7d6d1060d43f0
+sha256=877760e794fb050448b6e591616afaba061d40c319e86b145053edf22df5570d
+
 [http://telepathy.freedesktop.org/releases/telepathy-gabble/telepathy-gabble-0.3.0.tar.gz]
 md5=12a4508e338a39c63c24c41261eba3dd
 sha256=b4fcd32237271e400b00e779116e8203eac5efdaf53c78b9909b85a158fd81d8
@@ -22186,6 +22430,10 @@ sha256=3c4eb81c9d516937565a295beb0e98ab5c2a04864a0a5c8cef32916c63056b05
 md5=94bbf929aceac7601421e60ba35683a5
 sha256=63cd37752d153d222fa4a1fe08f6188832341f41652482bd7891e3fbe0ff8dd7
 
+[http://telepathy.freedesktop.org/releases/telepathy-gabble/telepathy-gabble-0.7.27.tar.gz]
+md5=0bd4fdfb63d86d5e297ae069ad489704
+sha256=9a4ce52bd7eb9b8010a481be71117d814eb15fe9c8579817c7b486199a3801ac
+
 [http://telepathy.freedesktop.org/releases/telepathy-gabble/telepathy-gabble-0.7.6.tar.gz]
 md5=17564dcb79d886d527609c154834c1c7
 sha256=9ce73e484b2f2858d46ffea9893f9823b5de9c7310f7c26b027f73a1c8fde857
@@ -22214,6 +22462,10 @@ sha256=c587eeab36208da798203cd5997fb82c891136dcd18780cd06e3d27a1d6d4a58
 md5=33e68c9876de84a252a84bf5f828aab6
 sha256=49dca0428d69f43c856800967b2def8c890cd322fbdd0aa47c227aec5820a690
 
+[http://telepathy.freedesktop.org/releases/telepathy-glib/telepathy-glib-0.7.29.tar.gz]
+md5=ae67d4fe42c7e337813754cb5927b6cc
+sha256=7bf25e050e8b8ceb983c1cad6b4e38892b052f6da82df3b7aec7b2ea50a8702e
+
 [http://telepathy.freedesktop.org/releases/telepathy-idle/telepathy-idle-0.1.2.tar.gz]
 md5=21bfda9e1fa12e25b4173deb9ffd0b5d
 sha256=3ed0cb5dd687e4d9fa838a318f9ef12a8c221894ff188687c27625f0ac3bce82
@@ -22554,6 +22806,10 @@ sha256=3193c3446d211db2bd3c169c86f6d433666669336bd589a20c87f1483295cf2a
 md5=724208e1b2d235148499672b44181298
 sha256=ad214a2692041f423d2150777c233b21cab2d108f849edc513192587ac63c9c2
 
+[http://ftp.gnome.org/pub/GNOME/sources/tracker/0.6/tracker-0.6.93.tar.bz2]
+md5=768059a486ff73ae18595afab3b78a70
+sha256=f4d3b413a61bfe6895f7f87bbfbcc7159f66b1d73fc29a7380839802fbb01198
+
 [http://downloads.sourceforge.net/transconnect/transconnect-1.2.tar.gz]
 md5=c255ff48387ea6a7092707ba992237e7
 sha256=47d6cc44f78fc6d4cdb1dfee02fe6e0f4d8aae0ce2e3e92567667f0475736617
@@ -22662,6 +22918,10 @@ sha256=d91b4addcbb241b04b6cf795447163ed890a436b10205d2cd9cc1885ea3d9433
 md5=ee74158c6c55ae16327595c70369ef83
 sha256=ef5e9bf276b65bb831f9c2554cd8784bd5b4ee65353808f82b7e2aef851587ec
 
+[http://downloads.sourceforge.net/tunctl/tunctl-1.5.tar.gz]
+md5=fdbedc263b3e85bb0e087cd567414607
+sha256=aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff
+
 [http://alioth.debian.org/frs/download.php/2241/tuxmath_w_fonts-1.6.0.tar.gz]
 md5=3aa0e0e488719611f0bc4441b63a6f56
 sha256=f3aae7e2f67cf12f3da98325388c7b2f6718729aa69c5c804d1866d6a49f8592
@@ -22802,6 +23062,10 @@ sha256=5cd64b5ac52720a7f60015e01696422277ecc459e89dce8b16d457f30a9409ab
 md5=cb11d3d74eee4d31124523d90d8c31fa
 sha256=0c0afa2816482e087987f71958b656ff0c122032f5e3897a8d17daca5bc14115
 
+[ftp://ftp.denx.de/pub/u-boot/u-boot-2009.03.tar.bz2]
+md5=285e2184d2efef50e0fe43b71d2a7b11
+sha256=a2889bee9c45575b284564dbc27cf3dc6cb9833d4ff643976a1b3dba2d763f86
+
 [http://linux.omap.com/pub/bootloader/2430sdp/source/u-boot-SEP1106.tar.gz]
 md5=49c07dec9e1be69fd01d46f47ec03731
 sha256=a090786113b02647413ebc15888af269f2e6d50f73cbb94b0619cc1702911dae
@@ -22906,6 +23170,10 @@ sha256=cc9f58ff58fbd3f5868e1f1e368e3c93e1f441afd0ac1dcbd5d01a9ce5b5b0d7
 md5=a3fcdcd21b2f33d598f45a68fff892bd
 sha256=ee3922bd46dbdc406be5d498be5bc062a0b39f05f1c0a1b22c3657eb0e805975
 
+[http://kernel.org/pub/linux/utils/kernel/hotplug/udev-141.tar.gz]
+md5=86382b7bbc64459e714c65a2a4e10916
+sha256=001be4a8963c48e7debc82c6078562d087a2979da63e558a5e3613c03725c377
+
 [http://udhcp.busybox.net/source/udhcp-0.9.8.tar.gz]
 md5=2d7e548820d2ded5e183933cb701defb
 sha256=da0ca1e821e3fa7cfbe73ddb1480b921002ee992f5e5fbc611422c103b907443
@@ -26550,6 +26818,10 @@ sha256=723dbbdfac6e421aa3343a2f1cef7cfb998bb5c045dcf0df870aeba6dd78b79d
 md5=658badd22689cdde536050f740ec8319
 sha256=70a767f1109bf70353c58b0fb54626a1300fd0724017196bfd17d13a582ddd62
 
+[http://gpe.linuxtogo.org/download/source/xserver-common-1.24.tar.gz]
+md5=6d7aaa9c267427ddb78faf008cf78187
+sha256=8109646b77c08a0f269531ad42475782101a88681c2590453f4a5c9fe4681932
+
 [http://gpe.linuxtogo.org/download/source/xserver-common-1.3.tar.gz]
 md5=b55e9347b9aed725cc7baf91701cdd83
 sha256=177b5a3e65d7a64b5a0fbbf1b10f8e3d020a20c823b1bb9f3269dc835df213e1
-- 
1.6.1



