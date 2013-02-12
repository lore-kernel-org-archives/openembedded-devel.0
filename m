Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5N4s-0003jt-6A
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 22:08:08 +0100
Received: by mail-vc0-f178.google.com with SMTP id m8so323524vcd.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2013 12:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=4IF06jpmst79MxgdIqn2bCqa3EH+s+DgD/MUh4bX5dQ=;
	b=MjcMsiRy543fRrhzfcA/FmMMdiTWkpVS9SR5yujmGiOsOqYDpc76yOvoAsymIUZk7L
	7dVnn6r5Ca4FsszFjHjLM6nOkmJ7xSYpfCJxqeLRPsNon06CI5fGZ6agDahvy0YDkkGx
	81Xzssn6edIfRtCDgip8nzTI0M2B4qXuAsef5QPC/kWFrvXEl3ljG/yuZCEunBBIl+PQ
	bQKhR70LDtHzZZ4/C404h3OADZgJ3PmHSr9aiAV9tojCxwvDa2jjkbLBeAMsHaJ02DmF
	UP2iCasQf/vttu6w2vy5MpNsQJ1iPfrw63GRUzh4YY3BuKsxyOEkqiKlWMfyODM/VAIq
	2pvQ==
X-Received: by 10.52.23.18 with SMTP id i18mr22199783vdf.46.1360702305897;
	Tue, 12 Feb 2013 12:51:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 12:51:25 -0800 (PST)
In-Reply-To: <CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 20:51:25 +0000
Message-ID: <CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQn7l7Tn8Hy+EGLe7NERFuB1xWd8jKDN50MGGoqBiwi/tHevj5e353vgbUyHIPCOn2s+HFpL
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 21:08:12 -0000
Content-Type: text/plain; charset=UTF-8

On 12 February 2013 16:43, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Qt Embedded as we build it is currently configured to use tslib, as is
>> SDL. If the alternative (evdev?) is supported they could presumably be
>> switched over though. I don't know how practical that is however.
>
> Yes Qt Embedded uses it; not sure evdev is an alternative here.

I'd be surprised if QtE doesn't support evdev, but I've been surprised
a lot recently.  Can you investigate quickly to see if QtE supports
evdev?

As far as X and oe-core is concerned, tslib isn't involve at all
anymore.  There are xorg-input-tslib drivers in Debian but they've not
been touched for years, the upstream source URL doesn't exist any
more, and I'd actually be somewhat surprised if they worked.  Xorg is
all about evdev + xinput for touchscreens.

Ross


