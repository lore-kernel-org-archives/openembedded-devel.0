Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OfACj-0007zi-KX
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 13:26:15 +0200
Received: by bwz10 with SMTP id 10so1216774bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=StKkdns/QEv/EOw3qdzfZuPySZQW4a2OCi9uESC9OAI=;
	b=i0EfIQdVPpG01AmbribL482lVkGqqVO8ZAPabKd0NJxZx5VuxlhTwALjY1u7EIUfTu
	8x6eRMn2Kx3sVvmjSrtqHwqNSN17LEbSx6jLL0MXfmX+z7h0/+3v2kuk9ANfs0VTgETQ
	aMckHooBAPjPXO/FoQOl9gFiTvApeE7ruAa0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e21G1eFzQB4hq0wF5JdCRqjVDvuaCDEicakjVteNfwFSzvw6FREWIgxnk3qKALEqv3
	paTm55WMVH6PADnDRQTIzw1LWvuonnYYikCgk/ZO0ja+25xnzHd1GGQSJiEiti9mFa0U
	DW200XOmJZxznu0Em4dATONiS/7FV3EJBIg7U=
MIME-Version: 1.0
Received: by 10.204.163.70 with SMTP id z6mr2209659bkx.29.1280575554028; Sat, 
	31 Jul 2010 04:25:54 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 31 Jul 2010 04:25:53 -0700 (PDT)
In-Reply-To: <1280573475.3721.44.camel@mattotaupa>
References: <openembedded-devel@lists.openembedded.org>
	<1280504555-3633-2-git-send-email-aalonso00@gmail.com>
	<1280573475.3721.44.camel@mattotaupa>
Date: Sat, 31 Jul 2010 13:25:53 +0200
Message-ID: <AANLkTimx9o-PzWgVJoPR3W3njy61wu1kowOPV2j-4vKM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 02/10] xilinx-virtex4: new file
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
X-List-Received-Date: Sat, 31 Jul 2010 11:26:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/31 Paul Menzel <paulepanter@users.sourceforge.net>

> Am Freitag, den 30.07.2010, 10:42 -0500 schrieb Adrian Alonso:
> > +
> > +PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
> > +PREFERRED_VERSION_u-boot_xilinx-virtex4 = "u-boot-xilinx"
>
> As far as I can see, those recipes are added in later patches. Would not
> that make this patch produce a non-working machine and therefore for
> example also render `git bisect` useless.
>
> If I was right, please reorder the patches. I do not know what the
> preferred way of adding new machines is. A big patch with all needed
> files or incremental ones.
>

If you reorder please resubmit the full patchset, so it becomes clear what
belongs together.
Also use PATCH v2 or so in he header to distinguish form earlier patches

Frans

