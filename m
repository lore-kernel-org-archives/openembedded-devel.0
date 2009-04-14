Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Ltetq-0003I1-Eu
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 11:26:25 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 4A00C18934F; Tue, 14 Apr 2009 11:25:29 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 11:25:14 +0200
Message-Id: <1239701117-7033-2-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>
References: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][STABLE][PATCH 1/4] checksums: sync with .dev
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
X-List-Received-Date: Tue, 14 Apr 2009 09:26:43 -0000

From: Koen Kooi <koen@openembedded.org>

---
 conf/checksums.ini |  212 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 files changed, 192 insertions(+), 20 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 658aae7..3dbb048 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -662,6 +662,10 @@ sha256=4d8187c484a28c32f843b929b244bb2da07d74f7fdc2c49f843a555464f75236
 md5=a335d299bb7e14d910c600d0975dd375
 sha256=84eb13052bf4d41c26bf689f4bf58cb8036b9846f0d1693073b89e3d125793f3
 
+[http://www.packagekit.org/releases/PackageKit-0.4.6.tar.gz]
+md5=66ef4281047ad51f499ec05420028f11
+sha256=4e44eb7be990cb62e57840f4b01b6c9af06c4655869d0cb565fc45749c20b82e
+
 [http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Params-Util-0.20.tar.gz]
 md5=33c4466239c97cc3e1063eff0577206c
 sha256=29f7e05045a5699b211d2a8332d36113c22f9c2e96174f40939e79dbc356905d
@@ -1786,6 +1790,10 @@ sha256=85331e63c90370c305121f134358e76cbb06846a12c04a7825d5869f331ee00d
 md5=3b416557d2c395a36b97a819812e99b0
 sha256=2bcc5d5620f8533eb4300ba1b48c9d2a00092ce04588e32f7074cf2aadc34259
 
+[http://downloads.digium.com/pub/asterisk/releases/asterisk-1.4.23.1.tar.gz]
+md5=4788954a93f5fbf78e55e2aa6e03329f
+sha256=03e2cf43ffe9935d56fa0ea3663fc9bd23ce9720682c79d6269e78a9a1629d63
+
 [http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-alaw-1.4.8.tar.gz]
 md5=e708a5510a61217725b6ad663287dfa0
 sha256=5d5c305079eb9918d271fad28ac73248a7d2962347dbd80d16aac66fe35e2729
@@ -1846,10 +1854,22 @@ sha256=3ec786e6df9e1a935aff4848b6989cad8f87c1fa8813dc033b338e18b17138d8
 md5=b47d4fa958aaf83916b6a917626102cd
 sha256=9d1fff10d391cb64890bb8e0050d3f023520a8dd5aee43c4d3f9c6f8611da668
 
+[ftp://www.at91.com/pub/buildroot/at91bootstrap-2.10.tar.bz2]
+md5=a3bcd50138d29c1d23a0d378edb52dfe
+sha256=019b98442d4debcd74d759043884b4b0ed48a2bef425649bfe3061d00e854fc5
+
 [ftp://www.at91.com/pub/buildroot/at91bootstrap-2.3.tar.bz2]
 md5=a29b3f07e623d20894ab23335daf5da5
 sha256=d598d078c24a24b13eac8a219a4ab05499909404cbd4efcb8641fdcde28464c0
 
+[ftp://www.at91.com/pub/buildroot/at91bootstrap-2.4.tar.bz2]
+md5=10161158f116e0b171582a2f66854af1
+sha256=c01e579401453ae97bd7671997d4b3d3b63e25e7e1e9cec02611a944ad1727fa
+
+[ftp://www.at91.com/pub/buildroot/at91bootstrap-2.8.tar.bz2]
+md5=117b73e2bf1f8d52afe6e742e33444a6
+sha256=a5647ea3761560d7ee1baecea3f09c942f10441e60c6ddd3bad6a450d84a3918
+
 [ftp://ftp.debian.org/debian/pool/main/a/at/at_3.1.8-11.tar.gz]
 md5=81dbae5162aaa8a398a81424d6631c77
 sha256=0d77c73a3c151a7da647dd924f32151e5ee4574530568fd65067882f79cd5a44
@@ -1958,6 +1978,10 @@ sha256=fce50bc26351bbbe31154d9a734cb433ec8fb404efc5febd50c149e5eaf62449
 md5=dc3fc7209752207c23e7c94ab886b340
 sha256=636eef7f400c2f3df489c0d2fa21507e88692113561e75a40a26c52bc422d7fc
 
+[ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.13.tar.gz]
+md5=9de56d4a161a723228220b0f425dc711
+sha256=f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e
+
 [ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.57.tar.bz2]
 md5=407ea53787ce13f5ca427e9a51e05bc2
 sha256=e1035aa2c21fae2a934d1ab56c774ce9d22717881dab8a1a5b16d294fb793489
@@ -2686,6 +2710,14 @@ sha256=5a2e6e83062699fb01babfb5b211054e01dde097d3b31767135be5447bb05bde
 md5=53a3347a1c38971bee4c4016b45bcf6d
 sha256=f6cfceb541a10849805f853b790bc8343309e7b21078a9c18a7a6a8cf2f94e3b
 
+[http://www.kernel.org/pub/linux/bluetooth/bluez-4.34.tar.gz]
+md5=2435f7a932cdeecce01211e06142795f
+sha256=1c46b6e219aec9bbd3286e9366de7e6dd05f68ed33b7487fbd211397c890fc40
+
+[http://www.kernel.org/pub/linux/bluetooth/bluez-4.35.tar.gz]
+md5=5919d6383cd9446f8b90fdca748dc961
+sha256=e5e592de95f50a1569d3e4a95c8b955a2535e265e24869e3ce30e19b0949b465
+
 [http://www.kernel.org/pub/linux/bluetooth/bluez-4.7.tar.gz]
 md5=2aa806940d2c841e57a9b2ab7302b750
 sha256=ed384dea4f5f21157758fcd7db64db19ce0b410509c26630706e4a3c779287a0
@@ -3414,6 +3446,10 @@ sha256=fbd7a0595eba5cf0cb168d9893e883f5cc7a68a7d6fec23cb3688508b247fa22
 md5=82b08b1980ec6fbfc83b4dc0e2df10f7
 sha256=543435cb0988acc90a6e651e424eb331aba3f73361036d7af458bc1233973199
 
+[http://ftp.gnome.org/pub/GNOME/sources/cheese/2.26/cheese-2.26.0.tar.bz2]
+md5=17c991c695c3a7549da6e42d1b327d79
+sha256=297c7aa579e14c1c22fbbc19254fbefca3b79ef8e6643856c83be0fdb8721412
+
 [http://www.0x50.org/download/0.4/0.4.29/cherokee-0.4.29.tar.gz]
 md5=854e6e61a69781746496012658d8ef98
 sha256=7091536ef2a51d2548ac6268cc846dda9c37f7f7348597868c793f42b9be7d78
@@ -5350,6 +5386,10 @@ sha256=6f40962eb8d76e0e9d76ec9f461d62c6af8561028d194358aed001827cc418fc
 md5=f100632e67f94ef4fffa4da32d25427a
 sha256=748359a51e008c179dc5dd5e2974f4b1279c78e09a2613a73d15cd22cb55e8d8
 
+[http://www.burghardt.pl/files/esekeyd-1.2.4.tar.gz]
+md5=5eb8d1b02cdd99d0681e946768e529db
+sha256=7267db1685b04e766b782e4c5aab9729bf3f23b86d568a3a513c77eb91aaed03
+
 [http://enlightenment.freedesktop.org/files/esmart-0.9.0.007.tar.gz]
 md5=a65b4a08818ac9ef9de3dd9d4f20f148
 sha256=5df5b02c568f5e4b744252fbd62f5fae71bf0eddecc423d2b396a0ffbfe94465
@@ -6914,14 +6954,26 @@ sha256=37b3286c2bfb68da9df983f60721f868e29897f7a426306748fee93b25c5fb61
 md5=88785071f29ed0e0b6b61057a1079442
 sha256=1159457a0e4c054b709547ae21ff624aebab2033e0d9e5bf46c9cf88b1970606
 
+[http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2]
+md5=88785071f29ed0e0b6b61057a1079442
+sha256=1159457a0e4c054b709547ae21ff624aebab2033e0d9e5bf46c9cf88b1970606
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2]
 md5=ad9f97a4d04982ccf4fd67cb464879f3
 sha256=985cbb23a486570a8783395a42a8689218f5218a0ccdd6bec590eef341367bb7
 
+[http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2]
+md5=ad9f97a4d04982ccf4fd67cb464879f3
+sha256=985cbb23a486570a8783395a42a8689218f5218a0ccdd6bec590eef341367bb7
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2]
 md5=a4a3eb15c96030906d8494959eeda23c
 sha256=cfc0efbcc6fcde0d416a32dfb246c9df022515a312683fac412578c4fd09a9bc
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2]
+md5=a4a3eb15c96030906d8494959eeda23c
+sha256=cfc0efbcc6fcde0d416a32dfb246c9df022515a312683fac412578c4fd09a9bc
+
 [http://ftp.nluug.nl/languages/gcc/snapshots/4.2-20060513/gcc-4.2-20060513.tar.bz2]
 md5=ac6d19831220c4aeef4475492725486f
 sha256=98bdb26cd2644f2290e34453d9115b88bcff940bd1feb88db5a0fc557ec0ea5e
@@ -6930,27 +6982,47 @@ sha256=98bdb26cd2644f2290e34453d9115b88bcff940bd1feb88db5a0fc557ec0ea5e
 md5=cba410e6ff70f7d7f4be7a0267707fd0
 sha256=ca0a12695b3bccfa8628509e08cb9ed7d8ed48deff0a299e4cb8de87d2c1fced
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.1/gcc-4.2.1.tar.bz2]
+md5=cba410e6ff70f7d7f4be7a0267707fd0
+sha256=ca0a12695b3bccfa8628509e08cb9ed7d8ed48deff0a299e4cb8de87d2c1fced
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.2/gcc-4.2.2.tar.bz2]
 md5=7ae33781417a35a2eb03ee098a9f4490
 sha256=673b85d780a082c014ded4ac11f8269a3fe893b4dbb584d65b8602d50b3872b1
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.2/gcc-4.2.2.tar.bz2]
+md5=7ae33781417a35a2eb03ee098a9f4490
+sha256=673b85d780a082c014ded4ac11f8269a3fe893b4dbb584d65b8602d50b3872b1
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.3/gcc-4.2.3.tar.bz2]
 md5=ef2a4d9991b3644115456ea05b2b8163
 sha256=5df9a267091eea09179651ad2a2302fe99f780ac7e598278e7f47b2339fa2e80
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.3/gcc-4.2.3.tar.bz2]
+md5=ef2a4d9991b3644115456ea05b2b8163
+sha256=5df9a267091eea09179651ad2a2302fe99f780ac7e598278e7f47b2339fa2e80
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2]
 md5=d79f553e7916ea21c556329eacfeaa16
 sha256=afba845e2d38547a63bd3976e90245c81ea176786f9e6966339c6d3761f1133a
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2]
+md5=d79f553e7916ea21c556329eacfeaa16
+sha256=afba845e2d38547a63bd3976e90245c81ea176786f9e6966339c6d3761f1133a
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2]
 md5=4afa0290cc3a41ac8822666f1110de98
 sha256=66596b80995f88cb66aaaf937598df7a9af10cc06799c3a7a64879e20b552fd5
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2]
+md5=4afa0290cc3a41ac8822666f1110de98
+sha256=66596b80995f88cb66aaaf937598df7a9af10cc06799c3a7a64879e20b552fd5
+
 [ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
 md5=5dfac5da961ecd5f227c3175859a486d
 sha256=bfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
 
-[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
 md5=5dfac5da961ecd5f227c3175859a486d
 sha256=bfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
 
@@ -6958,6 +7030,10 @@ sha256=bfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
 md5=cc3c5565fdb9ab87a05ddb106ba0bd1f
 sha256=309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
 
+[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.3/gcc-4.3.3.tar.bz2]
+md5=cc3c5565fdb9ab87a05ddb106ba0bd1f
+sha256=309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
+
 [http://gcc.releasenotes.org/releases/gcc-4.3.3/gcc-4.3.3.tar.bz2]
 md5=cc3c5565fdb9ab87a05ddb106ba0bd1f
 sha256=309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
@@ -7798,6 +7874,10 @@ sha256=cea63cddf79864d306198c7a84091af0b4685816b352ae253a3e2bfac5e67cb7
 md5=7f2a8cee97e62ebfa284363dc93b3178
 sha256=9605f7aee1b8d58cac10dd514c2bdfa340089d85b149db828816d18ac3ebaff8
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-bluetooth/2.27/gnome-bluetooth-2.27.1.tar.bz2]
+md5=4a7c977086af47fe43ea08b29ab93503
+sha256=939c8a8f819b8c39e4e355a764b2a47c6959d57029c5134a51a282d7cccd60c5
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-common/2.18/gnome-common-2.18.0.tar.bz2]
 md5=567172e685fc0783b1d6ab9843a85d6a
 sha256=ba28c1017e7e4212db16ada3f44cb446b6637c9c4fe16c0e2c2a51c94c46bc5b
@@ -7842,6 +7922,10 @@ sha256=4bd3141b2c668b24b43ac10a7a7040ce0717d8f088aee8a93ef261e446d88818
 md5=a2cc0424619f271bf1a65cc0fbe782f0
 sha256=7ebe5b0c2bb296386f1d62c3a5d30ed50e353c8d9dc390b77e0b5fdf56e4dad9
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-desktop/2.26/gnome-desktop-2.26.0.tar.bz2]
+md5=796fc830e0baff24381809a7abe012f8
+sha256=3b3fe18bc30ad60f1bbbb2bc2d2ec14a2f9babb9312eb4834395b5839b7d7ee9
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-desktop/2.7/gnome-desktop-2.7.90.tar.bz2]
 md5=16691f6bdc7c09445c457387adaba1f1
 sha256=6a1499a1e50ac89210a9a1fdb36bc070ef6d1a02764a0f8d90de314dba01972e
@@ -7890,6 +7974,10 @@ sha256=98e4202a7745e0533c7a665fc6d2cc6b4ee851debf159a61d8de706b952ac748
 md5=17ba571e5dd83434dc5b2b06ada7b56e
 sha256=b71f89f9ead65a7d3ccb92f6a6c2fb1719be25d6661dd67a14b5d820ee6831b2
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-icon-theme/2.26/gnome-icon-theme-2.26.0.tar.bz2]
+md5=36a4e5e1b2c7c053779a9a399f6146a2
+sha256=4320c937d4d211ac39633aa39b55e770b9a996697c857e2b8033c40323384709
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-keyring/0.2/gnome-keyring-0.2.1.tar.bz2]
 md5=2fe5fb39cc18d1a6792fd3281223dfff
 sha256=1c6d5a1732742469ec32ab7297f3b8eacfc0f4bfae5fdb096b603877dde12612
@@ -7942,6 +8030,10 @@ sha256=b3ef17eb05308e35e1627e5ca56b6951e9aea69cf112164ef698cdad6f44ed23
 md5=1816a0d21ef99d5b3a8bcd033c88f732
 sha256=f19ac5af961be1d6244f9526311af8a67518c7403ef71209dcee94b68f77d58e
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-menus/2.26/gnome-menus-2.26.0.tar.bz2]
+md5=55fd07e67d8334de2e03e4e23c011452
+sha256=84a97b6d74b14e27888a0f54759e570cb701400c5b176471871bc08a6acafb15
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-mime-data/2.18/gnome-mime-data-2.18.0.tar.bz2]
 md5=541858188f80090d12a33b5a7c34d42c
 sha256=37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7
@@ -7962,6 +8054,10 @@ sha256=015f415748fa90d51b2bfd2dd41906ee918eb4e5d900d7b6b3ac698e4016e5c0
 md5=05b03bd236a5bda56ea85122f356a68f
 sha256=ff507ea3421f410ab0faf59b6146f65fa073b01c556f017ce211557b51ba3804
 
+[http://www.packagekit.org/releases/gnome-packagekit-2.27.1.tar.gz]
+md5=7a38bcdfda3e712365f674c51565e845
+sha256=1d77646aa7291dcf8e5ab78955f5e5755faac982e795fa70f7ecf5aa98da6f9e
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-panel/2.10/gnome-panel-2.10.1.tar.bz2]
 md5=a2719f5c79a9e48bca086f08a77a6889
 sha256=dc60f7f6e9b9ce52ad4e2ce1f7d6dca643590e86e49c749d513d9f8a25068a7a
@@ -7982,6 +8078,10 @@ sha256=e1ecc0ddc5a09481deb2daa1f30fa14472bfed541db46bb4f49f3d0d728b0a45
 md5=0d246880611a4c58fe2ff99614b96918
 sha256=6d6d0f013594f1d5f685bc9d35ad2c64d7817339a932d8e17eede5b8a3c8196a
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-panel/2.26/gnome-panel-2.26.0.tar.bz2]
+md5=27965de9b12952b22b7e232af6acb0de
+sha256=e8e21b008d4afcebfc3241d0f91dd2dcc0b171b16f5675fc1b7ed699e79b56f3
+
 [http://downloads.sourceforge.net/gnome-power/gnome-power-0.0.5.tar.gz]
 md5=db310dadcc958a781a2752a6a7748e60
 sha256=78f7dc6946e178513202f06afc19496c8ac1e3ac6c43c56c40f4db1a23762179
@@ -8006,6 +8106,10 @@ sha256=559b5d857b4fbc31418bc677f3391182ba1c357cabb8dfee04a1e709a7a63d01
 md5=d8f8e61d99402e8b0a82d3c8d6e873be
 sha256=7ad66f99a1bad1ae0bbb02bd7a7cf8ed17fdc3fd104fa5c68e04961459ad5c50
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-python-desktop/2.26/gnome-python-desktop-2.26.0.tar.bz2]
+md5=fbcf4ef5ec4a8c4eec4d390c5889c80f
+sha256=400a5401a591e271c3357d0a8cb05a7927b4c218130497d06f75df9763d4efd8
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-python-extras/2.19/gnome-python-extras-2.19.1.tar.bz2]
 md5=08896c63d71ce44d20fafbaf9c0edc78
 sha256=c5f74f4c46dbb379d119d6f74ca4a47653af251bea176dc7a0ecacccb88339f0
@@ -9206,6 +9310,10 @@ sha256=5149991a219e8f2059350ed9d52bb110c0695da6eb9fe256e9e213e69f83929f
 md5=5bfa5605d9565ff01138d7a574cc2614
 sha256=fc029984019736eab2b0f10ce28d48ff88f8ceed7a1739cb4b71b851c4b89b91
 
+[http://downloads.sourceforge.net/gsoap2/gsoap_2.7.13.tar.gz]
+md5=fffb49eb1db7ff03643a4313115dc3b1
+sha256=3d40a528b8f3309f392945dca2ecaee5a698f4ee00a6036907a57c4f25a6a479
+
 [http://downloads.sourceforge.net/gsoap2/gsoap_2.7.7.tar.gz]
 md5=a0bbbfdc135034cd778537f979121df7
 sha256=7b531f1b6481fbe1a21620a86649f42cb2de9cf086e7bdde46335137d3ca11dc
@@ -9782,6 +9890,10 @@ sha256=67e7dd1dca32a99eb1102a853d2df1bac782d50a4361511409572cfe8ea51147
 md5=a41e8b7d99e390cef8312f7ce5f312a5
 sha256=17eccded6e096208181e2c7625802526112af23f5b2c7b2a672ab9ccff3a55fd
 
+[http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.2/gvfs-1.2.1.tar.bz2]
+md5=df8f624587adfabe7009838ce6d8d5fd
+sha256=0e3c3469721ff1d4296bf4af7e1f131201d2dc6a36c772d99e1630f8cce31da2
+
 [http://sebdelestaing.free.fr/gweled/Release/gweled-0.5.tar.gz]
 md5=238f5ef66317bb24c3d4018a7d1e9ec3
 sha256=d5baec578b22407e3fc78cc47393942f9704f1ab7b8d1c012577037d3421f90e
@@ -13038,6 +13150,10 @@ sha256=d5a799e1d11cd91865cb716a11de970de97d7ef679684db0a893fc6a65a9acd0
 md5=d006328ec5cebc5dbf3a18834db95bba
 sha256=0abae1eef7210e4decab7f89ea5b3a012c06859e91923a7212ca50856bffd500
 
+[http://ftp.gnome.org/pub/GNOME/sources/libgweather/2.26/libgweather-2.26.0.tar.bz2]
+md5=b96016d7b35c66cf251189e9851ee252
+sha256=c1efdeb59fe87145d13d99b7bb6f51b56505081fb2ebc2f7fe7dc3f7699da45e
+
 [http://www.handhelds.org/~mmp/files/libhal-nm-0.0.2.tar.gz]
 md5=2f0882a711759113b2388a790abe8fd8
 sha256=68dd467cf8bd54283da874af54ac35de58b88444371ea48bb5cef289a0942981
@@ -14118,6 +14234,10 @@ sha256=59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36
 md5=8c198831cc0495596c78134b8849e9ad
 sha256=59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36
 
+[http://ftp.gnome.org/pub/GNOME/sources/libunique/1.0/libunique-1.0.8.tar.bz2]
+md5=02b9e41c70ca738e1aa914f400fc1f05
+sha256=d627a10f523af14e9ead655ebab3a26e7faeea006bdfa7739bc4c04058ddf4c6
+
 [http://downloads.sourceforge.net/upnp/libupnp-1.3.1.tar.gz]
 md5=6646be5e31e58188e8f47c6ce64faa4c
 sha256=4d0d6a5302222757fb36ee21d8f8e1b3de849c2de658ab1105272f32ff78767d
@@ -16618,6 +16738,10 @@ sha256=48f1d25af102d216fdc2ebcd6396ffce963558c119b88730dc02fb1c158fcc4c
 md5=783e5f7be6391d6c46b4725e38af475a
 sha256=a793ebe4245656f0ae23d5a87895555182f62943e02e9667303ad20c4e690c1d
 
+[http://ftp.gnome.org/pub/GNOME/sources/nautilus/2.26/nautilus-2.26.1.tar.bz2]
+md5=5d75f5de2806e9003e36a4613866b8d1
+sha256=86c8839ad5c8a1c5674eb3617bbe15e9c9bb2358a7435a0e2d22cd25ab7718ff
+
 [http://ftp.gnome.org/pub/GNOME/sources/nautilus/2.6/nautilus-2.6.1.tar.bz2]
 md5=50c5732c0c9736b7026bce1c6b0007dc
 sha256=83f1d6623e142af30a9b3fa9135ecf973fbb8c89f1dc36a218de0c0fef6ddf07
@@ -17046,6 +17170,14 @@ sha256=c80d9ea7ebca32b63ea23d2a52ac799cff32f8f30c66b491d2b8f93da05585e4
 md5=b79146369fc76a61d6d4056a937c71c8
 sha256=b69a259795762881a5384072085bb501d77c6fb974e0b7a16ca573565ffe3629
 
+[http://tadas.dailyda.com/software/obex-data-server-0.4.4.tar.gz]
+md5=4aad0182812c770dde21246522be9f5e
+sha256=aa567d986c74a4c8b4abb1cc454c099f67ab01b049b4c69aa6e703c7f18b594d
+
+[http://www.kernel.org/pub/linux/bluetooth/obexd-0.10.tar.gz]
+md5=b9fbc1386b24f59b36aeb9d764c11fb5
+sha256=8ed452371010117e183ade4e1e3ae4b489485b792722bf3b97b817cf0ed66ac8
+
 [http://downloads.sourceforge.net/openobex/obexftp-0.20.tar.gz]
 md5=085b9edc0504c0d79e7479a54e2018c5
 sha256=7246fc75257afcd30ff16dc70185057157bcefc12fa9fba111b3b201577cc40e
@@ -17062,6 +17194,10 @@ sha256=09687012d5e016277fa638f22b8c784aea6803056c70d14614e3b75158aae877
 md5=d167cfdea244e3a5f973a7b16864419c
 sha256=09687012d5e016277fa638f22b8c784aea6803056c70d14614e3b75158aae877
 
+[http://downloads.sourceforge.net/openobex/obexftp-0.23.tar.bz2]
+md5=f20762061b68bc921e80be4aebc349eb
+sha256=44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36
+
 [http://www.caside.lancs.ac.uk/bt/obexpush.tar.gz]
 md5=edb66ba97fe6c84b6160c670c4bcdea8
 sha256=341c6865aa392b6cf056e1bd9cda53d2f31a942460087ad22d6f6dc91bb0bd0e
@@ -17306,6 +17442,10 @@ sha256=3a80ba2524c66a46db3ac17a788a759015a1f79de6a495fcdf3a316e19fe7c23
 md5=feaa5dfe5151c0e70e8f868fa4648a43
 sha256=3a80ba2524c66a46db3ac17a788a759015a1f79de6a495fcdf3a316e19fe7c23
 
+[http://www.kernel.org/pub/linux/bluetooth/openobex-1.5.tar.gz]
+md5=0d83dc86445a46a1b9750107ba7ab65c
+sha256=e602047570799a47ecb028420bda8f2cef41310e5a99d084de10aa9422935e65
+
 [http://www.openpbx.org/releases/openpbx.org-1.2_rc3.tar.gz]
 md5=e270c40626dfa2131cc39dd1352b46f9
 sha256=934e1e5438c46927236f1f3254265e94c7e38e7c0e02d92abb7efc4e03ce91e9
@@ -18046,6 +18186,10 @@ sha256=e5ad0ec9b0facaab5982a0d48534292e6d3a6a3e6dca60e798e8b8eeda2f8a8e
 md5=26f67d99666834cc579094619821d3c8
 sha256=035bbd4c1ac9c5b3a42e58777446e0370ca66d9258dc30a9f4c5ad48ebfacd65
 
+[http://kernel.org/pub/linux/kernel/v2.6/testing/patch-2.6.30-rc1.bz2]
+md5=05daeda25430fd13bbdb47b3481f7320
+sha256=5ed217591fefb043f4deb7b66a9b6351195dfb9405c0d2f5ec0f4d43a30aa9b2
+
 [http://www.muru.com/linux/omap/patches/patch-2.6.9-omap1.bz2]
 md5=d6249654087f0bcafaa860ac573316a4
 sha256=91806347cb386002a8bfd20ee66e536e4a7dfb01f207dd751341f2971090d9ac
@@ -18214,6 +18358,10 @@ sha256=362e4b4473f2f7a3bfa28ea73e80ec00a2fe525a1aceb5f66e1c528a900bd735
 md5=b97d3a725ab93662adf09acfbc49efeb
 sha256=56fc9e6324539537324b071e5b51c3388df9bfa92fb7e210b989b463122fc333
 
+[https://alioth.debian.org/frs/download.php/2795/pcsc-lite-1.5.2.tar.bz2]
+md5=d7d466621bec39354351f09349f6374c
+sha256=a0c11b0b5cc46d4c4ec499b875cfdc4e766fdf12fe2f6ea635e1b11ab7b8821e
+
 [http://handhelds.org/~zecke/oe_packages/pdamaze_V1.0.0.tar.gz]
 md5=bf27dd51fe03c8b475080b74de043a13
 sha256=99d6bc6b360baabd6044e8883d467cc6ed7955f9ab66d8f87f61e3cc757fb97a
@@ -18634,6 +18782,10 @@ sha256=91f75eb29c07271fcbfa2082c8300690efe4a72f2fbf35dace98108b0c6f7ba3
 md5=b05e1d7f0cac9cc4e096aa21409dee55
 sha256=91f75eb29c07271fcbfa2082c8300690efe4a72f2fbf35dace98108b0c6f7ba3
 
+[ftp://ftp-archives.postgresql.org/pub/source/v8.2.4/postgresql-8.2.4.tar.bz2]
+md5=af7ec100a33c41bfb8d87b5e0ec2f44a
+sha256=8ff6afab743e894c0d96e668dcf9b3d3c1044719d6def45ef7390c64b54ed268
+
 [http://www.povray.org/redirect/www.povray.org/ftp/pub/povray/Official/Unix/povray-3.6.1.tar.bz2]
 md5=b5789bb7eeaed0809c5c82d0efda571d
 sha256=4e8a7fecd44807343b6867e1f2440aa0e09613d6d69a7385ac48f4e5e7737a73
@@ -20366,6 +20518,10 @@ sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
 md5=797ea136fe43e4286c9362ee4516674e
 sha256=1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed
 
+[http://trac.luon.net/data/ruby-dbus/releases/ruby-dbus-0.2.1.tar.gz]
+md5=1f6398d8bbafa272c0b43878fec43276
+sha256=cfcadc4ae860f2de3d6aa1a1230a410b1dedf783148a27a20205bb3b54e3c3ac
+
 [http://rxtx.qbang.org/pub/rxtx/rxtx-2.1-7r2.zip]
 md5=9290b4832d46199f8d798a531209640b
 sha256=31db3852a86105766758975519b27d262407c96cacad4f34ad0de5aae26addd9
@@ -21130,6 +21286,10 @@ sha256=489bb2f9fb69922e9befc27ae1b8d19d31c83c586f55b7ecc503cb4f5e767da4
 md5=6df271fd6a92d7641d7b060dedf7fec6
 sha256=7eedc4ece1c82668c06222ef85457206139253e24a50e5b5d2401a41baee28c1
 
+[http://www.dest-unreach.org/socat/download/Archive/socat-1.3.2.1.tar.bz2]
+md5=860fe417ea5e9ca2d2b2225192b85b87
+sha256=ecfbca297c26eff6cb04c2c45af1ee5c21d4a123a05f8b056a1c81ffcdfa1e3a
+
 [http://www.dest-unreach.org/socat/download/socat-1.3.2.1.tar.bz2]
 md5=860fe417ea5e9ca2d2b2225192b85b87
 sha256=ecfbca297c26eff6cb04c2c45af1ee5c21d4a123a05f8b056a1c81ffcdfa1e3a
@@ -22630,6 +22790,14 @@ sha256=8ab07cd758a1775642629e624f70e376fa8e84a2f879dee4544158d9c90cde2a
 md5=ca12b805b4f2bdcf15733be3fe22e896
 sha256=096aa286d923b7cc356bbe0dda0a29a701369deeb27ada1a2f053155aa403c31
 
+[ftp://ftp.denx.de/pub/u-boot/u-boot-2008.10.tar.bz2]
+md5=9d7758c475068a8452430f18d1751566
+sha256=5cd64b5ac52720a7f60015e01696422277ecc459e89dce8b16d457f30a9409ab
+
+[ftp://ftp.denx.de/pub/u-boot/u-boot-2009.01.tar.bz2]
+md5=cb11d3d74eee4d31124523d90d8c31fa
+sha256=0c0afa2816482e087987f71958b656ff0c122032f5e3897a8d17daca5bc14115
+
 [http://linux.omap.com/pub/bootloader/2430sdp/source/u-boot-SEP1106.tar.gz]
 md5=49c07dec9e1be69fd01d46f47ec03731
 sha256=a090786113b02647413ebc15888af269f2e6d50f73cbb94b0619cc1702911dae
@@ -23098,6 +23266,10 @@ sha256=7f2f0492b0e1f9f96bd416e6c7a34e77c46faa20eeaff28c81c5932c91534ffc
 md5=5e6c4ce07091725d9afdac7cf00e553c
 sha256=d0425be8572be85b8a7ae802a19bcb73fdeac74906f7bcbbc129697ea6a86f3a
 
+[http://download.gnome.org/sources/vala/0.6/vala-0.6.0.tar.bz2]
+md5=9e5888a79757eb0f47df118b39762ed6
+sha256=9d1cb3661e6c15059e4eecce323b3f118c243d1f17a1883e2b2d7ca0a16987e5
+
 [http://www.valgrind.org/downloads/valgrind-3.2.1.tar.bz2]
 md5=9407d33961186814cef0e6ecedfd6318
 sha256=7f9a15d7be16ca03a0912191e8d55a486bf69690e11bb76ccece3eaff3730a33
@@ -23358,6 +23530,10 @@ sha256=c762525fdbf5f5dd32c6c950f2a63d8c1b15ec3dc7afca5d2dc3dbd1b129a00d
 md5=66480128b9dabcced2e4c8db3e60fa50
 sha256=6c5bfb2edae5c289233b6cd65393bb7414a2d30ad4d1239c207a659a4232d91a
 
+[http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog-5.6.tar.gz]
+md5=6df285569dd1d85528b983c98c9b2b7c
+sha256=a2c7d6726e092315dbb047211b754528e4532521678a30e16f60a31bb86a7f74
+
 [http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog_5.3.1.tar.gz]
 md5=ba97ddce396bfccd8d409bc3141d7ef4
 sha256=b7bf9feeedea26d7e06935369a1a556089426e94f9ead946018526c96cd9b12e
@@ -23666,6 +23842,10 @@ sha256=b31c3bc4e85e7f972db1dfb7b447d213694569e2a5794a84116295c334a11f43
 md5=43cbe5c7508f7dc3e141c346a897fbe7
 sha256=b31c3bc4e85e7f972db1dfb7b447d213694569e2a5794a84116295c334a11f43
 
+[http://downloads.sourceforge.net/wxwindows/wxWidgets-2.8.10.tar.gz]
+md5=05b32ca051651f4b1885a90f62969faf
+sha256=4a65573bc12e15b21a4acdce89e7e6b71edbe214817457f90fcf855220bafe66
+
 [http://downloads.sourceforge.net/wxwindows/wxWidgets-2.8.9.tar.gz]
 md5=3ad40ea2b1728eefa94f60beb9951ff7
 sha256=9b4096bb1e273914adf101182c27d457f46fcc44d1b3ea027bae3d34ace8c6f7
@@ -25694,25 +25874,9 @@ sha256=5e3db5f2387457f67798d664ed67c67337d2f84c45f15d986ee2f46f9b45d0d1
 md5=d12efb18c7e3025c5e6a6f63144c2145
 sha256=b968a10f52b0c5e807ec4c2c106f3aea301cf0ac00d04299b6961370c82c66d8
 
-[http://downloads.sourceforge.net/xine/xine-lib-1.0.tar.gz]
-md5=96e5195c366064e7778af44c3e71f43a
-sha256=6a283d383358200a9d6866d5d666a0227c8412d9c33d41f166f39c011482aed4
-
-[http://heanet.dl.sourceforge.net/sourceforge/xine/xine-lib-1.0.tar.gz]
-md5=96e5195c366064e7778af44c3e71f43a
-sha256=6a283d383358200a9d6866d5d666a0227c8412d9c33d41f166f39c011482aed4
-
-[http://heanet.dl.sourceforge.net/xine/xine-lib-1.0.tar.gz]
-md5=96e5195c366064e7778af44c3e71f43a
-sha256=6a283d383358200a9d6866d5d666a0227c8412d9c33d41f166f39c011482aed4
-
-[http://downloads.sourceforge.net/xine/xine-lib-1.1.0.tar.gz]
-md5=3537cfd58d253b4be20a4975e7086e38
-sha256=795085a067b3a11c1b3de48b4d07b01d8ffb6123bd188a73cb53b0605f875c64
-
-[http://heanet.dl.sourceforge.net/xine/xine-lib-1.1.0.tar.gz]
-md5=3537cfd58d253b4be20a4975e7086e38
-sha256=795085a067b3a11c1b3de48b4d07b01d8ffb6123bd188a73cb53b0605f875c64
+[http://downloads.sourceforge.net/xine/xine-lib-1.1.16.tar.bz2]
+md5=acd1a210c5a6444e8fd44696469352bb
+sha256=27df9c8f962797b235d69154705cfdf18d3e325f028f54e3e804f6dadb8237be
 
 [http://folks.o-hand.com/dodji/0xdeadbabe/xine.tgz]
 md5=8b78ce490cde6eb3c586656e9bc5ead8
@@ -26790,6 +26954,14 @@ sha256=81a5c8b74f100d7444356895f745321de53398f70e83b69f8284b0bf63c99ad0
 md5=ae1f9198544d1585f44dab7bab110ae3
 sha256=28e73da5403faad322022e8fb327f99677841d26396a1a1f1e854c768b47cf7c
 
+[http://pypi.python.org/packages/source/z/zope.interface/zope.interface-3.3.0.tar.gz]
+md5=93668855e37b4691c5c956665c33392c
+sha256=c049ef6f0748a2db26c7d01de1566e52f048e5fa6fbbb8da90c43e55597a5075
+
+[http://pypi.python.org/packages/source/z/zope.interface/zope.interface-3.5.1.tar.gz]
+md5=685fc532550abb07cca6190c9cd2b901
+sha256=b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0
+
 [http://downloads.sourceforge.net/zrally/zrally_0.90_src.tar.gz]
 md5=7084c0d2b28108563ca45e5ec1533ba1
 sha256=c4fb0477fdc110b63d867ae2a46cca7913fa6a0ca8bf574c7189329bea91dcdf
-- 
1.6.1



