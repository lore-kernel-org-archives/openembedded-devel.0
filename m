Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MsO3b-0001Z3-6C
	for openembedded-devel@openembedded.org; Mon, 28 Sep 2009 23:46:58 +0200
Received: (qmail 1542 invoked by uid 1003); 28 Sep 2009 21:46:12 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 28 Sep 2009 21:46:11 -0000
Message-ID: <4AC12EA2.7060109@balister.org>
Date: Mon, 28 Sep 2009 17:46:10 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.1) Gecko/20090814 Fedora/3.0-2.6.b3.fc11 Thunderbird/3.0b3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
In-Reply-To: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How do I build OE for PPC-405 inside Virtex 4?
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
X-List-Received-Date: Mon, 28 Sep 2009 21:46:58 -0000
X-Groupsio-MsgNum: 13247
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms090802020802010802080207"

--------------ms090802020802010802080207
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09/28/2009 05:24 PM, Ali Akbar Zarezadeh wrote:
> Hi everybody,
>
> Currently the Xilinx Open Source Linux is running on our PICSY designed=

> platform (based on Virtex 4 FX20 FPGA for smart camera). ELDK is used a=
s
> cross compiler. Now we are going to change it with OpenEmbedded to be
> more flexible with the ramdisk or root filesystem and also take benefit=

> of existing recipes in OE (for example openCV and ACE).
> To be in the safe corner and proceed step be step, the first try was
> only to create new ramdisk with OE and again use the Xilinx Open Source=

> Linux but with new generated ramdisk by OE. In the first try these
> settings are used in the local.conf:
>
> MACHINE =3D "xilinx-ml403"
> DISTRO =3D "angstrom-2008.1"
>
> This step with the "bibake helloworld-image" was successful. Afterwards=
,
> in the second step the "bitbake console-image" is tested. Unfortunately=

> we got stuck in this step and is not system hangs on in init step. For
> your information the Kernel version we used is 1.6.29-rc5. You could se=
e
> log of system in boot up in following:
>
>
> -----------------------------------------------------------------------=
-----------------------------------------------
>
> zImage starting: loaded at 0x00400000 (sp: 0x00be7eb0)
> Allocating 0x2f9a19 bytes for kernel ...
> gunzipping (0x00000000<- 0x0040d000:0x00564427)...done 0x2dde20 bytes
> Attached initrd image at 0x00565000-0x00be6d1d
> initrd head: 0x1f8b0808
>
> Linux/PowerPC load: console=3DttyUL0 root=3D/dev/ram rw init=3D/bin/ini=
t
> Finalizing device tree... flat tree at 0xbf4300
> Using Xilinx Virtex machine description
> Linux version 2.6.29-rc5 (akzare@orest) (gcc version 4.2.2) #63 PREEMPT=

> Thu Sep 24 20:17:09 CEST 2009
> Found initrd at 0xc0565000:0xc0be6d1d
> Zone PFN ranges:
>    DMA      0x00000000 ->  0x000075ff
>    Normal   0x000075ff ->  0x000075ff
> Movable zone start PFN for each node
> early_node_map[1] active PFN ranges
>      0: 0x00000000 ->  0x000075ff
> MMU: Allocated 1088 bytes of context maps for 255 contexts
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
> 29971
> Kernel command line: console=3DttyUL0 root=3D/dev/ram rw init=3D/bin/in=
it
> Xilinx intc at 0x81800000 mapped to 0xfdfff000
> PID hash table entries: 512 (order: 9, 2048 bytes)
> clocksource: timebase mult[d55555] shift[22] registered
> Console: colour dummy device 80x25
> console [ttyUL0] enabled
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> Memory: 109876k/120828k available (2784k kernel code, 10808k reserved,
> 128k data, 110k bss, 148k init)
> Calibrating delay loop... 598.01 BogoMIPS (lpj=3D1196032)
> Mount-cache hash table entries: 512
> net_namespace: 880 bytes
> NET: Registered protocol family 16
> bio: create slab<bio-0>  at 0
> NET: Registered protocol family 2
> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> TCP established hash table entries: 4096 (order: 3, 32768 bytes)
> TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
> TCP: Hash tables configured (established 4096 bind 4096)
> TCP reno registered
> NET: Registered protocol family 1
> checking if image is initramfs...it isn't (no cpio magic); looks like a=
n
> initrd
> Freeing initrd memory: 6663k freed
> msgmni has been set to 227
> alg: No test for stdrng (krng)
> io scheduler noop registered
> io scheduler anticipatory registered
> io scheduler deadline registered
> io scheduler cfq registered (default)
> Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> 84000000.serial: ttyUL0 at MMIO 0x84000003 (irq =3D 16) is a uartlite
> brd: module loaded
> loop: module loaded
> nbd: registered device at major 43
> Device Tree Probing 'ethernet'
> xilinx_lltemac 81c00000.ethernet: MAC address is now  2: 0: 0: 0: 0: 0
> xilinx_lltemac 81c00000.ethernet: XLlTemac: using DMA mode.
> XLlTemac: Dma base address: phy: 0x84600100, virt: 0xc8018100
> XLlTemac: buffer descriptor size: 32768 (0x8000)
> XLlTemac: Allocating DMA descriptors with kmalloc<6>XLlTemac:
> (buffer_descriptor_init) phy: 0x6c80000, virt: 0xc6c80000, size: 0x8000=

> XTemac: No PHY detected.  Assuming a PHY at address 0
> eth0 (): not using net_device_ops yet
> eth0: Dropping NETIF_F_SG since no checksum feature.
> xilinx_lltemac 81c00000.ethernet: eth0: Xilinx TEMAC at 0x81C00000
> mapped to 0xC8012000, irq=3D17
> Linux video capture interface: v2.00
> TCP cubic registered
> NET: Registered protocol family 17
> RAMDISK: Compressed image found at block 0
> VFS: Mounted root (ext2 filesystem) on device 1:0.
> Freeing unused kernel memory: 148k init
> Failed to execute /bin/init.  Attempting defaults...
> INIT: version 2.86 booting
> Starting udev and populating dev cache
> Remounting root file system...
> WARNING: Couldn't open directory /lib/modules/2.6.29-rc5: No such file
> or directory
> FATAL: Could not open /lib/modules/2.6.29-rc5/modules.dep.temp for
> writing: No such file or directory
> root: mount: mount point /proc/bus/usb does not exist
> Configuring network interfaces... eth0: XLlTemac: Options: 0x3fa
> eth0: XLlTemac: allocating interrupt 19 for dma mode tx.
> eth0: XLlTemac: allocating interrupt 18 for dma mode rx.
> eth0: XLlTemac: We renegotiated the speed to: 100
> eth0: XLlTemac: speed set to 100Mb/s
> eth0: XLlTemac: Send Threshold =3D 24, Receive Threshold =3D 4
> eth0: XLlTemac: Send Wait bound =3D 254, Receive Wait bound =3D 254
> udhcpc (v1.13.2) started
> run-parts: /etc/udhcpc.d/00avahi-autoipd exited with code 1
> Sending discover...
> Sending discover...
> Sending discover...
> run-parts: /etc/udhcpc.d/99avahi-autoipd exited with code 1
> No lease, failing
> done.
> Starting portmap daemon: portmap.
> net.ipv4.conf.default.rp_filter =3D 1
> net.ipv4.conf.all.rp_filter =3D 1
> hwclock: can't open '/dev/misc/rtc': No such file or directory
> Fri Sep 25 17:43:00 UTC 2009
> hwclock: can't open '/dev/misc/rtc': No such file or directory
> Configuring avahi-daemon
>   System startup links for /etc/init.d/avahi-daemon already exist.
> Configuring libnss-mdns
> Configuring ppp-dialin
> Configuring avahi-autoipd
> Configuring angstrom-libc-fixup-hack
> Configuring dbus
>   System startup links for /etc/init.d/dbus-1 already exist.
> Configuring ppp
> INIT: Entering runlevel: 5
> Creating Dropbear SSH server RSA host key.
> Will output 1024 bit rsa secret key to
> '/etc/dropbear/dropbear_rsa_host_key'
> Generating key, this may take a while...
> Public key portion is:
> ssh-rsa
> AAAAB3NzaC1yc2EAAAADAQABAAAAgwC5CKkPhMsuidec4TYxjnSBcQk57SZBiIXbVPkt5Sv=
XVv008piyVuaYFnowJVqa8WkYtdr80lSmHNfquU0PmlHHzaiXZJbjETtj7LRFKYbrjrD+Lpcy=
pqyzyMLM+r9F/Ngm31Xj6Ms45K21MZgksB3plafgD855LwLNnKnBF5V/1kJj root@xilinx-=
ml403
> Fingerprint: md5 43:57:34:3b:13:e7:5d:bb:76:21:29:8b:c1:56:5d:a7
> Starting Dropbear SSH server: modprobe: FATAL: Could not
> load /lib/modules/2.6.29-rc5/modules.dep: No such file or directory
>
> modprobe: FATAL: Could not load /lib/modules/2.6.29-rc5/modules.dep: No=

> such file or directory
>
> dropbear.
> Starting system message bus: dbus.
> Starting syslogd/klogd: done
>   * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
> [ ok ]
> INIT: Id "S" respawning too fast: disabled for 5 minutes

I've heard of this, but I do not know the answer. Googling for=20
"respawning too fast ml403" may give you some more ideas.

> .
> .
> .
> -----------------------------------------------------------------------=
-----------------------------------------------
>
> Considering the log, I have checked the /lib/modules/ directory in my O=
E
> and it seems the version is "oe/tmp/rootfs/lib/modules/2.6.24-rc3" and =
I
> guess maybe the problem is the mismatch between the version of Linux
> kernel from Xilinx and OE. IF it is the reason, what should be the
> solution?
>
> On the other hand, it seems the generated ramdisk is not fit into our
> desire. Total DDR memory of our system is 128M and this generated
> ramdsik occupied nearly 25M. Maybe it is because of using
> "angstrom-2008.1". In our system we don't need X11 or ... Now, the
> question is how could I remove all unnecessary staff from ramdisk to
> make it smaller? Or is there any other solution better than
> angstrom-2008.1?

You need to create a custom image with only the packages you need.=20
Console-image creates a "full featured" image for system with only text=20
consoles.

Look in=20
tmp/deploy/glibc/images/beagleboard/Angstrom-console-image-glibc-ipk-2009=
=2EX-test-20090927-beagleboard-testlab=20
(OK, this is for a beagle board, but you should find a similar directory =

for the ml403) and look at the files there. There are files listing the=20
installed packages and their sizes. Once you get an idea of the changes=20
you need, we can make some suggestions how to shrink your image.

I have an ml403, but have never had time play much with it. If possible, =

I'd like to figure out how to build a working kernel in OE that we could =

use as a simple kernel for testing the board. I'll need some help=20
understanding what files are needed from ELDK (which I only sort off=20
have access too)

Philip

>
> I've started to read usermanual of OE, but still I have not found out a=

> solution for this problem. Is there any idea how could I proceed to hav=
e
> a running OE Linux on our Virtex 4 platform from scratch with
> consideration of all tricky ways not to face with such pitfall again?
>
> I would be grateful to receive promptly your solution through
> compilation and installation of OE on hardcore Power PC 405 inside
> Virtex 4.
>
> Thanks in advance.
>
> Regards
> Ali
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


--------------ms090802020802010802080207
Content-Type: application/pkcs7-signature; name="smime.p7s"
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
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
eIEYPwAAAAAAAA==

--------------ms090802020802010802080207--
