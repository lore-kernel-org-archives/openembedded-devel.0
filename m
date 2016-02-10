Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 309C2731E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:20:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g62so4171006wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 05:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=G3/n75U9aMujGQ0j1Ys+PsIZWXzUqSkjU6qMTh4/ing=;
	b=ojUjqVqrb+0n2wV7AitG0z/lqbjlMZQs0Hi7FMKXopvUl4Xo62uaaJpKhNm7uD/jRg
	9fxF6V42Br2i42QOGSMBNhZHOjESLnPav0ZsYHcmwa6awutg88MFurA0YfoN3jwFyZU9
	rwUi63MmpB3WLhJeqMtcZfyprXJJfPnvwWgvihE3duetRAq/TadhwqEqORVN8PJTdSrd
	vCk/NJnylthO7V/ZhekP0t5J8FgNZQ+13lIakJoQUS7IGY6GfekzblrsMybrc0acI3xN
	MIcEYiaJlK0Nm1mcsPYxGro7pyEbq+RMfhoVfQKRXzJ0ZI5VRuz0c1Z/mumZT3rGUr1o
	MbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=G3/n75U9aMujGQ0j1Ys+PsIZWXzUqSkjU6qMTh4/ing=;
	b=MgEXIlEiyBSas3aZs5AxA1WMfsQDL0F/RU66AP/hWom9EAhPSh6VrZe3dylRnWDqoq
	4HW1G/Bn5kLCiUdVuWbrB5n3PzMmNoyvHFJ02SacAJfOx3GE9ri9bCYnC0QJC+lYyuUi
	ij00Ny5u54q9eakbaz9vapO+6fzXtK0ZPASgHPfGeXSscUZY0hV50ihC9cs50N41wJjY
	Gtj5xbPXO+fDGxkzTlxR8FwkX4qHAclix3kQ/t0uf8iXx/xP2XRLjnONVFLMkcv+nSGb
	Y1yqBVo+Je7zpyQ9wOdoQeFw+94AgJmamlfulu4VHv05BS4v8CoRbeRk4ZOTmdjih1Zj
	ddzg==
X-Gm-Message-State: AG10YOTeDVyB52MN56D4Y+qtwL8H6ajnCwFCvKXj1YjkczkPPrSTD4DOpO/jqaKSoN+nlA==
X-Received: by 10.194.9.42 with SMTP id w10mr39130381wja.159.1455110445925;
	Wed, 10 Feb 2016 05:20:45 -0800 (PST)
Received: from [192.168.0.13] ([81.56.255.191])
	by smtp.googlemail.com with ESMTPSA id
	g3sm2953388wjw.31.2016.02.10.05.20.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Feb 2016 05:20:44 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1455108862-2507-1-git-send-email-funman@videolan.org>
	<1455108862-2507-2-git-send-email-funman@videolan.org>
	<20160210131946.GB2609@jama>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <56BB392B.7000203@videolan.org>
Date: Wed, 10 Feb 2016 14:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160210131946.GB2609@jama>
Subject: Re: [meta-multimedia][PATCH 2/2] vlc: make sdl optional (enabled by default)
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
X-List-Received-Date: Wed, 10 Feb 2016 13:20:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 10/02/2016 14:19, Martin Jansa wrote:
> On Wed, Feb 10, 2016 at 01:54:22PM +0100, Rafaël Carré wrote:
>> ---
> 
> Did you forget to add sdl to default PACKAGECONFIG?

Oops yes,

sdl also depends on x11 and I am not sure how to add that dependency:
Something like

	{@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}

?

>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> index 2887a68..c85a811 100644
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> @@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  
>>  DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
>> -   virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>> +   dbus dbus-glib libxml2 gnutls \
>>     tremor faad2 ffmpeg flac fluidsynth alsa-lib \
>>     lua-native lua libidn \
>>     avahi jpeg xz libmodplug mpeg2dec \
>> @@ -25,7 +25,6 @@ EXTRA_OECONF = "\
>>      --disable-screen --disable-caca \
>>      --enable-httpd --enable-vlm \
>>      --enable-freetype \
>> -    --enable-sdl \ 
>>      --enable-png \
>>      --enable-tremor \
>>      --enable-v4l2 --disable-aa --disable-faad \
>> @@ -41,6 +40,7 @@ EXTRA_OECONF = "\
>>  
>>  PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>> +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
>>  PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
>>  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>>  PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
>> -- 
>> 2.5.0

