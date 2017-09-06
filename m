Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2908F6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 23:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86NeE5h005916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 6 Sep 2017 16:40:14 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 16:40:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
	<CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
	<9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
	<CALbNGRRQAKUNR-X1U=vdc4dEzpobc5k+b_F8cS=u2VOi04s7MA@mail.gmail.com>
	<65cc49bb-5a7e-c3f6-1e08-09a6bcb8ccab@windriver.com>
	<CALbNGRS260modGqY+bkNV+R5XiONyVcdSQpE-eYLoR47VxqsRg@mail.gmail.com>
	<c1bf1c61-de6e-6f5c-9130-7808c77666e5@windriver.com>
	<CALbNGRQgzpBr5WywUZN9e1aFc0+Kj8RThJp-qNL89s4WN3=gEQ@mail.gmail.com>
	<9d02cc47-76d7-50d8-d083-016b8b5e2896@windriver.com>
Organization: Wind River Systems
Message-ID: <ad48f790-de27-1dad-db61-f9fed786e110@windriver.com>
Date: Wed, 6 Sep 2017 18:40:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <9d02cc47-76d7-50d8-d083-016b8b5e2896@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 23:40:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/6/17 4:00 PM, Mark Hatle wrote:
> On 9/6/17 3:53 PM, Andreas Müller wrote:
>>>> I am sure that I miss the point again but fedora - for me
>>>> reference/inspiration many times - has no problem with xfce4-mixer
>>>> [1].
>>>>
>>>> [1] http://pkgs.fedoraproject.org/cgit/rpms/xfce4-mixer.git/tree/xfce4-mixer.spec
>>>
>>> arch - https://bbs.archlinux.org/viewtopic.php?id=222294
>>> debian - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=785846
>>> mageia - https://forums.mageia.org/en/viewtopic.php?f=15&t=10018
>>> Fedora - https://bugzilla.redhat.com/show_bug.cgi?id=1355763
>> ^ Yes you should look into this - that is exactly the problem I have.
>>>
>>> etc...  This is what I based the original commit message on.
>>>
>>> Just an FYI, the first part of my test WITHOUT the xfce4-mixer and
>>> gstreamer-0.10 removal just passed.
>> Passed what exactly?
> 
> ../scripts/yocto-compat-layer.py meta-openembedded
> 
> bitbake -S none world
> bitbake -S none universe
> bitbake xfce4-mixer florence  (with opengl and x11 distro features enabled, and
> commercial license flag set)
> 
> bitbake world (bringing in additional recipes that may collide or otherwise
> impact with the two versions of gstreamer) is what I have in progress.

The received the following failures:
  meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile

meta-openembedded/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb:do_compile

virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.31.bb:do_compile
  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb:do_compile
  meta-openembedded/meta-oe/recipes-extended/leveldb/leveldb_git.bb:do_compile
  meta-openembedded/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb:do_compile

None of these are related to any of the changes in this system or gstreamer.

> The next step will be to verify packagegroups/images can at least construct
> something without generating a file conflict error.

bitbake packagegroup-tools-bluetooth packagegroup-basic packagegroup-boot
packagegroup-sdk-target packagegroup-fonts-truetype packagegroup-xfce-multimedia
packagegroup-xfce-base packagegroup-xfce-extended

Passed.

bitbake core-image-minimal-xfce core-image-minimal core-image-base core-image-sato

Passed.

So whatever caused the fault with gstreamer when I was building before has gone
away.  I'm unable to reproduce it.  So patches 29 and 31 can be dropped from the
set.

> --Mark
> 
>>> I will let it continue and will report on
>>> the status once the full test is complete.  (full test as in bitbake world)
>>>
>>> --Mark
>>>
>> Andreas
>>
> 


