Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1J4Zaf-00071m-UA
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 11:22:22 +0100
Received: by fk-out-0910.google.com with SMTP id 18so2460889fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 02:17:28 -0800 (PST)
Received: by 10.82.171.16 with SMTP id t16mr5989653bue.11.1197973047612;
	Tue, 18 Dec 2007 02:17:27 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Tue, 18 Dec 2007 02:17:27 -0800 (PST)
Message-ID: <74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
Date: Tue, 18 Dec 2007 11:17:27 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
MIME-Version: 1.0
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev PDA-like machines with card slots: Enable "vfat" feature.
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
X-List-Received-Date: Tue, 18 Dec 2007 10:22:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dec 18, 2007 3:47 AM, pfalcon commit
<openembedded-commits@lists.openembedded.org> wrote:
> PDA-like machines with card slots: Enable "vfat" feature.
> * FAT-formatted cards are commodity, it's expectable them to be supported OOB.

A machine feature "vfat" sounds strange. I think machine features
should be about the hardware capabilities. Unfortunately I don't have
a proposal for a good name, but I'd prefer something like "cardslot"
or some better generic term for SD/CF/MemoryStick/etc. capability.
Then the distro can decide whether that means to add vfat support or
ext2 or gnome-volume-manager or some fancy card formatting GUI app.

regards
Philipp

> Author: pfalcon@openembedded.org
> Branch: org.openembedded.dev
> Revision: 4bf2d682c2a35ca8521a9a1916ca88359015932f
> ViewMTN: http://monotone.openembedded.org/revision/info/4bf2d682c2a35ca8521a9a1916ca88359015932f
> Files:
> 1
> conf/machine/h1910.conf
> conf/machine/h1940.conf
> conf/machine/h2200.conf
> conf/machine/h3600.conf
> conf/machine/h3800.conf
> conf/machine/h3900.conf
> conf/machine/h4000.conf
> conf/machine/h5000.conf
> conf/machine/h6300.conf
> conf/machine/htcalpine.conf
> conf/machine/htcapache.conf
> conf/machine/htcblueangel.conf
> conf/machine/htchimalaya.conf
> conf/machine/htcsable.conf
> conf/machine/htctornado.conf
> conf/machine/htcuniversal.conf
> conf/machine/htcwallaby.conf
> conf/machine/hx2000.conf
> conf/machine/hx4700.conf
> conf/machine/include/collie-2.6.inc
> conf/machine/include/palm.inc
> conf/machine/include/zaurus-2.6.inc
> conf/machine/jornada6xx.conf
> conf/machine/jornada7xx.conf
> conf/machine/looxc550.conf
> conf/machine/magician.conf
> conf/machine/netbook-pro.conf
> conf/machine/nokia770.conf
> conf/machine/nokia800.conf
> conf/machine/rx1950.conf
> conf/machine/rx3000.conf
> conf/machine/simpad.conf
> Diffs:
>
> #
> # mt diff -r9ecf040d01020ce72d56cb39e1d500c8ec8213e0 -r4bf2d682c2a35ca8521a9a1916ca88359015932f
> #
> #
> #
> # patch "conf/machine/h1910.conf"
> #  from [8c804116d1d1ba9168798328770d1e5de28235f4]
> #    to [5d0e6102d9262ec21df09d0780240368654de730]
> #
> # patch "conf/machine/h1940.conf"
> #  from [049b100411c0eb5e07e8aa959eb355443ebc8e62]
> #    to [5d5ed7d3174c8626b826213337b0e2943ebd402b]
> #
> # patch "conf/machine/h2200.conf"
> #  from [dbbf175b117be5072305298eb83c9da4db932774]
> #    to [517c64f5b7a22dd1f67791d8534910358ca7b6e1]
> #
> # patch "conf/machine/h3600.conf"
> #  from [99592d7e77fd317519f43f5db57cf5da1814b1a0]
> #    to [baccbbb3fd46dea023ff7dc49ac173b169688428]
> #
> # patch "conf/machine/h3800.conf"
> #  from [770f223d05006e764028a3ae322091d63a5a15ba]
> #    to [fc56ab4ab42e6f66cc6f6209f0dd114355b91000]
> #
> # patch "conf/machine/h3900.conf"
> #  from [ba6e4bdcb26b319daae0835f4eef2c47a841fa3e]
> #    to [849df89a61a34c3f1c79560dccd714393cceb3c0]
> #
> # patch "conf/machine/h4000.conf"
> #  from [6c7b95aedd50d9f49088b0f0d050dba11b72af1a]
> #    to [2f23045424e0dc12c7ee9c1d485ba6c477117ed9]
> #
> # patch "conf/machine/h5000.conf"
> #  from [bb77d647234a173113a7e97b543d1059381c7257]
> #    to [e3be93bf378f53331316ca75535d32465f86f9b0]
> #
> # patch "conf/machine/h6300.conf"
> #  from [e1a2c9d17fb731040d2e84bc13ba955232d0f5c9]
> #    to [4c6c8fdebd9d8dc8eb6354ae169862cc5662c63a]
> #
> # patch "conf/machine/htcalpine.conf"
> #  from [f98db98a7f6a213ef95099564d36eb534dcf7e1e]
> #    to [802992dbe7902b4d3b3dc7d58c62c2fce6db5692]
> #
> # patch "conf/machine/htcapache.conf"
> #  from [85b3799dbf21a7bc89bc888892fb26f330a3b213]
> #    to [e42671ae241f36191c65cf0e671acc0be0ba3d34]
> #
> # patch "conf/machine/htcblueangel.conf"
> #  from [0c19233d7062948ae1fec57ba52f8627716d1dd2]
> #    to [bd67f8166ed61397dc7eacf52aa56206eec3dcf1]
> #
> # patch "conf/machine/htchimalaya.conf"
> #  from [e402ae7923faf0ef767e500842820754adf95d26]
> #    to [5b5a7a0c10307d5ac09035f291fcd391ad86c991]
> #
> # patch "conf/machine/htcsable.conf"
> #  from [e839db7ced3fc8ad5fa110b108879d7deb946433]
> #    to [1c17d91980d832248cff034b882d033d426d3adf]
> #
> # patch "conf/machine/htctornado.conf"
> #  from [92930583820f744123783398b9289029467426bb]
> #    to [979eaba253df13d5af8e9713eaf8db9ed45856b6]
> #
> # patch "conf/machine/htcuniversal.conf"
> #  from [ed21482af85e14b44ba36c3a1957e387fb4f0299]
> #    to [c3c6fb34551bb7ce746a908db22f450adcb9cfa4]
> #
> # patch "conf/machine/htcwallaby.conf"
> #  from [6197c7cff0cafc821c99e4e46921fb8cf0e4e1b4]
> #    to [f536aa7626c709ec12492ce50cec7af6c4062a8c]
> #
> # patch "conf/machine/hx2000.conf"
> #  from [4c388078f8a393457e2d370a6d0b8321e53a27dc]
> #    to [a3ae9da47e9dea078b01d3e9dee957af54dd6d78]
> #
> # patch "conf/machine/hx4700.conf"
> #  from [7073f22f2c781c6ef6eaf11fac2de5ae77d66f5b]
> #    to [8a9b68dd63f3be8457ae064682536c7c1912b241]
> #
> # patch "conf/machine/include/collie-2.6.inc"
> #  from [4c2267c98964a40d4dd4216de14ec06eb578694d]
> #    to [a71f2479ea4e652346eccf4594034af29bb74651]
> #
> # patch "conf/machine/include/palm.inc"
> #  from [166ae8b4b06d4c97637ae03d01c773ace2a78f09]
> #    to [b8d88830d5077ec934ae7c71d2461970284d99dc]
> #
> # patch "conf/machine/include/zaurus-2.6.inc"
> #  from [6cb1d601b80af4a29b59dd760b6939447fa49736]
> #    to [7ecb352669b5b71228489192cdeb5826dc02b46a]
> #
> # patch "conf/machine/jornada6xx.conf"
> #  from [b17e1ecf2b7a98288b82648ad9c4723b9124a0bf]
> #    to [f17b9e945c5c317eb883c46e5a75675f5a073868]
> #
> # patch "conf/machine/jornada7xx.conf"
> #  from [c41cc23268b4ae13d751e61be124cbce148e220b]
> #    to [931f12408f78e84eaafc92103fd2590493bcd246]
> #
> # patch "conf/machine/looxc550.conf"
> #  from [529a76fa9a251dc8860a581573be21b93a713c79]
> #    to [9d267cfb7bddcaa7a780909f13b9893ef5e6827a]
> #
> # patch "conf/machine/magician.conf"
> #  from [4260af3d8d3a880db6afad5b346400cd59e1fd77]
> #    to [c0fd9446610a60ab643595383d5a99b2b23fb6c7]
> #
> # patch "conf/machine/netbook-pro.conf"
> #  from [22005b0157cbf484254316335c81a9636fbd7882]
> #    to [16b274a8c05b0e05cc1944b21b0cdf2fe27df5e0]
> #
> # patch "conf/machine/nokia770.conf"
> #  from [a2763946febc14b318477d62f3ed1eecfa6c3a6c]
> #    to [828d8946d7940a421a16941b49f4c1c5740fd755]
> #
> # patch "conf/machine/nokia800.conf"
> #  from [dbee9c0aad081a2c82f8e99644e2d2967508913f]
> #    to [ede2d35668185c917664bdbafa710c61e835ac69]
> #
> # patch "conf/machine/rx1950.conf"
> #  from [01b414b0e56e1cc981aa872ae90f09f174d6a2fa]
> #    to [a0d7631022017fd94a035fa4b8e8085315b5f694]
> #
> # patch "conf/machine/rx3000.conf"
> #  from [2c7f1ff05ffdf2b1f2c2d2853d9b529d7c9372e5]
> #    to [7a9518260fc59e1a013a84722a718477ed1f1daa]
> #
> # patch "conf/machine/simpad.conf"
> #  from [32f2aeca8055f0ccf3e78753f11723249b169136]
> #    to [9987d298771d159fd85308e85bdb5a82fd16832d]
> #
> ============================================================
> --- conf/machine/h1910.conf     8c804116d1d1ba9168798328770d1e5de28235f4
> +++ conf/machine/h1910.conf     5d0e6102d9262ec21df09d0780240368654de730
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/h1940.conf     049b100411c0eb5e07e8aa959eb355443ebc8e62
> +++ conf/machine/h1940.conf     5d5ed7d3174c8626b826213337b0e2943ebd402b
> @@ -13,7 +13,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm bluetooth irda usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm bluetooth irda usbgadget screen vfat"
>
>
>  # Some extra configuration
> ============================================================
> --- conf/machine/h2200.conf     dbbf175b117be5072305298eb83c9da4db932774
> +++ conf/machine/h2200.conf     517c64f5b7a22dd1f67791d8534910358ca7b6e1
> @@ -17,7 +17,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/h3600.conf     99592d7e77fd317519f43f5db57cf5da1814b1a0
> +++ conf/machine/h3600.conf     baccbbb3fd46dea023ff7dc49ac173b169688428
> @@ -17,7 +17,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget  screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/h3800.conf     770f223d05006e764028a3ae322091d63a5a15ba
> +++ conf/machine/h3800.conf     fc56ab4ab42e6f66cc6f6209f0dd114355b91000
> @@ -1,8 +1,8 @@
>  #@TYPE: Machine
>  #@NAME: Compaq iPAQ 38xx
>  #@DESCRIPTION: Machine configuration for the Compaq iPAQ 38xx devices
>
>  #this machine will be primarily focussed on the 2.6 port
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
>
>  require conf/machine/h3600.conf
> ============================================================
> --- conf/machine/h3900.conf     ba6e4bdcb26b319daae0835f4eef2c47a841fa3e
> +++ conf/machine/h3900.conf     849df89a61a34c3f1c79560dccd714393cceb3c0
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/h4000.conf     6c7b95aedd50d9f49088b0f0d050dba11b72af1a
> +++ conf/machine/h4000.conf     2f23045424e0dc12c7ee9c1d485ba6c477117ed9
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/h5000.conf     bb77d647234a173113a7e97b543d1059381c7257
> +++ conf/machine/h5000.conf     e3be93bf378f53331316ca75535d32465f86f9b0
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/h6300.conf     e1a2c9d17fb731040d2e84bc13ba955232d0f5c9
> +++ conf/machine/h6300.conf     4c6c8fdebd9d8dc8eb6354ae169862cc5662c63a
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/htcalpine.conf f98db98a7f6a213ef95099564d36eb534dcf7e1e
> +++ conf/machine/htcalpine.conf 802992dbe7902b4d3b3dc7d58c62c2fce6db5692
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia irda bluetooth usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia irda bluetooth usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/htcapache.conf 85b3799dbf21a7bc89bc888892fb26f330a3b213
> +++ conf/machine/htcapache.conf e42671ae241f36191c65cf0e671acc0be0ba3d34
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia irda bluetooth usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia irda bluetooth usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/htcblueangel.conf      0c19233d7062948ae1fec57ba52f8627716d1dd2
> +++ conf/machine/htcblueangel.conf      bd67f8166ed61397dc7eacf52aa56206eec3dcf1
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/htchimalaya.conf       e402ae7923faf0ef767e500842820754adf95d26
> +++ conf/machine/htchimalaya.conf       5b5a7a0c10307d5ac09035f291fcd391ad86c991
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/htcsable.conf  e839db7ced3fc8ad5fa110b108879d7deb946433
> +++ conf/machine/htcsable.conf  1c17d91980d832248cff034b882d033d426d3adf
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/htctornado.conf        92930583820f744123783398b9289029467426bb
> +++ conf/machine/htctornado.conf        979eaba253df13d5af8e9713eaf8db9ed45856b6
> @@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/kernel = "lin
>
>  PREFERRED_PROVIDER_virtual/kernel = "linux-tornado-omap2"
>
> -MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget"
> +MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget vfat"
>
>  MACHINE_EXTRA_RDEPENDS = "alsa-state"
>
> ============================================================
> --- conf/machine/htcuniversal.conf      ed21482af85e14b44ba36c3a1957e387fb4f0299
> +++ conf/machine/htcuniversal.conf      c3c6fb34551bb7ce746a908db22f450adcb9cfa4
> @@ -17,7 +17,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
>  MACHINE_GUI_CLASS = "bigscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "480"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
> -MACHINE_FEATURES = "kernel26 apm alsa irda usbgadget usbhost keyboard touchscreen screen wifi bluetooth phone"
> +MACHINE_FEATURES = "kernel26 apm alsa irda usbgadget usbhost keyboard touchscreen screen wifi bluetooth phone vfat"
>  MACHINE_FEATURES += "iwmmxt"
>
>  #
> ============================================================
> --- conf/machine/htcwallaby.conf        6197c7cff0cafc821c99e4e46921fb8cf0e4e1b4
> +++ conf/machine/htcwallaby.conf        f536aa7626c709ec12492ce50cec7af6c4062a8c
> @@ -15,7 +15,7 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
>  MACHINE_GUI_CLASS = "smallscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "240"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen phone"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen phone vfat"
>
>  #
>  # Software/packages selection
> ============================================================
> --- conf/machine/hx2000.conf    4c388078f8a393457e2d370a6d0b8321e53a27dc
> +++ conf/machine/hx2000.conf    a3ae9da47e9dea078b01d3e9dee957af54dd6d78
> @@ -19,7 +19,7 @@ MODUTILS = "26"
>
>  MODUTILS = "26"
>
> -MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen"
> +MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat"
>
>  PCMCIA_MANAGER = "pcmciautils"
>
> ============================================================
> --- conf/machine/hx4700.conf    7073f22f2c781c6ef6eaf11fac2de5ae77d66f5b
> +++ conf/machine/hx4700.conf    8a9b68dd63f3be8457ae064682536c7c1912b241
> @@ -21,7 +21,7 @@ MACHINE_DISPLAY_PPI = "200"
>  MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
>  MACHINE_DISPLAY_ORIENTATION = "0"
>  MACHINE_DISPLAY_PPI = "200"
> -MACHINE_FEATURES = "alsa apm bluetooth irda pcmcia screen touchscreen usbgadget wifi"
> +MACHINE_FEATURES = "alsa apm bluetooth irda pcmcia screen touchscreen usbgadget wifi vfat"
>  MACHINE_FEATURES += "iwmmxt"
>
>  #
> ============================================================
> --- conf/machine/include/collie-2.6.inc 4c2267c98964a40d4dd4216de14ec06eb578694d
> +++ conf/machine/include/collie-2.6.inc a71f2479ea4e652346eccf4594034af29bb74651
> @@ -1,7 +1,7 @@ SERIAL_CONSOLE = "115200 ttySA0"
>  PREFERRED_PROVIDER_virtual/kernel = "linux-rp"
>
>  SERIAL_CONSOLE = "115200 ttySA0"
> -MACHINE_FEATURES = "kernel26 apm pcmcia screen irda usbgadget keyboard touchscreen wifi"
> +MACHINE_FEATURES = "kernel26 apm pcmcia screen irda usbgadget keyboard touchscreen wifi vfat"
>
>  MACHINE_EXTRA_RDEPENDS = "kernel-modules"
>
> ============================================================
> --- conf/machine/include/palm.inc       166ae8b4b06d4c97637ae03d01c773ace2a78f09
> +++ conf/machine/include/palm.inc       b8d88830d5077ec934ae7c71d2461970284d99dc
> @@ -10,7 +10,7 @@ require conf/machine/include/tune-xscale
>  # Use tune-x%s
> >>> DIFF TRUNCATED @ 16K
>
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


