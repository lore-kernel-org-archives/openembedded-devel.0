Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IJlCc-0003Jo-TZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Aug 2007 09:16:03 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1279598waf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2007 00:13:07 -0700 (PDT)
Received: by 10.115.14.1 with SMTP id r1mr3306803wai.1186816387554;
	Sat, 11 Aug 2007 00:13:07 -0700 (PDT)
Received: by 10.115.73.16 with HTTP; Sat, 11 Aug 2007 00:13:07 -0700 (PDT)
Message-ID: <19c1b8a90708110013v87af3f9h7d4f0b4354153eb3@mail.gmail.com>
Date: Sat, 11 Aug 2007 00:13:07 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46BCC163.8000906@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <46BCC163.8000906@dominion.kabel.utwente.nl>
Subject: Re: [RFC] improving binutils-cross staging
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
X-List-Received-Date: Sat, 11 Aug 2007 07:16:03 -0000
X-Groupsio-MsgNum: 2675
Content-Type: multipart/mixed; 
	boundary="----=_Part_118984_4095113.1186816387505"

------=_Part_118984_4095113.1186816387505
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Koen

It seems you need development support installed. this configure option
--enable-install-libbfd should do it.
Attached patch ( untested) should fix it.

Thanks

-Khem

On 8/10/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> For blackfin I need to build elf2flt and that needs some extra files from binutils:
>
> - --- packages/binutils/binutils-cross_2.17.50.0.5.bb
> d60bed4e513253708d05f83d02aecf9ca9441369
> +++ packages/binutils/binutils-cross_2.17.50.0.5.bb
> 208e1b60a5e66b05df64de9964cfdce963a37190
> @@ -21,6 +21,15 @@ do_stage () {
>         rmdir ${CROSS_DIR}/${libdir} || :
>         rmdir ${CROSS_DIR}/${prefix} || :
>
> +        oe_libinstall -a -C opcodes libopcodes ${CROSS_DIR}/${TARGET_SYS}/lib
> +        oe_libinstall -a -C bfd libbfd ${CROSS_DIR}/${TARGET_SYS}/lib
> +
> +        install -d ${CROSS_DIR}/${TARGET_SYS}/include
> +        install -d ${CROSS_DIR}/${TARGET_SYS}/include/elf
> +
> +        install -m 0644 bfd/bfd.h ${CROSS_DIR}/${TARGET_SYS}/include
> +        install -m 0644 ${WORKDIR}/binutils-${PV}/include/elf/*.h
> ${CROSS_DIR}/${TARGET_SYS}/include/elf/
> +
>         # We want to move this into the target specific location
>         mkdir -p ${CROSS_DIR}/${TARGET_SYS}/lib
>         mv -f ${CROSS_DIR}/lib/libiberty.a ${CROSS_DIR}/${TARGET_SYS}/lib
>
> It looks a bit ugly to me, does anyone have a better suggestion?
>
> regards,
>
> Koen
>
> PS:
>
> elf2flt_svn.bb:
> PV = "0.0+svnr${SRCREV}"
> inherit autotools cross
> SRC_URI = "svn://sources.blackfin.uclinux.org/toolchain/trunk;module=${PN}"
> S = "${WORKDIR}/${PN}"
> EXTRA_OECONF = " --with-libbfd=${CROSS_DIR}/${TARGET_SYS}/lib/libbfd.a \
>                  --with-libiberty=${CROSS_DIR}/${TARGET_SYS}/lib/libiberty.a \
>                  --with-bfd-include-dir=${CROSS_DIR}/${TARGET_SYS}/include \
>                "
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGvMFjMkyGM64RGpERAm7sAJ9/aEYcxAhXKd7Z79IivGFQ9lxZpACghyBy
> qF+s0qRfgCTelH3Q/LXZSlo=
> =4q6O
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

------=_Part_118984_4095113.1186816387505
Content-Type: application/octet-stream; name="diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="diff"
X-Attachment-Id: f_f57rtpye

IwojIG9sZF9yZXZpc2lvbiBbMmVjNTM1NGViMTU3NWVkZGUwZDA2ZTljYzRiYzZiODBhMzJhMmVh
M10KIwojIHBhdGNoICJwYWNrYWdlcy9iaW51dGlscy9iaW51dGlscy1jcm9zc18yLjE3LjUwLjAu
NS5iYiIKIyAgZnJvbSBbZDYwYmVkNGU1MTMyNTM3MDhkMDVmODNkMDJhZWNmOWNhOTQ0MTM2OV0K
IyAgICB0byBbYjA3ZDA0ZWMwZGY2NTQwMTBhNGU1MGUwMDczYWMxYzM1ZGU2MGZhYV0KIyAKIyBw
YXRjaCAicGFja2FnZXMvZ2xpYmMvZWdsaWJjX3N2bi5iYiIKIyAgZnJvbSBbODc5NjQ1ZDI5NGNm
YjNhMDYwYjg4ZjVjZDMyZTdkM2MzNjA3ZTM5ZV0KIyAgICB0byBbYTg1YjhlYjk4MzdiYWM2OTAz
ZTJkZGU4NTU2Mzg0MTcwZWZhNzgyMl0KIwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIHBhY2thZ2VzL2JpbnV0aWxzL2JpbnV0
aWxzLWNyb3NzXzIuMTcuNTAuMC41LmJiCWQ2MGJlZDRlNTEzMjUzNzA4ZDA1ZjgzZDAyYWVjZjlj
YTk0NDEzNjkKKysrIHBhY2thZ2VzL2JpbnV0aWxzL2JpbnV0aWxzLWNyb3NzXzIuMTcuNTAuMC41
LmJiCWIwN2QwNGVjMGRmNjU0MDEwYTRlNTBlMDA3M2FjMWMzNWRlNjBmYWEKQEAgLTYsNyArNiw4
IEBAIEVYVFJBX09FQ09ORiA9ICItLXdpdGgtc3lzcm9vdD0ke0NST1NTX0QKIEZJTEVTRElSID0g
IiR7QG9zLnBhdGguZGlybmFtZShiYi5kYXRhLmdldFZhcignRklMRScsZCwxKSl9L2JpbnV0aWxz
LSR7UFZ9IgogUEFDS0FHRVMgPSAiIgogRVhUUkFfT0VDT05GID0gIi0td2l0aC1zeXNyb290PSR7
Q1JPU1NfRElSfS8ke1RBUkdFVF9TWVN9IFwKLQkJLS1wcm9ncmFtLXByZWZpeD0ke1RBUkdFVF9Q
UkVGSVh9IgorCQktLXByb2dyYW0tcHJlZml4PSR7VEFSR0VUX1BSRUZJWH0gXAorCQktLWVuYWJs
ZS1pbnN0YWxsLWxpYmJmZCIKIAogZG9fc3RhZ2UgKCkgewogCW9lX3J1bm1ha2UgaW5zdGFsbAo=

------=_Part_118984_4095113.1186816387505--
