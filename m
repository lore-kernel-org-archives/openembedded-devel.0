Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaOQv-00036O-Hu
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 11:18:29 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 02:04:12 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so22200344iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=elYnGjpmIhbtqBfpvvq267cPASn9qLcITN3z0ju/4tQ=;
	b=Upr+8K6GNsTqzBKS8Z513j1FBQy2KeFCHJVjmvlbihst91nsGuRMfuAN08Ozr3UPOv
	fydb/of1ENfPreT2IPlNRZ2pF1xAF2ukwVmZXS+L9Ar1W5SQkGsMHeqxy0MB2HpNTJiW
	iSu4DJY7uthL5OVg+Wbpasl1xotVO/8TEQf8AjyEeH/LHSa3kWOeOYUIEQwDQBKvg4+J
	UN88f5j7O3foMXxZ9ZSjsjOAStJ6DmXgBbqzC6rwefyV886jgEU/GjlTSK//ZsTJ3OAM
	DautQcRZvI3srueW/zv8Uc44Ui12K3jM0bnqcRK6U+GmVkLkIvCKJrna0+jfbqoB96fh
	BJbw==
Received: by 10.60.169.243 with SMTP id ah19mr9985157oec.127.1353319450984;
	Mon, 19 Nov 2012 02:04:10 -0800 (PST)
Received: by 10.60.169.243 with SMTP id ah19mr9985151oec.127.1353319450787;
	Mon, 19 Nov 2012 02:04:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.34.138 with HTTP; Mon, 19 Nov 2012 02:03:50 -0800 (PST)
In-Reply-To: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
References: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Nov 2012 10:03:50 +0000
Message-ID: <CAJTo0LaDC2cx+CfgOgdFan7njJ4mZgJ1VBuo_1KUcgkuQnN+Dw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm6dSxDi+zCsPTw6PXWlJZQdK2KElP9JcKrPh0EO1HCfiwd4W4ESwBrzC250z1z5VK28VAHHhSdgTknT7dtoqPcI9GHILgAbyd2TIfEuiNoDXNEJTt48Mrsw9q/B1meZuMbA5wPfZMfiBIwJOT+ZMNrrlpZiC0DSYtZe06kAsHsHZV62mNctkHQphFqlBmqMpPvVVe1
Subject: Re: window managers?
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
X-List-Received-Date: Mon, 19 Nov 2012 10:18:30 -0000
Content-Type: text/plain; charset=UTF-8

On 17 November 2012 21:57, Cliff Brake <cliff.brake@gmail.com> wrote:
> I did some looking into window managers in recent oe/meta-oe/angstrom,
> and this is what I found:
>
> matchbox
> - is this still maintained?  Does not seem like a lot of new development.
>
> Questions:
> 1) any opinions on WM for embedded Linux systems?  For most projects,
> we simply run a single full screen app, but a WM would be nice in some
> cases.

For a single fullscreen application, Matchbox is practically
"finished".  Nokia deployed it on several devices (770, N800, N810)
and their QA were ruthless.

At some point I should sweep around the OE derivates, old Maemo and
collect any outstanding patches, but if it's sufficiently featureful
then it does work very well.

Personally if I want a "proper" window manager that's also flexible,
I'd use Mutter.  Fast compositing and and plugin architecture so you
can implement any behaviour with it (GNOME Shell and MeeGo
Netbook/Dawati were both based on Mutter).

Ross


