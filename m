Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1M9Mwa-0001W1-JT
	for openembedded-devel@openembedded.org; Wed, 27 May 2009 19:29:37 +0200
Received: (qmail 25944 invoked by uid 1003); 27 May 2009 17:21:20 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 27 May 2009 17:21:19 -0000
Message-ID: <4A1D768E.4050101@balister.org>
Date: Wed, 27 May 2009 13:21:18 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gvivan$clg$1@ger.gmane.org>
In-Reply-To: <gvivan$clg$1@ger.gmane.org>
Subject: Re: [STABLE][PATCH] linux-omap: sync everything with .dev
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
X-List-Received-Date: Wed, 27 May 2009 17:29:37 -0000
X-Groupsio-MsgNum: 10786
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms020805040500040101050207"

--------------ms020805040500040101050207
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> [ This is only the diffstat, the complete 4 megabyte big patch is at 
> http://dominion.thruhere.net/koen/OE/0001-linux-omap-sync-everything-with-.dev.patch 
> ]
> 
> linux-omap: sync everything with .dev
>  * also sync the machine files to match the kernels

Koen,

I patched .stable and tried building console-image. This build failed on 
omap3-sgx-modules. Is there a way we can avoid building this? I suspect 
I can make it build by reading the bb file and downloading something 
from the TI website, but I'd like stable to build without having to do that.

Philip


> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  conf/machine/beagleboard.conf                      |   14 +-
>  conf/machine/include/omap3.inc                     |   13 +
>  conf/machine/omap3-pandora.conf                    |   14 +-
>  conf/machine/omap3evm.conf                         |    8 +-
>  conf/machine/overo.conf                            |    8 +-
>  .../linux/linux-omap-2.6.28/beagleboard/defconfig  |   10 +-
>  recipes/linux/linux-omap-2.6.28/modedb-hd720.patch |   13 +
>  ...IF_RESTORE_SIGMASK-support-and-enable-the.patch |  287 +
>  .../0124-leds-gpio-broken-with-current-git.patch   |   79 +
>  recipes/linux/linux-omap-2.6.29/DSS2.diff          |23964 
> --------------------
>  .../linux-omap-2.6.29/ads7846-detection.patch      |   41 +
>  .../beagleboard/beagle-asoc.patch                  |   35 +
>  .../linux/linux-omap-2.6.29/beagleboard/defconfig  |  631 +-
>  .../linux/linux-omap-2.6.29/beagleboard/ehci.patch |  131 +
>  ...t-gro-Fix-legacy-path-napi_complete-crash.patch |   39 +
>  ...002-OMAPFB-move-omapfb.h-to-include-linux.patch | 1316 ++
>  ...003-DSS2-OMAP2-3-Display-Subsystem-driver.patch |14450 ++++++++++++
>  .../dss2/0004-DSS2-OMAP-framebuffer-driver.patch   | 3403 +++
>  .../dss2/0005-DSS2-Add-panel-drivers.patch         |  396 +
>  .../0006-DSS2-HACK-Add-DSS2-support-for-N800.patch | 1079 +
>  ...Add-DSS2-support-for-SDP-Beagle-Overo-EVM.patch | 5715 +++++
>  ...unction-to-display-object-to-get-the-back.patch |   39 +
>  .../dss2/0009-DSS2-Add-acx565akm-panel.patch       |  778 +
>  ...2-Small-VRFB-context-allocation-bug-fixed.patch |   28 +
>  ...-Allocated-memory-for-Color-Look-up-table.patch |   37 +
>  .../dss2/0012-DSS2-Fix-DMA-rotation.patch          |   65 +
>  .../0013-DSS2-Verify-that-overlay-paddr-0.patch    |   41 +
>  ...-Add-function-to-get-DSS-logic-clock-rate.patch |   51 +
>  ...-DSS2-DSI-calculate-VP_CLK_RATIO-properly.patch |   68 +
>  ...6-DSS2-DSI-improve-packet-len-calculation.patch |   58 +
>  ...2-Disable-video-planes-on-sync-lost-error.patch |  103 +
>  ...S2-check-for-ovl-paddr-only-when-enabling.patch |   40 +
>  ...-fclk-limits-when-configuring-video-plane.patch |  183 +
>  ...heck-scaling-limits-against-proper-values.patch |   79 +
>  .../dss2/0021-DSS2-Add-venc-register-dump.patch    |   96 +
>  .../0022-DSS2-FB-remove-unused-var-warning.patch   |   27 +
>  ...the-default-FB-color-format-through-board.patch |  214 +
>  .../dss2/0024-DSS2-Beagle-Use-gpio_set_value.patch |   48 +
>  ...-Macro-for-calculating-base-address-of-th.patch |   28 +
>  ...I-sidlemode-to-noidle-while-sending-frame.patch |   78 +
>  ...2-VRFB-rotation-and-mirroring-implemented.patch |  324 +
>  ...FB-Added-support-for-the-YUV-VRFB-rotatio.patch |  236 +
>  ...FB-Set-line_length-correctly-for-YUV-with.patch |   61 +
>  ..._get_trans_key-was-returning-wrong-key-ty.patch |   29 +
>  ...2-do-bootmem-reserve-for-exclusive-access.patch |   33 +
>  ...DSS2-Fix-DISPC_VID_FIR-value-for-omap34xx.patch |   35 +
>  .../dss2/0033-DSS2-Prefer-3-tap-filter.patch       |   82 +
>  ...34-DSS2-VRAM-improve-omap_vram_add_region.patch |  135 +
>  ...-the-function-pointer-for-getting-default.patch |   66 +
>  ...-support-for-setting-and-querying-alpha-b.patch |  118 +
>  ...2-Added-support-for-querying-color-keying.patch |  150 +
>  ...B-Some-color-keying-pointerd-renamed-in-D.patch |   56 +
>  ...ysfs-entry-to-for-the-alpha-blending-supp.patch |   59 +
>  ...ded-proper-exclusion-for-destination-colo.patch |   97 +
>  ...S2-Disable-vertical-offset-with-fieldmode.patch |   71 +
>  ...DSS2-Don-t-enable-fieldmode-automatically.patch |   34 +
>  ...3-DSS2-Swap-field-0-and-field-1-registers.patch |  170 +
>  ...dd-sysfs-entry-for-seting-the-rotate-type.patch |   76 +
>  .../0045-DSS2-Fixed-line-endings-from-to.patch     |   48 +
>  ...-DSI-decrease-sync-timeout-from-60s-to-2s.patch |   26 +
>  ...eturn-value-for-rotate_type-sysfs-functio.patch |   44 +
>  ...3-DMA-implement-trans-copy-and-const-fill.patch |  123 +
>  ...9-DSS2-VRAM-clear-allocated-area-with-DMA.patch |  101 +
>  .../0050-DSS2-OMAPFB-remove-fb-clearing-code.patch |   53 +
>  .../0051-DSS2-VRAM-use-debugfs-not-procfs.patch    |  170 +
>  ...52-DSS2-VRAM-fix-section-mismatch-warning.patch |   34 +
>  ...S2-disable-LCD-DIGIT-before-resetting-DSS.patch |   41 +
>  .../dss2/0054-DSS2-DSI-more-error-handling.patch   |   85 +
>  .../0055-DSS2-Added-global-alpha-support.patch     |  230 +
>  ...ion-attrs-for-YUV-need-not-to-be-reversed.patch |   35 +
>  ...mentation-update-for-new-sysfs-entries-in.patch |   32 +
>  ...-touch-plane-coordinates-when-changing-fb.patch |   56 +
>  ...-DSI-configure-ENTER-EXIT_HS_MODE_LATENCY.patch |   97 +
>  ...-div-by-zero-when-calculating-required-fc.patch |   34 +
>  .../dss2/0061-DSS2-VRFB-save-restore-context.patch |  106 +
>  .../dss2/0062-DSS2-VRAM-Fix-indentation.patch      |   65 +
>  ...he-usage-of-get_last_off_on_transaction_i.patch |   82 +
>  .../dss2/0064-VRFB-fix-debug-messages.patch        |   35 +
>  ...065-VRFB-add-suspend-resume-functionality.patch |  216 +
>  ...2-DSI-tune-the-timings-to-be-more-relaxed.patch |   92 +
>  ...FB-don-t-WARN-when-releasing-inactive-ctx.patch |   29 +
>  ...-Swap-field-offset-values-w-VRFB-rotation.patch |   65 +
>  ...3EVM-Added-DSI-powerup-and-powerdown-func.patch |  125 +
>  .../linux-omap-2.6.29/dss2/0070-DSS2-fix-irq1.diff |  221 +
>  .../linux-omap-2.6.29/dss2/0071-DSS2-fix-irq2.diff |   35 +
>  .../linux-omap-2.6.29/fix-audio-capture.patch      |   16 +
>  ...base-address-definitions-and-resources-fo.patch |  153 +
>  ...1-omap-iommu-tlb-and-pagetable-primitives.patch | 1226 +
>  ...mmu-omap2-architecture-specific-functions.patch |  453 +
>  ...map-iommu-omap3-iommu-device-registration.patch |  124 +
>  ...u-simple-virtual-address-space-management.patch | 1083 +
>  ...ap-iommu-entries-for-Kconfig-and-Makefile.patch |   45 +
>  ...-omap-iommu-Don-t-try-BUG_ON-in_interrupt.patch |   26 +
>  ...u-We-support-chained-scatterlists-probabl.patch |   24 +
>  ...p2-iommu-entries-for-Kconfig-and-Makefile.patch |   29 +
>  ...dd-ISP-main-driver-and-register-definitio.patch | 4625 ++++
>  .../0002-omap3isp-Add-ISP-MMU-wrapper.patch        |  209 +
>  .../0003-omap3isp-Add-userspace-header.patch       |  696 +
>  .../0004-omap3isp-Add-ISP-frontend-CCDC.patch      | 1875 ++
>  ...0005-omap3isp-Add-ISP-backend-PRV-and-RSZ.patch | 3413 +++
>  ...Add-statistics-collection-modules-H3A-and.patch | 2741 +++
>  .../0007-omap3isp-Add-CSI2-interface-support.patch | 2384 ++
>  .../omap3camera/0008-omap3isp-Add-ISP-tables.patch | 4018 ++++
>  .../0009-omap34xxcam-Add-camera-driver.patch       | 2249 ++
>  ...izer-and-Previewer-driver-added-to-commit.patch | 2915 +++
>  ...Resizer-bug-fixes-on-top-of-1.0.2-release.patch |  730 +
>  .../v4l/0001-V4L2-Add-COLORFX-user-control.patch   |   44 +
>  ...f-v4l2_int_device_try_attach_all-requires.patch |   50 +
>  .../isp/v4l/0003-V4L-Int-if-Dummy-slave.patch      |   61 +
>  ...t-device-add-support-for-VIDIOC_QUERYMENU.patch |   33 +
>  .../0005-V4L-Int-if-Add-vidioc_int_querycap.patch  |   35 +
>  recipes/linux/linux-omap-2.6.29/mmctiming.patch    |   16 +
>  recipes/linux/linux-omap-2.6.29/modedb-hd720.patch |   13 +
>  ...-USB-musb-only-turn-off-vbus-in-OTG-hosts.patch |   43 +
>  ...B-composite-avoid-inconsistent-lock-state.patch |   76 +
>  ...sb-NAK-timeout-scheme-on-bulk-RX-endpoint.patch |  218 +
>  ...rewrite-host-periodic-endpoint-allocation.patch |  106 +
>  ...isable-VUSB-regulators-when-cable-unplugg.patch |  181 +
>  ...t-composite-device-level-suspend-resume-h.patch |   84 +
>  ...dget-fix-ethernet-link-reports-to-ethtool.patch |   47 +
>  ...sb-musb_host-minor-enqueue-locking-fix-v2.patch |   60 +
>  .../0009-usb-musb_host-fix-ep0-fifo-flushing.patch |   93 +
>  ...b-sanitize-clearing-TXCSR-DMA-bits-take-2.patch |  361 +
>  .../0011-musb-fix-isochronous-TXDMA-take-2.patch   |  417 +
>  ...12-musb-fix-possible-panic-while-resuming.patch |   56 +
>  ...usb_host-refactor-musb_save_toggle-take-2.patch |   91 +
>  ...get-suppress-parasitic-TX-interrupts-with.patch |   32 +
>  ...musb_gadget-fix-unhandled-endpoint-0-IRQs.patch |  202 +
>  ...musb_host-factor-out-musb_ep_-get-set-_qh.patch |  146 +
>  .../0017-musb_host-refactor-URB-giveback.patch     |  132 +
>  ...018-musb-split-out-CPPI-interrupt-handler.patch |  167 +
>  ...9-musb_host-simplify-check-for-active-URB.patch |  158 +
>  ...sb_host-streamline-musb_cleanup_urb-calls.patch |   58 +
>  ...1-twl4030-usb-fix-minor-reporting-goofage.patch |   70 +
>  ...dma-mode-1-for-TX-if-transfer-size-equals.patch |   38 +
>  .../0023-musb-add-high-bandwidth-ISO-support.patch |  187 +
>  .../0024-USB-otg-adding-nop-usb-transceiver.patch  |  259 +
>  ...-usb-xceiv-behave-when-linked-as-a-module.patch |   90 +
>  ...musb-proper-hookup-to-transceiver-drivers.patch | 1109 +
>  .../musb/0027-musb-otg-timer-cleanup.patch         |  198 +
>  ...-musb-make-initial-HNP-roleswitch-work-v2.patch |  133 +
>  ...b-support-disconnect-after-HNP-roleswitch.patch |  145 +
>  recipes/linux/linux-omap-2.6.29/overo/defconfig    |  497 +-
>  recipes/linux/linux-omap-2.6.29/overo/ehci.patch   |  113 +
>  .../0001-ASoC-Add-support-for-OMAP3-EVM.patch      |  206 -
>  ...-New-display-subsystem-driver-for-OMAP2-3.patch |10355 ---------
>  .../0001-Implement-downsampling-with-debugs.patch  |  138 -
>  ...solution-check-that-prevents-scaling-when.patch |   26 -
>  ...es-Steve-Kipisz-USB-EHCI-support.-He-star.patch |  146 -
>  ...MAPFB-fb-driver-for-new-display-subsystem.patch | 3809 ----
>  .../0003-DSS-Add-generic-DVI-panel.patch           |  146 -
>  .../0004-DSS-support-for-Beagle-Board.patch        | 1607 --
>  ...05-DSS-Sharp-LS037V7DW01-LCD-Panel-driver.patch |  156 -
>  .../0006-DSS-Support-for-OMAP3-SDP-board.patch     | 1877 --
>  .../0007-DSS-Support-for-OMAP3-EVM-board.patch     |  255 -
>  .../0008-DSS-Hacked-N810-support.patch             | 1076 -
>  ...FB-allocate-fbmem-only-for-fb0-or-if-spes.patch |  121 -
>  ...FB-remove-extra-omapfb_setup_overlay-call.patch |   29 -
>  ...B-fix-GFX_SYNC-to-be-compatible-with-DSS1.patch |   27 -
>  ...omments-to-FAKE_VSYNC-to-make-things-more.patch |   27 -
>  .../0013-DSS-OMAPFB-remove-extra-spaces.patch      |   25 -
>  .../0014-DSS-fix-clk_get_usecount.patch            |   67 -
>  .../linux-omap-pm/add-cpufreq-for-omap3evm.diff    |   28 -
>  recipes/linux/linux-omap-pm/beagleboard/ehci.patch |  131 +
>  .../linux/linux-omap-pm/cache-display-fix.patch    |  238 -
>  recipes/linux/linux-omap-pm/dss2.diff              |    9 -
>  ...t-gro-Fix-legacy-path-napi_complete-crash.patch |   39 +
>  ...002-OMAPFB-move-omapfb.h-to-include-linux.patch | 1297 ++
>  ...003-DSS2-OMAP2-3-Display-Subsystem-driver.patch |14450 ++++++++++++
>  .../dss2/0004-DSS2-OMAP-framebuffer-driver.patch   | 3403 +++
>  .../dss2/0005-DSS2-Add-panel-drivers.patch         |  396 +
>  .../0006-DSS2-HACK-Add-DSS2-support-for-N800.patch | 1079 +
>  ...Add-DSS2-support-for-SDP-Beagle-Overo-EVM.patch | 5691 +++++
>  ...unction-to-display-object-to-get-the-back.patch |   39 +
>  .../dss2/0009-DSS2-Add-acx565akm-panel.patch       |  778 +
>  ...2-Small-VRFB-context-allocation-bug-fixed.patch |   28 +
>  ...-Allocated-memory-for-Color-Look-up-table.patch |   37 +
>  .../dss2/0012-DSS2-Fix-DMA-rotation.patch          |   65 +
>  .../0013-DSS2-Verify-that-overlay-paddr-0.patch    |   41 +
>  ...-Add-function-to-get-DSS-logic-clock-rate.patch |   51 +
>  ...-DSS2-DSI-calculate-VP_CLK_RATIO-properly.patch |   68 +
>  ...6-DSS2-DSI-improve-packet-len-calculation.patch |   58 +
>  ...2-Disable-video-planes-on-sync-lost-error.patch |  103 +
>  ...S2-check-for-ovl-paddr-only-when-enabling.patch |   40 +
>  ...-fclk-limits-when-configuring-video-plane.patch |  183 +
>  ...heck-scaling-limits-against-proper-values.patch |   79 +
>  .../dss2/0021-DSS2-Add-venc-register-dump.patch    |   96 +
>  .../0022-DSS2-FB-remove-unused-var-warning.patch   |   27 +
>  ...the-default-FB-color-format-through-board.patch |  214 +
>  .../dss2/0024-DSS2-Beagle-Use-gpio_set_value.patch |   48 +
>  ...-Macro-for-calculating-base-address-of-th.patch |   28 +
>  ...I-sidlemode-to-noidle-while-sending-frame.patch |   78 +
>  ...2-VRFB-rotation-and-mirroring-implemented.patch |  324 +
>  ...FB-Added-support-for-the-YUV-VRFB-rotatio.patch |  236 +
>  ...FB-Set-line_length-correctly-for-YUV-with.patch |   61 +
>  ..._get_trans_key-was-returning-wrong-key-ty.patch |   29 +
>  ...2-do-bootmem-reserve-for-exclusive-access.patch |   33 +
>  ...DSS2-Fix-DISPC_VID_FIR-value-for-omap34xx.patch |   35 +
>  .../dss2/0033-DSS2-Prefer-3-tap-filter.patch       |   82 +
>  ...34-DSS2-VRAM-improve-omap_vram_add_region.patch |  135 +
>  ...-the-function-pointer-for-getting-default.patch |   66 +
>  ...-support-for-setting-and-querying-alpha-b.patch |  118 +
>  ...2-Added-support-for-querying-color-keying.patch |  150 +
>  ...B-Some-color-keying-pointerd-renamed-in-D.patch |   56 +
>  ...ysfs-entry-to-for-the-alpha-blending-supp.patch |   59 +
>  ...ded-proper-exclusion-for-destination-colo.patch |   97 +
>  ...S2-Disable-vertical-offset-with-fieldmode.patch |   71 +
>  ...DSS2-Don-t-enable-fieldmode-automatically.patch |   34 +
>  ...3-DSS2-Swap-field-0-and-field-1-registers.patch |  170 +
>  ...dd-sysfs-entry-for-seting-the-rotate-type.patch |   76 +
>  .../0045-DSS2-Fixed-line-endings-from-to.patch     |   48 +
>  ...-DSI-decrease-sync-timeout-from-60s-to-2s.patch |   26 +
>  ...eturn-value-for-rotate_type-sysfs-functio.patch |   44 +
>  ...3-DMA-implement-trans-copy-and-const-fill.patch |  123 +
>  ...9-DSS2-VRAM-clear-allocated-area-with-DMA.patch |  101 +
>  .../0050-DSS2-OMAPFB-remove-fb-clearing-code.patch |   53 +
>  .../0051-DSS2-VRAM-use-debugfs-not-procfs.patch    |  170 +
>  ...52-DSS2-VRAM-fix-section-mismatch-warning.patch |   34 +
>  ...S2-disable-LCD-DIGIT-before-resetting-DSS.patch |   41 +
>  recipes/linux/linux-omap-pm/dss2/merge-fixups.diff |   49 +
>  recipes/linux/linux-omap-pm/dvb-fix-dma.diff       |   60 -
>  .../linux-omap-pm/fix-clkrate-programming.diff     |   57 -
>  recipes/linux/linux-omap-pm/fix-dpll-m4.diff       |   37 -
>  recipes/linux/linux-omap-pm/fix-irq33.diff         |  111 -
>  recipes/linux/linux-omap-pm/fixup-evm-cpufreq.diff |   44 -
>  recipes/linux/linux-omap-pm/ioremap-fix.patch      |   75 -
>  recipes/linux/linux-omap-pm/mru-256MB.diff         |   24 -
>  .../mru-enable-overlay-optimalization.diff         |  117 -
>  .../linux-omap-pm/mru-fix-display-panning.diff     |   49 -
>  recipes/linux/linux-omap-pm/mru-fix-timings.diff   |   26 -
>  .../linux-omap-pm/mru-improve-pixclock-config.diff |   93 -
>  .../mru-make-video-timings-selectable.diff         |  312 -
>  .../musb-support-high-bandwidth.patch.eml          |  134 -
>  recipes/linux/linux-omap-pm/no-harry-potter.diff   |   11 -
>  recipes/linux/linux-omap-pm/omap-2430-lcd.patch    |   11 -
>  .../linux/linux-omap-pm/oprofile-0.9.3.armv7.diff  |  599 -
>  recipes/linux/linux-omap-pm/overo-cpufreq.diff     |   25 +
>  recipes/linux/linux-omap-pm/overo/defconfig        | 2250 ++
>  recipes/linux/linux-omap-pm/overo/ehci.patch       |  113 +
>  .../linux-omap-pm/strongly-ordered-memory.diff     |   18 -
>  ...edc-suppress-needless-timer-reprogramming.patch |   81 -
>  .../linux/linux-omap-pm/timer-suppression.patch    |   43 -
>  recipes/linux/linux-omap-pm/touchscreen.patch      |   22 -
>  .../linux/linux-omap-pm/twl-asoc-fix-record.diff   |   34 -
>  recipes/linux/linux-omap-pm/usbttyfix.patch        |   29 -
>  recipes/linux/linux-omap-pm_git.bb                 |   95 +-
>  recipes/linux/linux-omap_2.6.28.bb                 |    4 +-
>  recipes/linux/linux-omap_2.6.29.bb                 |  146 +-
>  248 files changed, 102107 insertions(+), 46621 deletions(-)
>  create mode 100644 conf/machine/include/omap3.inc
>  create mode 100644 recipes/linux/linux-omap-2.6.28/modedb-hd720.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/0001-implement-TIF_RESTORE_SIGMASK-support-and-enable-the.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/0124-leds-gpio-broken-with-current-git.patch 
> 
>  delete mode 100644 recipes/linux/linux-omap-2.6.29/DSS2.diff
>  create mode 100644 recipes/linux/linux-omap-2.6.29/ads7846-detection.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/beagleboard/beagle-asoc.patch
>  create mode 100644 recipes/linux/linux-omap-2.6.29/beagleboard/ehci.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0001-Revert-gro-Fix-legacy-path-napi_complete-crash.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0002-OMAPFB-move-omapfb.h-to-include-linux.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0003-DSS2-OMAP2-3-Display-Subsystem-driver.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0004-DSS2-OMAP-framebuffer-driver.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0005-DSS2-Add-panel-drivers.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0006-DSS2-HACK-Add-DSS2-support-for-N800.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0007-DSS2-Add-DSS2-support-for-SDP-Beagle-Overo-EVM.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0008-DSS2-Add-function-to-display-object-to-get-the-back.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0009-DSS2-Add-acx565akm-panel.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0010-DSS2-Small-VRFB-context-allocation-bug-fixed.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0011-DSS2-Allocated-memory-for-Color-Look-up-table.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0012-DSS2-Fix-DMA-rotation.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0013-DSS2-Verify-that-overlay-paddr-0.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0014-DSS2-Add-function-to-get-DSS-logic-clock-rate.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0015-DSS2-DSI-calculate-VP_CLK_RATIO-properly.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0016-DSS2-DSI-improve-packet-len-calculation.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0017-DSS2-Disable-video-planes-on-sync-lost-error.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0018-DSS2-check-for-ovl-paddr-only-when-enabling.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0019-DSS2-Check-fclk-limits-when-configuring-video-plane.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0020-DSS2-Check-scaling-limits-against-proper-values.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0021-DSS2-Add-venc-register-dump.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0022-DSS2-FB-remove-unused-var-warning.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0023-DSS2-pass-the-default-FB-color-format-through-board.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0024-DSS2-Beagle-Use-gpio_set_value.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0025-DSS2-VRFB-Macro-for-calculating-base-address-of-th.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0026-DSS2-DSI-sidlemode-to-noidle-while-sending-frame.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0027-DSS2-VRFB-rotation-and-mirroring-implemented.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0028-DSS2-OMAPFB-Added-support-for-the-YUV-VRFB-rotatio.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0029-DSS2-OMAPFB-Set-line_length-correctly-for-YUV-with.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0030-DSS2-dispc_get_trans_key-was-returning-wrong-key-ty.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0031-DSS2-do-bootmem-reserve-for-exclusive-access.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0032-DSS2-Fix-DISPC_VID_FIR-value-for-omap34xx.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0033-DSS2-Prefer-3-tap-filter.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0034-DSS2-VRAM-improve-omap_vram_add_region.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0035-DSS2-Added-the-function-pointer-for-getting-default.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0036-DSS2-Added-support-for-setting-and-querying-alpha-b.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0037-DSS2-Added-support-for-querying-color-keying.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0038-DSS2-OMAPFB-Some-color-keying-pointerd-renamed-in-D.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0039-DSS2-Add-sysfs-entry-to-for-the-alpha-blending-supp.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0040-DSS2-Provided-proper-exclusion-for-destination-colo.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0041-DSS2-Disable-vertical-offset-with-fieldmode.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0042-DSS2-Don-t-enable-fieldmode-automatically.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0043-DSS2-Swap-field-0-and-field-1-registers.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0044-DSS2-add-sysfs-entry-for-seting-the-rotate-type.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0045-DSS2-Fixed-line-endings-from-to.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0046-DSS2-DSI-decrease-sync-timeout-from-60s-to-2s.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0047-DSS2-fix-return-value-for-rotate_type-sysfs-functio.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0048-OMAP2-3-DMA-implement-trans-copy-and-const-fill.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0049-DSS2-VRAM-clear-allocated-area-with-DMA.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0050-DSS2-OMAPFB-remove-fb-clearing-code.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0051-DSS2-VRAM-use-debugfs-not-procfs.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0052-DSS2-VRAM-fix-section-mismatch-warning.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0053-DSS2-disable-LCD-DIGIT-before-resetting-DSS.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0054-DSS2-DSI-more-error-handling.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0055-DSS2-Added-global-alpha-support.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0056-DSS2-Rotation-attrs-for-YUV-need-not-to-be-reversed.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0057-DSS2-Documentation-update-for-new-sysfs-entries-in.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0058-DSS2-Don-t-touch-plane-coordinates-when-changing-fb.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0059-DSS2-DSI-configure-ENTER-EXIT_HS_MODE_LATENCY.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0060-DSS2-Avoid-div-by-zero-when-calculating-required-fc.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0061-DSS2-VRFB-save-restore-context.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0062-DSS2-VRAM-Fix-indentation.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0063-DSS2-fix-the-usage-of-get_last_off_on_transaction_i.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0064-VRFB-fix-debug-messages.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0065-VRFB-add-suspend-resume-functionality.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0066-DSS2-DSI-tune-the-timings-to-be-more-relaxed.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0067-DSS2-VRFB-don-t-WARN-when-releasing-inactive-ctx.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0068-DSS2-Swap-field-offset-values-w-VRFB-rotation.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0069-DSS2-OMAP3EVM-Added-DSI-powerup-and-powerdown-func.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0070-DSS2-fix-irq1.diff
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/dss2/0071-DSS2-fix-irq2.diff
>  create mode 100644 recipes/linux/linux-omap-2.6.29/ehci.patch
>  create mode 100644 recipes/linux/linux-omap-2.6.29/fix-audio-capture.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/base/0001-omap3-Add-base-address-definitions-and-resources-fo.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0001-omap-iommu-tlb-and-pagetable-primitives.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0002-omap-iommu-omap2-architecture-specific-functions.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0003-omap-iommu-omap3-iommu-device-registration.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0004-omap-iommu-simple-virtual-address-space-management.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0005-omap-iommu-entries-for-Kconfig-and-Makefile.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0006-omap-iommu-Don-t-try-BUG_ON-in_interrupt.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0007-omap-iommu-We-support-chained-scatterlists-probabl.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/iommu/0008-omap2-iommu-entries-for-Kconfig-and-Makefile.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0001-omap3isp-Add-ISP-main-driver-and-register-definitio.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0002-omap3isp-Add-ISP-MMU-wrapper.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0003-omap3isp-Add-userspace-header.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0004-omap3isp-Add-ISP-frontend-CCDC.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0005-omap3isp-Add-ISP-backend-PRV-and-RSZ.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0006-omap3isp-Add-statistics-collection-modules-H3A-and.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0007-omap3isp-Add-CSI2-interface-support.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0008-omap3isp-Add-ISP-tables.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/omap3camera/0009-omap34xxcam-Add-camera-driver.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/standalone/0001-Resizer-and-Previewer-driver-added-to-commit.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/standalone/0002-Resizer-bug-fixes-on-top-of-1.0.2-release.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/v4l/0001-V4L2-Add-COLORFX-user-control.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/v4l/0002-V4L-Int-if-v4l2_int_device_try_attach_all-requires.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/v4l/0003-V4L-Int-if-Dummy-slave.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/v4l/0004-V4L-int-device-add-support-for-VIDIOC_QUERYMENU.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/isp/v4l/0005-V4L-Int-if-Add-vidioc_int_querycap.patch 
> 
>  create mode 100644 recipes/linux/linux-omap-2.6.29/mmctiming.patch
>  create mode 100644 recipes/linux/linux-omap-2.6.29/modedb-hd720.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0001-USB-musb-only-turn-off-vbus-in-OTG-hosts.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0002-USB-composite-avoid-inconsistent-lock-state.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0003-USB-musb-NAK-timeout-scheme-on-bulk-RX-endpoint.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0004-USB-musb-rewrite-host-periodic-endpoint-allocation.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0005-USB-TWL-disable-VUSB-regulators-when-cable-unplugg.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0006-USB-gadget-composite-device-level-suspend-resume-h.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0007-usb-gadget-fix-ethernet-link-reports-to-ethtool.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0008-usb-musb_host-minor-enqueue-locking-fix-v2.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0009-usb-musb_host-fix-ep0-fifo-flushing.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0010-musb-sanitize-clearing-TXCSR-DMA-bits-take-2.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0011-musb-fix-isochronous-TXDMA-take-2.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0012-musb-fix-possible-panic-while-resuming.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0013-musb_host-refactor-musb_save_toggle-take-2.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0014-musb_gadget-suppress-parasitic-TX-interrupts-with.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0015-musb_gadget-fix-unhandled-endpoint-0-IRQs.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0016-musb_host-factor-out-musb_ep_-get-set-_qh.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0017-musb_host-refactor-URB-giveback.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0018-musb-split-out-CPPI-interrupt-handler.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0019-musb_host-simplify-check-for-active-URB.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0020-musb_host-streamline-musb_cleanup_urb-calls.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0021-twl4030-usb-fix-minor-reporting-goofage.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0022-musb-use-dma-mode-1-for-TX-if-transfer-size-equals.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0023-musb-add-high-bandwidth-ISO-support.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0024-USB-otg-adding-nop-usb-transceiver.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0025-nop-usb-xceiv-behave-when-linked-as-a-module.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0026-musb-proper-hookup-to-transceiver-drivers.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0027-musb-otg-timer-cleanup.patch
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0028-musb-make-initial-HNP-roleswitch-work-v2.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-2.6.29/musb/0029-musb-support-disconnect-after-HNP-roleswitch.patch 
> 
>  create mode 100644 recipes/linux/linux-omap-2.6.29/overo/ehci.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0001-ASoC-Add-support-for-OMAP3-EVM.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0001-DSS-New-display-subsystem-driver-for-OMAP2-3.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0001-Implement-downsampling-with-debugs.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0001-Removed-resolution-check-that-prevents-scaling-when.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0001-This-merges-Steve-Kipisz-USB-EHCI-support.-He-star.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0002-DSS-OMAPFB-fb-driver-for-new-display-subsystem.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0003-DSS-Add-generic-DVI-panel.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0004-DSS-support-for-Beagle-Board.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0005-DSS-Sharp-LS037V7DW01-LCD-Panel-driver.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0006-DSS-Support-for-OMAP3-SDP-board.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0007-DSS-Support-for-OMAP3-EVM-board.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0008-DSS-Hacked-N810-support.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0009-DSS-OMAPFB-allocate-fbmem-only-for-fb0-or-if-spes.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0010-DSS-OMAPFB-remove-extra-omapfb_setup_overlay-call.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0011-DSS-OMAPFB-fix-GFX_SYNC-to-be-compatible-with-DSS1.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0012-DSS-Add-comments-to-FAKE_VSYNC-to-make-things-more.patch 
> 
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0013-DSS-OMAPFB-remove-extra-spaces.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/0014-DSS-fix-clk_get_usecount.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/add-cpufreq-for-omap3evm.diff
>  create mode 100644 recipes/linux/linux-omap-pm/beagleboard/ehci.patch
>  delete mode 100644 recipes/linux/linux-omap-pm/cache-display-fix.patch
>  delete mode 100644 recipes/linux/linux-omap-pm/dss2.diff
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0001-Revert-gro-Fix-legacy-path-napi_complete-crash.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0002-OMAPFB-move-omapfb.h-to-include-linux.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0003-DSS2-OMAP2-3-Display-Subsystem-driver.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0004-DSS2-OMAP-framebuffer-driver.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0005-DSS2-Add-panel-drivers.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0006-DSS2-HACK-Add-DSS2-support-for-N800.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0007-DSS2-Add-DSS2-support-for-SDP-Beagle-Overo-EVM.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0008-DSS2-Add-function-to-display-object-to-get-the-back.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0009-DSS2-Add-acx565akm-panel.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0010-DSS2-Small-VRFB-context-allocation-bug-fixed.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0011-DSS2-Allocated-memory-for-Color-Look-up-table.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0012-DSS2-Fix-DMA-rotation.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0013-DSS2-Verify-that-overlay-paddr-0.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0014-DSS2-Add-function-to-get-DSS-logic-clock-rate.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0015-DSS2-DSI-calculate-VP_CLK_RATIO-properly.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0016-DSS2-DSI-improve-packet-len-calculation.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0017-DSS2-Disable-video-planes-on-sync-lost-error.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0018-DSS2-check-for-ovl-paddr-only-when-enabling.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0019-DSS2-Check-fclk-limits-when-configuring-video-plane.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0020-DSS2-Check-scaling-limits-against-proper-values.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0021-DSS2-Add-venc-register-dump.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0022-DSS2-FB-remove-unused-var-warning.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0023-DSS2-pass-the-default-FB-color-format-through-board.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0024-DSS2-Beagle-Use-gpio_set_value.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0025-DSS2-VRFB-Macro-for-calculating-base-address-of-th.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0026-DSS2-DSI-sidlemode-to-noidle-while-sending-frame.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0027-DSS2-VRFB-rotation-and-mirroring-implemented.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0028-DSS2-OMAPFB-Added-support-for-the-YUV-VRFB-rotatio.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0029-DSS2-OMAPFB-Set-line_length-correctly-for-YUV-with.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0030-DSS2-dispc_get_trans_key-was-returning-wrong-key-ty.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0031-DSS2-do-bootmem-reserve-for-exclusive-access.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0032-DSS2-Fix-DISPC_VID_FIR-value-for-omap34xx.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0033-DSS2-Prefer-3-tap-filter.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0034-DSS2-VRAM-improve-omap_vram_add_region.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0035-DSS2-Added-the-function-pointer-for-getting-default.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0036-DSS2-Added-support-for-setting-and-querying-alpha-b.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0037-DSS2-Added-support-for-querying-color-keying.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0038-DSS2-OMAPFB-Some-color-keying-pointerd-renamed-in-D.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0039-DSS2-Add-sysfs-entry-to-for-the-alpha-blending-supp.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0040-DSS2-Provided-proper-exclusion-for-destination-colo.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0041-DSS2-Disable-vertical-offset-with-fieldmode.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0042-DSS2-Don-t-enable-fieldmode-automatically.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0043-DSS2-Swap-field-0-and-field-1-registers.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0044-DSS2-add-sysfs-entry-for-seting-the-rotate-type.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0045-DSS2-Fixed-line-endings-from-to.patch
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0046-DSS2-DSI-decrease-sync-timeout-from-60s-to-2s.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0047-DSS2-fix-return-value-for-rotate_type-sysfs-functio.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0048-OMAP2-3-DMA-implement-trans-copy-and-const-fill.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0049-DSS2-VRAM-clear-allocated-area-with-DMA.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0050-DSS2-OMAPFB-remove-fb-clearing-code.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0051-DSS2-VRAM-use-debugfs-not-procfs.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0052-DSS2-VRAM-fix-section-mismatch-warning.patch 
> 
>  create mode 100644 
> recipes/linux/linux-omap-pm/dss2/0053-DSS2-disable-LCD-DIGIT-before-resetting-DSS.patch 
> 
>  create mode 100644 recipes/linux/linux-omap-pm/dss2/merge-fixups.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/dvb-fix-dma.diff
>  create mode 100644 recipes/linux/linux-omap-pm/ehci.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/fix-clkrate-programming.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/fix-dpll-m4.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/fix-irq33.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/fixup-evm-cpufreq.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/ioremap-fix.patch
>  delete mode 100644 recipes/linux/linux-omap-pm/mru-256MB.diff
>  delete mode 100644 
> recipes/linux/linux-omap-pm/mru-enable-overlay-optimalization.diff
>  delete mode 100644 
> recipes/linux/linux-omap-pm/mru-fix-display-panning.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/mru-fix-timings.diff
>  delete mode 100644 
> recipes/linux/linux-omap-pm/mru-improve-pixclock-config.diff
>  delete mode 100644 
> recipes/linux/linux-omap-pm/mru-make-video-timings-selectable.diff
>  delete mode 100644 
> recipes/linux/linux-omap-pm/musb-support-high-bandwidth.patch.eml
>  delete mode 100644 recipes/linux/linux-omap-pm/no-harry-potter.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/omap-2430-lcd.patch
>  delete mode 100644 recipes/linux/linux-omap-pm/oprofile-0.9.3.armv7.diff
>  create mode 100644 recipes/linux/linux-omap-pm/overo-cpufreq.diff
>  create mode 100644 recipes/linux/linux-omap-pm/overo/defconfig
>  create mode 100644 recipes/linux/linux-omap-pm/overo/ehci.patch
>  delete mode 100644 
> recipes/linux/linux-omap-pm/strongly-ordered-memory.diff
>  delete mode 100644 
> recipes/linux/linux-omap-pm/tick-schedc-suppress-needless-timer-reprogramming.patch 
> 
>  delete mode 100644 recipes/linux/linux-omap-pm/timer-suppression.patch
>  delete mode 100644 recipes/linux/linux-omap-pm/touchscreen.patch
>  delete mode 100644 recipes/linux/linux-omap-pm/twl-asoc-fix-record.diff
>  delete mode 100644 recipes/linux/linux-omap-pm/usbttyfix.patch
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--------------ms020805040500040101050207
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDUyNzE3
MjExOFowIwYJKoZIhvcNAQkEMRYEFEgja4MIoEL+9ZT0zVLcCH3OX3LmMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQAuxqfc5MaYGLBLpgIggDArSQ9BKgQUBTF76uFmxedvimppCajw
NfCQV5H/YPkfvFmMCkw1fUqQrO7jTqln8AmAFNRXCfkONsRpmP6EM14jB3COndJwhkM11/QPoXhy
v304FI8bKqXh5P8MMnY3iagK7WcIjhU4LD8ISFsly6FAFh4U/urfsgPndPq9QEuJreoUloCUszzk
49YrK60G0K5GLXc3kNKGWxgXfQ6mJis9//jsB3tuhXgp6GqqO2xwBzW/5WjvxFZyHMuaUsxDoNym
qfgarnCFsj6saAPK1Kv6n18aCky9GbUVjbo16bmvfsGAtJX1lnwwVUhz8i7YlUxgAAAAAAAA

--------------ms020805040500040101050207--
