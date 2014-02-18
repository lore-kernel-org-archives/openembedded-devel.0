Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 957FD6D14A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 02:04:26 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id le5so12531322vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 18:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9FkJMBv5XEZ/HC9dy7tz6KL0DNFhtXeceoMlCEiRgvI=;
	b=pitCxwe2MvmoqQv0ljoMx0UX1QbQrRjK0GHebLpiYiTXYGGt8oyQ3zYbmPOcKdTK+a
	Qlk7ekyz85JGG9JZzyTbhuPIgd/+A6VKdiLy7lu0/z5AsQ1qgE5M4eOPV1MMJoZV1wUV
	I4tPlR+ZAy931AC9GnWhuUWerusdat2wgTe+apSjTgjcDOXkEzRgJoIKRoX7XSL19cde
	sHQ9puZOhisxONxNVdZFOWgYN1oFIxIs3bdb/1JDj58hCtxmDw+qaTo7MHWpWVC3BoQi
	uRlZKDYzvYxuqOE0njtIHemH0WaBfEi6a/wm5+VYB9aGEWtAz4CR0p8sod39+KB4E+kE
	ytcQ==
MIME-Version: 1.0
X-Received: by 10.52.37.103 with SMTP id x7mr2686vdj.75.1392689066983; Mon, 17
	Feb 2014 18:04:26 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Mon, 17 Feb 2014 18:04:26 -0800 (PST)
In-Reply-To: <CAFeBWL67tUiY5BZ6Fp6dz5H00Y=smW+fvdS6dzz3A0scqaysuQ@mail.gmail.com>
References: <CAFeBWL67tUiY5BZ6Fp6dz5H00Y=smW+fvdS6dzz3A0scqaysuQ@mail.gmail.com>
Date: Mon, 17 Feb 2014 18:04:26 -0800
Message-ID: <CAFeBWL5CeF69bJ+rzt0srJ02U6rjwDRzofnRzSkA_S6ktQgHGw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: pam_gnome_keyring.so not getting packaged into my rootfs
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
X-List-Received-Date: Tue, 18 Feb 2014 02:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just learned ConsoleKit is no longer maintained and is replaced by
Systemd's Logind (http://www.freedesktop.org/wiki/Software/ConsoleKit/).
Judging by the fact that GDM still relies on ck (ck-get-x11-display-device
handle), I am inclined to say OE's gdm recipe is not up to date.
However I am not too familiar with the scene and I may have missed details.

Any clarification on this?

Adam


On Mon, Feb 17, 2014 at 3:00 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Hello everyone, my gdm logs in /var/log/gdm is complaining about these
> missing files:
>
> - polkit-gnome-authentication-agent-1
> - ck-get-x11-display-device
> - pam_gnome_keyring.so
>
> The first two files are found in paths GDM wasn't aware of, so all I had
> to do was create symbolic links to
> /usr/lib/gdm/{polkit-gnome-authentication-agent-1,
> ck-get-x11-display-device}.
>
> The last file, pam_gnome_keyring.so, is not in my rootfs. The file gets
> generated and it's in my build directory however. I can create a bbappend
> to install this shared object into the rootfs, but I wanted to ask in the
> list to see if I missed something obvious.
>
> Thank you for your help!
>
> Adam
>
>
>

