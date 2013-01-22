Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lei.Yang@windriver.com>) id 1TxbEj-0005Ll-Gp
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 11:38:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0MAMBkD019897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 02:22:12 -0800 (PST)
Received: from [128.224.158.225] (128.224.158.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 02:22:11 -0800
Message-ID: <50FE684F.3000107@windriver.com>
Date: Tue, 22 Jan 2013 18:22:07 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
References: <1358762433-11853-1-git-send-email-lei.yang@windriver.com>
	<50FE5110.7090104@enea.com>
In-Reply-To: <50FE5110.7090104@enea.com>
X-Originating-IP: [128.224.158.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r0MAMBkD019897
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-virtualization] [meta-oe][PATCH] multipath-tools: Add multipath-tools recipe
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
X-List-Received-Date: Tue, 22 Jan 2013 10:38:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01/22/2013 04:42 PM, David Nystr=C3=B6m wrote:
> On Mon 21 Jan 2013 11:00:33 AM CET, lei.yang@windriver.com wrote:
>> From: Lei Yang <lei.yang@windriver.com>
>>
>> This packages provides:
>> - multipath: scans the system for multipathed devices, assembles
>> - multipathd: waits for maps events then execs multipath
>> - kpartx: maps linear devmaps to device partitions, which makes
>> multipath maps partionable
>> ......
>>
>> Now,It can be used for kvm disk img partion for me.
>>
>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>> ---
>>   .../multipath-tools/multipath-tools_git.bb         |   46=20
>> ++++++++++++++++++++
>>   1 files changed, 46 insertions(+), 0 deletions(-)
>>   create mode 100644=20
>> meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>>
>> diff --git=20
>> a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb=20
>> b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> new file mode 100644
>> index 0000000..e9509d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> @@ -0,0 +1,46 @@
>> +SUMMARY =3D "Tools to Manage Multipathed Devices with the device-mapp=
er"
>> +DESCRIPTION =3D "This package provides the tools to manage multipathe=
d=20
>> devices by \
>> +instructing the device-mapper multipath module what to do"
>> +
>> +HOMEPAGE =3D "http://christophe.varoqui.free.fr/"
>> +DEPENDS =3D "readline libaio lvm2"
>> +LICENSE =3D "GPLv2"
>> +
>> +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D7be2873b6270e45abacc503abbe2aa3d"
>> +S=3D"${WORKDIR}/git"
>> +
>> +
>> +SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;protocol=3Dht=
tp"
>> +
>> +SRCREV =3D "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>> +PV =3D "0.4.9+gitr${SRCPV}"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OEMAKE=3D"LIB=3D${libdir} exec_prefix=3D${exec_prefix}=20
>> libdir=3D${libdir}"
>> +
>> +PACKAGES =3D+ "libmpathpersist mpathpersist kpartx libmultipath=20
>> multipath multipathd libmultipath-dev libmpathpersist-dev"
>> +
>> +
>> +RDEPENDS_${PN} +=3D "libmpathpersist mpathpersist kpartx libmultipath=
=20
>> multipath multipathd"
>> +
>
> Is RDEPENDS on udev not mandatory ?
>

good catch, we can add it, it will create /dev/mapper/loop0p1 node, I=20
give a log for it's kpart usage in my testing,It's pretty easy for image=20
partition
because you don't need to know offset for partition

root@intel_5500_server:/# kpartx -l sdb.img
loop0p1 : 0 20480 /dev/loop0 2048
loop0p2 : 0 10240 /dev/loop0 22528
loop deleted : /dev/loop0
root@intel_5500_server:/# kpartx -a sdb.img
root@intel_5500_server:/# ls /dev/mapper/
control  loop0p1  loop0p2
root@intel_5500_server:/# ls /dev/mapper/loop0p1
/dev/mapper/loop0p1
root@intel_5500_server:/# mkfs.ext3 /dev/mapper/loop0p1
.....

root@intel_5500_server:/# mount /dev/mapper/loop0p1 /mnt
root@intel_5500_server:/# ls /mnt
lost+found



>> +do_install_append () {
>> +    ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
>> +    ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
>> +}
>> +
>> +ALLOW_EMPTY_${PN} =3D "1"
>> +FILES_${PN}     =3D ""
>> +
>> +FILES_libmpathpersist =3D "${libdir}/libmpathpersist*.so.0"
>> +FILES_mpathpersist =3D "${sbindir}/mpathpersist"
>> +FILES_kpartx =3D "${sbindir}/kpartx ${base_libdir}/udev/"
>> +FILES_libmultipath =3D "${libdir}/libcheck*.so ${libdir}/libpri*.so=20
>> ${libdir}/libmultipath*.so.0"
>> +FILES_multipath =3D "${sbindir}/multipath ${sysconfdir}"
>> +FILES_multipathd =3D "${sbindir}/multipathd ${base_libdir}"
>> +
>> +#put the symbol link lib in -dev
>> +FILES_libmultipath-dev =3D "${libdir}/libmultipath*.so"
>> +FILES_libmpathpersist-dev =3D "${libdir}/libmpathpersist*.so"
>> +
>> +
>
> Whats the intended destination for this recipe ?

if meta-oe,  recipes-support
if meta-virtualization: recipes-extended


> If not accepted in meta-oe, We'll be happy to merge it in=20
> meta-virtualization.
>

Glad to add in meta-virt

Lei

> Br,
> David



