Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 76FE377035
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 10:41:02 +0000 (UTC)
Received: by iofz202 with SMTP id z202so86598317iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 03:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0HlXkHMq4ueiqRJ10ZIYOhHW3OqwfMyk4EPF8++N8fk=;
	b=ClqeG/RNYpio+bhz8TmkMwfMf0qsKpNyATk1aZLmamyDEqxG5eNG3No1LTMzJDpYTp
	MjLSxEIwsoQN3sPDLRRDrnV5KFmgAS+jXJW8RWHhwwH0dodnCLWIjO+DxFP3o/my0XQl
	mJgY9fRw0z62LYB2K0ROlBecaa58X+WXxOD8proPeMa1gz+vu2OdNFcO2VxWpcls8ArV
	KyBmTPyPVmUE2BrWa0Aya8bPi3XfeynzRvDuYK3ILOMsr0u6GksqfDYqDm8fMPHWg0d4
	inDH8aAuhgaSEj6SNBOYltiUG9F7Ugk7MTyECDuDsD1Mjm+Ipz0V1EzKgH5djB4jPXlF
	rJjw==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr11707159iod.148.1445510462478; 
	Thu, 22 Oct 2015 03:41:02 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Thu, 22 Oct 2015 03:41:02 -0700 (PDT)
In-Reply-To: <CA+chaQf5_A_4gm34f7sdU=ES_5k4fF_-=aRYBo7BiKLbOaR=nQ@mail.gmail.com>
References: <1445491305-39447-1-git-send-email-wenzong.fan@windriver.com>
	<CA+chaQf5_A_4gm34f7sdU=ES_5k4fF_-=aRYBo7BiKLbOaR=nQ@mail.gmail.com>
Date: Thu, 22 Oct 2015 12:41:02 +0200
Message-ID: <CALbNGRSR81R9NGHjBQLb47XyR1v-_9VKwhYEdV8NHu3qocDagQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-multimedia] gst-plugins-good: fix depends to libgudev
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
X-List-Received-Date: Thu, 22 Oct 2015 10:41:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 22, 2015 at 11:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This shouldn't be needed when:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111271.html
>
> is merged.
>
> On Thu, Oct 22, 2015 at 7:21 AM, <wenzong.fan@windriver.com> wrote:
>
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> * udev provides libgudev but it won't be built with systemd;
>> * systemd provides udev but no libgudev, libgudev has been removed
>>   from systemd and it's a independent project now; libgudev only be
>>   built if systemd distro feature enabled.
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb    | 5
>> ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>> gst-plugins-good_0.10.31.bb
>> b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>> gst-plugins-good_0.10.31.bb
>> index af18281..3f3478f 100644
>> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>> gst-plugins-good_0.10.31.bb
>> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
>> gst-plugins-good_0.10.31.bb
>> @@ -11,12 +11,15 @@ PACKAGECONFIG ?= "jpeg v4l \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio',
>> '', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>>  "
>> +
>> +GUDEV="${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'libgudev',
>> 'udev', d)}"
>> +
>>  PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>>  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>>  PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
>>  PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
>>  PACKAGECONFIG[gdkpixbuf] =
>> "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>> -PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2
>> --without-gudev,udev"
There should be a patch replacing udev by libgudev in the
dependencies. No need for DISTRO_FEATURE magic here - this is done in
udev/libgudev.

Andreas

