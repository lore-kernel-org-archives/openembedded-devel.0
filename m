Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40B6862176
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:18:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7F2IZOt025200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2013 19:18:36 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 14 Aug 2013 19:18:33 -0700
Message-ID: <520C3A77.9080300@windriver.com>
Date: Thu, 15 Aug 2013 10:18:31 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<20130814071513.GS17945@jama> <520B321F.8070301@windriver.com>
	<20130814115342.GW17945@jama>
In-Reply-To: <20130814115342.GW17945@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC PATCH 00/13] create meta-filesystems layer to collect filesystem related recipes
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
X-List-Received-Date: Thu, 15 Aug 2013 02:18:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2013 07:53 PM, Martin Jansa wrote:
> On Wed, Aug 14, 2013 at 03:30:39PM +0800, Hongxu Jia wrote:
>> On 08/14/2013 03:15 PM, Martin Jansa wrote:
>>> On Wed, Aug 14, 2013 at 02:30:52PM +0800, Hongxu Jia wrote:
>>>> Survey the filesystem related items in meta-oe, and move them to the
>>>> meta-openembedded/meta-filesystems layer
>>> Whole patchset looks good to me. Only thing I've noticed is that we have
>>> interesting collection of BBFILE_COLLECTIONS names, I know it's not
>>> important as long as we use correct name in other assignments, but
>>> maybe some convention (like styleguide for recipes) would be nice:
>>>
>>> meta-efl/conf/layer.conf:BBFILE_COLLECTIONS += "efl-layer"
>>> meta-gnome/conf/layer.conf:BBFILE_COLLECTIONS += "gnome-layer"
>>> meta-gpe/conf/layer.conf:BBFILE_COLLECTIONS += "gpe-layer"
>>> meta-initramfs/conf/layer.conf:BBFILE_COLLECTIONS += "meta-initramfs"
>>> meta-multimedia/conf/layer.conf:BBFILE_COLLECTIONS += "multimedia-layer"
>>> meta-networking/conf/layer.conf:BBFILE_COLLECTIONS += "networking"
>>> meta-oe/conf/layer.conf:BBFILE_COLLECTIONS += "openembedded-layer"
>>> meta-ruby/conf/layer.conf:BBFILE_COLLECTIONS += "ruby-layer"
>>> meta-systemd/conf/layer.conf:BBFILE_COLLECTIONS += "systemd-layer"
>>> meta-webserver/conf/layer.conf:BBFILE_COLLECTIONS += "webserver"
>>> meta-xfce/conf/layer.conf:BBFILE_COLLECTIONS += "xfce-layer"
>>> toolchain-layer/conf/layer.conf:BBFILE_COLLECTIONS += "toolchain-layer"
>>>
>>> meta-filesystems/conf/layer.conf:BBFILE_COLLECTIONS += "filesystems"
>>> meta-perl/conf/layer.conf:BBFILE_COLLECTIONS += "perl-layer"
>>>
>>> What about using <foo>-layer for meta-<foo> layer.conf?
>>>
>>> Only
>>> meta-initramfs, meta-networking, meta-oe, meta-webserver,
>>> meta-filesystems, toolchain-layer aren't using that convention now
>> Agree, follow the convention is good and I will fix it by hand.
> I've already updated layer.conf for meta-filesystems when merging it for
> test in "bitbake world"
>
> Now they are in jansa/in-test so you don't need to resend them.

Got it, I have updated the branch, and will not resend the pull
request again.

git://git.pokylinux.org/poky-contrib hongxu/meta-filesystems

Thanks,
Hongxu

>> BTW, it's better to modify the script 'yocto-layer' in meta-oe
>> which I used to create the new layer.
>>
>> The layer.conf format defined in
>> 'scripts/lib/bsp/substrate/target/arch/layer/conf/layer.conf'
>>
>> //Hongxu
>>
>>>> *1, already layout in meta-oe, they will be moved to meta-filesystems with
>>>>       the exception of lvm2 and udisks.
>>>>       - lvm2 is depended by udisks/cryptsetup/multipath-tools.
>>>>       - udisks has close relations with systemd.
>>>> meta-oe--------------->|recipes-core---------------->|f2fs-tools
>>>>                          |recipes-extended------------>|owfs
>>>>                          |recipes-connectivity-------->|ifuse
>>>>                                                        |sshfs-fuse
>>>>                                                        |smbnetfs
>>>>                          |recipes-support------------->|ntfs-3g-ntfsprogs
>>>>                                                        |xfsprogs
>>>>                                                        |cramfs
>>>>                                                        |physfs
>>>>                                                        |fuse
>>>>                                                        |lvm2
>>>>                                                        |udisks
>>>>
>>>> *2, already layout in oe-core/meta, they will stay where they are.
>>>> oe-core/meta---------->|recipes-devtools------------>|file
>>>>                                                        |dosfstools
>>>>                                                        |squashfs-tools
>>>>                                                        |devel-config------->nfs-export-root
>>>>                                                        |btrfs-tools
>>>>                                                        |genext2fs
>>>>                                                        |e2fsprogs
>>>>                                                        |util-linux
>>>>                                                        |packagegroups------>packagegroup-base.bb
>>>>                                                        |sysfsutils
>>>>                          |recipes-extended------------>|stat
>>>>                          |recipes-support------------->|attr
>>>>
>>>> *3, TOBE layout in meta-filesystems layer.
>>>> ifuse, sshfs-fuse, owfs, smbnetfs, ntfs-3g-ntfsprogs, fuse-exfat are based on fuse
>>>>
>>>> meta-filesystems------>|recipes-filesystems--------->|ifuse
>>>>                                                        |sshfs-fuse
>>>>                                                        |owfs
>>>>                                                        |ntfs-3g-ntfsprogs
>>>>                                                        |cramfs
>>>>                                                        |smbnetfs
>>>>                                                        |fuse-exfat
>>>>                          |recipes-support------------->|fuse
>>>>                                                        |physfs
>>>>                          |recipes-utils--------------->|f2fs-tools
>>>>                                                        |exfat-utils
>>>>                                                        |xfsprogs
>>>>
>>>> *4, upgrade and newly added
>>>> 1) 4 Packages need to be upgraded
>>>>       owfs, 2.8p20-->2.9p1
>>>>       ntfs-3g-ntfsprogs, 2011.4.12-->2013.1.13
>>>>       xfsprogs, 3.1.8-->3.1.11
>>>>       fuse, 2.9.2-->2.9.3
>>>>
>>>> 2) 2 Packages are newly added to meta-filesystems
>>>>       fuse-exfat: add version 1.0.1
>>>>       exfat-utils: add version 1.0.1
>>>>
>>>> [YOCTO #4178]
>>>>
>>>> //Hongxu
>>>>
>>>> The following changes since commit fa914e4c80bcb29d2526bda3d0d916f71f8f6df4:
>>>>
>>>>     gst-ffmpeg: drop .bbappend, moved to oe-core (2013-08-14 00:20:24 +0200)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     git://git.pokylinux.org/poky-contrib hongxu/meta-filesystems
>>>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/meta-filesystems
>>>>
>>>> Hongxu Jia (13):
>>>>     meta-filesystems creation
>>>>     fuse: move to meta-filesystems and upgrade
>>>>     physfs: move to meta-filesystems
>>>>     ifuse: move to meta-filesystems
>>>>     smbnetfs: move to meta-filesystems
>>>>     sshfs-fuse: move to meta-filesystems
>>>>     owfs: move to meta-filesystems and upgrade
>>>>     cramfs: move to meta-filesystems
>>>>     xfsprogs: move to meta-filesystems and upgrade
>>>>     ntfs-3g-ntfsprogs: move to meta-filesystems and upgrade
>>>>     f2fs-tools: move to meta-filesystems
>>>>     fuse-exfat: add version 1.0.1
>>>>     exfat-utils: add version 1.0.1
>>>>
>>>>    meta-filesystems/COPYING.MIT                       |  17 ++
>>>>    meta-filesystems/README                            | 138 +++++++++++++
>>>>    meta-filesystems/conf/layer.conf                   |  10 +
>>>>    .../recipes-filesystems}/cramfs/cramfs_1.1.bb      |   0
>>>>    .../fuse-exfat/fuse-exfat_1.0.1.bb                 |  26 +++
>>>>    .../recipes-filesystems}/ifuse/ifuse_1.1.2.bb      |   0
>>>>    .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |  15 +-
>>>>    .../recipes-filesystems}/owfs/owfs/owhttpd         |   0
>>>>    .../recipes-filesystems}/owfs/owfs/owserver        |   0
>>>>    .../recipes-filesystems/owfs/owfs_2.9p1.bb         |  11 +-
>>>>    .../recipes-filesystems}/smbnetfs/smbnetfs_git.bb  |   0
>>>>    .../sshfs-fuse/sshfs-fuse_2.4.bb                   |   0
>>>>    .../recipes-support/fuse/files}/aarch64.patch      |  15 +-
>>>>    .../fuse/files}/gold-unversioned-symbol.patch      |  76 +++++--
>>>>    .../recipes-support/fuse/fuse_2.9.3.bb             |  13 +-
>>>>    .../recipes-support/physfs/physfs_2.0.3.bb         |   0
>>>>    .../recipes-utils/exfat-utils/exfat-utils_1.0.1.bb |  29 +++
>>>>    .../recipes-utils}/f2fs-tools/f2fs-tools_1.1.0.bb  |   0
>>>>    .../files}/drop-configure-check-for-aio.patch      |  42 ++--
>>>>    .../xfsprogs/files}/remove-install-as-user.patch   | 225 +++------------------
>>>>    .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |   5 +-
>>>>    21 files changed, 363 insertions(+), 259 deletions(-)
>>>>    create mode 100644 meta-filesystems/COPYING.MIT
>>>>    create mode 100644 meta-filesystems/README
>>>>    create mode 100644 meta-filesystems/conf/layer.conf
>>>>    rename {meta-oe/recipes-support => meta-filesystems/recipes-filesystems}/cramfs/cramfs_1.1.bb (100%)
>>>>    create mode 100644 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
>>>>    rename {meta-oe/recipes-connectivity => meta-filesystems/recipes-filesystems}/ifuse/ifuse_1.1.2.bb (100%)
>>>>    rename meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb => meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb (63%)
>>>>    rename {meta-oe/recipes-extended => meta-filesystems/recipes-filesystems}/owfs/owfs/owhttpd (100%)
>>>>    rename {meta-oe/recipes-extended => meta-filesystems/recipes-filesystems}/owfs/owfs/owserver (100%)
>>>>    rename meta-oe/recipes-extended/owfs/owfs_2.8p20.bb => meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb (85%)
>>>>    rename {meta-oe/recipes-connectivity => meta-filesystems/recipes-filesystems}/smbnetfs/smbnetfs_git.bb (100%)
>>>>    rename {meta-oe/recipes-connectivity => meta-filesystems/recipes-filesystems}/sshfs-fuse/sshfs-fuse_2.4.bb (100%)
>>>>    rename {meta-oe/recipes-support/fuse/fuse-2.9.2 => meta-filesystems/recipes-support/fuse/files}/aarch64.patch (49%)
>>>>    rename {meta-oe/recipes-support/fuse/fuse-2.9.2 => meta-filesystems/recipes-support/fuse/files}/gold-unversioned-symbol.patch (45%)
>>>>    rename meta-oe/recipes-support/fuse/fuse_2.9.2.bb => meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb (67%)
>>>>    rename {meta-oe => meta-filesystems}/recipes-support/physfs/physfs_2.0.3.bb (100%)
>>>>    create mode 100644 meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1.bb
>>>>    rename {meta-oe/recipes-core => meta-filesystems/recipes-utils}/f2fs-tools/f2fs-tools_1.1.0.bb (100%)
>>>>    rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 => meta-filesystems/recipes-utils/xfsprogs/files}/drop-configure-check-for-aio.patch (67%)
>>>>    rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 => meta-filesystems/recipes-utils/xfsprogs/files}/remove-install-as-user.patch (46%)
>>>>    rename meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb => meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb (90%)
>>>>
>>>> -- 
>>>> 1.8.1.2
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


