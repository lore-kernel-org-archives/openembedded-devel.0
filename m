Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U843C-0002X1-43
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 08:25:11 +0100
Received: by mail-pa0-f44.google.com with SMTP id kp1so3885578pab.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=1Y/wls8du6SZhhqxPi8TNY62aWkC4Qmo0ujp18cs2R4=;
	b=UeKNxgiTHyQMsO7FVY66rujX4tspHg0sVfkMetVrVXB8d/0VsTKtn2o+ksM/f6vMmx
	6X6+XICC5cfTYVDOYclP9a5m2gyx+Le8hRh8Ld+FJL53TyB8F3BH/FRxUQpO+GSvOAuI
	OTN/z3g/7aCN+Ftp6yTJJOHJcGK4ySrqwyXMe7B5o7jRwcP/SObSYqFIwWlSJ4kxxzN9
	+B4tt9REx9NahDrF8Sy3bM3pTcmZKbmO76FlgaLMvk0CEoU4H8RUnES6VLudaJGN4WCY
	ayv+IG2/k5TfzYD5/HE5Yxp0bgC/db6t20Vu586PMiDhbGEJ9ZRbbErx5HYvMdXGaI9A
	t6eA==
X-Received: by 10.66.13.74 with SMTP id f10mr912861pac.202.1361344138996;
	Tue, 19 Feb 2013 23:08:58 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id o5sm110205984pay.5.2013.02.19.23.08.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 23:08:58 -0800 (PST)
Date: Tue, 19 Feb 2013 23:08:44 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130220070843.GB23580@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20130109101310.38A4C103A7@opal>
	<CAGiJk9fX-W=P_5z_e45NwU+Nj3CSc4ozdS3_WyVyVtQyEWc5bw@mail.gmail.com>
	<lyobgvykjp.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyobgvykjp.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Khem Raj : dhcp: Add systemd unit file for dhclient
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
X-List-Received-Date: Wed, 20 Feb 2013 07:25:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/01/13 13:24), Enrico Scholz wrote:
> Samuel Stirtzel <s.stirtzel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> writes:
> 
> >> +ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
> > ...
> > systemd[1]: PID file /var/run/dhclient.pid not readable (yet?) after start.
> > [FAILED] Failed to start Dynamic Host Configuration Protocol (DHCP).
> > See 'systemctl status dhclient.service' for details.
> >
> >
> > Any idea why it is missing?
> 
> probably a '--no-pid' option

how is /var/run setup in your case ? may be its not existing for some
reason


