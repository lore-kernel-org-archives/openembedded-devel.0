Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JY38C-0000CE-2L
	for openembedded-devel@openembedded.org; Sat, 08 Mar 2008 18:46:55 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JY36U-0005P0-Ry
	for openembedded-devel@openembedded.org; Sat, 08 Mar 2008 17:45:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 08 Mar 2008 17:45:02 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 08 Mar 2008 17:45:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sat, 08 Mar 2008 18:40:29 +0100
Message-ID: <fquj2d$jik$2@ger.gmane.org>
References: <47D2B73F.7070905@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47D2B73F.7070905@gmx.de>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: move do_deploy to kernel.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Mar 2008 17:46:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas Kunze schreef:
| Hi,
|
| currently nearly every kernel recipe implements do_deploy and nearly all
| implementations are the same. This patch moved do_deploy to
| kernel.bbclass and updates all kernel recipes to use or override it.
| Please have a look if the change this makes to your kernel recipe is ok
| for you. IMO it would be best if you modify your kernel recipe how you
| need it after this is commited. If nobody objects I will commit this
| next Friday (mar 14th).

+1 from me

regards,

Koen

| Regards,
| Thomas
|
| Change to kernel.bbclass:
| #
| # old_revision [2c5004d72a3f70fdae1b53fd5cfe6b9ba04648c1]
| #
| # patch "classes/kernel.bbclass"
| #  from [34b802297a875fd3c77c50d0aac3270b57374764]
| #    to [abc44d342bd8bced4334f5d46986ca991c5de524]
| #
| ============================================================
| --- classes/kernel.bbclass    34b802297a875fd3c77c50d0aac3270b57374764
| +++ classes/kernel.bbclass    abc44d342bd8bced4334f5d46986ca991c5de524
| @@ -448,3 +448,20 @@ addtask sizecheck before do_install afte
|  }
|
|  addtask sizecheck before do_install after do_compile
| +
| +KERNEL_CUSTOM_NAME ?= ""
| +KERNEL_DEPLOY_NAME ?=
|
"${KERNEL_IMAGETYPE}-${PV}-${KERNEL_CUSTOM_NAME}${MACHINE}-${DATETIME}.bin"
| +KERNEL_SYMLINK_NAME ?=
| "${KERNEL_IMAGETYPE}-${KERNEL_CUSTOM_NAME}${MACHINE}.bin"
| +
| +do_deploy() {
| +        install -d ${DEPLOY_DIR_IMAGE}
| +        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOY_NAME}
| +        cd ${DEPLOY_DIR_IMAGE}
| +        ln -sf ${KERNEL_DEPLOY_NAME} ${KERNEL_SYMLINK_NAME}
| +        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_VERSION}-${MACHINE}.tgz -C ${D} lib
| +}
| +
| +do_deploy[dirs] = "${S}"
| +
| +addtask deploy before do_build after do_install
| +
|
| Updated kernel recipes:
|
| #
| # old_revision [2c5004d72a3f70fdae1b53fd5cfe6b9ba04648c1]
| #
| # patch "packages/linux/LAB-kernel_2.6.13-hh2.bb"
| #  from [21b2c94a538b886075cdc74ca6cbd4087628ced1]
| #    to [b002cb973f244bc75f9b945cd68649b4b4335194]
| #
| # patch "packages/linux/LAB-kernel_cvs.bb"
| #  from [85c1fa63bcdd31dc57b94a7a4cd03e467fa9a727]
| #    to [dd491dc46c9e352733c6c787089615563652e05d]
| #
| # patch
|
"packages/linux/collie-kernel-58-6-debug_2.4.18-rmk7-pxa3-embedix20030509.bb"
| #  from [95b4838142802f9a9d5f2e61083b8c8443be384a]
| #    to [af2e23147953c72fbe11139bc662acc68a851386]
| #
| # patch "packages/linux/compulab-pxa270_2.6.16.bb"
| #  from [4694fb75afe6c5d1011a87d7d09c2782c995d519]
| #    to [fa86f15440d0479a564c2773414e1d2c76c7e920]
| #
| # patch "packages/linux/devkitidp-pxa255_2.6.19.bb"
| #  from [ddf60a124917dd197f6cf08a76fb02087ce033eb]
| #    to [6f4563aedfe64b87c82b6dc7c0d6e90fdacc8cab]
| #
| # patch "packages/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb"
| #  from [1b6e37dd7b8a233d87a5541a13384e0b92f09551]
| #    to [5031c9fb4373c6f949b0c85bbda5305e227dfdb5]
| #
| # patch "packages/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb"
| #  from [a452af7d69c3d884966354e28c8547c6bcb16b6b]
| #    to [acd4c53c81aaf43edc2f230f348f69eda3f70e43]
| #
| # patch "packages/linux/gumstix-linux.inc"
| #  from [acaefbd2b36224f66b5c0a9bd39662ebd6ee39eb]
| #    to [feea1bd4c6e30be720a72d037d44c0c9ad618238]
| #
| # patch "packages/linux/ixp4xx-kernel.inc"
| #  from [7fdde9d51b8e3fe0cc0eb9518098902d6281e3da]
| #    to [1c543d21550db4363f5a641dde67e2ad1e97ceba]
| #
| # patch "packages/linux/linux-amsdelta-2.6_2.6.16-omap2.bb"
| #  from [05eaab60785d5e05e846f30e1b3fa346b7af411e]
| #    to [4c819243042158bd1a4c87bf8c36344ea96d3045]
| #
| # patch "packages/linux/linux-bd-neon-2.6_2.6.22.bb"
| #  from [457d040120a5884806bf1ae597512aa6e951e1fa]
| #    to [a2bfe10ed6b0e5bdd5aaa2f2019de3b615446e6d]
| #
| # patch "packages/linux/linux-efika_2.6.18+2.6.19-rc6.bb"
| #  from [9854e7470109cece86c7335b8261fa4a6c33df31]
| #    to [65d32086c4f2a2fd71ffdc217f0beb3c9bf80190]
| #
| # patch "packages/linux/linux-efika_2.6.20.20.bb"
| #  from [01117a66cc290abe28c789551dafbdaadaf2e6df]
| #    to [1b3165d039493374e1176f8516664086f9960c04]
| #
| # patch "packages/linux/linux-efika_2.6.20.bb"
| #  from [26eb3e8b2f654dac6975e04c0e7c078417623da6]
| #    to [447aa0867df1051856747635b708dc10d80ae07d]
| #
| # patch "packages/linux/linux-efika_2.6.21+git.bb"
| #  from [1d96763c1bba903c9753ae5d85530485bea1668d]
| #    to [30b2f23a4a0e7e68bc130053fa9b6f609f21478c]
| #
| # patch "packages/linux/linux-gumstix_2.6.15.bb"
| #  from [5e35bf29285ac1fbc0b075f0367bc1a8d88b3b3b]
| #    to [a9dcc2306672c2a32d8248a651f08f6309ecb346]
| #
| # patch "packages/linux/linux-hackndev-2.6_git.bb"
| #  from [64dc1851d5ce9033729f0f42a60d0fd078db1f7e]
| #    to [b62689b2d0b627662ac88b31cc5e0ca3e70a2988]
| #
| # patch "packages/linux/linux-handhelds-2.6.inc"
| #  from [319b768a94bcc0a36290ba995d6ed819cff470fd]
| #    to [8434d46e4e16b5664c8dd275abb2c70377ddd970]
| #
| # patch "packages/linux/linux-jlime-jornada6xx_2.6.11.bb"
| #  from [e5690ef11fcf56b6afea05914a8d0cc43fdd8ddd]
| #    to [8701602e073cfec86ea4b730e72843960b581eff]
| #
| # patch "packages/linux/linux-jlime-jornada6xx_2.6.17.bb"
| #  from [1812cd357f386bde56fd123ad05f999bfbfc523f]
| #    to [c3b6a4ec701ddf7c906f5c56d41787d0eae6b7e0]
| #
| # patch "packages/linux/linux-jlime-jornada6xx_2.6.21rc5.bb"
| #  from [d8e50205bd984595d687ef8c1029648c350148b2]
| #    to [8cb1c02737fccfbd18ef9b7e890f9f9152132b3a]
| #
| # patch "packages/linux/linux-jlime-jornada7xx_2.6.17.bb"
| #  from [118cea8f14b2829631e191683adac8664625d2dc]
| #    to [e033eb2983af7d03a9ac98af426feca0ec65bad3]
| #
| # patch "packages/linux/linux-jlime-jornada7xx_2.6.18.bb"
| #  from [90de1d3f21ac6715b8d8969408329c528a928370]
| #    to [d7409d15e42998b92eb516f4caeed2ede1a369ce]
| #
| # patch "packages/linux/linux-jlime-jornada7xx_2.6.19rc6.bb"
| #  from [6677636ce3a207ec5a71b92b00c6a6b00c6164e3]
| #    to [1f4de47323d653696880f2063c3bbb9419734bca]
| #
| # patch "packages/linux/linux-ks8695_2.6.16.bb"
| #  from [e5f8049819e2048b2ea04c0f1163f86c9d33187e]
| #    to [a151e37da5f5309a73cb8f2f647cb9dd18c360a5]
| #
| # patch "packages/linux/linux-linkstationarm_2.6.12.bb"
| #  from [5c531f3ff8db593954394d2cd7b0bbf6d5f3c034]
| #    to [d873cf0f98336a86a2b1f99323ed0ad066a9a28a]
| #
| # patch "packages/linux/linux-linkstationppc_2.6.21-rc5.bb"
| #  from [679383825421e632b5d7cc7a4a1a719a3b8a403a]
| #    to [36ab9771ef868ea66b40030e8f8d7f05d12e011d]
| #
| # patch "packages/linux/linux-ml403-mvista-2.6.x_git.bb"
| #  from [1627e847f526fa7073747ec037b61f626f96352f]
| #    to [8efa468a1f3367d18a20c3260f90ada47a76f98d]
| #
| # patch "packages/linux/linux-ml403-slab-2.6.x_git.bb"
| #  from [5030af659ba81e0fd39cabcfe458111ae1646763]
| #    to [1dedc8ec0ccb14b25d9979db1e4af75c63668f9a]
| #
| # patch "packages/linux/linux-mtx-1_2.4.27.bb"
| #  from [5aa527007e73fd6ebd969c021abff9f8573dd189]
| #    to [e8855b47883bee538c1e4684e6b9f9dc3e08ef95]
| #
| # patch "packages/linux/linux-mtx-2_2.4.27.bb"
| #  from [478bed2951d5bfe4a59968087493fe96a1428770]
| #    to [a11f8e9e2f3b400405bc1d4c54e6c4c39230bccc]
| #
| # patch "packages/linux/linux-mtx-3_2.6.15.4.bb"
| #  from [a34093b088a5da3a33502d715235b1e1171292de]
| #    to [ad810bd1e8c7703133e23ecb7babf7af0673ec51]
| #
| # patch "packages/linux/linux-mtx-3_2.6.15.bb"
| #  from [d7111648056223fa630144eb7ea690dde9d02136]
| #    to [3fe52943fbf0066681c0d6374c516fc5f119b194]
| #
| # patch "packages/linux/linux-navman_2.6.18.bb"
| #  from [170d50b807364f5b39aaf8a74d85700e2d5ef059]
| #    to [7222348b888446c23fe8b1cebabd4b5f8f3ebce0]
| #
| # patch "packages/linux/linux-nokia800.inc"
| #  from [c099bf50d2367d56a7a7f92d7972a909ef3f1c8b]
| #    to [e115eb464fd01dc9fb6240cf410d23831cdb0c3f]
| #
| # patch "packages/linux/linux-omap-2.6_2.6.9-omap1.bb"
| #  from [0fc02f33bb0974e2ef2525856bf1a22ed9a550c0]
| #    to [16a16b7a279d8e82b110426ced8e7a09e343504f]
| #
| # patch "packages/linux/linux-omap.inc"
| #  from [511a21147c331fc26f3e5848413c000974a7fedd]
| #    to [8d1b4e76cfc047cf84efee4c9fe9da7e8ac020b7]
| #
| # patch "packages/linux/linux-palm-omap1_2.6.22-omap1.bb"
| #  from [09c462b9df4a65761d04ae252b5156bbe024c54a]
| #    to [6d3623af6e48ee147a8cf8e33bd7c3f9bf501ad7]
| #
| # patch "packages/linux/linux-rp.inc"
| #  from [955d75bfe07f7f78a1bb382972543be8f55ae216]
| #    to [8efe110a0206f0bcff50da5554603214a407b8fe]
| #
| # patch "packages/linux/linux-sequoia_2.6.21.bb"
| #  from [5dc8ca7fe3e92accabff7e6dc3d9d28540f8839b]
| #    to [d413717f8bcba9bb60c8c1a6428744aadfda32fa]
| #
| # patch "packages/linux/linux-smdk2440_2.6.20+git.bb"
| #  from [c6bddc2c20ea68b01d4e8457000fdb982a675840]
| #    to [c1a3ee438ab00d04db3a09863dd5d44c44d509a2]
| #
| # patch "packages/linux/linux-smdk2443_2.6.20+git.bb"
| #  from [43c2952116b3749fac68666c3f67f36bf48154fe]
| #    to [d1486129501571f3ec91eb5d75702829a1bf928e]
| #
| # patch "packages/linux/linux-storcenter_2.6.12.6.bb"
| #  from [2d88bee5909e832293186264642aaaa6f6d15e7d]
| #    to [aebb2189821031a5a3dee099c03be9c702721041]
| #
| # patch "packages/linux/linux-storcenter_2.6.15.7.bb"
| #  from [c8d13191b10ec42a45a1dac552bc747a241b24ad]
| #    to [f4a0cbe23d6cb597b8fadc822741c3743ac8af83]
| #
| # patch "packages/linux/linux-sun4cdm_2.4.26.bb"
| #  from [dfbb8a3b7ce6381ef53c89ac9cc012925ee2d088]
| #    to [cb7b79292f0df562d042c5d11e26f4f9f3b1684f]
| #
| # patch "packages/linux/linux-tornado-omap2_2.6.16.16.bb"
| #  from [a735d9e07c77baf8fa31bb48cda83957ab6af590]
| #    to [2abc45d9ddbe360fdd17e53fa7dd355e2edf56d5]
| #
| # patch "packages/linux/linux-turbostation_2.6.20.2.bb"
| #  from [abd711d81a65da03e4199ceaf85703d9c052a26b]
| #    to [7897027767e57ffa7b287bcb8ffd5846e74e6fb2]
| #
| # patch "packages/linux/linux-wrt_2.4.20.bb"
| #  from [ce82a3361914a1863ec5646e35eb6492f5babb69]
| #    to [e74b100f98b6d06e1178e06ac84707dc3ea720ca]
| #
| # patch "packages/linux/linux-wrt_2.4.30.bb"
| #  from [fe9df0285b627d50369b865bce0ec5e3c3756664]
| #    to [e6fb2a6757c20d6db3711f1c4b100d280955766e]
| #
| # patch "packages/linux/linux-x86_2.6.20.bb"
| #  from [373dff7be9a2cb86fd01661a2204fcbebf1c8427]
| #    to [c3d12343d14667cacd6610f043b0754e84524af5]
| #
| # patch "packages/linux/linux-xxs1500_2.4.21.bb"
| #  from [50ad158a5e60cb7c35b3482d7433fb7b8edf6a9f]
| #    to [4c3804df17204b8a2d8c9cfeecb854c9fd442b7e]
| #
| # patch "packages/linux/linux.inc"
| #  from [eeaa90a02ec1d98a0a19b42de93dd613867bea9b]
| #    to [4e66c3bdf1bbb4352e37398df0c2a52c07a31abb]
| #
| # patch "packages/linux/logicpd-pxa270_2.6.17-rc5.bb"
| #  from [9fab46f9b5a54dc6a7f752e4fefaff2e81d1f54d]
| #    to [9a2aa6a59d9c5a88fb3c8f6d2799f1770f5c1639]
| #
| # patch "packages/linux/logicpd-pxa270_2.6.19.2.bb"
| #  from [3e9ccae6c92fe9092727de6d7d781be339abbb88]
| #    to [9fbc51193472073bf35723abf0347dacb07f96ba]
| #
| # patch "packages/linux/mainstone-kernel_2.6.11.bb"
| #  from [d5a9b182d8e86b8f4b7b579cdfcfe40bf7616703]
| #    to [6b6f689b5f536ee641091f47d602e47e356dcf95]
| #
| # patch "packages/linux/mx21ads-kernel_2.6.19rc6.bb"
| #  from [eb89e283bb375e8deefb9398a9f77334e4b32a4d]
| #    to [77940b31b7200a1e72b9b0131f0a42bbf0a79b4d]
| #
| # patch "packages/linux/mx31ads-kernel_2.6.19rc6.bb"
| #  from [3c6294ce239293d9c65f68e973f7ea4a89f122aa]
| #    to [4d45821e3959cca1cf0ec3e7c014bc8541d57f7d]
| #
| # patch "packages/linux/netbook-pro-kernel_2.6.17.bb"
| #  from [adcec4915e8ffc89681f8dd32ddca0cbcaed2d47]
| #    to [7adc49fa49c65c4f9d8ff3246f89df9f5cc5f455]
| #
| # patch "packages/linux/openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb"
| #  from [34b1ac44c6acbb17f968621b1dc6ca57af533195]
| #    to [43e599a840242fc71bf6e07c1e9a30fb453567b6]
| #
| # patch
"packages/linux/openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc"
| #  from [3b48e835c5b6a538db140840202ca3abd2bf5296]
| #    to [7d99efacb78551a1709a390b5a5b38d64a30a994]
| #
| # patch "packages/linux/openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb"
| #  from [bb5224a41360e3207277481ecfb4e71d69378231]
| #    to [b40023ab8faeb0abe963777565da486c0544ad81]
| #
| # patch "packages/linux/triton-kernel_2.6.11.bb"
| #  from [5c76121264ec80611a8d410d965dadb3d129cee5]
| #    to [a8a4f6fce50a1cb7d5bbb6ef284ee7a8eab0140f]
| #
| # patch "packages/linux/unslung-kernel_2.4.22.l2.3r63.bb"
| #  from [b5e796a22c471b4d8a343f091cd2a3b7e4dc99f5]
| #    to [d80969cb5ce2c41aeeb873a709ac754d4dba2494]
| #
| # patch "packages/linux/xanadux-un-2.6_2.6.12.bb"
| #  from [a63c9825f09a1bef04ed41c2ab3d9783328c0776]
| #    to [c78078aec8a4746eb843f76fd4c63d0875560a6f]
| #
| ============================================================
| --- packages/linux/LAB-kernel_2.6.13-hh2.bb
| 21b2c94a538b886075cdc74ca6cbd4087628ced1
| +++ packages/linux/LAB-kernel_2.6.13-hh2.bb
| b002cb973f244bc75f9b945cd68649b4b4335194
| @@ -26,12 +26,5 @@ do_configure() {
|          yes '' | oe_runmake oldconfig
|  }
|
| +KERNEL_DEPLOY_NAME = "LAB-image-${MACHINE}-${DATETIME}.bin"
| +KERNEL_SYMLINK_NAME = "LAB-image-${MACHINE}"
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/LAB-image-${MACHINE}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/LAB-kernel_cvs.bb
| 85c1fa63bcdd31dc57b94a7a4cd03e467fa9a727
| +++ packages/linux/LAB-kernel_cvs.bb
| dd491dc46c9e352733c6c787089615563652e05d
| @@ -51,19 +51,13 @@ do_configure() {
|          yes '' | oe_runmake oldconfig
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/LAB-image-${MACHINE}
| +KERNEL_DEPLOY_NAME = "LAB-image-${MACHINE}-${DATETIME}.bin"
| +KERNEL_SYMLINK_NAME =  "LAB-image-${MACHINE}^"
|
| +do_deploy_append() {
|      # Generate the HTC flavor, which must be a multiple of 512 bytes
long.
|      cat ${WORKDIR}/greatwall_header
| arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${WORKDIR}/greatwall_trailer | dd
| conv=sync of=${DEPLOY_DIR_IMAGE}/LAB-image-${MACHINE}.htc
|  }
|
|  do_stage() {
|  }
| -
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| ---
|
packages/linux/collie-kernel-58-6-debug_2.4.18-rmk7-pxa3-embedix20030509.bb

| 95b4838142802f9a9d5f2e61083b8c8443be384a
| +++
|
packages/linux/collie-kernel-58-6-debug_2.4.18-rmk7-pxa3-embedix20030509.bb

| af2e23147953c72fbe11139bc662acc68a851386
| @@ -1,11 +1,8 @@ require ../linux/openzaurus-sa_2.4.18-rm
|  COLLIE_MEMORY_SIZE = "58"
|  COLLIE_RAMDISK_SIZE = "6"
|  KERNEL_CONSOLE = "tty0"
|
|  require ../linux/openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb
|
| +KERNEL_DEPLOY_NAME =
|
"${KERNEL_IMAGETYPE}-${MACHINE}-${COLLIE_MEMORY_SIZE}-${COLLIE_RAMDISK_SIZE}-DEBUG-${DATETIME}.bin"
| +KERNEL_SYMLINK_NAME =
|
"${KERNEL_IMAGETYPE}-${MACHINE}-${COLLIE_MEMORY_SIZE}-${COLLIE_RAMDISK_SIZE}-DEBUG.bin"
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} \
| -
|
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${COLLIE_MEMORY_SIZE}-${COLLIE_RAMDISK_SIZE}-DEBUG-${DATETIME}.bin
| -}
| ============================================================
| --- packages/linux/compulab-pxa270_2.6.16.bb
| 4694fb75afe6c5d1011a87d7d09c2782c995d519
| +++ packages/linux/compulab-pxa270_2.6.16.bb
| fa86f15440d0479a564c2773414e1d2c76c7e920
| @@ -31,12 +31,6 @@ do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/2.6.16/CL_FlashDrv
| ${S}/drivers/block/cl_flash
|  }
|
| -do_deploy() {
| -    KNAME=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${KNAME}
| -}
| -
|  python do_compulab_image() {
|      import os
|      import os.path
| @@ -62,11 +56,7 @@ python do_compulab_image() {
|      fo.close()
|  }
|
| +addtask compulab_image before do_build after do_deploy
|
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_install after do_compile
| -addtask compulab_image before do_install after do_deploy
| -
|  COMPATIBLE_MACHINE = "cm-x270"
|
| ============================================================
| --- packages/linux/devkitidp-pxa255_2.6.19.bb
| ddf60a124917dd197f6cf08a76fb02087ce033eb
| +++ packages/linux/devkitidp-pxa255_2.6.19.bb
| 6f4563aedfe64b87c82b6dc7c0d6e90fdacc8cab
| @@ -28,12 +28,3 @@ do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig ${S}/.config
|  #    echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR}/images
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR}/images/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb
| 1b6e37dd7b8a233d87a5541a13384e0b92f09551
| +++ packages/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb
| 5031c9fb4373c6f949b0c85bbda5305e227dfdb5
| @@ -43,14 +43,3 @@ do_configure() {
|
|
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb
| a452af7d69c3d884966354e28c8547c6bcb16b6b
| +++ packages/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb
| acd4c53c81aaf43edc2f230f348f69eda3f70e43
| @@ -42,15 +42,3 @@ do_configure() {
|
|
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install
| -
| -
| -
| ============================================================
| --- packages/linux/gumstix-linux.inc
| acaefbd2b36224f66b5c0a9bd39662ebd6ee39eb
| +++ packages/linux/gumstix-linux.inc
| feea1bd4c6e30be720a72d037d44c0c9ad618238
| @@ -9,8 +9,6 @@ DEPENDS += " \
|             u-boot-mkimage-openmoko-native \
|            "
|
| -KERNEL_IMAGE_BASE_NAME = ${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}
| -
|  S = "${WORKDIR}/linux-${PV}"
|  do_deploy[dirs] = "${S}"
|
| @@ -45,17 +43,11 @@ do_install_prepend() {
|          fi
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
| -        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_RELEASE}-${PR}-${MACHINE}.tgz -C
| ${D} lib
| -
| +do_deploy_append() {
|          if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
|              ${OBJCOPY} -O binary -R .note -R .comment -S
| arch/${ARCH}/boot/compressed/vmlinux linux.bin
| -            uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a
| ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n
| "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
| +            uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a
| ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n
| "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin
| ${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOY_NAME}.bin
|              rm -f linux.bin
|
|          fi
|  }
| -
| -addtask deploy before do_package after do_install
| ============================================================
| --- packages/linux/ixp4xx-kernel.inc
| 7fdde9d51b8e3fe0cc0eb9518098902d6281e3da
| +++ packages/linux/ixp4xx-kernel.inc
| 1c543d21550db4363f5a641dde67e2ad1e97ceba
| @@ -353,8 +353,6 @@ do_install_append() {
|      install_image 'fsg3${SITEINFO_ENDIANESS}' 'fsg3'
|  }
|
| -do_deploy[dirs] = "${S}"
| -
|  deploy_image() {
|      copy_image '${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-'"$1" "$2"
|  }
| @@ -369,5 +367,3 @@ do_deploy() {
|      deploy_image 'dsmg600${SITEINFO_ENDIANESS}' 'dsmg600'
|      deploy_image 'fsg3${SITEINFO_ENDIANESS}' 'fsg3'
|  }
| -
| -addtask deploy before do_package after do_install
| ============================================================
| --- packages/linux/linux-amsdelta-2.6_2.6.16-omap2.bb
| 05eaab60785d5e05e846f30e1b3fa346b7af411e
| +++ packages/linux/linux-amsdelta-2.6_2.6.16-omap2.bb
| 4c819243042158bd1a4c87bf8c36344ea96d3045
| @@ -32,12 +32,3 @@ do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig ${S}/.config
|          oe_runmake oldconfig
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-bd-neon-2.6_2.6.22.bb
| 457d040120a5884806bf1ae597512aa6e951e1fa
| +++ packages/linux/linux-bd-neon-2.6_2.6.22.bb
| a2bfe10ed6b0e5bdd5aaa2f2019de3b615446e6d
| @@ -32,17 +32,10 @@ do_configure() {
|          yes '' | oe_runmake oldconfig
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}.bin
| -        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_RELEASE}-${PR}-${MACHINE}.tgz -C
| ${D} lib
| +do_deploy_append() {
|          ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
|          rm -f linux.bin.gz
|          gzip -9 linux.bin
|          ${STAGING_BINDIR_NATIVE}/mkimage -A arm -O linux -T kernel -C
| gzip -a a0008000 -e a0008000 -n "Boundary Devices NEON" -d linux.bin.gz
| ${DEPLOY_DIR_IMAGE}/uImage-${PV}-${PR}-${MACHINE}.bin
|          rm -f linux.bin.gz
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install
| ============================================================
| --- packages/linux/linux-efika_2.6.18+2.6.19-rc6.bb
| 9854e7470109cece86c7335b8261fa4a6c33df31
| +++ packages/linux/linux-efika_2.6.18+2.6.19-rc6.bb
| 65d32086c4f2a2fd71ffdc217f0beb3c9bf80190
| @@ -24,14 +24,3 @@ do_configure() {
|          install -m 644 ${WORKDIR}/defconfig ${S}/.config
|          yes | make ARCH=${ARCH} oldconfig
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-efika_2.6.20.20.bb
| 01117a66cc290abe28c789551dafbdaadaf2e6df
| +++ packages/linux/linux-efika_2.6.20.20.bb
| 1b3165d039493374e1176f8516664086f9960c04
| @@ -70,14 +70,3 @@ do_stage_append () {
|         cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
|         cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-efika_2.6.20.bb
| 26eb3e8b2f654dac6975e04c0e7c078417623da6
| +++ packages/linux/linux-efika_2.6.20.bb
| 447aa0867df1051856747635b708dc10d80ae07d
| @@ -67,16 +67,3 @@ do_stage_append () {
|         cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
|         cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
|  }
| -
| -
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-efika_2.6.21+git.bb
| 1d96763c1bba903c9753ae5d85530485bea1668d
| +++ packages/linux/linux-efika_2.6.21+git.bb
| 30b2f23a4a0e7e68bc130053fa9b6f609f21478c
| @@ -54,14 +54,3 @@ do_stage_append () {
|         cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
|         cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-gumstix_2.6.15.bb
| 5e35bf29285ac1fbc0b075f0367bc1a8d88b3b3b
| +++ packages/linux/linux-gumstix_2.6.15.bb
| a9dcc2306672c2a32d8248a651f08f6309ecb346
| @@ -72,17 +72,13 @@ do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig-gumstix ${S}/.config
|  }
|
| -do_deploy() {
| +do_deploy_append() {
|          ${HOST_PREFIX}objcopy -O binary -R .note -R .comment -S
| arch/arm/boot/compressed/vmlinux arch/arm/boot/compressed/linux.bin
|          mkimage -A arm -O linux -T kernel -C none -a 0xa0008000 -e
| 0xa0008000 -n "gumstix" -d arch/arm/boot/compressed/linux.bin
| arch/arm/boot/uImage
|          install -d ${DEPLOY_DIR_IMAGE}
|          cp arch/arm/boot/uImage ${DEPLOY_DIR_IMAGE}/uImage-${PN}-${PV}
|  }
|
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  PACKAGES += "kernel-modules-sound kernel-modules-bluetooth
| kernel-modules-pcmcia kernel-modules-ide kernel-modules-ethernet
| kernel-modules-wireless kernel-modules-usb kernel-modules-mmc
| kernel-modules-fat kernel-modules-nfs"
|
|  ALLOW_EMPTY_kernel-modules-sound = "1"
| ============================================================
| --- packages/linux/linux-hackndev-2.6_git.bb
| 64dc1851d5ce9033729f0f42a60d0fd078db1f7e
| +++ packages/linux/linux-hackndev-2.6_git.bb
| b62689b2d0b627662ac88b31cc5e0ca3e70a2988
| @@ -73,13 +73,3 @@ do_compile_prepend() {
|                  cd -
|      fi
|  }
| -
| -do_deploy() {
| -    install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/linux-handhelds-2.6.inc
| 319b768a94bcc0a36290ba995d6ed819cff470fd
| +++ packages/linux/linux-handhelds-2.6.inc
| 8434d46e4e16b5664c8dd275abb2c70377ddd970
| @@ -23,8 +23,6 @@ KERNEL_PRIORITY = "${@'%d' % (int(bb.dat
|
|  KERNEL_PRIORITY = "${@'%d' % (int(bb.data.getVar('K_MAJOR',d,1)) *
| 100000000 + int(bb.data.getVar('K_MINOR',d,1)) * 1000000 +
| int(bb.data.getVar('K_MICRO',d,1)) * 10000 +
| float(bb.data.getVar('HHV',d,1)))}"
|
| -KERNEL_FILENAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}.bin"
| -
|  do_configure() {
|
|      if [ `grep EXTRAVERSION Makefile | grep hh | awk '{print $3}' | sed
| s/-hh//` != ${HHV} ]; then
| @@ -64,15 +62,11 @@ do_compile_prepend() {
|      fi
|  }
|
| -do_deploy() {
| -    install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_FILENAME}
| -    tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PR}-${MACHINE}.tgz -C
| ${D} lib
| -
| +do_deploy_append() {
|      #reflash.ctl is required to reflash using bootldr
|      # format:
|      # name file md5sumfile destination
| -    echo "${MACHINE}-kernel-${DATETIME} ${KERNEL_FILENAME} - kernel" >>
| ${DEPLOY_DIR_IMAGE}/reflash.ctl
| +    echo "${MACHINE}-kernel-${DATETIME} ${KERNEL_DEPLOY_NAME} - kernel"
|  >> ${DEPLOY_DIR_IMAGE}/reflash.ctl
|      gen_haret_startup
|
|      if [ -n "${KERNEL_INITRAMFS_PATH}" -a "${ANGSTROM_MODE}" == "glibc"
| ]; then
| @@ -90,7 +84,7 @@ gen_haret_startup() {
|  # This is startup file for HaRET, Linux bootloader for WinCE
|  # http://handhelds.org/wiki/HaRET
|
| -set kernel "${KERNEL_FILENAME}"
| +set kernel "${KERNEL_DEPLOY_NAME}"
|
|  # Boot choices. Uncomment 'set' statements in exactly one section
|
| ============================================================
| --- packages/linux/linux-jlime-jornada6xx_2.6.11.bb
| e5690ef11fcf56b6afea05914a8d0cc43fdd8ddd
| +++ packages/linux/linux-jlime-jornada6xx_2.6.11.bb
| 8701602e073cfec86ea4b730e72843960b581eff
| @@ -20,8 +20,3 @@ do_configure_prepend() {
|  do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig_jlime ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/$(ARCH)/boot/$(KERNEL_IMAGETYPE)
| $(DEPLOY_DIR)/images/$(KERNEL_IMAGETYPE)
| -}
| ============================================================
| --- packages/linux/linux-jlime-jornada6xx_2.6.17.bb
| 1812cd357f386bde56fd123ad05f999bfbfc523f
| +++ packages/linux/linux-jlime-jornada6xx_2.6.17.bb
| c3b6a4ec701ddf7c906f5c56d41787d0eae6b7e0
| @@ -27,8 +27,3 @@ do_configure_prepend() {
|  do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig_jlime ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/$(ARCH)/boot/$(KERNEL_IMAGETYPE)
| $(DEPLOY_DIR)/images/$(KERNEL_IMAGETYPE)
| -}
| ============================================================
| --- packages/linux/linux-jlime-jornada6xx_2.6.21rc5.bb
| d8e50205bd984595d687ef8c1029648c350148b2
| +++ packages/linux/linux-jlime-jornada6xx_2.6.21rc5.bb
| 8cb1c02737fccfbd18ef9b7e890f9f9152132b3a
| @@ -25,8 +25,3 @@ do_configure_prepend() {
|  do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/$(ARCH)/boot/$(KERNEL_IMAGETYPE)
| $(DEPLOY_DIR)/images/$(KERNEL_IMAGETYPE)
| -}
| ============================================================
| --- packages/linux/linux-jlime-jornada7xx_2.6.17.bb
| 118cea8f14b2829631e191683adac8664625d2dc
| +++ packages/linux/linux-jlime-jornada7xx_2.6.17.bb
| e033eb2983af7d03a9ac98af426feca0ec65bad3
| @@ -35,8 +35,3 @@ do_configure_prepend() {
|  do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconf_jlime ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/$(ARCH)/boot/$(KERNEL_IMAGETYPE)
| $(DEPLOY_DIR)/images/$(KERNEL_IMAGETYPE)
| -}
| ============================================================
| --- packages/linux/linux-jlime-jornada7xx_2.6.18.bb
| 90de1d3f21ac6715b8d8969408329c528a928370
| +++ packages/linux/linux-jlime-jornada7xx_2.6.18.bb
| d7409d15e42998b92eb516f4caeed2ede1a369ce
| @@ -23,8 +23,3 @@ do_configure_prepend() {
|  do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconf_jlime ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/$(ARCH)/boot/$(KERNEL_IMAGETYPE)
| $(DEPLOY_DIR)/images/$(KERNEL_IMAGETYPE)
| -}
| ============================================================
| --- packages/linux/linux-jlime-jornada7xx_2.6.19rc6.bb
| 6677636ce3a207ec5a71b92b00c6a6b00c6164e3
| +++ packages/linux/linux-jlime-jornada7xx_2.6.19rc6.bb
| 1f4de47323d653696880f2063c3bbb9419734bca
| @@ -25,8 +25,3 @@ do_configure_prepend() {
|  do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconf_jlime ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/$(ARCH)/boot/$(KERNEL_IMAGETYPE)
| $(DEPLOY_DIR)/images/$(KERNEL_IMAGETYPE)
| -}
| ============================================================
| --- packages/linux/linux-ks8695_2.6.16.bb
| e5f8049819e2048b2ea04c0f1163f86c9d33187e
| +++ packages/linux/linux-ks8695_2.6.16.bb
| a151e37da5f5309a73cb8f2f647cb9dd18c360a5
| @@ -23,12 +23,3 @@ do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig-${MACHINE} ${S}/.config
|      echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-linkstationarm_2.6.12.bb
| 5c531f3ff8db593954394d2cd7b0bbf6d5f3c034
| +++ packages/linux/linux-linkstationarm_2.6.12.bb
| d873cf0f98336a86a2b1f99323ed0ad066a9a28a
| @@ -24,13 +24,4 @@ do_configure() {
|      install -m 0644 ${WORKDIR}/defconfig ${S}/.config
|      ARCH=${ARCH} oe_runmake oldconfig
|  }
| +KERNEL_SYMLINK_NAME="vmlinux.UBoot"
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/vmlinux.UBoot
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/linux-linkstationppc_2.6.21-rc5.bb
| 679383825421e632b5d7cc7a4a1a719a3b8a403a
| +++ packages/linux/linux-linkstationppc_2.6.21-rc5.bb
| 36ab9771ef868ea66b40030e8f8d7f05d12e011d
| @@ -31,12 +31,4 @@ do_install_append() {
|      dtc -f -I dts -O dtb -o ${D}/boot/kuroboxHG.dtb -V 16
| arch/${ARCH}/boot/dts/kuroboxHG.dts
|      dtc -f -I dts -O dtb -o ${D}/boot/kuroboxHD.dtb -V 16
| arch/${ARCH}/boot/dts/kuroboxHD.dts
|  }
| +KERNEL_SYMLINK_NAME="vmlinux.UBoot"
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/vmlinux.UBoot
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-ml403-mvista-2.6.x_git.bb
| 1627e847f526fa7073747ec037b61f626f96352f
| +++ packages/linux/linux-ml403-mvista-2.6.x_git.bb
| 8efa468a1f3367d18a20c3260f90ada47a76f98d
| @@ -55,8 +55,3 @@ do_install_prepend() {
|          install -m 0644
arch/${ARCH}/boot/images/${KERNEL_IMAGETYPE}.elf \
|                          arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/linux-ml403-slab-2.6.x_git.bb
| 5030af659ba81e0fd39cabcfe458111ae1646763
| +++ packages/linux/linux-ml403-slab-2.6.x_git.bb
| 1dedc8ec0ccb14b25d9979db1e4af75c63668f9a
| @@ -78,8 +78,3 @@ do_install_prepend() {
|          install -m 0644
arch/${ARCH}/boot/images/${KERNEL_IMAGETYPE}.elf \
|                          arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/linux-mtx-1_2.4.27.bb
| 5aa527007e73fd6ebd969c021abff9f8573dd189
| +++ packages/linux/linux-mtx-1_2.4.27.bb
| e8855b47883bee538c1e4684e6b9f9dc3e08ef95
| @@ -79,7 +79,3 @@ do_deploy() {
|          install -m 0644 arch/mips/zboot/images/mtx-1.flash.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.flash.srec
|      install -m 0644 arch/mips/zboot/images/mtx-1.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.ram.srec
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-mtx-2_2.4.27.bb
| 478bed2951d5bfe4a59968087493fe96a1428770
| +++ packages/linux/linux-mtx-2_2.4.27.bb
| a11f8e9e2f3b400405bc1d4c54e6c4c39230bccc
| @@ -91,7 +91,3 @@ do_deploy() {
|          install -m 0644 arch/mips/zboot/images/mtx-2.flash.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.flash.srec
|      install -m 0644 arch/mips/zboot/images/mtx-2.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.ram.srec
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-mtx-3_2.6.15.4.bb
| a34093b088a5da3a33502d715235b1e1171292de
| +++ packages/linux/linux-mtx-3_2.6.15.4.bb
| ad810bd1e8c7703133e23ecb7babf7af0673ec51
| @@ -89,7 +89,3 @@ do_deploy() {
|          #install -m 0644 arch/mips/boot/mtx-3.flash.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.flash.srec
|      #install -m 0644 arch/mips/boot/mtx-3.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.ram.srec
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-mtx-3_2.6.15.bb
| d7111648056223fa630144eb7ea690dde9d02136
| +++ packages/linux/linux-mtx-3_2.6.15.bb
| 3fe52943fbf0066681c0d6374c516fc5f119b194
| @@ -57,7 +57,3 @@ do_deploy() {
|          install -m 0644 arch/arm/zboot/images/mtx-3.flash.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.flash.srec
|      install -m 0644 arch/arm/zboot/images/mtx-3.srec
| ${DEPLOY_DIR}/images/${KERNEL_IMAGE_NAME}.ram.srec
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-navman_2.6.18.bb
| 170d50b807364f5b39aaf8a74d85700e2d5ef059
| +++ packages/linux/linux-navman_2.6.18.bb
| 7222348b888446c23fe8b1cebabd4b5f8f3ebce0
| @@ -40,14 +40,3 @@ do_configure() {
|
|          yes '' | oe_runmake oldconfig
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-nokia800.inc
| c099bf50d2367d56a7a7f92d7972a909ef3f1c8b
| +++ packages/linux/linux-nokia800.inc
| e115eb464fd01dc9fb6240cf410d23831cdb0c3f
| @@ -31,12 +31,3 @@ do_configure_prepend() {
|          yes '' | oe_runmake oldconfig
|
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-omap-2.6_2.6.9-omap1.bb
| 0fc02f33bb0974e2ef2525856bf1a22ed9a550c0
| +++ packages/linux/linux-omap-2.6_2.6.9-omap1.bb
| 16a16b7a279d8e82b110426ced8e7a09e343504f
| @@ -18,12 +18,3 @@ do_configure_prepend() {
|      install -m 0644 ${WORKDIR}/defconfig ${S}/.config
|          oe_runmake oldconfig
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-omap.inc
| 511a21147c331fc26f3e5848413c000974a7fedd
| +++ packages/linux/linux-omap.inc
| 8d1b4e76cfc047cf84efee4c9fe9da7e8ac020b7
| @@ -29,11 +29,3 @@ do_configure_prepend() {
|
|          yes '' | oe_runmake oldconfig
|  }
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-palm-omap1_2.6.22-omap1.bb
| 09c462b9df4a65761d04ae252b5156bbe024c54a
| +++ packages/linux/linux-palm-omap1_2.6.22-omap1.bb
| 6d3623af6e48ee147a8cf8e33bd7c3f9bf501ad7
| @@ -35,12 +35,3 @@ do_configure() {
|      yes '' | oe_runmake oldconfig
|
|  }
| -
| -do_deploy() {
| -    install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-rp.inc
955d75bfe07f7f78a1bb382972543be8f55ae216
| +++ packages/linux/linux-rp.inc
8efe110a0206f0bcff50da5554603214a407b8fe
| @@ -1,9 +1,11 @@ inherit kernel
|  DESCRIPTION = "2.6 Linux Development Kernel for Zaurus devices and iPAQ
| hx2750."
|  SECTION = "kernel"
|  LICENSE = "GPL"
|
|  inherit kernel
|
| +
| +INITRAMFS_IMAGE=initramfs-kexec-image
|  DEPENDS_append_collie = " bc-native"
|  RPROVIDES_kernel-base += "hostap-modules"
|
| @@ -17,9 +19,6 @@ COMPATIBLE_MACHINE = '(collie|poodle|c7x
|  COMPATIBLE_HOST = "(arm|i.86).*-linux"
|  COMPATIBLE_MACHINE =
|
'(collie|poodle|c7x0|akita|spitz|tosa|hx2000|qemuarm|qemux86|bootcdx86|htcuniversal)'
|
| -KERNEL_CUSTOM_NAME ?= ""
| -KERNEL_DEPLOY_NAME ?=
|
"${KERNEL_IMAGETYPE}-${PV}-${KERNEL_CUSTOM_NAME}${MACHINE}-${DATETIME}.bin"
| -KERNEL_SYMLINK_NAME ?=
| "${KERNEL_IMAGETYPE}-${KERNEL_CUSTOM_NAME}${MACHINE}.bin"
|  KERNEL_DEFCONFIG ?= "defconfig-${MACHINE}"
|
|  CMDLINE_CON = "console=ttyS0,115200n8 console=tty1 noinitrd"
| @@ -142,18 +141,6 @@ do_configure() {
|      yes '' | oe_runmake oldconfig
|  }
|
| -do_deploy() {
| -    install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOY_NAME}
| -    cd ${DEPLOY_DIR_IMAGE}
| -    ln -sf ${KERNEL_DEPLOY_NAME} ${KERNEL_SYMLINK_NAME}
| -    tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_VERSION}-${MACHINE}.tgz -C ${D}
lib
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install
| -
|  # wlan-ng stuff need compiled kernel sources
|  do_rm_work() {
|  }
| ============================================================
| --- packages/linux/linux-sequoia_2.6.21.bb
| 5dc8ca7fe3e92accabff7e6dc3d9d28540f8839b
| +++ packages/linux/linux-sequoia_2.6.21.bb
| d413717f8bcba9bb60c8c1a6428744aadfda32fa
| @@ -39,22 +39,9 @@ do_stage_append () {
|         cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
|  }
|
| -
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/images/${KERNEL_IMAGETYPE} \
| -
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
|  #seems like 2.6.21 kernel images have moved (or is this only for the
| Denx kernel ?)
|  #so we need to copy the kernel image where kernel.bbclass expects it
to be
|  do_install_prepend() {
|          install -m 0644 arch/${ARCH}/boot/images/${KERNEL_IMAGETYPE} \
|                          arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/linux-smdk2440_2.6.20+git.bb
| c6bddc2c20ea68b01d4e8457000fdb982a675840
| +++ packages/linux/linux-smdk2440_2.6.20+git.bb
| c1a3ee438ab00d04db3a09863dd5d44c44d509a2
| @@ -22,16 +22,4 @@ do_configure() {
|      oe_runmake oldconfig
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin
| -        rm -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
| -        ln -s
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
| -        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_RELEASE}-${MACHINE}.tgz -C ${D} lib
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install
| -
|  KERNEL_RELEASE = "2.6.21"
| ============================================================
| --- packages/linux/linux-smdk2443_2.6.20+git.bb
| 43c2952116b3749fac68666c3f67f36bf48154fe
| +++ packages/linux/linux-smdk2443_2.6.20+git.bb
| d1486129501571f3ec91eb5d75702829a1bf928e
| @@ -31,12 +31,7 @@ do_configure() {
|      oe_runmake oldconfig
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin
| -        rm -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
| -        ln -s
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
| -        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_RELEASE}-${MACHINE}.tgz -C ${D} lib
| +do_deploy_append() {
|      ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
|          rm -f linux.bin.gz
|          gzip -9 linux.bin
| @@ -44,8 +39,4 @@ do_deploy() {
|          rm -f linux.bin.gz
|  }
|
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install
| -
|  KERNEL_RELEASE = "2.6.21-rc5"
| ============================================================
| --- packages/linux/linux-storcenter_2.6.12.6.bb
| 2d88bee5909e832293186264642aaaa6f6d15e7d
| +++ packages/linux/linux-storcenter_2.6.12.6.bb
| aebb2189821031a5a3dee099c03be9c702721041
| @@ -44,18 +44,7 @@ do_configure() {
|          make ARCH=ppc oldconfig
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/images/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
|  #ppc build leaves the kernel in a different place
|  #do_movekernel() {
|  #
|  #}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-storcenter_2.6.15.7.bb
| c8d13191b10ec42a45a1dac552bc747a241b24ad
| +++ packages/linux/linux-storcenter_2.6.15.7.bb
| f4a0cbe23d6cb597b8fadc822741c3743ac8af83
| @@ -23,14 +23,3 @@ do_configure() {
|      install -m 644 ${WORKDIR}/defconfig-${PV} ${S}/.config
|      make ARCH=${ARCH} oldconfig
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 ${KERNEL_OUTPUT}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-sun4cdm_2.4.26.bb
| dfbb8a3b7ce6381ef53c89ac9cc012925ee2d088
| +++ packages/linux/linux-sun4cdm_2.4.26.bb
| cb7b79292f0df562d042c5d11e26f4f9f3b1684f
| @@ -26,7 +26,3 @@ do_deploy() {
|      install -d ${DEPLOY_DIR_IMAGE}
|      elftoaout -o ${DEPLOY_DIR_IMAGE}/linux-aout-${DATETIME}
| ${KERNEL_IMAGETYPE}
|  }
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux-tornado-omap2_2.6.16.16.bb
| a735d9e07c77baf8fa31bb48cda83957ab6af590
| +++ packages/linux/linux-tornado-omap2_2.6.16.16.bb
| 2abc45d9ddbe360fdd17e53fa7dd355e2edf56d5
| @@ -39,12 +39,3 @@ do_configure() {
|          yes '' | oe_runmake oldconfig
|
|  }
| -
| -do_deploy() {
| -    install -d ${DEPLOY_DIR_IMAGE}
| -    install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_populate_staging after do_compile
| ============================================================
| --- packages/linux/linux-turbostation_2.6.20.2.bb
| abd711d81a65da03e4199ceaf85703d9c052a26b
| +++ packages/linux/linux-turbostation_2.6.20.2.bb
| 7897027767e57ffa7b287bcb8ffd5846e74e6fb2
| @@ -34,18 +34,7 @@ do_configure() {
|          make ARCH=ppc oldconfig
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/images/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
|  #ppc build leaves the kernel in a different place
|  #do_movekernel() {
|  #
|  #}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/linux-wrt_2.4.20.bb
| ce82a3361914a1863ec5646e35eb6492f5babb69
| +++ packages/linux/linux-wrt_2.4.20.bb
| e74b100f98b6d06e1178e06ac84707dc3ea720ca
| @@ -47,13 +47,4 @@ do_configure_prepend() {
|      echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PACKAGE_ARCH}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  COMPATIBLE_MACHINE = "wrt54"
| ============================================================
| --- packages/linux/linux-wrt_2.4.30.bb
| fe9df0285b627d50369b865bce0ec5e3c3756664
| +++ packages/linux/linux-wrt_2.4.30.bb
| e6fb2a6757c20d6db3711f1c4b100d280955766e
| @@ -107,8 +107,4 @@ do_deploy() {
|          ${DEPLOY_DIR_IMAGE}/wrt-kernel-${PV}.lzma
|  }
|
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  COMPATIBLE_MACHINE = "wrt54"
| ============================================================
| --- packages/linux/linux-x86_2.6.20.bb
| 373dff7be9a2cb86fd01661a2204fcbebf1c8427
| +++ packages/linux/linux-x86_2.6.20.bb
| c3d12343d14667cacd6610f043b0754e84524af5
| @@ -28,13 +28,3 @@ do_configure_prepend_i686() {
|  do_configure_prepend_i686() {
|      install -m 0644 ${WORKDIR}/i686-defconfig ${S}/.config
|  }
| -
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/i386/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_populate_staging after do_compile
| ============================================================
| --- packages/linux/linux-xxs1500_2.4.21.bb
| 50ad158a5e60cb7c35b3482d7433fb7b8edf6a9f
| +++ packages/linux/linux-xxs1500_2.4.21.bb
| 4c3804df17204b8a2d8c9cfeecb854c9fd442b7e
| @@ -27,12 +27,3 @@ FILES_kernel += " /tmp"
|  }
|
|  FILES_kernel += " /tmp"
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 ${KERNEL_OUTPUT}
| ${DEPLOY_DIR_IMAGE}/${MACHINE}-${KV}-${KERNEL_IMAGETYPE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/linux.inc    eeaa90a02ec1d98a0a19b42de93dd613867bea9b
| +++ packages/linux/linux.inc    4e66c3bdf1bbb4352e37398df0c2a52c07a31abb
| @@ -129,20 +129,5 @@ do_compile_append() {
|      fi
|  }
|
| +KERNEL_DEPLOY_NAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
| +KERNEL_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-${MACHINE}"
| -KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
| -KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-${MACHINE}"
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
| -        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PR}-${MACHINE}.tgz -C ${D} lib
| -
| -        cd ${DEPLOY_DIR_IMAGE}
| -        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
| -        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
| ${KERNEL_IMAGE_SYMLINK_NAME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install
| -
| ============================================================
| --- packages/linux/logicpd-pxa270_2.6.17-rc5.bb
| 9fab46f9b5a54dc6a7f752e4fefaff2e81d1f54d
| +++ packages/linux/logicpd-pxa270_2.6.17-rc5.bb
| 9a2aa6a59d9c5a88fb3c8f6d2799f1770f5c1639
| @@ -26,13 +26,4 @@ do_configure_prepend() {
|
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  COMPATIBLE_MACHINE = "logicpd-pxa270"
| ============================================================
| --- packages/linux/logicpd-pxa270_2.6.19.2.bb
| 3e9ccae6c92fe9092727de6d7d781be339abbb88
| +++ packages/linux/logicpd-pxa270_2.6.19.2.bb
| 9fbc51193472073bf35723abf0347dacb07f96ba
| @@ -47,13 +47,4 @@ do_configure_prepend() {
|
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  COMPATIBLE_MACHINE = "logicpd-pxa270"
| ============================================================
| --- packages/linux/mainstone-kernel_2.6.11.bb
| d5a9b182d8e86b8f4b7b579cdfcfe40bf7616703
| +++ packages/linux/mainstone-kernel_2.6.11.bb
| 6b6f689b5f536ee641091f47d602e47e356dcf95
| @@ -25,13 +25,4 @@ do_configure_prepend() {
|  #    echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  COMPATIBLE_MACHINE = "mainstone"
| ============================================================
| --- packages/linux/mx21ads-kernel_2.6.19rc6.bb
| eb89e283bb375e8deefb9398a9f77334e4b32a4d
| +++ packages/linux/mx21ads-kernel_2.6.19rc6.bb
| 77940b31b7200a1e72b9b0131f0a42bbf0a79b4d
| @@ -44,14 +44,3 @@ do_configure_prepend() {
|      yes '' | oe_runmake oldconfig
|
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/mx31ads-kernel_2.6.19rc6.bb
| 3c6294ce239293d9c65f68e973f7ea4a89f122aa
| +++ packages/linux/mx31ads-kernel_2.6.19rc6.bb
| 4d45821e3959cca1cf0ec3e7c014bc8541d57f7d
| @@ -45,13 +45,4 @@ do_configure_prepend() {
|
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  KERNEL_RELEASE = "2.6.19-rc6"
| ============================================================
| --- packages/linux/netbook-pro-kernel_2.6.17.bb
| adcec4915e8ffc89681f8dd32ddca0cbcaed2d47
| +++ packages/linux/netbook-pro-kernel_2.6.17.bb
| 7adc49fa49c65c4f9d8ff3246f89df9f5cc5f455
| @@ -43,14 +43,3 @@ do_configure() {
|
|
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| -
| ============================================================
| --- packages/linux/openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
| 34b1ac44c6acbb17f968621b1dc6ca57af533195
| +++ packages/linux/openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
| 43e599a840242fc71bf6e07c1e9a30fb453567b6
| @@ -91,12 +91,3 @@ do_configure_prepend() {
|          install -m 0644 ${WORKDIR}/defconfig-${MACHINE} ${S}/.config ||
| die "No default configuration for ${MACHINE} available."
|          echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
|  }
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PACKAGE_ARCH}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| ---
| packages/linux/openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc
| 3b48e835c5b6a538db140840202ca3abd2bf5296
| +++
| packages/linux/openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc
| 7d99efacb78551a1709a390b5a5b38d64a30a994
| @@ -105,15 +105,6 @@ do_configure_prepend() {
|          echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  PACKAGE_ARCH_corgi    = "c7x0"
|  PACKAGE_ARCH_shepherd = "c7x0"
|  PACKAGE_ARCH_husky    = "c7x0"
| ============================================================
| --- packages/linux/openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb
| bb5224a41360e3207277481ecfb4e71d69378231
| +++ packages/linux/openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb
| b40023ab8faeb0abe963777565da486c0544ad81
| @@ -92,13 +92,5 @@ do_configure_prepend() {
|          echo "CONFIG_CMDLINE=\"$CMDLINE mem=${mem}M\"" >> ${S}/.config
|  }
|
| +KERNEL_DEPLOY_NAME =
|
"${KERNEL_IMAGETYPE}-${MACHINE}-${COLLIE_MEMORY_SIZE}-${COLLIE_RAMDISK_SIZE}-${DATETIME}.bin"
| +KERNEL_SYMLINK_NAME =
|
"${KERNEL_IMAGETYPE}-${MACHINE}-${COLLIE_MEMORY_SIZE}-${COLLIE_RAMDISK_SIZE}.bin"
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} \
| -
|
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}-${COLLIE_MEMORY_SIZE}-${COLLIE_RAMDISK_SIZE}-${DATETIME}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
| ============================================================
| --- packages/linux/triton-kernel_2.6.11.bb
| 5c76121264ec80611a8d410d965dadb3d129cee5
| +++ packages/linux/triton-kernel_2.6.11.bb
| a8a4f6fce50a1cb7d5bbb6ef284ee7a8eab0140f
| @@ -1,10 +1,8 @@ PR = "r0"
|  SECTION = "kernel"
|  DESCRIPTION = "Linux kernel for the KARO TRITON XScale Board"
|  LICENSE = "GPL"
|  PR = "r0"
|
| -KERNEL_SUFFIX = "triton"
| -
|  SRC_URI =
"${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
|
|
${KERNELORG_MIRROR}/pub/linux/kernel/people/akpm/patches/2.6/${PV}/${PV}-mm2/${PV}-mm2.bz2;patch=1

| \
|             file://patch-2.6.11-mm2-karo9.bz2;patch=1 \
| @@ -26,13 +24,4 @@ do_configure_prepend() {
|             ${S}/include/asm-arm/.proc ${S}/include/asm-arm/.arch
|  }
|
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${KERNEL_SUFFIX}
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| -
|  COMPATIBLE_MACHINE = "triton"
| ============================================================
| --- packages/linux/unslung-kernel_2.4.22.l2.3r63.bb
| b5e796a22c471b4d8a343f091cd2a3b7e4dc99f5
| +++ packages/linux/unslung-kernel_2.4.22.l2.3r63.bb
| d80969cb5ce2c41aeeb873a709ac754d4dba2494
| @@ -49,12 +49,5 @@ do_configure_prepend() {
|      rm -rf ${S}/include/asm-arm/arch ${S}/include/asm-arm/proc \
|             ${S}/include/asm-arm/.proc ${S}/include/asm-arm/.arch
|  }
| +KERNEL_DEPLOY_NAME =
"${KERNEL_IMAGETYPE}-${KERNEL_SUFFIX}-${DATETIME}.bin"
| +KERNEL_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-${KERNEL_SUFFIX}.bin"
| -
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${KERNEL_SUFFIX}.bin
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_build after do_compile
| ============================================================
| --- packages/linux/xanadux-un-2.6_2.6.12.bb
| a63c9825f09a1bef04ed41c2ab3d9783328c0776
| +++ packages/linux/xanadux-un-2.6_2.6.12.bb
| c78078aec8a4746eb843f76fd4c63d0875560a6f
| @@ -17,17 +17,3 @@ do_configure() {
|          cp arch/arm/configs/htcuniversal_defconfig .config || die "No
| default configuration for ${MACHINE} available."
|          yes '' | oe_runmake oldconfig
|  }
| -
| -
| -###############################################################
| -# put into deploy directory
| -#
| -do_deploy() {
| -        install -d ${DEPLOY_DIR_IMAGE}
| -        install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin
| -        tar -cvzf
| ${DEPLOY_DIR_IMAGE}/modules-${KERNEL_VERSION}-${MACHINE}.tgz -C ${D} lib
| -}
| -
| -do_deploy[dirs] = "${S}"
| -
| -addtask deploy before do_package after do_install

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH0s+NMkyGM64RGpERAgqDAJ9jflBKDHA8tmVlVLNSKgvE3ZdWzQCeMA1C
FsRe9VfRE84DlF6eeAax6XY=
=Q6Q9
-----END PGP SIGNATURE-----



