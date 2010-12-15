Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PT0k3-0002Gb-9K
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 00:26:40 +0100
Received: by fxm11 with SMTP id 11so2492848fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 15:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=w4VXvcnzrtuT8/VK7ZlTTJxJ1yWtR4XnGYHprLGoYuM=;
	b=w8V900UlvbEBe8qFgmDmEQJeyQ/fkYdjQ4KL4VfLCpIy83Vlo6oC6wkFPOQrAjKL3c
	PmDYJHSMh+98ur06tvz/3T+6iijEZIG/UTVlTTxHO9HsxzFP6w88lLEZeVrc5zFHoWDP
	Nc/yy6P+ClQZQwZG00XUGMqOSoRWf/5kLXqvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=CiyfddDUGBIReosOsOoLwNqFHGUO08BUGoGrTClpkMQNSkhMlBA1dKr7dTBHQnba/H
	j9qkJxkeUjsEeh115AgmwFmd1JzQZFwWEGaJMrll474PvHo74XrzVRMEgotPybnJ8Ei2
	3NEb9q2TKwYJF3JWbC4BJB981WXAP+2Q7sESQ=
Received: by 10.223.114.14 with SMTP id c14mr2479805faq.103.1292455501313;
	Wed, 15 Dec 2010 15:25:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Wed, 15 Dec 2010 15:24:41 -0800 (PST)
In-Reply-To: <AANLkTi=ZP2qTYw3A6KGKppb82D-hoc1LQFQ2DGjbHxN0@mail.gmail.com>
References: <AANLkTik3B0Boi4PuUqZiSd8no_BwBoSzcgWVmFcKcY3L@mail.gmail.com>
	<AANLkTinvRwriJ=W50duDtc50t2fCT5PM_3-D6Ec8VwM5@mail.gmail.com>
	<AANLkTi=ZP2qTYw3A6KGKppb82D-hoc1LQFQ2DGjbHxN0@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 15 Dec 2010 16:24:41 -0700
Message-ID: <AANLkTik_OhkXYdd658Job2F8w_6PkH9wr_NbV_X-=_vL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: task-sdk-native hard-coded to depend on sysvinit
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
X-List-Received-Date: Wed, 15 Dec 2010 23:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

upstart's sysvinit-compat is part of my image and installed on the system.

Or do you mean some other type of compat package?

AJ ONeal


On Tue, Dec 14, 2010 at 1:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Dec 13, 2010 at 2:19 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> > actually, the error only seems to happen when another package is
> installed
> > or when it is part of a my-custom-image.bb - which is a problem since I
> want
> > to install both it and upstart.
>
> if there are conflicts then probably you need something like a compat
> package
> where you can make sure that the bits that conflict are taken care of
> upstart and sysvinit are conflicting
> packages.
>
> >
> > opkg install python python-misc task-sdk-native
> >
> > when I tried it all on it's lonesome it worked.
> >
> > AJ ONeal
> >
> > On Mon, Dec 13, 2010 at 2:27 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> >
> >> Why should task-sdk-native depend on sysvinit in the first place?
> >>
> >> And in the second place, isn't there something like virtual/init that it
> >> should depend on instead?
> >>
> >> opkg install task-sdk-native
> >>
> >> Collected errors:
> >>  * check_data_file_clashes: Package sysvinit wants to install file
> >> /sbin/telinit
> >>     But that file is already provided by package  * upstart-sysvcompat
> >>  * check_data_file_clashes: Package sysvinit wants to install file
> >> /sbin/killall5
> >>     But that file is already provided by package  * sysvinit-utils
> >>  * check_data_file_clashes: Package sysvinit wants to install file
> >> /etc/init.d/rc
> >>     But that file is already provided by package  * upstart-sysvcompat
> >>  * check_data_file_clashes: Package sysvinit wants to install file
> >> /etc/init.d/rcS
> >>     But that file is already provided by package  * upstart-sysvcompat
> >>  * check_data_file_clashes: Package sysvinit wants to install file
> >> /etc/default/rcS
> >>     But that file is already provided by package  * upstart-sysvcompat
> >>  * opkg_install_cmd: Cannot install package task-sdk-native.
> >>
> >>
> >> AJ ONeal
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

