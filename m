Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf@atmel.com>) id 1L8sOj-0007Ms-4a
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Dec 2008 09:20:21 +0100
Received: from [10.175.196.247] (213.67.42.143) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.129) (authenticated as
	0706224457)
	id 4843FAEB02C55B85 for openembedded-devel@lists.openembedded.org;
	Sat, 6 Dec 2008 09:16:37 +0100
From: Ulf Samuelsson <ulf@atmel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Atmel Nordic AB
Date: Sat, 06 Dec 2008 09:16:36 +0100
Message-Id: <1228551396.14826.31.camel@aeglos.sweden.atmel.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
Subject: Build of qemu-native fails.
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
X-List-Received-Date: Sat, 06 Dec 2008 08:20:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: Quoted-Printable

Building the Angstrom for at91sam9263ek:

The build of qemu-native fails!

The normal build uses qemu-native-svn which fails, then I tried=20
qemu-native-0.9.1 with the same result.

In ./work/armv5te-angstrom-linux-gnueabi/linux-libc-headers-2.6.23-r3/lin=
ux-2.6.23/include/linux/usbdevice_fs.h
it looks like:
struct usbdevfs_ctrltransfer {
	__u8 bRequestType;
	__u8 bRequest;
	__u16 wValue;
	__u16 wIndex;
	__u16 wLength;
	__u32 timeout;  /* in milliseconds */
 	void __user *data;
};

It does not like the __user in "void __user *data"=20

In ./work/armv5te-angstrom-linux-gnueabi/linux-libc-headers-2.6.23-r3/ima=
ge/usr/include/linux/usbdevice_fs.h
it looks the same as in recent kernels:

/* usbdevfs ioctl codes */

struct usbdevfs_ctrltransfer {
	__u8 bRequestType;
	__u8 bRequest;
	__u16 wValue;
	__u16 wIndex;
	__u16 wLength;
	__u32 timeout;  /* in milliseconds */
 	void *data;
};


If I extract linux-2.6.23 and do
$ make ARCH=3Darm INSTALL_HDR_PATH=3D../headers headers_install
I don't get the "__user" inside this header file,

Anyone knows why?

----
Error message from qemu-native-0.9.1 build below:


gcc-3.4.6
-isystem/home/ulf/projects/OE/build/tmp/staging/i686-linux/usr/include
-O2 -Wall -O2 -g -fno-strict-aliasing
-isystem/home/ulf/projects/OE/build/tmp/staging/i686-linux/usr/include
-I.
-I/home/ulf/projects/OE/build/tmp/work/i686-linux/qemu-native-0.9.1-r7/qe=
mu-0.9.1 -MMD -MP -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOU=
RCE -I/home/ulf/projects/OE/build/tmp/work/i686-linux/qemu-native-0.9.1-r=
7/qemu-0.9.1/slirp    -c -o usb-linux.o usb-linux.c
| In file included from usb-linux.c:31:
| /usr/include/linux/usbdevice_fs.h:49: error: variable or field
`__user' declared void
| /usr/include/linux/usbdevice_fs.h:49: error: syntax error before '*'
token
| /usr/include/linux/usbdevice_fs.h:56: error: variable or field
`__user' declared void
| /usr/include/linux/usbdevice_fs.h:56: error: syntax error before '*'
token
| /usr/include/linux/usbdevice_fs.h:66: error: variable or field
`__user' declared void
| /usr/include/linux/usbdevice_fs.h:66: error: syntax error before '*'
token
| /usr/include/linux/usbdevice_fs.h:100: error: variable or field
`__user' declared void
| /usr/include/linux/usbdevice_fs.h:100: error: syntax error before '*'
token
| /usr/include/linux/usbdevice_fs.h:109: error: syntax error before '}'
token
| /usr/include/linux/usbdevice_fs.h:116: error: variable or field
`__user' declared void
| /usr/include/linux/usbdevice_fs.h:116: error: syntax error before '*'
token
| usb-linux.c: In function `usb_host_update_interfaces':
| usb-linux.c:183: error: storage size of 'ctrl' isn't known
| usb-linux.c:187: error: invalid application of `sizeof' to incomplete
type `usbdevfs_ioctl'
| usb-linux.c:183: warning: unused variable `ctrl'
| usb-linux.c: In function `usb_host_handle_control':
| usb-linux.c:283: error: invalid application of `sizeof' to incomplete
type `usbdevfs_ctrltransfer'
| usb-linux.c: In function `usb_host_handle_data':
| usb-linux.c:309: error: storage size of 'bt' isn't known
| usb-linux.c:325: error: invalid application of `sizeof' to incomplete
type `usbdevfs_bulktransfer'
| usb-linux.c:309: warning: unused variable `bt'
| usb-linux.c: In function `usb_host_handle_isoch':
| usb-linux.c:414: error: invalid application of `sizeof' to incomplete
type `usbdevfs_urb'
| usb-linux.c:421: error: dereferencing pointer to incomplete type
| usb-linux.c:422: error: dereferencing pointer to incomplete type
| usb-linux.c:423: error: dereferencing pointer to incomplete type
| usb-linux.c:424: error: dereferencing pointer to incomplete type
| usb-linux.c:425: error: dereferencing pointer to incomplete type
| usb-linux.c:426: error: dereferencing pointer to incomplete type
| usb-linux.c:427: error: dereferencing pointer to incomplete type
| usb-linux.c:428: error: dereferencing pointer to incomplete type
| usb-linux.c:429: error: dereferencing pointer to incomplete type
| usb-linux.c:433: error: dereferencing pointer to incomplete type
| usb-linux.c:435: error: dereferencing pointer to incomplete type
| usb-linux.c:436: error: dereferencing pointer to incomplete type
| usb-linux.c:437: error: dereferencing pointer to incomplete type
| usb-linux.c:438: error: dereferencing pointer to incomplete type
| usb-linux.c:439: error: dereferencing pointer to incomplete type
| usb-linux.c:440: error: invalid application of `sizeof' to incomplete
type `usbdevfs_urb'
| usb-linux.c:475: error: dereferencing pointer to incomplete type
| usb-linux.c: In function `usb_linux_update_endp_table':
| usb-linux.c:506: error: invalid application of `sizeof' to incomplete
type `usbdevfs_ctrltransfer'
| usb-linux.c:547: error: invalid application of `sizeof' to incomplete
type `usbdevfs_ctrltransfer'
| make: *** [usb-linux.o] Error 1
| FATAL: oe_runmake failed
NOTE: Task
failed: /home/ulf/projects/OE/build/tmp/work/i686-linux/qemu-native-0.9.1=
-r7/temp/log.do_compile.12353
NOTE: package qemu-native-0.9.1-r7: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package qemu-native-0.9.1: failed
ERROR: Build
of /home/ulf/projects/OE/openembedded/packages/qemu/qemu-native_0.9.1.bb
do_compile failed
ERROR: Task 7
(/home/ulf/projects/OE/openembedded/packages/qemu/qemu-native_0.9.1.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 6 tasks of which 0 didn't need to be
rerun and 1 failed.
ERROR:
'/home/ulf/projects/OE/openembedded/packages/qemu/qemu-native_0.9.1.bb'
failed
NOTE: build 200812060707: completed

--=20
Best Regards,
Ulf Samuelsson          mail:   ulf@atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv=C3=A4gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457





