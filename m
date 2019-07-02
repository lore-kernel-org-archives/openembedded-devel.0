Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67B377E726
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:27:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x621RbTu023354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:27:37 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:27:36 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
	<20190628100721.GB18526@localhost>
	<0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
	<20190701125529.GB7483@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <3ae724ee-85b4-af57-0437-d6be2169874f@windriver.com>
Date: Tue, 2 Jul 2019 09:27:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701125529.GB7483@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
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
X-List-Received-Date: Tue, 02 Jul 2019 01:27:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 7/1/19 8:55 PM, Adrian Bunk wrote:
> On Fri, Jun 28, 2019 at 10:57:02PM +0800, Hongxu Jia wrote:
>> On 6/28/19 6:07 PM, Adrian Bunk wrote:
>>> On Thu, Jun 27, 2019 at 09:47:49AM -0400, Hongxu Jia wrote:
>>>> Since commit [061953143 networkmanager: Update to 1.18.0] applied,
>>>> upstream disable libnm-glib by default. And in further networkmanager,
>>>> upstream removes libnm-glib, libnm-glib-vpn, and libnm-util for good
>>>> ...
>>> Any strong reason for removing this already now?
>> Make sure to clean up empty package, in 1.18
>>
>> libnm-glib is already disabled, and left three empty
>>
>> packages(no package generated acturally). I found
>>
>> the issue, trace the reason and provide fix
> What problem does this issue cause?

This is the fix on meta-anaconda, if you do not like to remove

libnm-glib in this version, please do it in next upgrading

...

commit 270a8f01c17941f73539f22e131b9df6f3af81c3
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Jun 27 13:37:54 2019 +0000

     python3-anaconda: do not runtime depends on libnmutil libnmglib 
libnmglib-vpn

     Since commit [061953143 networkmanager: Update to 1.18.0] applied 
in OE,
     upstream networkmanager  disable libnm-glib by default. And in 
further networkmanager,
     upstream networkmanager removes libnm-glib, libnm-glib-vpn, and 
libnm-util for good

https://github.com/NetworkManager/NetworkManager/commit/df58895fb3479c4f00b9107126759d138250fef2
https://github.com/NetworkManager/NetworkManager/commit/5801f89f4d1464fc15cb1d97755b73f9f68cb2e6

     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

diff --git a/recipes-installer/anaconda/python3-anaconda_28.22.11.bb 
b/recipes-installer/anaconda/python3-anaconda_28.22.11.bb
index 32770e3..96aa201 100755
--- a/recipes-installer/anaconda/python3-anaconda_28.22.11.bb
+++ b/recipes-installer/anaconda/python3-anaconda_28.22.11.bb
@@ -42,7 +42,7 @@ RDEPENDS_${PN} = "e2fsprogs e2fsprogs-e2fsck 
e2fsprogs-mke2fs \
                     python3-systemd python3-pydbus python3-simpleline \
                  "

-RDEPENDS_${PN} += "networkmanager libnmutil libnmglib libnmglib-vpn \
+RDEPENDS_${PN} += "networkmanager \
                     network-manager-applet \

...

//Hongxu


>
>> You may note original PACKAGECONFIG[glib] does not have
>>
>> without option, so clean up it rather than add missing without option
>>
>> PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
> That is actually fine and doesn't need a fix - the library is only built
> if explicitely requested --with-libnm-glib.
>
>>> It's gone in 1.20 so removal then is clear, but if someone wants
>>> to use it for legacy code with 1.18 this should stay possible as
>>> long as <= 1.18 is shipped.
>> I think it will be upgraded 1.20 soon, and if someone wants
>>
>> to use legacy code, I think 1.16 in warrior is better choose
>>
>> which libnm-glib is always enabled
> "soon" might be after Yocto 2.8 branches.
>
>> //Hongxu
> cu
> Adrian
>


