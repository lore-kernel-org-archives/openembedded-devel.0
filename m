Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QnEHt-0000MN-4S
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 20:29:25 +0200
Received: by ewy5 with SMTP id 5so2660422ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2011 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=RCbsVzB1vRHH/PdMURfu1JlVbLAEq37YVY5vw6VJLLU=;
	b=eIJDAf0mGbtvBJN9tIkJTO78ohA1Q7kKoRer/9LB/ZPMfffrIbpTfDJYuC08ww6wQS
	XbkKJT3I4QHAGzWgYKtYSAZ3LQNWWSWw1H5Mz/8X3pQy0z7Nqr+lfWe9jgiToIuVy3YF
	2GjnYDVjOIIDHKXckyJmhP+R8PvrovUHwEu2s=
MIME-Version: 1.0
Received: by 10.213.102.9 with SMTP id e9mr309510ebo.91.1312050304786; Sat, 30
	Jul 2011 11:25:04 -0700 (PDT)
Received: by 10.213.113.196 with HTTP; Sat, 30 Jul 2011 11:25:04 -0700 (PDT)
In-Reply-To: <BAF0F415-E659-485C-855F-271AD4ABE73B@beagleboard.org>
References: <1311980287-31536-1-git-send-email-agnel.joel@gmail.com>
	<BAF0F415-E659-485C-855F-271AD4ABE73B@beagleboard.org>
Date: Sat, 30 Jul 2011 13:25:04 -0500
Message-ID: <CAD=GYpbN-8O1yWnbPGE_XLThnBSAoKosw2998Hq1MqWMjbMQAg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Koen Kooi <koen@beagleboard.org>
Cc: Joel A Fernandes <joelagnel@ti.com>, beagleboard@googlegroups.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Jason Kridner <jdk@ti.com>
Subject: Re: [beagleboard] [PATCH] gst-plugins-good: v4l2src: Make Leapoard Imaging VGA Camera work out of the box
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
X-List-Received-Date: Sat, 30 Jul 2011 18:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 30, 2011 at 2:31 AM, Koen Kooi <koen@beagleboard.org> wrote:
>
> Op 30 jul. 2011, om 00:58 heeft Joel A Fernandes het volgende geschreven:
>
>> Format enumeration in Gstreamer expects drivers to implement VIDIOC_ENUM=
_FMT and if not, it calls
>> VIDIOC_TRY_FMT on a set of "emulated formats" which could be unsupported=
 resulting in failure of
>> the format negotiation stage [1]
>>
>> We add UYVY to the set of formats making the mt9v113 sensor in this came=
ra board and other sensors
>> that don't support the emulated formats work out-of-the box without need=
ing a caps filter element
>>
>> [1] http://lists.freedesktop.org/archives/gstreamer-devel/2011-July/0324=
25.html
>>
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>> ---
>> ...-UYVY-color-format-to-the-list-of-enumera.patch | =A0 43 ++++++++++++=
++++++++
>> recipes/gstreamer/gst-plugins-good_0.10.28.bb =A0 =A0 =A0| =A0 =A04 +-
>> 2 files changed, 46 insertions(+), 1 deletions(-)
>> create mode 100644 recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-U=
YVY-color-format-to-the-list-of-enumera.patch
>>
>> diff --git a/recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-UYVY-co=
lor-format-to-the-list-of-enumera.patch b/recipes/gstreamer/gst-plugins-goo=
d/0001-v4l2src-Add-UYVY-color-format-to-the-list-of-enumera.patch
>> new file mode 100644
>> index 0000000..88a0125
>> --- /dev/null
>> +++ b/recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-UYVY-color-for=
mat-to-the-list-of-enumera.patch
>> @@ -0,0 +1,43 @@
>> +From d5a1f365bfd4420912735709bcb8004d3ad7226c Mon Sep 17 00:00:00 2001
>> +From: Joel A Fernandes <agnel.joel@gmail.com>
>> +Date: Fri, 29 Jul 2011 17:23:43 -0500
>> +Subject: [PATCH] v4l2src: Add UYVY color format to the list of enumerat=
ions
>> +
>> +OMAP3 ISP returns -EINVAL for VIDIOC_ENUM_FMT ioctl on video node. Due =
to this, format negotiation fails. This adds UYVY format to the list of enu=
merations.
>
> I must be missing something, but what has negotation failure to do with a=
dding a new format? I would expect adding new formats not to have any effec=
t if negotiation fails.

The way it works is:

Enumerate formats -> Negotiate formats between source and sink pads
and set the format

Enumerate formats doesn't return UYVY (The driver is supposed to
return this but ENUM_FMT ioctl is not implemented in ISP like I was
saying). Due to this, the negotiate function is either unable to find
a matching format on the sink pad (if you used a UYVY caps filter
element) or fails to set the format if you used a more general
element.

>
> Anyway, could you add a 'upstream-status' tag to the patch as described i=
n http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Pa=
tch_Header_Recommendations ?

This patch is more like a harmless hack which works around a
limitation of the driver. It is unlikely that it will be accepted by
upstream or if it should even be submitted as an RFC. Considering
this, would it be ok if I prepended "HACK!" to the title? I noticed
this in your 1GHz patches

Thanks,
Joel


