Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UQIga-00031A-5n
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 16:41:31 +0200
Message-ID: <5166C774.5040200@communistcode.co.uk>
Date: Thu, 11 Apr 2013 15:23:48 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
In-Reply-To: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Thu, 11 Apr 2013 14:41:41 -0000
X-List-Received-Date: Thu, 11 Apr 2013 14:41:41 -0000
X-Groupsio-MsgNum: 44078
Content-Type: multipart/mixed; boundary="------------060402050709010203030508"

--------------060402050709010203030508
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/13 05:51, Khem Raj wrote:
> All,
>
> I have added gcc 4.8 recipes and the branch is here
>
> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>
> cgit
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-4.8
>
> Please test it out on your respective environments if you can.
>
> To enable gcc 4.8 with OE-Core you would
>
> in local.conf set
>
> GCCVERSION = "4.8%"
>
> and if you use angstrom. Please checkout 'next' branch of setup-scripts
> and then in conf/local.conf
>
> set
>
> ANGSTROM_GCC_VERSION = "4.8%"
>
> My testing so far has been building systems-image for all qemu machines and they
> seem to boot as good as 4.7 did. But I am hoping for wider testing and finding issues
> or very least improve the existing recipes for now and once the 1.4 release is done
> we can then propose it for inclusion in OE-Core
>
> Thanks for your time
>
>
> -Khem
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Hi Khem,

Testing your patches today threw up a build failure in nativesdk-qemu.

Log attached.

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------060402050709010203030508
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.24885"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_compile.24885"

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 8
  GEN   mips64-softmmu/config-devices.mak
  GEN   mips64el-softmmu/config-devices.mak
  GEN   arm-linux-user/config-devices.mak
  GEN   arm-softmmu/config-devices.mak
  GEN   i386-linux-user/config-devices.mak
  GEN   i386-softmmu/config-devices.mak
  GEN   mips-linux-user/config-devices.mak
  GEN   mips-softmmu/config-devices.mak
  GEN   mipsel-linux-user/config-devices.mak
  GEN   mipsel-softmmu/config-devices.mak
  GEN   ppc-softmmu/config-devices.mak
  GEN   ppc-linux-user/config-devices.mak
  GEN   sh4-linux-user/config-devices.mak
  GEN   sh4-softmmu/config-devices.mak
  GEN   x86_64-linux-user/config-devices.mak
  GEN   x86_64-softmmu/config-devices.mak
  GEN   config-host.h
  GEN   qemu-options.def
  GEN   qmp-commands.h
  GEN   qapi-types.h
  GEN   qapi-visit.h
  GEN   trace/generated-tracers.h
  GEN   tests/test-qapi-types.h
  GEN   tests/test-qapi-visit.h
  GEN   tests/test-qmp-commands.h
  GEN   config-all-devices.mak
  GEN   qemu-monitor.texi
  GEN   qemu-options.texi
  GEN   qemu-img-cmds.texi
  GEN   qemu-nbd.8
  GEN   QMP/qmp-commands.txt
  GEN   qapi-types.c
  GEN   qemu-tech.html
  GEN   qga/qapi-generated/qga-qapi-types.h
  GEN   qga/qapi-generated/qga-qapi-visit.h
  GEN   qga/qapi-generated/qga-qmp-commands.h
  GEN   qapi-visit.c
  GEN   qga/qapi-generated/qga-qapi-types.c
  GEN   qga/qapi-generated/qga-qapi-visit.c
  GEN   qga/qapi-generated/qga-qmp-marshal.c
  CC    qapi/qapi-visit-core.o
  CC    qapi/qapi-dealloc-visitor.o
  CC    qapi/qmp-input-visitor.o
  CC    qapi/qmp-output-visitor.o
  CC    qapi/qmp-registry.o
  CC    qapi/qmp-dispatch.o
  CC    qapi/string-input-visitor.o
  CC    qapi/string-output-visitor.o
  CC    qapi/opts-visitor.o
  CC    qobject/qint.o
  CC    qobject/qstring.o
  CC    qobject/qdict.o
  CC    qobject/qlist.o
  CC    qobject/qfloat.o
  CC    qobject/qbool.o
  CC    qobject/qjson.o
  CC    qobject/json-lexer.o
  CC    qobject/json-streamer.o
  CC    qobject/json-parser.o
  CC    qobject/qerror.o
  CC    trace/default.o
  CC    trace/control.o
  GEN   trace/generated-tracers.c
  CC    util/osdep.o
  CC    util/cutils.o
  CC    util/qemu-timer-common.o
  CC    util/oslib-posix.o
  CC    util/qemu-thread-posix.o
  CC    util/event_notifier-posix.o
  CC    util/envlist.o
  CC    util/path.o
  CC    util/host-utils.o
  CC    util/cache-utils.o
  CC    util/module.o
  CC    util/bitmap.o
  CC    util/bitops.o
  CC    util/hbitmap.o
  CC    util/acl.o
  CC    util/error.o
  CC    util/qemu-error.o
  CC    util/compatfd.o
  CC    util/iov.o
  CC    util/aes.o
  CC    util/qemu-config.o
  CC    util/qemu-sockets.o
  CC    util/uri.o
  CC    util/notify.o
  CC    util/qemu-option.o
  CC    util/qemu-progress.o
  CC    stubs/arch-query-cpu-def.o
  CC    stubs/clock-warp.o
  CC    stubs/cpu-get-clock.o
  CC    stubs/cpu-get-icount.o
  CC    stubs/fdset-add-fd.o
  CC    stubs/fdset-find-fd.o
  CC    stubs/fdset-get-fd.o
  CC    stubs/fdset-remove-fd.o
  CC    stubs/get-fd.o
  CC    stubs/get-vm-name.o
  CC    stubs/iothread-lock.o
  CC    stubs/migr-blocker.o
  CC    stubs/mon-is-qmp.o
  CC    stubs/mon-printf.o
  CC    stubs/mon-print-filename.o
  CC    stubs/mon-protocol-event.o
  CC    stubs/mon-set-error.o
  CC    stubs/reset.o
  CC    stubs/set-fd-handler.o
  CC    stubs/slirp.o
  CC    stubs/sysbus.o
  CC    stubs/vm-stop.o
  CC    stubs/vmstate.o
  CC    qemu-nbd.o
  CC    async.o
  CC    thread-pool.o
  CC    nbd.o
  CC    block.o
  CC    blockjob.o
  CC    main-loop.o
  CC    iohandler.o
  CC    qemu-timer.o
  CC    aio-posix.o
  CC    qemu-coroutine.o
  CC    qemu-coroutine-lock.o
  CC    qemu-coroutine-io.o
  CC    qemu-coroutine-sleep.o
  CC    coroutine-ucontext.o
  CC    block/raw.o
  CC    block/cow.o
  CC    block/qcow.o
  CC    block/vdi.o
  CC    block/vmdk.o
  CC    block/cloop.o
  CC    block/dmg.o
  CC    block/bochs.o
  CC    block/vpc.o
  CC    block/vvfat.o
  CC    block/qcow2.o
  CC    block/qcow2-refcount.o
  CC    block/qcow2-cluster.o
  CC    block/qcow2-snapshot.o
  CC    block/qcow2-cache.o
  CC    block/qed.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/qemu-1.4.0/include/qemu-common.h:15:0,
                 from block/qcow2-snapshot.c:25:
block/qcow2-snapshot.c: In function 'qcow2_write_snapshots':
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/qemu-1.4.0/include/qemu/compiler.h:36:23: warning: typedef 'qemu_build_bug_on__250' locally defined but not used [-Wunused-local-typedefs]
     typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1];
                       ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/qemu-1.4.0/include/qemu/compiler.h:33:18: note: in definition of macro 'cat'
 #define cat(x,y) x ## y
                  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/qemu-1.4.0/include/qemu/compiler.h:36:18: note: in expansion of macro 'cat2'
     typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1];
                  ^
block/qcow2-snapshot.c:249:5: note: in expansion of macro 'QEMU_BUILD_BUG_ON'
     QEMU_BUILD_BUG_ON(offsetof(QCowHeader, snapshots_offset) !=
     ^
  CC    block/qed-gencb.o
  CC    block/qed-l2-cache.o
  CC    block/qed-table.o
  CC    block/qed-cluster.o
  CC    block/qed-check.o
  CC    block/parallels.o
  CC    block/blkdebug.o
  CC    block/blkverify.o
  CC    block/raw-posix.o
  CC    block/nbd.o
  CC    block/sheepdog.o
  GEN   qemu-img-cmds.h
  CC    qemu-io.o
  CC    cmd.o
  CC    qemu-bridge-helper.o
  CC    blockdev.o
  CC    blockdev-nbd.o
  CC    readline.o
  CC    os-posix.o
  CC    migration.o
  CC    migration-tcp.o
  CC    qemu-char.o
  CC    block-migration.o
  CC    page_cache.o
  CC    xbzrle.o
  CC    migration-exec.o
  CC    migration-unix.o
  CC    migration-fd.o
  CC    bt-host.o
  CC    bt-vhci.o
  CC    dma-helpers.o
  CC    qtest.o
  CC    vl.o
  GEN   qmp-marshal.c
  CC    qmp.o
  CC    hmp.o
  CC    qemu-log.o
  CC    tcg-runtime.o
  CC    audio/audio.o
  CC    audio/noaudio.o
  CC    audio/wavaudio.o
  CC    audio/mixeng.o
  CC    audio/sdlaudio.o
  CC    audio/ossaudio.o
  CC    audio/wavcapture.o
  CC    backends/rng.o
  CC    backends/rng-egd.o
  CC    backends/rng-random.o
  CC    block/stream.o
  CC    block/commit.o
  CC    block/mirror.o
  CC    disas/arm.o
  CC    disas/i386.o
  CC    disas/mips.o
  CC    disas/ppc.o
  CC    disas/sh4.o
  CC    fsdev/qemu-fsdev-dummy.o
  CC    fsdev/qemu-fsdev-opts.o
  CC    hw/qdev.o
  CC    hw/qdev-properties.o
  CC    hw/irq.o
  CC    hw/loader.o
  CC    hw/virtio-console.o
  CC    hw/virtio-rng.o
  CC    hw/virtio-pci.o
  CC    hw/virtio-bus.o
  CC    hw/fw_cfg.o
  CC    hw/pci_bridge_dev.o
  CC    hw/ioh3420.o
  CC    hw/xio3130_upstream.o
  CC    hw/xio3130_downstream.o
  CC    hw/i82801b11.o
  CC    hw/watchdog.o
  CC    hw/isa_mmio.o
  CC    hw/ecc.o
  CC    hw/nand.o
  CC    hw/pflash_cfi01.o
  CC    hw/pflash_cfi02.o
  CC    hw/m48t59.o
  CC    hw/escc.o
  CC    hw/serial.o
  CC    hw/serial-isa.o
  CC    hw/serial-pci.o
  CC    hw/parallel.o
  CC    hw/i8254_common.o
  CC    hw/i8254.o
  CC    hw/pcspk.o
  CC    hw/pckbd.o
  CC    hw/fdc.o
  CC    hw/acpi.o
  CC    hw/acpi_piix4.o
  CC    hw/acpi_ich9.o
  CC    hw/pm_smbus.o
  CC    hw/smbus_ich9.o
  CC    hw/apm.o
  CC    hw/dma.o
  CC    hw/i82374.o
  CC    hw/hpet.o
  CC    hw/applesmc.o
  CC    hw/ccid-card-passthru.o
  CC    hw/i8259_common.o
  CC    hw/i8259.o
  CC    hw/fifo.o
  CC    hw/pam.o
  CC    hw/prep_pci.o
  CC    hw/i82378.o
  CC    hw/pc87312.o
  CC    hw/macio.o
  CC    hw/cuda.o
  CC    hw/adb.o
  CC    hw/mac_nvram.o
  CC    hw/mac_dbdma.o
  CC    hw/heathrow_pic.o
  CC    hw/grackle_pci.o
  CC    hw/unin_pci.o
  CC    hw/dec_pci.o
  CC    hw/ppce500_pci.o
  CC    hw/g364fb.o
  CC    hw/piix4.o
  CC    hw/jazz_led.o
  CC    hw/xilinx_intc.o
  CC    hw/xilinx_timer.o
  CC    hw/xilinx_uartlite.o
  CC    hw/arm_timer.o
  CC    hw/pl011.o
  CC    hw/pl022.o
  CC    hw/pl031.o
  CC    hw/pl041.o
  CC    hw/lm4549.o
  CC    hw/pl050.o
  CC    hw/pl061.o
  CC    hw/pl080.o
  CC    hw/pl110.o
  CC    hw/pl181.o
  CC    hw/pl190.o
  CC    hw/arm_l2x0.o
  CC    hw/versatile_pci.o
  CC    hw/versatile_i2c.o
  CC    hw/cadence_uart.o
  CC    hw/cadence_ttc.o
  CC    hw/cadence_gem.o
  CC    hw/xgmac.o
  CC    hw/wdt_i6300esb.o
  CC    hw/tpci200.o
  CC    hw/ipoctal232.o
  CC    hw/ipack.o
  CC    hw/ne2000.o
  CC    hw/eepro100.o
  CC    hw/pcnet-pci.o
  CC    hw/pcnet.o
  CC    hw/e1000.o
  CC    hw/rtl8139.o
  CC    hw/smc91c111.o
  CC    hw/lan9118.o
  CC    hw/ne2000-isa.o
  CC    hw/lsi53c895a.o
  CC    hw/megasas.o
  CC    hw/esp.o
  CC    hw/esp-pci.o
  CC    hw/sysbus.o
  CC    hw/isa-bus.o
  CC    hw/qdev-addr.o
  CC    hw/vga-pci.o
  CC    hw/vga-isa.o
  CC    hw/vga-isa-mm.o
  CC    hw/vmware_vga.o
  CC    hw/vmmouse.o
  CC    hw/cirrus_vga.o
  CC    hw/rc4030.o
  CC    hw/ds1225y.o
  CC    hw/dp8393x.o
  CC    hw/mipsnet.o
  CC    hw/null-machine.o
  CC    hw/sb16.o
  CC    hw/es1370.o
  CC    hw/ac97.o
  CC    hw/intel-hda.o
  CC    hw/hda-audio.o
  CC    hw/ptimer.o
  CC    hw/max7310.o
  CC    hw/wm8750.o
  CC    hw/twl92230.o
  CC    hw/tsc2005.o
  CC    hw/lm832x.o
  CC    hw/tmp105.o
  CC    hw/stellaris_input.o
  CC    hw/ssd0303.o
  CC    hw/ssd0323.o
  CC    hw/ads7846.o
  CC    hw/max111x.o
  CC    hw/ds1338.o
  CC    hw/i2c.o
  CC    hw/smbus.o
  CC    hw/smbus_eeprom.o
  CC    hw/eeprom93xx.o
  CC    hw/scsi-disk.o
  CC    hw/cdrom.o
  CC    hw/hd-geometry.o
  CC    hw/block-common.o
  CC    hw/scsi-generic.o
  CC    hw/scsi-bus.o
  CC    hw/hid.o
  CC    hw/ssi.o
  CC    hw/m25p80.o
  CC    hw/ssi-sd.o
  CC    hw/bt.o
  CC    hw/sd.o
  CC    hw/bt-l2cap.o
  CC    hw/bt-sdp.o
  CC    hw/bt-hci.o
  CC    hw/bt-hid.o
  CC    hw/bt-hci-csr.o
  CC    hw/msmouse.o
  CC    hw/ps2.o
  CC    hw/qdev-monitor.o
  CC    hw/qdev-properties-system.o
  CC    net/net.o
  CC    net/queue.o
  CC    net/checksum.o
  CC    net/util.o
  CC    net/hub.o
  CC    net/socket.o
  CC    net/dump.o
  CC    net/tap.o
  CC    net/tap-linux.o
  CC    net/slirp.o
  CC    qom/object.o
  CC    qom/container.o
  CC    qom/qom-qobject.o
  CC    qom/cpu.o
  CC    slirp/cksum.o
  CC    slirp/if.o
  CC    slirp/ip_icmp.o
  CC    slirp/ip_input.o
  CC    slirp/ip_output.o
  CC    slirp/dnssearch.o
  CC    slirp/slirp.o
  CC    slirp/mbuf.o
  CC    slirp/misc.o
  CC    slirp/sbuf.o
  CC    slirp/socket.o
  CC    slirp/tcp_input.o
  CC    slirp/tcp_output.o
  CC    slirp/tcp_subr.o
  CC    slirp/tcp_timer.o
  CC    slirp/udp.o
  CC    slirp/bootp.o
  CC    slirp/tftp.o
  CC    slirp/arp_table.o
  CC    ui/keymaps.o
  CC    ui/console.o
  CC    ui/cursor.o
  CC    ui/input.o
  CC    ui/qemu-pixman.o
  CC    ui/sdl.o
  CC    ui/sdl_zoom.o
  CC    ui/x_keymap.o
  CC    ui/curses.o
  CC    ui/vnc.o
  CC    ui/d3des.o
  CC    ui/vnc-enc-zlib.o
  CC    ui/vnc-enc-hextile.o
  CC    ui/vnc-enc-tight.o
  CC    ui/vnc-palette.o
  CC    ui/vnc-enc-zrle.o
  CC    ui/vnc-jobs.o
  CC    hw/ide/core.o
  CC    hw/ide/atapi.o
  CC    hw/ide/qdev.o
  CC    hw/ide/pci.o
  CC    hw/ide/isa.o
  CC    hw/ide/piix.o
  CC    hw/ide/cmd646.o
  CC    hw/ide/macio.o
  CC    hw/ide/via.o
  CC    hw/ide/ahci.o
  CC    hw/ide/ich.o
  CC    hw/pci/pci.o
  CC    hw/pci/pci_bridge.o
  CC    hw/pci/msix.o
  CC    hw/pci/msi.o
  CC    hw/pci/shpc.o
  CC    hw/pci/slotid_cap.o
  CC    hw/pci/pci_host.o
  CC    hw/pci/pcie_host.o
  CC    hw/pci/pcie.o
  CC    hw/pci/pcie_aer.o
  CC    hw/pci/pcie_port.o
  CC    hw/pci/pci-stub.o
  CC    hw/usb/hcd-uhci.o
  CC    hw/usb/hcd-ohci.o
  CC    hw/usb/hcd-ehci.o
  CC    hw/usb/hcd-ehci-pci.o
  CC    hw/usb/hcd-ehci-sysbus.o
  CC    hw/usb/hcd-xhci.o
  CC    hw/usb/libhw.o
  CC    hw/usb/core.o
  CC    hw/usb/combined-packet.o
  CC    hw/usb/bus.o
  CC    hw/usb/desc.o
  CC    hw/usb/dev-hub.o
  CC    hw/usb/host-linux.o
  CC    hw/usb/dev-bluetooth.o
  CC    hw/usb/dev-hid.o
  CC    hw/usb/dev-storage.o
  CC    hw/usb/dev-wacom.o
  CC    hw/usb/dev-serial.o
  CC    hw/usb/dev-network.o
  CC    hw/usb/dev-audio.o
  CC    hw/usb/dev-smartcard-reader.o
  CC    hw/usb/dev-uas.o
  CPP   optionrom/multiboot.asm
  CPP   optionrom/linuxboot.asm
  CPP   optionrom/kvmvapic.asm
  GEN   qemu-doc.html
  AS    optionrom/multiboot.o
  AS    optionrom/linuxboot.o
  AS    optionrom/kvmvapic.o
  GEN   qemu.1
  GEN   qemu-img.1
  Building optionrom/multiboot.img
  Building optionrom/linuxboot.img
  CC    qapi-types.o
  Building optionrom/kvmvapic.img
  Building optionrom/multiboot.raw
  Building optionrom/linuxboot.raw
  Building optionrom/kvmvapic.raw
  Signing optionrom/multiboot.bin
  CC    qapi-visit.o
  Signing optionrom/linuxboot.bin
  CC    qga/commands.o
  Signing optionrom/kvmvapic.bin
  CC    qga/guest-agent-command-state.o
  CC    qga/main.o
  CC    qga/commands-posix.o
  CC    qga/channel-posix.o
  CC    qga/qapi-generated/qga-qapi-types.o
  CC    qga/qapi-generated/qga-qapi-visit.o
  CC    qga/qapi-generated/qga-qmp-marshal.o
  AR    libqemustub.a
  CC    qemu-img.o
  LINK  qemu-bridge-helper
  CC    qmp-marshal.o
  CC    trace/generated-tracers.o
  AR    libqemuutil.a
  LINK  qemu-ga
  LINK  qemu-nbd
  LINK  qemu-img
  LINK  qemu-io
  GEN   arm-linux-user/config-target.h
  GEN   arm-softmmu/hmp-commands.h
  GEN   mips64el-softmmu/hmp-commands.h
  CC    arm-linux-user/exec.o
  GEN   mips64-softmmu/hmp-commands.h
  CC    arm-linux-user/translate-all.o
  GEN   arm-softmmu/qmp-commands-old.h
  GEN   mips64el-softmmu/qmp-commands-old.h
  GEN   arm-softmmu/config-target.h
  CC    arm-linux-user/cpu-exec.o
  GEN   mips64-softmmu/qmp-commands-old.h
  GEN   mips64el-softmmu/config-target.h
  GEN   i386-linux-user/config-target.h
  GEN   mips64-softmmu/config-target.h
  CC    arm-linux-user/tcg/tcg.o
  CC    i386-linux-user/exec.o
  CC    arm-softmmu/exec.o
  CC    mips64-softmmu/exec.o
  CC    mips64el-softmmu/exec.o
  CC    mips64el-softmmu/translate-all.o
  GEN   i386-softmmu/hmp-commands.h
  CC    i386-linux-user/translate-all.o
  GEN   i386-softmmu/qmp-commands-old.h
  GEN   i386-softmmu/config-target.h
  CC    i386-softmmu/exec.o
  GEN   mips-linux-user/config-target.h
  CC    mips-linux-user/exec.o
  CC    mips-linux-user/translate-all.o
  CC    arm-linux-user/tcg/optimize.o
  CC    i386-linux-user/cpu-exec.o
  CC    mips64-softmmu/translate-all.o
  CC    i386-linux-user/tcg/tcg.o
  CC    mips64el-softmmu/cpu-exec.o
  CC    mips-linux-user/cpu-exec.o
  CC    arm-softmmu/translate-all.o
  GEN   mips-softmmu/hmp-commands.h
  CC    mips64el-softmmu/tcg/tcg.o
  CC    arm-linux-user/fpu/softfloat.o
  CC    i386-softmmu/translate-all.o
  GEN   mips-softmmu/qmp-commands-old.h
  CC    mips-linux-user/tcg/tcg.o
  GEN   mips-softmmu/config-target.h
  CC    mips64-softmmu/cpu-exec.o
  CC    mips-softmmu/exec.o
  CC    arm-softmmu/cpu-exec.o
  CC    arm-softmmu/tcg/tcg.o
  CC    mips64-softmmu/tcg/tcg.o
  CC    i386-softmmu/cpu-exec.o
  CC    i386-softmmu/tcg/tcg.o
  CC    i386-linux-user/tcg/optimize.o
  CC    mips64el-softmmu/tcg/optimize.o
  CC    mips-softmmu/translate-all.o
  CC    arm-softmmu/tcg/optimize.o
  CC    mips64el-softmmu/fpu/softfloat.o
  CC    i386-linux-user/fpu/softfloat.o
  CC    mips64-softmmu/tcg/optimize.o
  CC    mips-linux-user/tcg/optimize.o
  CC    mips-softmmu/cpu-exec.o
  CC    i386-softmmu/tcg/optimize.o
  CC    mips-softmmu/tcg/tcg.o
  CC    arm-softmmu/fpu/softfloat.o
  CC    mips64-softmmu/fpu/softfloat.o
  CC    arm-linux-user/disas.o
  CC    mips-linux-user/fpu/softfloat.o
  GEN   arm-linux-user/gdbstub-xml.c
  CC    i386-softmmu/fpu/softfloat.o
  CC    arm-linux-user/gdbstub.o
  CC    mips-softmmu/tcg/optimize.o
  CC    arm-linux-user/thunk.o
  CC    arm-linux-user/user-exec.o
  CC    arm-linux-user/linux-user/main.o
  CC    mips-softmmu/fpu/softfloat.o
  CC    mips64el-softmmu/disas.o
  CC    arm-linux-user/linux-user/syscall.o
  CC    mips64el-softmmu/arch_init.o
  CC    arm-softmmu/disas.o
  CC    i386-linux-user/disas.o
  CC    mips64-softmmu/disas.o
  GEN   arm-softmmu/gdbstub-xml.c
  CC    i386-linux-user/gdbstub.o
  CC    mips64el-softmmu/cpus.o
  CC    arm-softmmu/arch_init.o
  CC    mips-linux-user/disas.o
  CC    mips64-softmmu/arch_init.o
  CC    mips-linux-user/gdbstub.o
  CC    arm-softmmu/cpus.o
  CC    i386-linux-user/thunk.o
  CC    i386-softmmu/disas.o
  CC    mips64-softmmu/cpus.o
  CC    mips64el-softmmu/monitor.o
  CC    mips-linux-user/thunk.o
  CC    i386-softmmu/arch_init.o
  CC    i386-linux-user/user-exec.o
  CC    arm-softmmu/monitor.o
  CC    i386-linux-user/linux-user/main.o
  CC    mips-linux-user/user-exec.o
  CC    mips64-softmmu/monitor.o
  CC    i386-softmmu/cpus.o
  CC    mips-linux-user/linux-user/main.o
  CC    i386-linux-user/linux-user/syscall.o
  CC    mips-softmmu/disas.o
  CC    mips-linux-user/linux-user/syscall.o
  CC    mips-softmmu/arch_init.o
  CC    i386-softmmu/monitor.o
  CC    mips64el-softmmu/gdbstub.o
  CC    mips-softmmu/cpus.o
  CC    mips64-softmmu/gdbstub.o
  CC    arm-softmmu/gdbstub.o
  CC    mips64el-softmmu/balloon.o
  CC    mips64el-softmmu/ioport.o
  CC    arm-softmmu/balloon.o
  CC    mips-softmmu/monitor.o
  CC    mips64el-softmmu/kvm-stub.o
  CC    mips64-softmmu/balloon.o
  CC    mips64el-softmmu/memory.o
  CC    arm-softmmu/ioport.o
  CC    mips64-softmmu/ioport.o
  CC    i386-softmmu/gdbstub.o
  CC    arm-softmmu/kvm-stub.o
  CC    mips64-softmmu/kvm-stub.o
  CC    arm-softmmu/memory.o
  CC    i386-softmmu/balloon.o
  CC    mips64-softmmu/memory.o
  CC    i386-softmmu/ioport.o
  CC    mips64el-softmmu/savevm.o
  CC    i386-softmmu/kvm-all.o
  CC    mips-softmmu/gdbstub.o
  CC    arm-softmmu/savevm.o
  CC    mips-softmmu/balloon.o
  CC    mips64el-softmmu/cputlb.o
  CC    mips64-softmmu/savevm.o
  CC    mips-softmmu/ioport.o
  CC    i386-softmmu/memory.o
  CC    arm-linux-user/linux-user/strace.o
  CC    mips64el-softmmu/memory_mapping-stub.o
  CC    mips-softmmu/kvm-stub.o
  CC    mips64el-softmmu/dump-stub.o
  CC    mips64el-softmmu/xen-stub.o
  CC    mips-softmmu/memory.o
  CC    arm-softmmu/cputlb.o
  CC    mips64el-softmmu/hw/virtio.o
  CC    arm-linux-user/linux-user/mmap.o
  CC    mips64-softmmu/cputlb.o
  CC    i386-softmmu/savevm.o
  CC    arm-softmmu/memory_mapping-stub.o
  CC    arm-linux-user/linux-user/signal.o
  CC    mips64-softmmu/memory_mapping-stub.o
  CC    mips64el-softmmu/hw/virtio-blk.o
  CC    arm-softmmu/dump-stub.o
  CC    mips64-softmmu/dump-stub.o
  CC    arm-softmmu/xen-stub.o
  CC    i386-linux-user/linux-user/strace.o
  CC    mips64-softmmu/xen-stub.o
  CC    mips-softmmu/savevm.o
  CC    mips64el-softmmu/hw/virtio-balloon.o
  CC    arm-softmmu/hw/virtio.o
  CC    arm-linux-user/linux-user/elfload.o
  CC    mips64-softmmu/hw/virtio.o
  CC    mips64el-softmmu/hw/virtio-net.o
  CC    i386-softmmu/cputlb.o
  CC    i386-linux-user/linux-user/mmap.o
  CC    arm-softmmu/hw/virtio-blk.o
  CC    mips-linux-user/linux-user/strace.o
  CC    mips64-softmmu/hw/virtio-blk.o
  CC    arm-linux-user/linux-user/linuxload.o
  CC    i386-linux-user/linux-user/signal.o
  CC    mips64el-softmmu/hw/virtio-serial-bus.o
  CC    i386-softmmu/memory_mapping.o
  CC    mips-softmmu/cputlb.o
  CC    arm-softmmu/hw/virtio-balloon.o
  CC    arm-linux-user/linux-user/uaccess.o
  CC    mips64-softmmu/hw/virtio-balloon.o
  CC    i386-softmmu/dump.o
  CC    arm-linux-user/linux-user/cpu-uname.o
  CC    mips-linux-user/linux-user/mmap.o
  CC    i386-linux-user/linux-user/elfload.o
  CC    arm-softmmu/hw/virtio-net.o
  CC    mips64-softmmu/hw/virtio-net.o
  CC    mips64el-softmmu/hw/virtio-scsi.o
  CC    mips-softmmu/memory_mapping-stub.o
  CC    arm-linux-user/linux-user/flatload.o
  CC    i386-softmmu/xen-stub.o
  CC    mips-softmmu/dump-stub.o
  CC    mips-linux-user/linux-user/signal.o
  CC    mips64el-softmmu/hw/vhost_net.o
  CC    arm-linux-user/target-arm/arm-semi.o
  CC    i386-softmmu/hw/virtio.o
  CC    mips-softmmu/xen-stub.o
  CC    mips64el-softmmu/hw/vga.o
  CC    i386-linux-user/linux-user/linuxload.o
  CC    arm-softmmu/hw/virtio-serial-bus.o
  CC    mips64-softmmu/hw/virtio-serial-bus.o
  CC    mips-softmmu/hw/virtio.o
  CC    arm-linux-user/target-arm/translate.o
  CC    i386-linux-user/linux-user/uaccess.o
  CC    mips-linux-user/linux-user/elfload.o
  CC    i386-softmmu/hw/virtio-blk.o
  CC    i386-linux-user/linux-user/cpu-uname.o
  CC    arm-softmmu/hw/virtio-scsi.o
  CC    mips64-softmmu/hw/virtio-scsi.o
  CC    i386-linux-user/linux-user/vm86.o
  CC    mips-softmmu/hw/virtio-blk.o
  CC    i386-softmmu/hw/virtio-balloon.o
  CC    arm-softmmu/hw/vhost_net.o
  CC    i386-linux-user/target-i386/translate.o
  CC    mips64-softmmu/hw/vhost_net.o
  CC    mips-softmmu/hw/virtio-balloon.o
  CC    mips-linux-user/linux-user/linuxload.o
  CC    arm-softmmu/hw/vga.o
  CC    i386-softmmu/hw/virtio-net.o
  CC    mips64-softmmu/hw/vga.o
  CC    mips-softmmu/hw/virtio-net.o
  CC    mips-linux-user/linux-user/uaccess.o
  CC    mips64el-softmmu/hw/device-hotplug.o
  CC    mips-linux-user/linux-user/cpu-uname.o
  CC    mips64el-softmmu/hw/vfio_pci.o
  CC    i386-softmmu/hw/virtio-serial-bus.o
  CC    mips-linux-user/target-mips/translate.o
  CC    mips-softmmu/hw/virtio-serial-bus.o
  CC    i386-softmmu/hw/virtio-scsi.o
  CC    mips-softmmu/hw/virtio-scsi.o
  CC    mips64el-softmmu/hw/mips/../mips_r4k.o
  CC    arm-softmmu/hw/device-hotplug.o
  CC    i386-softmmu/hw/vhost_net.o
  CC    mips64-softmmu/hw/device-hotplug.o
  CC    arm-softmmu/hw/vfio_pci.o
  CC    mips64el-softmmu/hw/mips/../mips_jazz.o
  CC    mips-softmmu/hw/vhost_net.o
  CC    mips64-softmmu/hw/vfio_pci.o
  CC    i386-softmmu/hw/vhost.o
  CC    mips-softmmu/hw/vga.o
  CC    mips64el-softmmu/hw/mips/../mips_malta.o
  CC    arm-softmmu/hw/arm/../integratorcp.o
  CC    mips64-softmmu/hw/mips/../mips_r4k.o
  CC    i386-softmmu/hw/vga.o
  CC    arm-softmmu/hw/arm/../versatilepb.o
  CC    mips64el-softmmu/hw/mips/../mips_mipssim.o
  CC    mips64-softmmu/hw/mips/../mips_jazz.o
  CC    mips64el-softmmu/hw/mips/../mips_addr.o
  CC    arm-softmmu/hw/arm/../arm_pic.o
  CC    mips64el-softmmu/hw/mips/../mips_timer.o
  CC    mips64-softmmu/hw/mips/../mips_malta.o
  CC    arm-softmmu/hw/arm/../arm_boot.o
  CC    mips64el-softmmu/hw/mips/../mips_int.o
  CC    arm-softmmu/hw/arm/../xilinx_zynq.o
  CC    mips64el-softmmu/hw/mips/../gt64xxx.o
  CC    mips-softmmu/hw/device-hotplug.o
  CC    mips64-softmmu/hw/mips/../mips_mipssim.o
  CC    arm-softmmu/hw/arm/../zynq_slcr.o
  CC    mips-softmmu/hw/vfio_pci.o
  CC    mips64-softmmu/hw/mips/../mips_addr.o
  CC    arm-softmmu/hw/arm/../xilinx_spips.o
  CC    mips64el-softmmu/hw/mips/../mc146818rtc.o
  CC    i386-softmmu/hw/device-hotplug.o
  CC    mips64-softmmu/hw/mips/../mips_timer.o
  CC    i386-softmmu/hw/ivshmem.o
  CC    arm-softmmu/hw/arm/../arm_gic.o
  CC    mips64-softmmu/hw/mips/../mips_int.o
  CC    mips64el-softmmu/hw/mips/../bonito.o
  CC    mips-softmmu/hw/mips/../mips_r4k.o
  CC    mips64-softmmu/hw/mips/../gt64xxx.o
  CC    i386-softmmu/hw/vfio_pci.o
  CC    arm-softmmu/hw/arm/../arm_gic_common.o
  CC    mips-softmmu/hw/mips/../mips_jazz.o
  CC    mips64el-softmmu/hw/mips/../vt82c686.o
  CC    mips64-softmmu/hw/mips/../mc146818rtc.o
  CC    arm-softmmu/hw/arm/../realview_gic.o
  CC    mips-softmmu/hw/mips/../mips_malta.o
  CC    mips64el-softmmu/hw/mips/../mips_fulong2e.o
  CC    arm-softmmu/hw/arm/../realview.o
  CC    mips64-softmmu/target-mips/translate.o
  CC    mips64el-softmmu/target-mips/translate.o
  CC    i386-softmmu/hw/i386/../mc146818rtc.o
  CC    arm-softmmu/hw/arm/../arm_sysctl.o
  CC    mips-softmmu/hw/mips/../mips_mipssim.o
  CC    arm-softmmu/hw/arm/../arm11mpcore.o
  CC    mips-softmmu/hw/mips/../mips_addr.o
  CC    mips-softmmu/hw/mips/../mips_timer.o
  CC    arm-softmmu/hw/arm/../a9mpcore.o
  CC    i386-softmmu/hw/i386/../pc.o
  CC    arm-softmmu/hw/arm/../exynos4210_gic.o
  CC    mips-softmmu/hw/mips/../mips_int.o
  CC    mips-softmmu/hw/mips/../gt64xxx.o
  CC    arm-softmmu/hw/arm/../exynos4210_combiner.o
  CC    i386-softmmu/hw/i386/../apic_common.o
  CC    mips-softmmu/hw/mips/../mc146818rtc.o
  CC    arm-softmmu/hw/arm/../exynos4210.o
  CC    i386-softmmu/hw/i386/../apic.o
  CC    arm-softmmu/hw/arm/../exynos4_boards.o
  CC    mips-softmmu/target-mips/translate.o
  CC    arm-softmmu/hw/arm/../exynos4210_uart.o
  CC    i386-softmmu/hw/i386/../kvmvapic.o
  CC    arm-softmmu/hw/arm/../exynos4210_pwm.o
  CC    i386-softmmu/hw/i386/../sga.o
  CC    arm-softmmu/hw/arm/../exynos4210_pmu.o
  CC    i386-softmmu/hw/i386/../ioapic_common.o
  CC    arm-softmmu/hw/arm/../exynos4210_mct.o
  CC    i386-softmmu/hw/i386/../ioapic.o
  CC    i386-softmmu/hw/i386/../piix_pci.o
  CC    arm-softmmu/hw/arm/../exynos4210_fimd.o
  CC    i386-softmmu/hw/i386/../vmport.o
  CC    i386-softmmu/hw/i386/../pci/pci-hotplug.o
  CC    i386-softmmu/hw/i386/../smbios.o
  CC    arm-softmmu/hw/arm/../exynos4210_rtc.o
  CC    i386-softmmu/hw/i386/../wdt_ib700.o
  CC    arm-softmmu/hw/arm/../exynos4210_i2c.o
  CC    i386-softmmu/hw/i386/../debugcon.o
  CC    arm-softmmu/hw/arm/../arm_mptimer.o
  CC    i386-softmmu/hw/i386/../debugexit.o
  CC    i386-softmmu/hw/i386/../multiboot.o
  CC    arm-softmmu/hw/arm/../a15mpcore.o
  CC    i386-softmmu/hw/i386/../pc_piix.o
  CC    arm-softmmu/hw/arm/../armv7m.o
  CC    i386-softmmu/hw/i386/../pc_sysfw.o
  CC    arm-softmmu/hw/arm/../armv7m_nvic.o
  CC    i386-softmmu/hw/i386/../lpc_ich9.o
  CC    arm-softmmu/hw/arm/../stellaris.o
  CC    i386-softmmu/hw/i386/../q35.o
  CC    i386-softmmu/hw/i386/../pc_q35.o
  CC    arm-softmmu/hw/arm/../stellaris_enet.o
  CC    i386-softmmu/hw/i386/../pc-testdev.o
  CC    arm-softmmu/hw/arm/../highbank.o
  CC    i386-softmmu/target-i386/translate.o
  CC    arm-linux-user/target-arm/op_helper.o
  CC    arm-softmmu/hw/arm/../pxa2xx.o
  CC    arm-linux-user/target-arm/helper.o
  CC    arm-softmmu/hw/arm/../pxa2xx_pic.o
  CC    arm-linux-user/target-arm/cpu.o
  CC    arm-softmmu/hw/arm/../pxa2xx_gpio.o
  CC    arm-linux-user/target-arm/neon_helper.o
  CC    arm-softmmu/hw/arm/../pxa2xx_timer.o
  CC    arm-softmmu/hw/arm/../pxa2xx_dma.o
  CC    arm-softmmu/hw/arm/../pxa2xx_lcd.o
  CC    arm-linux-user/target-arm/iwmmxt_helper.o
  CC    arm-softmmu/hw/arm/../pxa2xx_mmci.o
  CC    arm-softmmu/hw/arm/../pxa2xx_pcmcia.o
  CC    arm-softmmu/hw/arm/../pxa2xx_keypad.o
  CC    arm-linux-user/linux-user/arm/nwfpe/fpa11.o
  CC    arm-softmmu/hw/arm/../gumstix.o
  CC    arm-linux-user/linux-user/arm/nwfpe/fpa11_cpdo.o
  CC    arm-softmmu/hw/arm/../zaurus.o
  CC    arm-linux-user/linux-user/arm/nwfpe/fpa11_cpdt.o
  CC    arm-softmmu/hw/arm/../ide/microdrive.o
  CC    arm-linux-user/linux-user/arm/nwfpe/fpa11_cprt.o
  CC    arm-softmmu/hw/arm/../spitz.o
  CC    arm-linux-user/linux-user/arm/nwfpe/fpopcode.o
  CC    arm-linux-user/linux-user/arm/nwfpe/single_cpdo.o
  CC    arm-linux-user/linux-user/arm/nwfpe/double_cpdo.o
  CC    arm-softmmu/hw/arm/../tosa.o
  CC    arm-linux-user/linux-user/arm/nwfpe/extended_cpdo.o
  CC    arm-softmmu/hw/arm/../tc6393xb.o
  CC    arm-linux-user/gdbstub-xml.o
  LINK  arm-linux-user/qemu-arm
  CC    arm-softmmu/hw/arm/../omap1.o
  CC    i386-softmmu/target-i386/helper.o
  CC    mips64-softmmu/target-mips/dsp_helper.o
  CC    mips-linux-user/target-mips/dsp_helper.o
  CC    arm-softmmu/hw/arm/../omap_lcdc.o
  CC    mips-linux-user/target-mips/op_helper.o
  CC    arm-softmmu/hw/arm/../omap_dma.o
  GEN   mipsel-linux-user/config-target.h
  CC    mipsel-linux-user/exec.o
  CC    arm-softmmu/hw/arm/../omap_clk.o
  CC    mipsel-linux-user/translate-all.o
  CC    arm-softmmu/hw/arm/../omap_mmc.o
  CC    mipsel-linux-user/cpu-exec.o
  CC    arm-softmmu/hw/arm/../omap_i2c.o
  CC    mipsel-linux-user/tcg/tcg.o
  CC    arm-softmmu/hw/arm/../omap_gpio.o
  CC    arm-softmmu/hw/arm/../omap_intc.o
  CC    arm-softmmu/hw/arm/../omap_uart.o
  CC    arm-softmmu/hw/arm/../omap2.o
  CC    mipsel-linux-user/tcg/optimize.o
  CC    mips-linux-user/target-mips/lmi_helper.o
  CC    arm-softmmu/hw/arm/../omap_dss.o
  CC    mipsel-linux-user/fpu/softfloat.o
  CC    mips-linux-user/target-mips/helper.o
  CC    arm-softmmu/hw/arm/../soc_dma.o
  CC    mips-linux-user/target-mips/cpu.o
  LINK  mips-linux-user/qemu-mips
  CC    arm-softmmu/hw/arm/../omap_gptimer.o
  CC    mipsel-linux-user/disas.o
  CC    i386-linux-user/target-i386/helper.o
  CC    arm-softmmu/hw/arm/../omap_synctimer.o
  CC    arm-softmmu/hw/arm/../omap_gpmc.o
  CC    mips-softmmu/target-mips/dsp_helper.o
  CC    arm-softmmu/hw/arm/../omap_sdrc.o
  CC    arm-softmmu/hw/arm/../omap_spi.o
  CC    arm-softmmu/hw/arm/../omap_tap.o
  CC    arm-softmmu/hw/arm/../omap_l4.o
  CC    mips64el-softmmu/target-mips/dsp_helper.o
  CC    arm-softmmu/hw/arm/../omap_sx1.o
  CC    mipsel-linux-user/gdbstub.o
  CC    arm-softmmu/hw/arm/../palm.o
  CC    arm-softmmu/hw/arm/../tsc210x.o
  CC    mipsel-linux-user/thunk.o
  CC    arm-softmmu/hw/arm/../nseries.o
  CC    mipsel-linux-user/user-exec.o
  CC    mipsel-linux-user/linux-user/main.o
  CC    arm-softmmu/hw/arm/../blizzard.o
  CC    mipsel-linux-user/linux-user/syscall.o
  CC    arm-softmmu/hw/arm/../onenand.o
  CC    i386-softmmu/target-i386/cpu.o
  CC    arm-softmmu/hw/arm/../cbus.o
  CC    mips-softmmu/target-mips/op_helper.o
  CC    arm-softmmu/hw/arm/../tusb6010.o
  CC    arm-softmmu/hw/arm/../usb/hcd-musb.o
  CC    mips64el-softmmu/target-mips/op_helper.o
  CC    arm-softmmu/hw/arm/../mst_fpga.o
  CC    arm-softmmu/hw/arm/../mainstone.o
  CC    arm-softmmu/hw/arm/../z2.o
  CC    arm-softmmu/hw/arm/../musicpal.o
  CC    arm-softmmu/hw/arm/../bitbang_i2c.o
  CC    arm-softmmu/hw/arm/../marvell_88w8618_audio.o
  CC    arm-softmmu/hw/arm/../framebuffer.o
  CC    arm-softmmu/hw/arm/../vexpress.o
  CC    arm-softmmu/hw/arm/../strongarm.o
  CC    mips-softmmu/target-mips/lmi_helper.o
  CC    arm-softmmu/hw/arm/../collie.o
  CC    arm-softmmu/hw/arm/../imx_serial.o
  CC    mipsel-linux-user/linux-user/strace.o
  CC    arm-softmmu/hw/arm/../imx_ccm.o
  CC    mips-softmmu/target-mips/helper.o
  CC    arm-softmmu/hw/arm/../imx_timer.o
  CC    mips-softmmu/target-mips/cpu.o
  CC    mipsel-linux-user/linux-user/mmap.o
  CC    arm-softmmu/hw/arm/../imx_avic.o
  CC    mips-softmmu/target-mips/machine.o
  CC    arm-softmmu/hw/arm/../kzm.o
  CC    mipsel-linux-user/linux-user/signal.o
  LINK  mips-softmmu/qemu-system-mips
  CC    arm-softmmu/hw/arm/../../device_tree.o
  CC    arm-softmmu/target-arm/arm-semi.o
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:55:0,
                 from /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
  fdt32_t magic;    /* magic word FDT_MAGIC */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
  fdt32_t totalsize;   /* total size of DT block */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
  fdt32_t off_dt_struct;   /* offset to structure */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
  fdt32_t off_dt_strings;   /* offset to strings */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
  fdt32_t off_mem_rsvmap;   /* offset to memory reserve map */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
  fdt32_t version;   /* format version */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
  fdt32_t last_comp_version;  /* last compatible version */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
  fdt32_t boot_cpuid_phys;  /* Which physical CPU id we're
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
  fdt32_t size_dt_strings;  /* size of the strings block */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
  fdt32_t size_dt_struct;   /* size of the structure block */
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
  fdt64_t address;
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
  fdt64_t size;
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
  fdt32_t tag;
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
  fdt32_t tag;
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
  fdt32_t len;
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
  fdt32_t nameoff;
  ^
In file included from /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:0:
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_setprop_inplace_u32':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:899:2: error: unknown type name 'fdt32_t'
  fdt32_t tmp = cpu_to_fdt32(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_setprop_inplace_u64':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:934:2: error: unknown type name 'fdt64_t'
  fdt64_t tmp = cpu_to_fdt64(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_property_u32':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:1010:2: error: unknown type name 'fdt32_t'
  fdt32_t tmp = cpu_to_fdt32(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_property_u64':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:1015:2: error: unknown type name 'fdt64_t'
  fdt64_t tmp = cpu_to_fdt64(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_setprop_u32':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:1171:2: error: unknown type name 'fdt32_t'
  fdt32_t tmp = cpu_to_fdt32(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_setprop_u64':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:1206:2: error: unknown type name 'fdt64_t'
  fdt64_t tmp = cpu_to_fdt64(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_appendprop_u32':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:1313:2: error: unknown type name 'fdt32_t'
  fdt32_t tmp = cpu_to_fdt32(val);
  ^
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h: In function 'fdt_appendprop_u64':
/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/x86_64-nativesdk-oecore-linux/mnt/SSD/r0005sdk/1.0-20130411/sysroots/x86_64-oecore-linux/usr/include/libfdt.h:1348:2: error: unknown type name 'fdt64_t'
  fdt64_t tmp = cpu_to_fdt64(val);
  ^
make[1]: *** [hw/arm/../../device_tree.o] Error 1
make[1]: *** Waiting for unfinished jobs....
  CC    mips64-softmmu/target-mips/op_helper.o
make: *** [subdir-arm-softmmu] Error 2
make: *** Waiting for unfinished jobs....
  CC    mips64-softmmu/target-mips/lmi_helper.o
  CC    mipsel-linux-user/linux-user/elfload.o
  CC    mipsel-linux-user/linux-user/linuxload.o
  CC    mipsel-linux-user/linux-user/uaccess.o
  CC    mips64el-softmmu/target-mips/lmi_helper.o
  CC    mips64el-softmmu/target-mips/helper.o
  CC    mipsel-linux-user/linux-user/cpu-uname.o
  CC    mipsel-linux-user/target-mips/translate.o
  CC    mipsel-linux-user/target-mips/dsp_helper.o
  CC    i386-linux-user/target-i386/cpu.o
  CC    mips64el-softmmu/target-mips/cpu.o
  CC    mipsel-linux-user/target-mips/op_helper.o
  CC    mips64-softmmu/target-mips/helper.o
  CC    i386-linux-user/target-i386/excp_helper.o
  CC    mipsel-linux-user/target-mips/lmi_helper.o
  CC    mips64el-softmmu/target-mips/machine.o
  CC    mips64-softmmu/target-mips/cpu.o
  CC    mipsel-linux-user/target-mips/helper.o
  CC    mipsel-linux-user/target-mips/cpu.o
  CC    mips64-softmmu/target-mips/machine.o
  CC    i386-softmmu/target-i386/excp_helper.o
  CC    i386-softmmu/target-i386/fpu_helper.o
  CC    i386-linux-user/target-i386/fpu_helper.o
  CC    i386-linux-user/target-i386/cc_helper.o
  CC    i386-linux-user/target-i386/int_helper.o
  CC    i386-linux-user/target-i386/svm_helper.o
  CC    i386-linux-user/target-i386/smm_helper.o
  CC    i386-linux-user/target-i386/misc_helper.o
  CC    i386-linux-user/target-i386/mem_helper.o
  CC    i386-linux-user/target-i386/seg_helper.o
  CC    i386-softmmu/target-i386/cc_helper.o
  LINK  mips64-softmmu/qemu-system-mips64
  CC    i386-softmmu/target-i386/int_helper.o
  CC    i386-linux-user/target-i386/ioport-user.o
  CC    i386-softmmu/target-i386/svm_helper.o
  LINK  mips64el-softmmu/qemu-system-mips64el
  CC    i386-softmmu/target-i386/smm_helper.o
  CC    i386-softmmu/target-i386/misc_helper.o
  CC    i386-softmmu/target-i386/mem_helper.o
  CC    i386-softmmu/target-i386/seg_helper.o
  CC    i386-softmmu/target-i386/machine.o
  CC    i386-softmmu/target-i386/arch_memory_mapping.o
  CC    i386-softmmu/target-i386/arch_dump.o
  CC    i386-softmmu/target-i386/kvm.o
  CC    i386-softmmu/target-i386/hyperv.o
  CC    i386-softmmu/hw/i386/../kvm/clock.o
  CC    i386-softmmu/hw/i386/../kvm/apic.o
  CC    i386-softmmu/hw/i386/../kvm/i8259.o
  CC    i386-softmmu/hw/i386/../kvm/ioapic.o
  CC    i386-softmmu/hw/i386/../kvm/i8254.o
  CC    i386-softmmu/hw/i386/../kvm/pci-assign.o
  LINK  i386-linux-user/qemu-i386
  LINK  mipsel-linux-user/qemu-mipsel
  LINK  i386-softmmu/qemu-system-i386
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-qemu/1.4.0-r0/temp/log.do_compile.24885 for further information)

--------------060402050709010203030508--
