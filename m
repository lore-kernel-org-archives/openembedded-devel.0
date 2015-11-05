Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 053BB75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 10:59:18 +0000 (UTC)
Received: by wikq8 with SMTP id q8so7946720wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=YGAOYVqNpES5xnP8BtcafeEMxGPAYNc7HinT1YeYiW4=;
	b=igl6zHeaY8Fqk5HjhJeNgcnpcIiaOMuVh5t79fF1yF79qus2un6LnVu9mAoQJa5Zp6
	feoUKOe5Sb74diWs8Kgvno1k6csn686ozHD/VHeaDOdHdqLi7RSRzXqEg2Xw4N7z1VYp
	Fw8iKyKhWxVtulGBmJysYAAz9fK6U5f2zt1TztHP7f6kw4HWB9jV2VWS5BFKgeagpmOu
	EZ/P86I6Xe6iqf34PgOph2wfar4c6FEppEjrAj9VmHaDECdmfVn9LlOiIpCzcKo27Bfi
	hDkOYPnV1NoUI/v6q9EcGnfluRagObQEhLKZGvIFkEuh/3XalhHre/FqCn0+4+Rh8WBt
	1g2A==
X-Received: by 10.194.190.19 with SMTP id gm19mr8605340wjc.0.1446721158272;
	Thu, 05 Nov 2015 02:59:18 -0800 (PST)
Received: from [192.168.0.13] ([81.56.255.191])
	by smtp.googlemail.com with ESMTPSA id
	q1sm6350375wjy.31.2015.11.05.02.59.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 02:59:17 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-3-git-send-email-funman@videolan.org>
	<20151104222547.GA2556@jama>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <563B3682.6000407@videolan.org>
Date: Thu, 5 Nov 2015 11:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151104222547.GA2556@jama>
Subject: Re: [meta-multimedia][PATCH 3/3] VLC: drop gnome-vfs, it will be removed from upstream in VLC 3.0
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
X-List-Received-Date: Thu, 05 Nov 2015 10:59:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello,

On 04/11/2015 23:25, Martin Jansa wrote:
> On Wed, Nov 04, 2015 at 05:03:19PM +0100, Rafaël Carré wrote:
>> ---
> 
> Is it still used in 2.2.1 version? we aren't using 3.0 yet:

Yes, that module is still present in 2.2 (2.2.1 and future 2.2.X versions).

I'm testing the waters here, as I couldn't build gnome-vfs, and since
that module
is being removed from upstream (again, in future 3.0 version but not
2.2.X), I
didn't bother to add a PACKAGECONFIG knob for it.

With this patch the gnome-vfs module will still if gnome-vfs is present,
although it will not load at runtime if gnome-vfs is not installed (without
preventing the rest of VLC to work properly).

It would be in the same position than the libarchive, dvdnav, samba,
ssh2 modules, etc
which coincidentally implement the capabilities that the deprecated (in
gnome) gnome-vfs
provides :)

So this simple patch fixes my build failure and at the same time reduces
future work for when
VLC 3.0 will be released.


What do you think?


Thanks for the feedback

>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> index ad5c81d..dddbb5b 100644
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
>>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
>> -   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
>> +   libdvdcss libdvdread lua-native lua libidn \
>>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
>>     tiff xcb-util-keysyms samba"


