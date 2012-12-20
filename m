Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TlpCM-0001j3-Bs
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 00:06:42 +0100
Received: by mail-vc0-f172.google.com with SMTP id fw7so4532430vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 14:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=O6BWLuIrHrd55aEjb9lIdEupT1f4eVSkPg8U5WA7p0o=;
	b=SxdORkVI1/YaFqv1p0yJ2VRTTVKaxBuDs7N+VXI2oEQ5lY/ePxQH04YLq/UMo7e48j
	hmjty+ibnXD2dzIxOkJrF4wRckyv8iQNsuwDlp1aODiS9ofOd8IS57V7kVOQOLhinZn0
	lQjm0wySyuQYUQ6dcmayAO7dSR8O73AOXfRoNKd+TPFIDywHfZ4GZSElzB58Nxe7zn3T
	XQTQUHQRNxkbYZHc1YvmZKw8ZAyc9tlGhMHyiwLUm1cdObQotoT/bievRAjvxriq0kTv
	+mOJWXLThx6Dk+TXPtOM6/sVoiL471ITAT6xy9CgR7tXuaaC6d5pNAOwfMm8tZY0qZ9n
	FZ6A==
MIME-Version: 1.0
Received: by 10.58.64.51 with SMTP id l19mr17660700ves.15.1356043916929; Thu,
	20 Dec 2012 14:51:56 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 20 Dec 2012 14:51:56 -0800 (PST)
In-Reply-To: <CALbNGRR6PUw1ExKaL4RiwOj66mo2nfsdXj4fUxRiqYgiudXAzg@mail.gmail.com>
References: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
	<20121218153311.GB3331@jama.palm1.palmone.com>
	<CALbNGRSpX154UsyMo1G29G1nJ2qwvfyavO20qto5eT22YPEYnA@mail.gmail.com>
	<20121220130323.GH14543@jama.palm1.palmone.com>
	<CALbNGRR6PUw1ExKaL4RiwOj66mo2nfsdXj4fUxRiqYgiudXAzg@mail.gmail.com>
Date: Thu, 20 Dec 2012 23:51:56 +0100
Message-ID: <CALbNGRSe-rkqT_dQmHg6hM2U-6j=LgHTOXSvPqCpaA3P8HHwOA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Thu, 20 Dec 2012 23:06:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 9:21 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Dec 20, 2012 at 2:03 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Thu, Dec 20, 2012 at 01:00:47PM +0100, Andreas M=C3=BCller wrote:
>>> > Btw meta-guacamayo is using newer gvfs-1.12.3 and maybe they also
>>> > resolved
>>> > http://patchwork.openembedded.org/patch/16755/
>>> This one was fixed in 211c2ba382d921519761bc0d241942f927cf692e
>>
>> OK, thanks, I've updated status on patchwork.
>>
>>> > Can you check if such upgrade would be usefull for meta-gnome too?
>>> > I'm not using gnome..
>>> Will do that hopefully before Xmas..
>>
> FYI: I updated to latest stable (1.14.2) and had some tests.
> Unfortunately this causes xfce/thunar automount fail. So this is not
> as easy as expected.
>
> Will try 1.12.3...
>
> Andreas
OK I checked: All stable gvfs versions > 1.8.2 require
gnome-disk-utility > 3.x which requires gtk3. I would prefer to stay
on gvfs 1.8.2.

Andreas


