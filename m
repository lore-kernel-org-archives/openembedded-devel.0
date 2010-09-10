Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OuAYE-0004Mo-Jj
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:50:28 +0200
Received: (qmail 2115 invoked by uid 1003); 10 Sep 2010 16:50:44 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Sep 2010 16:50:44 -0000
Message-ID: <4C8A99E4.2080402@balister.org>
Date: Fri, 10 Sep 2010 16:49:40 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284065307-5766-1-git-send-email-eric@eukrea.com>
	<4C8A97C9.2080004@mentor.com>
In-Reply-To: <4C8A97C9.2080004@mentor.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] util-linux-ng: fix readprofile update-alternatives vs	busybox
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
X-List-Received-Date: Fri, 10 Sep 2010 20:50:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/2010 04:40 PM, Tom Rini wrote:
> Eric Bénard wrote:
>> * util-linux-ng installs readprofile in /sbin, busybox installs
>> it in /usr/sbin which tiggers the following log when configuring
>> the package :
>> Configuring util-linux-ng-readprofile.
>> update-alternatives: Error: cannot register alternative readprofile to
>> /sbin/readprofile since it is already registered to /usr/sbin/readprofile
>> Collected errors:
>> * pkg_run_script: postinst script returned status 1.
>> * opkg_configure: util-linux-ng-readprofile.postinst returned 1.
>>
>> * the fix is to have util-linux-ng install readprofile in /usr/sbin
>>
>> * this patch fix http://bugs.openembedded.org/show_bug.cgi?id=5474 as
>> suggested by Tom Rini
>>
>> Signed-off-by: Eric Bénard <eric@eukrea.com>
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Tested-by: Philip Balister <philip@balister.org>

>
>> ---
>> recipes/util-linux-ng/util-linux-ng.inc | 15 +++++++++++----
>> 1 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes/util-linux-ng/util-linux-ng.inc
>> b/recipes/util-linux-ng/util-linux-ng.inc
>> index cbdf68d..ca0790e 100644
>> --- a/recipes/util-linux-ng/util-linux-ng.inc
>> +++ b/recipes/util-linux-ng/util-linux-ng.inc
>> @@ -8,7 +8,7 @@ inherit autotools gettext
>>
>> DEFAULT_PREFERENCE = "-1"
>>
>> -INC_PR = "r27"
>> +INC_PR = "r28"
>>
>> # allows for a release candidate
>> RC ?= ""
>> @@ -51,7 +51,7 @@ FILES_util-linux-ng-losetup =
>> "${base_sbindir}/losetup.${PN}"
>> FILES_util-linux-ng-mount = "${base_bindir}/mount.${PN}
>> ${sysconfdir}/default/mountall"
>> FILES_util-linux-ng-umount = "${base_bindir}/umount.${PN}"
>> # Moved to ${base_sbindir} by do_install:
>> -FILES_util-linux-ng-readprofile = "${base_sbindir}/readprofile.${PN}"
>> +FILES_util-linux-ng-readprofile = "${sbindir}/readprofile.${PN}"
>> FILES_util-linux-ng-fsck = "${base_sbindir}/fsck.${PN}"
>> FILES_util-linux-ng-blkid = "${base_sbindir}/blkid.${PN}"
>> FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
>> @@ -124,8 +124,9 @@ do_install () {
>> mkdir -p ${D}${base_bindir}
>>
>> sbinprogs="agetty blockdev ctrlaltdel cfdisk"
>> - sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix
>> fsck.minix losetup swapon fdisk readprofile fsck blkid vigr vipw"
>> + sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix
>> fsck.minix losetup swapon fdisk fsck blkid vigr vipw"
>> usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall
>> setsid chrt"
>> + usrsbinprogs_a="readprofile"
>> binprogs_a="dmesg kill more umount mount login reset"
>>
>> if [ "${base_sbindir}" != "${sbindir}" ]; then
>> @@ -152,6 +153,12 @@ do_install () {
>> fi
>> done
>>
>> + for p in $usrsbinprogs_a; do
>> + if [ -f "${D}${sbindir}/$p" ]; then
>> + mv "${D}${sbindir}/$p" "${D}${sbindir}/$p.${PN}"
>> + fi
>> + done
>> +
>> for p in $binprogs_a; do
>> if [ -f "${D}${base_bindir}/$p" ]; then
>> mv "${D}${base_bindir}/$p" "${D}${base_bindir}/$p.${PN}"
>> @@ -271,7 +278,7 @@ pkg_prerm_util-linux-ng-swaponoff () {
>> }
>>
>> pkg_postinst_util-linux-ng-readprofile() {
>> - update-alternatives --install ${base_sbindir}/readprofile
>> readprofile readprofile.${PN} 100
>> + update-alternatives --install ${sbindir}/readprofile readprofile
>> readprofile.${PN} 100
>> }
>>
>> pkg_prerm_util-linux-ng-readprofile () {
>
>


