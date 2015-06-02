Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id A26B8756FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jun 2015 08:15:48 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YzhMO-0004iu-5p for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2015 10:15:44 +0200
Received: from 80-218-32-173.dclient.hispeed.ch ([80.218.32.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2015 10:15:44 +0200
Received: from auslands-kv by 80-218-32-173.dclient.hispeed.ch with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2015 10:15:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Neuer User <auslands-kv@gmx.de>
Date: Tue, 02 Jun 2015 10:15:31 +0200
Message-ID: <mkjon3$vbc$1@ger.gmane.org>
References: <mki3hs$fmp$1@ger.gmane.org> <mkjjnf$fhu$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 80-218-32-173.dclient.hispeed.ch
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
In-Reply-To: <mkjjnf$fhu$1@ger.gmane.org>
Subject: Re: [python3][bug] no package provides python3-gdbm ???
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
X-List-Received-Date: Tue, 02 Jun 2015 08:15:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ok, I have found the bug and fix and backported it to fido.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=63a409ae683236591f19e3c553e11c35aff84128


Am 02.06.2015 um 08:50 schrieb Neuer User:
> It seems there is a bug in fido, It does not provide python3-gdbm. I
> just checked my old daisy install and that does indeed provide python3-gdbm.
> 
> Is there a bug tracker somewhere? Is this an OE issue or a yocto distro
> issue?
> 
> Last not least, how can I solve this?
> 
> Regards
> 
> Michael
> 
> Am 01.06.2015 um 19:08 schrieb Neuer User:
>> Got a new error during do_rootfs on fido:
>>
>> ERROR: Unable to install packages. Command
>> '/home/ubuntu/yocto1.8/build/tmp/sysroots/i686-linux/usr/bin/smart
>> --quiet
>> --data-dir=/home/ubuntu/yocto1.8/build/tmp/work/cubox_i-poky-linux-gnueabi/image-omnisonix/1.0-r0/rootfs/var/lib/smart
>> install -y packagegroup-omnisonix-graphics@all
>> psplash@cortexa9hf_vfp_neon run-postinsts@all
>> packagegroup-omnisonix-core@all packagegroup-core-ssh-openssh@all
>> packagegroup-omnisonix-apps@all packagegroup-omnisonix-audio@all
>> packagegroup-base-extended@cubox_i packagegroup-core-boot@cubox_i
>> locale-base-en-us@cortexa9hf_vfp_neon
>> locale-base-en-gb@cortexa9hf_vfp_neon' returned 1:
>> error: Can't install python3-modules-3.3.3-r1.0@cortexa9hf_vfp_neon: no
>> package provides python3-gdbm
>>
>>
>> ERROR: Function failed: do_rootfs
>>
>>
>> Haven't had that on daisy. Has anything changed? A new dependency of
>> python3 (python3-gdbm)? Or a missing package?
>>
>> Thanks for any ideas.
>>
>> Michael
>>
> 
> 



