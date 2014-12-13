Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5D50672453
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Dec 2014 18:04:50 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so9070439pdi.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Dec 2014 10:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=nBK3rZlyLq7e8gnRIHu5UAto+HfnFMfp0cHzjhUf2oI=;
	b=GeiScOX7p6FPSoRTga3sv7Lah3mtaru6mY5js5o7AcSaY6FhsP5Nw0QaVJ1nKimEVT
	p5kAKuu60l+7lJW60jFGTPNksaes5vhWYr/9R9pkaMAW44rH4wO6hZe8dw54k3PbcPyk
	W/mIqjQE6bGRdyO8//uoaGWPbJBjdIx/H+WTVP/eofiiFwGLsFzhoswwBfluoRPQpMHY
	PTUxMI+rrG6/ixEUz/ZwNqwraTFyUNUDK6kjf74GUmxm3LRjQfKo9JHQ89ASyx3YRiHU
	HBwaH5j79UL/7kZrTQ8NYUprGLH8rvaYbq3U7rJSD7Y3y7ESXrpYjVxlb1YwWL3Bye9d
	X/hw==
X-Received: by 10.68.97.131 with SMTP id ea3mr36768810pbb.144.1418493891175;
	Sat, 13 Dec 2014 10:04:51 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:8d0c:d29c:4b71:4aab?
	([2601:c:9380:601:8d0c:d29c:4b71:4aab])
	by mx.google.com with ESMTPSA id
	am14sm2995598pac.35.2014.12.13.10.04.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Dec 2014 10:04:50 -0800 (PST)
Message-ID: <548C7FBF.5030805@gmail.com>
Date: Sat, 13 Dec 2014 10:04:47 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "raj.khem@gmail.com >> Khem Raj" <raj.khem@gmail.com>
References: <1418433227-14617-1-git-send-email-akuster808@gmail.com>
	<86D280EF-C9D9-4644-83C3-91B9703C9292@gmail.com>
In-Reply-To: <86D280EF-C9D9-4644-83C3-91B9703C9292@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] netkit-tftp: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Dec 2014 18:04:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/12/2014 05:44 PM, Khem Raj wrote:
>
>> On Dec 12, 2014, at 5:13 PM, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>> .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 70 ++++++++++++++++++++++
>> 1 file changed, 70 insertions(+)
>> create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>>
>> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>> new file mode 100644
>> index 0000000..bd5c113
>> --- /dev/null
>> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>> @@ -0,0 +1,70 @@
>> +DESCRIPTION = " tftp - Trivial file transfer protocol client \
>> +    tftpd- Trivial file transfer protocol server "
>> +SECTION = "networking"
>> +LICENSE = “BSD"
>
> which BSD clause ?

will check.

>
>> +DEPENDS = " tcp-wrappers"
>> +
>> +LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
>> +
>> +SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
>> +        ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
>> +"
>> +
>> +SRC_URI[archive.md5sum] = "b7262c798e2ff50e29c2ff50dfd8d6a8"
>> +SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"
>> +SRC_URI[patch18.md5sum] = "cb29e7a33dd85105ba6e6ec4f971e42c"
>> +SRC_URI[patch18.sha256sum] = "092437d27b4fa88c044ef6290372fee5ce06d223607f0e22a6e527065c8930e7"
>> +
>> +inherit autotools-brokensep
>> +
>> +do_configure () {
>> +    ./configure --prefix=${prefix}
>> +    echo "CFLAGS=${CFLAGS}" > MCONFIG
>> +}
>> +
>> +do_compile () {
>> +    oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' 'CFLAGS=${CFLAGS}'
>> +}
>> +
>> +do_install () {
>> +    install -d ${D}${bindir}
>> +    install -d ${D}${sbindir}
>> +    install -d ${D}${mandir}/man1
>> +    install -d ${D}${mandir}/man8
>> +    install -d ${D}${sysconfdir}/xinetd.d
>> +
>> +    sed -i 's/install -s/install/' tftp/Makefile
>> +    sed -i 's/install -s/install/' tftpd/Makefile
>> +
>> +    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
>> +    'DAEMONMODE=0755' 'MANMODE=0644' \
>> +    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
>> +    'MANDIR=${mandir}' install
>> +
>> +    # create the xinetd config file
>> +    cat >tftp.conf <<EOF
>> + service tftp
>> + {
>> +    disable        = no
>> +    socket_type    = dgram
>> +    port           = 69
>> +    protocol       = udp
>> +    wait           = yes
>> +    user           = nobody
>> +    server         = ${sbindir}/in.tftpd
>> +    server_args    = /tftpboot
>> + }
>> +EOF
>
> may be this can be a separate file ? since then we can override it via bbappend if needed

sounds good.

>
>> +    install tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
>> +}
>> +
>> +INSANE_SKIP_${PN} = "already-stripped”
>
> Not nice, we loose the debuggability just replace install -s in its makefiles with install
> or may be just setting INSTALL variable is enough.

I will double check this.

thanks for the feedback.

- Armin
>
>> +
>> +PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
>> +FILES_${PN}-client = "${bindir}/*"
>> +FILES_${PN}-server = "${sbindir}/* ${sysconfdir}/xinetd.d/*"
>> +FILES_${PN}-doc = "${mandir}"
>> +FILES_${PN}-dbg = "${prefix}/src/debug \
>> +            ${bindir}/.debug ${sbindir}/.debug"
>> +
>> +RDEPENDS_${PN}-server = "tcp-wrappers xinetd"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

