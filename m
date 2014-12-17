Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id C80867270B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 22:19:08 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so8603pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 14:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ubreG1pq95VDdttGsy9T3cTfSNNdCS6vwHrt1nY9dF0=;
	b=PoMySapYXU04z5l7xzot1D6Euf16u467W46z3gtEPzxT2O102hOuzJgvsY2pihwMx4
	xCFKMmWsPwSCcQ0FpoV0b6/m5TtjJnvqcTVyKCEziSRcsMFeVts/kLL9ybFrjyMWA3tW
	53nv6zRIiIuANyQTz8XFyeVFkvZhD6dTS/UdXjEbU5XFAL/N5YqjA+ZkNh7vArl52vHj
	tQyhl+uqcYJDzVdF3Nu0EA9lNBbBa9HMXuQWXQEHjKmwJbeGUFreE3PPMW8llz3EjYhX
	guhb6N7QR2qu8j96BiFgP9CfP67X4rrWR7a22AM75u1FH6+nv1vJzsh07ZABX46Iye++
	ZfHQ==
X-Received: by 10.70.129.207 with SMTP id ny15mr67790566pdb.152.1418854749321; 
	Wed, 17 Dec 2014 14:19:09 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:bd7f:d1ec:52c9:778f?
	([2601:c:a700:272f:bd7f:d1ec:52c9:778f])
	by mx.google.com with ESMTPSA id j9sm4807572pdl.72.2014.12.17.14.19.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Dec 2014 14:19:08 -0800 (PST)
Message-ID: <54920158.1050601@gmail.com>
Date: Wed, 17 Dec 2014 14:19:04 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1418493812-17585-1-git-send-email-akuster808@gmail.com>	<20141217163527.GA12489@jama>
	<5491C19F.9080307@gmail.com> <20141217181649.GB12489@jama>
In-Reply-To: <20141217181649.GB12489@jama>
Subject: Re: [meta-networking][PATCH V2] netkit-tftp: new package
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
X-List-Received-Date: Wed, 17 Dec 2014 22:19:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

thanks.

- armin

On 12/17/2014 10:16 AM, Martin Jansa wrote:
> On Wed, Dec 17, 2014 at 09:47:11AM -0800, akuster808 wrote:
>>
>> ok. thanks for the feedback.
>
> FYI: I've also fixed it in master-next.
>
> I've shortened the DESCRIPTION a bit, if you want package specific
> description it could be set with package qualifier.
>
> I've removed V2: .. from commit message (I guess you wanted to include
> it bellow ---.
>
> I've dropped leading space from DEPENDS.
>
>> On 12/17/2014 08:35 AM, Martin Jansa wrote:
>>> On Sat, Dec 13, 2014 at 10:03:32AM -0800, Armin Kuster wrote:
>>>> V2: fix license
>>>>       moved xinent.d config to file
>>>>       remove INSANE
>>>
>>> Missing line-feed before LICENSE variable, doesn't even parse because
>>> bitbake doesn't see LICENSE..
>>>
>>> ERROR: This recipe does not have the LICENSE field set (netkit-tftp)
>>> ERROR: Failed to parse recipe: /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>>> ETA:  00:01:48
>>>
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>    .../netkit-tftp/netkit-tftp/tftp.conf              | 11 +++++
>>>>    .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 54 ++++++++++++++++++++++
>>>>    2 files changed, 65 insertions(+)
>>>>    create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
>>>>    create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>>>>
>>>> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
>>>> new file mode 100644
>>>> index 0000000..7bc6ca9
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
>>>> @@ -0,0 +1,11 @@
>>>> +service tftp
>>>> +{
>>>> +    disable        = no
>>>> +    socket_type    = dgram
>>>> +    port           = 69
>>>> +    protocol       = udp
>>>> +    wait           = yes
>>>> +    user           = nobody
>>>> +    server         = /usr/sbin/in.tftpd
>>>> +    server_args    = /tftpboot
>>>> +}
>>>> diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>>>> new file mode 100644
>>>> index 0000000..43075d7
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>>>> @@ -0,0 +1,54 @@
>>>> +DESCRIPTION = " tftp - Trivial file transfer protocol client \
>>>> +    tftpd- Trivial file transfer protocol server "
>>>> +SECTION = "networking" LICENSE = "BSD-4-Clause"
>>>> +DEPENDS = " tcp-wrappers"
>>>> +
>>>> +LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
>>>> +
>>>> +SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
>>>> +        ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
>>>> +        file://tftp.conf \
>>>> +"
>>>> +
>>>> +SRC_URI[archive.md5sum] = "b7262c798e2ff50e29c2ff50dfd8d6a8"
>>>> +SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"
>>>> +SRC_URI[patch18.md5sum] = "cb29e7a33dd85105ba6e6ec4f971e42c"
>>>> +SRC_URI[patch18.sha256sum] = "092437d27b4fa88c044ef6290372fee5ce06d223607f0e22a6e527065c8930e7"
>>>> +
>>>> +inherit autotools-brokensep
>>>> +
>>>> +do_configure () {
>>>> +    ./configure --prefix=${prefix}
>>>> +    echo "CFLAGS=${CFLAGS}" > MCONFIG
>>>> +}
>>>> +
>>>> +do_compile () {
>>>> +    oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' 'CFLAGS=${CFLAGS}'
>>>> +}
>>>> +
>>>> +do_install () {
>>>> +    install -d ${D}${bindir}
>>>> +    install -d ${D}${sbindir}
>>>> +    install -d ${D}${mandir}/man1
>>>> +    install -d ${D}${mandir}/man8
>>>> +    install -d ${D}${sysconfdir}/xinetd.d
>>>> +
>>>> +    sed -i 's/install -s/install/' tftp/Makefile
>>>> +    sed -i 's/install -s/install/' tftpd/Makefile
>>>> +
>>>> +    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
>>>> +    'DAEMONMODE=0755' 'MANMODE=0644' \
>>>> +    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
>>>> +    'MANDIR=${mandir}' install
>>>> +
>>>> +    install ${WORKDIR}/tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
>>>> +}
>>>> +
>>>> +PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
>>>> +FILES_${PN}-client = "${bindir}/*"
>>>> +FILES_${PN}-server = "${sbindir}/* ${sysconfdir}/xinetd.d/*"
>>>> +FILES_${PN}-doc = "${mandir}"
>>>> +FILES_${PN}-dbg = "${prefix}/src/debug \
>>>> +            ${bindir}/.debug ${sbindir}/.debug"
>>>> +
>>>> +RDEPENDS_${PN}-server = "tcp-wrappers xinetd"
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

