Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1PnSRN-00030L-KJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 10:03:53 +0100
Received: by wwi17 with SMTP id 17so1053187wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=6caLFfXeIXJI+b8joqznoh+UJi2qBRyfFDVKm5dnlrw=;
	b=f6JKOWNJLa0JAM3+/b/Kt0X84n+5fGEtGnnsKeJokBr1PkihGpDRECFP2G6V7YMhks
	LFGeOoK0kEmtKq57zo/cEjG5F277gLk79wB8bJf62j8iFc0WM58K7R6j9u/7Dqd5jTJ4
	H3YFc0nCartG8uWY8a6QwMxTBB44fdnngpiNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ofSKuQwkqDHzk2xF0oseRs9EAuMRnHgtrE0008m2fZZudBYwVxdt7qe6OFt2Jb8ZlY
	jk6QS4oX/DU8h9S2j2fN6ak6KLBVmtKlf7rY6EtJ2A7rOo150wGY0cWcwa1AINEdypdK
	IHH+qSXTQxjGa7RBTVWhlMz1gGU1dEmxtjfsY=
MIME-Version: 1.0
Received: by 10.227.137.19 with SMTP id u19mr16589552wbt.51.1297328568913;
	Thu, 10 Feb 2011 01:02:48 -0800 (PST)
Received: by 10.227.141.139 with HTTP; Thu, 10 Feb 2011 01:02:48 -0800 (PST)
In-Reply-To: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
References: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
Date: Thu, 10 Feb 2011 10:02:48 +0100
Message-ID: <AANLkTimK3FuqXj-Ybf4v+X7RxCbHs1XXsS5J=Yvrmo-0@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Problem with makedevs
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
X-List-Received-Date: Thu, 10 Feb 2011 09:03:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 9, 2011 at 10:54 PM, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> Hi,
>
> I think there is a problem with makedevs scripts. When I build
> bootstrap-image for jlime-2010.1.conf, the makedevs binary is a
> symlink to busybox.
>
> During bootup it complains about the way it's called from /etc/init.d/devices:
>
> /sbin/makedevs -r / -D /etc/device_table
>
> The proper way for this binary is:
>
> /sbin/makedevs -d /etc/device_table /
>
> It surprises me that nobody has noticed this before - is my
> configuration somehow unique? Jlime config file isn't overriding much
> here...
>
> What is a proper fix for this?
>
> bye,
> Filip Zyzniewski
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Filip,

reading your post I remember now I had a related issue creating initramfs:

[20100624 00:31:46]	<ant___>  	in the rootfs of myimages there is any
/dev/input/event, even though is listed in device-tables-minimal
[20100624 00:32:21]	<ant___>  	I mean before launching udev
[20100624 00:32:37]	<ant___>  	or in my case in an initramfs
[20100624 00:33:02]	<ant___>  	seems an issue with makedevs

[20100624 00:35:42]	<ant___>  	the command in image.bbclass is:
makedevs -r ${IMAGE_ROOTFS} -D $devtable
[20100624 01:09:38]	<ant___>  	I fear makedevs.c cannot create files in subdirs
[20100624 01:11:04]	<ant___>  	there is more: initscripts have their
device-table :(

FYI see related http://bugs.openembedded.net/show_bug.cgi?id=3593


[20100624 01:16:10]	<ant___>  	too late now to inspect makedevs.c
[20100624 01:16:33]	<ant___>  	perhaps tomorrow

...and then I forgot and moved to other things :/
(For our initramfs-kexecboot image, we solved drastically deleting and
recreating the devices one by one with mknod.)

So, yes, maybe it's a new syntax.
I'll test asap.

Regards
Andrea


