Received: from [209.85.211.193] (helo=mail-yw0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MhUz7-000370-Ja
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 22:57:17 +0200
Received: by ywh31 with SMTP id 31so4087231ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=0tZNl+SrnHhm7OqUzyiE+KTA06k55w6cR+CY22MiJKw=;
	b=A4gvbERLhmDlHE3PNHU9TVbSYwh3xqchQ7MT1zAbl8VS3MN0HhaWE7rFetDKHZreNz
	hTvgFq3xlHtsePueFFjPKG5Wf2NolQusViU7yqhpBgLce0gjfbJ7/qxsKIn9E/5Hd745
	19kGrEDQS/xiXmb8Wn/OKFI6fl69hIDj23AlA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sc/mXdRmw7n5MbVffYHckE/neFKGWfoEg5p86EIJrOdXhZRqVWYK7hYvrfZiUMTzLv
	Is1SDMYxXWQ0xhH/TuiSLr3V5ZyoFtxa5LEPHUIREewRybn4JH7GG+uOqWHEK6PmggvU
	lRRUelcx70ptEKEid4uAi12xyml7NK2gqWO6c=
MIME-Version: 1.0
Received: by 10.150.236.10 with SMTP id j10mr3856725ybh.313.1251578336572; 
	Sat, 29 Aug 2009 13:38:56 -0700 (PDT)
In-Reply-To: <20090826020342.GB5705@gmail.com>
References: <f96d234e0908251411s5ac89a67v223cb2240b81fe39@mail.gmail.com>
	<20090826020342.GB5705@gmail.com>
Date: Sat, 29 Aug 2009 16:38:56 -0400
Message-ID: <f96d234e0908291338i2fe06f6fkfc52b57cccd28fe6@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problem building uclibc + udev
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
X-List-Received-Date: Sat, 29 Aug 2009 20:57:18 -0000
X-Groupsio-MsgNum: 12845
Content-Type: multipart/mixed; boundary=000e0cd566d028f98a04724dca0c

--000e0cd566d028f98a04724dca0c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2009 at 10:03 PM, Khem Raj<raj.khem@gmail.com> wrote:
> On (25/08/09 17:11), Cliff Brake wrote:
>> I'm running into the following issue building udev:
>>
>> NOTE: Running task 606 of 631 (ID: 8,
>> /build/oe/oe-testing/openembedded/recipes/udev/udev_141.bb,
>> do_compile)
>> ERROR: function do_compile failed
>> ERROR: log data follows
>> (/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/temp/log.do_compile.14745)
>> | NOTE: make -j 5
>> | make =A0all-recursive
>> | make[1]: Entering directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141'
>> | Making all in udev
>> | make[2]: Entering directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141/udev'
>> | Making all in lib
>> | make[3]: Entering directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141/udev/lib'
>> | make[3]: Nothing to be done for `all'.
>> | make[3]: Leaving directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141/udev/lib'
>> | make[3]: Entering directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141/udev'
>> | /bin/sh ../arm-angstrom-linux-uclibcgnueabi-libtool --tag=3DCC
>> --mode=3Dlink arm-angstrom-linux-uclibcgnueabi-gcc -march=3Darmv7-a
>> -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
>> -isystem/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-an=
gstrom-linux-uclibcgnueabi/usr/include
>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
>> -ggdb3 -Wl,--as-needed
>> -L/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom=
-linux-uclibcgnueabi/usr/lib
>> -Wl,-rpath-link,/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/a=
rmv7a-angstrom-linux-uclibcgnueabi/usr/lib
>> -Wl,-O1 -Wl,--hash-style=3Dgnu -o udevd udev-event.o udev-watch.o
>> udev-node.o udev-rules.o udev-util.o libudev.o libudev-list.o
>> libudev-util.o libudev-device.o libudev-device-db-write.o
>> libudev-monitor.o libudev-enumerate.o libudev-queue.o libudev-ctrl.o
>> udevd.o
>> | arm-angstrom-linux-uclibcgnueabi-libtool: link:
>> arm-angstrom-linux-uclibcgnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8
>> -mfpu=3Dneon -mfloat-abi=3Dsoftfp
>> -isystem/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-an=
gstrom-linux-uclibcgnueabi/usr/include
>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
>> -ggdb3 -Wl,--as-needed -Wl,-rpath-link
>> -Wl,/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstr=
om-linux-uclibcgnueabi/usr/lib
>> -Wl,-O1 -Wl,--hash-style=3Dgnu -o udevd udev-event.o udev-watch.o
>> udev-node.o udev-rules.o udev-util.o libudev.o libudev-list.o
>> libudev-util.o libudev-device.o libudev-device-db-write.o
>> libudev-monitor.o libudev-enumerate.o libudev-queue.o libudev-ctrl.o
>> udevd.o =A0-L/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv=
7a-angstrom-linux-uclibcgnueabi/usr/lib
>> | udevd.o: In function `main':
>> | /build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-li=
nux-uclibcgnueabi/udev-141-r11/udev-141/udev/udevd.c:978:
>> undefined reference to `ppoll'
>> | collect2: ld returned 1 exit status
>> | make[3]: *** [udevd] Error 1
>> | make[3]: Leaving directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141/udev'
>> | make[2]: *** [all-recursive] Error 1
>> | make[2]: Leaving directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141/udev'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-lin=
ux-uclibcgnueabi/udev-141-r11/udev-141'
>> | make: *** [all] Error 2
>> | FATAL: oe_runmake failed
>>
>> It appears that uclibc is being built without ppoll as the headers
>> don't have it. =A0The beagleboard kernel is patched
>> (http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1f0d91e=
152f16fbd40bb2fb3c44a30d774d4dede)
>> to include ppoll, and the headers are modified as such:
>>
>> cbrake@happy:/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging$
>> searchc ppoll
>> ./armv7a-angstrom-linux-uclibcgnueabi/usr/include/asm/unistd.h:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 336 for ppoll */
>> ./beagleboard-angstrom-linux-gnueabi/kernel/arch/arm/include/asm/unistd.=
h:#define
>> __NR_ppoll =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(__NR_SYSCALL_BASE+336=
)
>> ./beagleboard-angstrom-linux-gnueabi/kernel/include/linux/syscalls.h:asm=
linkage
>> long sys_ppoll(struct pollfd __user *, unsigned int,
>> ./beagleboard-angstrom-linux-gnueabi/kernel/include/asm-arm/unistd.h:#de=
fine
>> __NR_ppoll =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (__NR_SYSCALL_BASE+336)
>> ./armv7a-angstrom-linux-gnueabi/usr/include/asm/unistd.h:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 336 for ppoll */
>> ./armv7a-angstrom-linux-gnueabi/usr/include/sys/poll.h:extern int
>> ppoll (struct pollfd *__fds, nfds_t __nfds,
>>
>> However, the headers are only modified in the kernel include
>> directory. =A0I suspect uclibc is getting unistd.h from the usr/include
>> directory which does not have __NR_ppoll defined. =A0What is the best
>> way to fix this. =A0I suspect we need to tell uclibc to look at the
>> kernel headers?
>
> it already does look into kernel headers to configure its system calls.
> All you need is to wireup this syscall in kernel and also in
> linux-libc-headers. IOW Port
> http://www.spinics.net/lists/arm-kernel/msg38114.html to both above
> places.

There are several solutions to this problem:

1) patch the kernel and linux-libc-headers with the attached patch
files (2.6.29 kernel, and 2.6.23 headers)
2) use the micro-base-image which uses mdev instead of udev.

Unfortunately, the linux-libc-headers patch is probably not distro
friendly as it modifies a non-machine specific package.  So there does
not seem to be a clear path forward.

Cliff

--000e0cd566d028f98a04724dca0c
Content-Type: text/x-patch; charset=US-ASCII; name="0001-arm-ppoll-select.patch"
Content-Disposition: attachment; filename="0001-arm-ppoll-select.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fyytbnbp0

RnJvbSA4ZjM5MzUwYmE4OWE1OTNkZGM3NzhhNTY2ODM1YzY5ZTRiYWU0NjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDbGlmZiBCcmFrZSA8Y2JyYWtlQGJlYy1zeXN0ZW1zLmNvbT4K
RGF0ZTogU2F0LCAyOSBBdWcgMjAwOSAxMzo0ODo1NSAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGFy
bSBwcG9sbCBzZWxlY3QKCi0tLQogaW5jbHVkZS9hc20tYXJtL3RocmVhZF9pbmZvLmggfCAgICAy
ICsrCiBpbmNsdWRlL2FzbS1hcm0vdW5pc3RkLmggICAgICB8ICAgIDcgKysrKy0tLQogMiBmaWxl
cyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9hc20tYXJtL3RocmVhZF9pbmZvLmggYi9pbmNsdWRlL2FzbS1hcm0vdGhyZWFkX2lu
Zm8uaAppbmRleCA0MTc4NDM1Li43MjMzMDNlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1hcm0v
dGhyZWFkX2luZm8uaAorKysgYi9pbmNsdWRlL2FzbS1hcm0vdGhyZWFkX2luZm8uaApAQCAtMTQy
LDYgKzE0Miw3IEBAIGV4dGVybiB2b2lkIGl3bW14dF90YXNrX3N3aXRjaChzdHJ1Y3QgdGhyZWFk
X2luZm8gKik7CiAjZGVmaW5lIFRJRl9TSUdQRU5ESU5HCQkwCiAjZGVmaW5lIFRJRl9ORUVEX1JF
U0NIRUQJMQogI2RlZmluZSBUSUZfU1lTQ0FMTF9UUkFDRQk4CisjZGVmaW5lIFRJRl9SRVNUT1JF
X1NJR01BU0sJOSAgICAgICAvKiByZXN0b3JlIHNpZ25hbCBtYXNrIGluIGRvX3NpZ25hbCAqLwog
I2RlZmluZSBUSUZfUE9MTElOR19OUkZMQUcJMTYKICNkZWZpbmUgVElGX1VTSU5HX0lXTU1YVAkx
NwogI2RlZmluZSBUSUZfTUVNRElFCQkxOApAQCAtMTUwLDYgKzE1MSw3IEBAIGV4dGVybiB2b2lk
IGl3bW14dF90YXNrX3N3aXRjaChzdHJ1Y3QgdGhyZWFkX2luZm8gKik7CiAjZGVmaW5lIF9USUZf
U0lHUEVORElORwkJKDEgPDwgVElGX1NJR1BFTkRJTkcpCiAjZGVmaW5lIF9USUZfTkVFRF9SRVND
SEVECSgxIDw8IFRJRl9ORUVEX1JFU0NIRUQpCiAjZGVmaW5lIF9USUZfU1lTQ0FMTF9UUkFDRQko
MSA8PCBUSUZfU1lTQ0FMTF9UUkFDRSkKKyNkZWZpbmUgX1RJRl9SRVNUT1JFX1NJR01BU0sJKDEg
PDwgVElGX1JFU1RPUkVfU0lHTUFTSykKICNkZWZpbmUgX1RJRl9QT0xMSU5HX05SRkxBRwkoMSA8
PCBUSUZfUE9MTElOR19OUkZMQUcpCiAjZGVmaW5lIF9USUZfVVNJTkdfSVdNTVhUCSgxIDw8IFRJ
Rl9VU0lOR19JV01NWFQpCiAjZGVmaW5lIF9USUZfRlJFRVpFCQkoMSA8PCBUSUZfRlJFRVpFKQpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tYXJtL3VuaXN0ZC5oIGIvaW5jbHVkZS9hc20tYXJtL3Vu
aXN0ZC5oCmluZGV4IGQzMjdiMjUuLjkyNjlmNWYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWFy
bS91bmlzdGQuaAorKysgYi9pbmNsdWRlL2FzbS1hcm0vdW5pc3RkLmgKQEAgLTM2MCw4ICszNjAs
OCBAQAogI2RlZmluZSBfX05SX3JlYWRsaW5rYXQJCQkoX19OUl9TWVNDQUxMX0JBU0UrMzMyKQog
I2RlZmluZSBfX05SX2ZjaG1vZGF0CQkJKF9fTlJfU1lTQ0FMTF9CQVNFKzMzMykKICNkZWZpbmUg
X19OUl9mYWNjZXNzYXQJCQkoX19OUl9TWVNDQUxMX0JBU0UrMzM0KQotCQkJCQkvKiAzMzUgZm9y
IHBzZWxlY3Q2ICovCi0JCQkJCS8qIDMzNiBmb3IgcHBvbGwgKi8KKyNkZWZpbmUgX19OUl9wc2Vs
ZWN0NgkJCShfX05SX1NZU0NBTExfQkFTRSszMzUpCisjZGVmaW5lIF9fTlJfcHBvbGwJCQkoX19O
Ul9TWVNDQUxMX0JBU0UrMzM2KQogI2RlZmluZSBfX05SX3Vuc2hhcmUJCQkoX19OUl9TWVNDQUxM
X0JBU0UrMzM3KQogI2RlZmluZSBfX05SX3NldF9yb2J1c3RfbGlzdAkJKF9fTlJfU1lTQ0FMTF9C
QVNFKzMzOCkKICNkZWZpbmUgX19OUl9nZXRfcm9idXN0X2xpc3QJCShfX05SX1NZU0NBTExfQkFT
RSszMzkpCkBAIC0zNzIsNyArMzcyLDcgQEAKICNkZWZpbmUgX19OUl92bXNwbGljZQkJCShfX05S
X1NZU0NBTExfQkFTRSszNDMpCiAjZGVmaW5lIF9fTlJfbW92ZV9wYWdlcwkJCShfX05SX1NZU0NB
TExfQkFTRSszNDQpCiAjZGVmaW5lIF9fTlJfZ2V0Y3B1CQkJKF9fTlJfU1lTQ0FMTF9CQVNFKzM0
NSkKLQkJCQkJLyogMzQ2IGZvciBlcG9sbF9wd2FpdCAqLworI2RlZmluZSBfX05SX2Vwb2xsX3B3
YWl0CQkoX19OUl9TWVNDQUxMX0JBU0UrMzQ2KQogI2RlZmluZSBfX05SX2tleGVjX2xvYWQJCQko
X19OUl9TWVNDQUxMX0JBU0UrMzQ3KQogI2RlZmluZSBfX05SX3V0aW1lbnNhdAkJCShfX05SX1NZ
U0NBTExfQkFTRSszNDgpCiAjZGVmaW5lIF9fTlJfc2lnbmFsZmQJCQkoX19OUl9TWVNDQUxMX0JB
U0UrMzQ5KQpAQCAtNDE5LDYgKzQxOSw3IEBACiAjZGVmaW5lIF9fQVJDSF9XQU5UX1NZU19TSUdQ
RU5ESU5HCiAjZGVmaW5lIF9fQVJDSF9XQU5UX1NZU19TSUdQUk9DTUFTSwogI2RlZmluZSBfX0FS
Q0hfV0FOVF9TWVNfUlRfU0lHQUNUSU9OCisjZGVmaW5lIF9fQVJDSF9XQU5UX1NZU19SVF9TSUdT
VVNQRU5ECiAKICNpZiAhZGVmaW5lZChDT05GSUdfQUVBQkkpIHx8IGRlZmluZWQoQ09ORklHX09B
QklfQ09NUEFUKQogI2RlZmluZSBfX0FSQ0hfV0FOVF9TWVNfVElNRQotLSAKMS42LjAuNAoK

--000e0cd566d028f98a04724dca0c
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-implement-TIF_RESTORE_SIGMASK-support-and-enable-the.patch"
Content-Disposition: attachment; 
	filename="0001-implement-TIF_RESTORE_SIGMASK-support-and-enable-the.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fyytd8oz1

RnJvbSA4YTc2NDNiMDk4NTZmNGY2NjE0MDNkY2VkYmUwNDU1YjNjYmVlZWE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZW4gTmV3YnVyeSA8c19qX25ld2J1cnlAeWFob28uY28u
dWs+CkRhdGU6IEZyaSwgMjIgTWF5IDIwMDkgMTQ6MjU6NDAgKzAyMDAKU3ViamVjdDogW1BBVENI
XSBpbXBsZW1lbnQgVElGX1JFU1RPUkVfU0lHTUFTSyBzdXBwb3J0IGFuZCBlbmFibGUgdGhlIHJl
bGF0ZWQKIHN5c2NhbGxzOgoKcHNlbGVjdDYKcHBvbGwKZXBvbGxfcHdhaXQKCkJhc2VkIG9uIGh0
dHA6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYXJtLWtlcm5lbC9tc2czODExNC5odG1sCi0tLQog
YXJjaC9hcm0vaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8ICAgIDIgKwogYXJjaC9hcm0vaW5j
bHVkZS9hc20vdW5pc3RkLmggICAgICB8ICAgIDcgKystCiBhcmNoL2FybS9rZXJuZWwvY2FsbHMu
UyAgICAgICAgICAgIHwgICAgNiArLQogYXJjaC9hcm0va2VybmVsL3NpZ25hbC5jICAgICAgICAg
ICB8ICAgOTAgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNo
YW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS90
aHJlYWRfaW5mby5oCmluZGV4IDRmODg0ODIuLjJjZjA5MTcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGhy
ZWFkX2luZm8uaApAQCAtMTM2LDYgKzEzNiw3IEBAIGV4dGVybiB2b2lkIHZmcF9zeW5jX3N0YXRl
KHN0cnVjdCB0aHJlYWRfaW5mbyAqdGhyZWFkKTsKICNkZWZpbmUgVElGX1NJR1BFTkRJTkcJCTAK
ICNkZWZpbmUgVElGX05FRURfUkVTQ0hFRAkxCiAjZGVmaW5lIFRJRl9TWVNDQUxMX1RSQUNFCTgK
KyNkZWZpbmUgVElGX1JFU1RPUkVfU0lHTUFTSwk5ICAgICAgIC8qIHJlc3RvcmUgc2lnbmFsIG1h
c2sgaW4gZG9fc2lnbmFsICovCiAjZGVmaW5lIFRJRl9QT0xMSU5HX05SRkxBRwkxNgogI2RlZmlu
ZSBUSUZfVVNJTkdfSVdNTVhUCTE3CiAjZGVmaW5lIFRJRl9NRU1ESUUJCTE4CkBAIC0xNDQsNiAr
MTQ1LDcgQEAgZXh0ZXJuIHZvaWQgdmZwX3N5bmNfc3RhdGUoc3RydWN0IHRocmVhZF9pbmZvICp0
aHJlYWQpOwogI2RlZmluZSBfVElGX1NJR1BFTkRJTkcJCSgxIDw8IFRJRl9TSUdQRU5ESU5HKQog
I2RlZmluZSBfVElGX05FRURfUkVTQ0hFRAkoMSA8PCBUSUZfTkVFRF9SRVNDSEVEKQogI2RlZmlu
ZSBfVElGX1NZU0NBTExfVFJBQ0UJKDEgPDwgVElGX1NZU0NBTExfVFJBQ0UpCisjZGVmaW5lIF9U
SUZfUkVTVE9SRV9TSUdNQVNLCSgxIDw8IFRJRl9SRVNUT1JFX1NJR01BU0spCiAjZGVmaW5lIF9U
SUZfUE9MTElOR19OUkZMQUcJKDEgPDwgVElGX1BPTExJTkdfTlJGTEFHKQogI2RlZmluZSBfVElG
X1VTSU5HX0lXTU1YVAkoMSA8PCBUSUZfVVNJTkdfSVdNTVhUKQogI2RlZmluZSBfVElGX0ZSRUVa
RQkJKDEgPDwgVElGX0ZSRUVaRSkKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Vu
aXN0ZC5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdW5pc3RkLmgKaW5kZXggOTRjYzU4ZS4uY2Qx
ZWFhMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vdW5pc3RkLmgKKysrIGIvYXJj
aC9hcm0vaW5jbHVkZS9hc20vdW5pc3RkLmgKQEAgLTM2MCw4ICszNjAsOCBAQAogI2RlZmluZSBf
X05SX3JlYWRsaW5rYXQJCQkoX19OUl9TWVNDQUxMX0JBU0UrMzMyKQogI2RlZmluZSBfX05SX2Zj
aG1vZGF0CQkJKF9fTlJfU1lTQ0FMTF9CQVNFKzMzMykKICNkZWZpbmUgX19OUl9mYWNjZXNzYXQJ
CQkoX19OUl9TWVNDQUxMX0JBU0UrMzM0KQotCQkJCQkvKiAzMzUgZm9yIHBzZWxlY3Q2ICovCi0J
CQkJCS8qIDMzNiBmb3IgcHBvbGwgKi8KKyNkZWZpbmUgX19OUl9wc2VsZWN0NgkJCShfX05SX1NZ
U0NBTExfQkFTRSszMzUpCisjZGVmaW5lIF9fTlJfcHBvbGwJCQkoX19OUl9TWVNDQUxMX0JBU0Ur
MzM2KQogI2RlZmluZSBfX05SX3Vuc2hhcmUJCQkoX19OUl9TWVNDQUxMX0JBU0UrMzM3KQogI2Rl
ZmluZSBfX05SX3NldF9yb2J1c3RfbGlzdAkJKF9fTlJfU1lTQ0FMTF9CQVNFKzMzOCkKICNkZWZp
bmUgX19OUl9nZXRfcm9idXN0X2xpc3QJCShfX05SX1NZU0NBTExfQkFTRSszMzkpCkBAIC0zNzIs
NyArMzcyLDcgQEAKICNkZWZpbmUgX19OUl92bXNwbGljZQkJCShfX05SX1NZU0NBTExfQkFTRSsz
NDMpCiAjZGVmaW5lIF9fTlJfbW92ZV9wYWdlcwkJCShfX05SX1NZU0NBTExfQkFTRSszNDQpCiAj
ZGVmaW5lIF9fTlJfZ2V0Y3B1CQkJKF9fTlJfU1lTQ0FMTF9CQVNFKzM0NSkKLQkJCQkJLyogMzQ2
IGZvciBlcG9sbF9wd2FpdCAqLworI2RlZmluZSBfX05SX2Vwb2xsX3B3YWl0CQkoX19OUl9TWVND
QUxMX0JBU0UrMzQ2KQogI2RlZmluZSBfX05SX2tleGVjX2xvYWQJCQkoX19OUl9TWVNDQUxMX0JB
U0UrMzQ3KQogI2RlZmluZSBfX05SX3V0aW1lbnNhdAkJCShfX05SX1NZU0NBTExfQkFTRSszNDgp
CiAjZGVmaW5lIF9fTlJfc2lnbmFsZmQJCQkoX19OUl9TWVNDQUxMX0JBU0UrMzQ5KQpAQCAtNDMw
LDYgKzQzMCw3IEBACiAjZGVmaW5lIF9fQVJDSF9XQU5UX1NZU19TSUdQRU5ESU5HCiAjZGVmaW5l
IF9fQVJDSF9XQU5UX1NZU19TSUdQUk9DTUFTSwogI2RlZmluZSBfX0FSQ0hfV0FOVF9TWVNfUlRf
U0lHQUNUSU9OCisjZGVmaW5lIF9fQVJDSF9XQU5UX1NZU19SVF9TSUdTVVNQRU5ECiAKICNpZiAh
ZGVmaW5lZChDT05GSUdfQUVBQkkpIHx8IGRlZmluZWQoQ09ORklHX09BQklfQ09NUEFUKQogI2Rl
ZmluZSBfX0FSQ0hfV0FOVF9TWVNfVElNRQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL2Nh
bGxzLlMgYi9hcmNoL2FybS9rZXJuZWwvY2FsbHMuUwppbmRleCAxNjgwZTllLi41MzQwMDBkIDEw
MDY0NAotLS0gYS9hcmNoL2FybS9rZXJuZWwvY2FsbHMuUworKysgYi9hcmNoL2FybS9rZXJuZWwv
Y2FsbHMuUwpAQCAtMzQ0LDggKzM0NCw4IEBACiAJCUNBTEwoc3lzX3JlYWRsaW5rYXQpCiAJCUNB
TEwoc3lzX2ZjaG1vZGF0KQogCQlDQUxMKHN5c19mYWNjZXNzYXQpCi0vKiAzMzUgKi8JQ0FMTChz
eXNfbmlfc3lzY2FsbCkJCS8qIGV2ZW50dWFsbHkgcHNlbGVjdDYgKi8KLQkJQ0FMTChzeXNfbmlf
c3lzY2FsbCkJCS8qIGV2ZW50dWFsbHkgcHBvbGwgKi8KKy8qIDMzNSAqLwlDQUxMKHN5c19wc2Vs
ZWN0NikKKwkJQ0FMTChzeXNfcHBvbGwpCiAJCUNBTEwoc3lzX3Vuc2hhcmUpCiAJCUNBTEwoc3lz
X3NldF9yb2J1c3RfbGlzdCkKIAkJQ0FMTChzeXNfZ2V0X3JvYnVzdF9saXN0KQpAQCAtMzU1LDcg
KzM1NSw3IEBACiAJCUNBTEwoc3lzX3Ztc3BsaWNlKQogCQlDQUxMKHN5c19tb3ZlX3BhZ2VzKQog
LyogMzQ1ICovCUNBTEwoc3lzX2dldGNwdSkKLQkJQ0FMTChzeXNfbmlfc3lzY2FsbCkJCS8qIGV2
ZW50dWFsbHkgZXBvbGxfcHdhaXQgKi8KKwkJQ0FMTChzeXNfZXBvbGxfcHdhaXQpCiAJCUNBTEwo
c3lzX2tleGVjX2xvYWQpCiAJCUNBTEwoc3lzX3V0aW1lbnNhdCkKIAkJQ0FMTChzeXNfc2lnbmFs
ZmQpCmRpZmYgLS1naXQgYS9hcmNoL2FybS9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL2FybS9rZXJu
ZWwvc2lnbmFsLmMKaW5kZXggODBiOGI1Yy4uNzY0NTA0OCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
a2VybmVsL3NpZ25hbC5jCisrKyBiL2FyY2gvYXJtL2tlcm5lbC9zaWduYWwuYwpAQCAtNDcsNTcg
KzQ3LDIzIEBAIGNvbnN0IHVuc2lnbmVkIGxvbmcgc2lncmV0dXJuX2NvZGVzWzddID0gewogCU1P
Vl9SN19OUl9SVF9TSUdSRVRVUk4sIFNXSV9TWVNfUlRfU0lHUkVUVVJOLCBTV0lfVEhVTUJfUlRf
U0lHUkVUVVJOLAogfTsKIAotc3RhdGljIGludCBkb19zaWduYWwoc2lnc2V0X3QgKm9sZHNldCwg
c3RydWN0IHB0X3JlZ3MgKiByZWdzLCBpbnQgc3lzY2FsbCk7CitzdGF0aWMgdm9pZCBkb19zaWdu
YWwoc3RydWN0IHB0X3JlZ3MgKiByZWdzLCBpbnQgc3lzY2FsbCk7CiAKIC8qCiAgKiBhdG9taWNh
bGx5IHN3YXAgaW4gdGhlIG5ldyBzaWduYWwgbWFzaywgYW5kIHdhaXQgZm9yIGEgc2lnbmFsLgog
ICovCi1hc21saW5rYWdlIGludCBzeXNfc2lnc3VzcGVuZChpbnQgcmVzdGFydCwgdW5zaWduZWQg
bG9uZyBvbGRtYXNrLCBvbGRfc2lnc2V0X3QgbWFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCith
c21saW5rYWdlIGludCBzeXNfc2lnc3VzcGVuZChpbnQgcmVzdGFydCwgdW5zaWduZWQgbG9uZyBv
bGRtYXNrLCBvbGRfc2lnc2V0X3QgbWFzaykKIHsKLQlzaWdzZXRfdCBzYXZlc2V0OwotCiAJbWFz
ayAmPSBfQkxPQ0tBQkxFOwogCXNwaW5fbG9ja19pcnEoJmN1cnJlbnQtPnNpZ2hhbmQtPnNpZ2xv
Y2spOwotCXNhdmVzZXQgPSBjdXJyZW50LT5ibG9ja2VkOworCWN1cnJlbnQtPnNhdmVkX3NpZ21h
c2sgPSBjdXJyZW50LT5ibG9ja2VkOwogCXNpZ2luaXRzZXQoJmN1cnJlbnQtPmJsb2NrZWQsIG1h
c2spOwogCXJlY2FsY19zaWdwZW5kaW5nKCk7CiAJc3Bpbl91bmxvY2tfaXJxKCZjdXJyZW50LT5z
aWdoYW5kLT5zaWdsb2NrKTsKLQlyZWdzLT5BUk1fcjAgPSAtRUlOVFI7Ci0KLQl3aGlsZSAoMSkg
ewotCQljdXJyZW50LT5zdGF0ZSA9IFRBU0tfSU5URVJSVVBUSUJMRTsKLQkJc2NoZWR1bGUoKTsK
LQkJaWYgKGRvX3NpZ25hbCgmc2F2ZXNldCwgcmVncywgMCkpCi0JCQlyZXR1cm4gcmVncy0+QVJN
X3IwOwotCX0KLX0KLQotYXNtbGlua2FnZSBpbnQKLXN5c19ydF9zaWdzdXNwZW5kKHNpZ3NldF90
IF9fdXNlciAqdW5ld3NldCwgc2l6ZV90IHNpZ3NldHNpemUsIHN0cnVjdCBwdF9yZWdzICpyZWdz
KQotewotCXNpZ3NldF90IHNhdmVzZXQsIG5ld3NldDsKLQotCS8qIFhYWDogRG9uJ3QgcHJlY2x1
ZGUgaGFuZGxpbmcgZGlmZmVyZW50IHNpemVkIHNpZ3NldF90J3MuICovCi0JaWYgKHNpZ3NldHNp
emUgIT0gc2l6ZW9mKHNpZ3NldF90KSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KLQlpZiAoY29weV9m
cm9tX3VzZXIoJm5ld3NldCwgdW5ld3NldCwgc2l6ZW9mKG5ld3NldCkpKQotCQlyZXR1cm4gLUVG
QVVMVDsKLQlzaWdkZWxzZXRtYXNrKCZuZXdzZXQsIH5fQkxPQ0tBQkxFKTsKLQotCXNwaW5fbG9j
a19pcnEoJmN1cnJlbnQtPnNpZ2hhbmQtPnNpZ2xvY2spOwotCXNhdmVzZXQgPSBjdXJyZW50LT5i
bG9ja2VkOwotCWN1cnJlbnQtPmJsb2NrZWQgPSBuZXdzZXQ7Ci0JcmVjYWxjX3NpZ3BlbmRpbmco
KTsKLQlzcGluX3VubG9ja19pcnEoJmN1cnJlbnQtPnNpZ2hhbmQtPnNpZ2xvY2spOwotCXJlZ3Mt
PkFSTV9yMCA9IC1FSU5UUjsKLQotCXdoaWxlICgxKSB7Ci0JCWN1cnJlbnQtPnN0YXRlID0gVEFT
S19JTlRFUlJVUFRJQkxFOwotCQlzY2hlZHVsZSgpOwotCQlpZiAoZG9fc2lnbmFsKCZzYXZlc2V0
LCByZWdzLCAwKSkKLQkJCXJldHVybiByZWdzLT5BUk1fcjA7Ci0JfQorCWN1cnJlbnQtPnN0YXRl
ID0gVEFTS19JTlRFUlJVUFRJQkxFOworCXNjaGVkdWxlKCk7CisJc2V0X3RocmVhZF9mbGFnKFRJ
Rl9SRVNUT1JFX1NJR01BU0spOworCXJldHVybiAtRVJFU1RBUlROT0hBTkQ7CiB9CiAKIGFzbWxp
bmthZ2UgaW50IApAQCAtMjkwLDcgKzI1Niw3IEBAIGFzbWxpbmthZ2UgaW50IHN5c19zaWdyZXR1
cm4oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIGJhZGZyYW1lOgogCWZvcmNlX3NpZyhTSUdTRUdW
LCBjdXJyZW50KTsKLQlyZXR1cm4gMDsKKwlyZXR1cm4gLUVGQVVMVDsKIH0KIAogYXNtbGlua2Fn
ZSBpbnQgc3lzX3J0X3NpZ3JldHVybihzdHJ1Y3QgcHRfcmVncyAqcmVncykKQEAgLTMyNSw3ICsy
OTEsNyBAQCBhc21saW5rYWdlIGludCBzeXNfcnRfc2lncmV0dXJuKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQogCiBiYWRmcmFtZToKIAlmb3JjZV9zaWcoU0lHU0VHViwgY3VycmVudCk7Ci0JcmV0dXJu
IDA7CisJcmV0dXJuIC1FRkFVTFQ7CiB9CiAKIHN0YXRpYyBpbnQKQEAgLTU0MSw3ICs1MDcsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgcmVzdGFydF9zeXNjYWxsKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQogLyoKICAqIE9LLCB3ZSdyZSBpbnZva2luZyBhIGhhbmRsZXIKICAqLwkKLXN0YXRpYyB2b2lk
CitzdGF0aWMgaW50CiBoYW5kbGVfc2lnbmFsKHVuc2lnbmVkIGxvbmcgc2lnLCBzdHJ1Y3Qga19z
aWdhY3Rpb24gKmthLAogCSAgICAgIHNpZ2luZm9fdCAqaW5mbywgc2lnc2V0X3QgKm9sZHNldCwK
IAkgICAgICBzdHJ1Y3QgcHRfcmVncyAqIHJlZ3MsIGludCBzeXNjYWxsKQpAQCAtNTkyLDcgKzU1
OCw3IEBAIGhhbmRsZV9zaWduYWwodW5zaWduZWQgbG9uZyBzaWcsIHN0cnVjdCBrX3NpZ2FjdGlv
biAqa2EsCiAKIAlpZiAocmV0ICE9IDApIHsKIAkJZm9yY2Vfc2lnc2VndihzaWcsIHRzayk7Ci0J
CXJldHVybjsKKwkJcmV0dXJuIHJldDsKIAl9CiAKIAkvKgpAQCAtNjA2LDYgKzU3Miw3IEBAIGhh
bmRsZV9zaWduYWwodW5zaWduZWQgbG9uZyBzaWcsIHN0cnVjdCBrX3NpZ2FjdGlvbiAqa2EsCiAJ
cmVjYWxjX3NpZ3BlbmRpbmcoKTsKIAlzcGluX3VubG9ja19pcnEoJnRzay0+c2lnaGFuZC0+c2ln
bG9jayk7CiAKKwlyZXR1cm4gcmV0OwogfQogCiAvKgpAQCAtNjE3LDExICs1ODQsMTIgQEAgaGFu
ZGxlX3NpZ25hbCh1bnNpZ25lZCBsb25nIHNpZywgc3RydWN0IGtfc2lnYWN0aW9uICprYSwKICAq
IHRoZSBrZXJuZWwgY2FuIGhhbmRsZSwgYW5kIHRoZW4gd2UgYnVpbGQgYWxsIHRoZSB1c2VyLWxl
dmVsIHNpZ25hbCBoYW5kbGluZwogICogc3RhY2stZnJhbWVzIGluIG9uZSBnbyBhZnRlciB0aGF0
LgogICovCi1zdGF0aWMgaW50IGRvX3NpZ25hbChzaWdzZXRfdCAqb2xkc2V0LCBzdHJ1Y3QgcHRf
cmVncyAqcmVncywgaW50IHN5c2NhbGwpCitzdGF0aWMgdm9pZCBkb19zaWduYWwoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsIGludCBzeXNjYWxsKQogewogCXN0cnVjdCBrX3NpZ2FjdGlvbiBrYTsKIAlz
aWdpbmZvX3QgaW5mbzsKIAlpbnQgc2lnbnI7CisJc2lnc2V0X3QgKm9sZHNldDsKIAogCS8qCiAJ
ICogV2Ugd2FudCB0aGUgY29tbW9uIGNhc2UgdG8gZ28gZmFzdCwgd2hpY2gKQEAgLTYzMCwxOCAr
NTk4LDI5IEBAIHN0YXRpYyBpbnQgZG9fc2lnbmFsKHNpZ3NldF90ICpvbGRzZXQsIHN0cnVjdCBw
dF9yZWdzICpyZWdzLCBpbnQgc3lzY2FsbCkKIAkgKiBpZiBzby4KIAkgKi8KIAlpZiAoIXVzZXJf
bW9kZShyZWdzKSkKLQkJcmV0dXJuIDA7CisJCXJldHVybjsKIAogCWlmICh0cnlfdG9fZnJlZXpl
KCkpCiAJCWdvdG8gbm9fc2lnbmFsOwogCiAJc2luZ2xlX3N0ZXBfY2xlYXIoY3VycmVudCk7CiAK
KwlpZiAodGVzdF90aHJlYWRfZmxhZyhUSUZfUkVTVE9SRV9TSUdNQVNLKSkKKwkJb2xkc2V0ID0g
JmN1cnJlbnQtPnNhdmVkX3NpZ21hc2s7CisJZWxzZQorCQlvbGRzZXQgPSAmY3VycmVudC0+Ymxv
Y2tlZDsKKwogCXNpZ25yID0gZ2V0X3NpZ25hbF90b19kZWxpdmVyKCZpbmZvLCAma2EsIHJlZ3Ms
IE5VTEwpOwogCWlmIChzaWduciA+IDApIHsKLQkJaGFuZGxlX3NpZ25hbChzaWduciwgJmthLCAm
aW5mbywgb2xkc2V0LCByZWdzLCBzeXNjYWxsKTsKKwkJaWYgKGhhbmRsZV9zaWduYWwoc2lnbnIs
ICZrYSwgJmluZm8sIG9sZHNldCwgcmVncywgc3lzY2FsbCkgPT0gMCkgeworCQkJLyogYSBzaWdu
YWwgd2FzIHN1Y2Nlc3NmdWxseSBkZWxpdmVyZWQ7IHRoZSBzYXZlZAorCQkJICogc2lnbWFzayB3
aWxsIGhhdmUgYmVlbiBzdG9yZWQgaW4gdGhlIHNpZ25hbCBmcmFtZSwKKwkJCSAqIGFuZCB3aWxs
IGJlIHJlc3RvcmVkIGJ5IHNpZ3JldHVybiwgc28gd2UgY2FuIHNpbXBseQorCQkJICogY2xlYXIg
dGhlIFRJRl9SRVNUT1JFX1NJR01BU0sgZmxhZyAqLworCQkJY2xlYXJfdGhyZWFkX2ZsYWcoVElG
X1JFU1RPUkVfU0lHTUFTSyk7CisJCX0KIAkJc2luZ2xlX3N0ZXBfc2V0KGN1cnJlbnQpOwotCQly
ZXR1cm4gMTsKKwkJcmV0dXJuOwogCX0KIAogIG5vX3NpZ25hbDoKQEAgLTY2NSw3ICs2NDQsNyBA
QCBzdGF0aWMgaW50IGRvX3NpZ25hbChzaWdzZXRfdCAqb2xkc2V0LCBzdHJ1Y3QgcHRfcmVncyAq
cmVncywgaW50IHN5c2NhbGwpCiAJCQkJdXNwID0gKHUzMiBfX3VzZXIgKilyZWdzLT5BUk1fc3A7
CiAKIAkJCQkvKgotCQkJCSAqIEVpdGhlciB3ZSBzdXBwb3J0cyBPQUJJIG9ubHksIG9yIHdlIGhh
dmUKKwkJCQkgKiBFaXRoZXIgd2Ugc3VwcG9ydCBPQUJJIG9ubHksIG9yIHdlIGhhdmUKIAkJCQkg
KiBFQUJJIHdpdGggdGhlIE9BQkkgY29tcGF0IGxheWVyIGVuYWJsZWQuCiAJCQkJICogSW4gdGhl
IGxhdGVyIGNhc2Ugd2UgZG9uJ3Qga25vdyBpZiB1c2VyCiAJCQkJICogc3BhY2UgaXMgRUFCSSBv
ciBub3QsIGFuZCBpZiBub3Qgd2UgbXVzdApAQCAtNjk1LDEyICs2NzQsMTcgQEAgc3RhdGljIGlu
dCBkb19zaWduYWwoc2lnc2V0X3QgKm9sZHNldCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBz
eXNjYWxsKQogCQl9CiAJfQogCXNpbmdsZV9zdGVwX3NldChjdXJyZW50KTsKLQlyZXR1cm4gMDsK
KyAgICAgICAgLyogaWYgdGhlcmUncyBubyBzaWduYWwgdG8gZGVsaXZlciwgd2UganVzdCBwdXQg
dGhlIHNhdmVkIHNpZ21hc2sKKyAgICAgICAgICAgYmFjay4gKi8KKwkJaWYgKHRlc3RfdGhyZWFk
X2ZsYWcoVElGX1JFU1RPUkVfU0lHTUFTSykpIHsKKwkJCWNsZWFyX3RocmVhZF9mbGFnKFRJRl9S
RVNUT1JFX1NJR01BU0spOworCQkJc2lncHJvY21hc2soU0lHX1NFVE1BU0ssICZjdXJyZW50LT5z
YXZlZF9zaWdtYXNrLCBOVUxMKTsKKwkJfQogfQogCiBhc21saW5rYWdlIHZvaWQKIGRvX25vdGlm
eV9yZXN1bWUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCB0aHJlYWRfZmxhZ3Ms
IGludCBzeXNjYWxsKQogewotCWlmICh0aHJlYWRfZmxhZ3MgJiBfVElGX1NJR1BFTkRJTkcpCi0J
CWRvX3NpZ25hbCgmY3VycmVudC0+YmxvY2tlZCwgcmVncywgc3lzY2FsbCk7CisJaWYgKHRocmVh
ZF9mbGFncyAmIChfVElGX1NJR1BFTkRJTkd8X1RJRl9SRVNUT1JFX1NJR01BU0spKQorCQlkb19z
aWduYWwocmVncywgc3lzY2FsbCk7CiB9Ci0tIAoxLjYuMi40Cgo=

--000e0cd566d028f98a04724dca0c--
