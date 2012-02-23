Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0cOA-0007d3-Vi
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 18:23:31 +0100
Received: by lahc1 with SMTP id c1so1790102lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 09:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.129.69 as permitted sender)
	client-ip=10.152.129.69; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.129.69 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.129.69])
	by 10.152.129.69 with SMTP id nu5mr1993161lab.9.1330017309382 (num_hops
	= 1); Thu, 23 Feb 2012 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=I3i9xFtF9UpM5SmXqKaojBBZeq+Mcyp/WE17BsoGfIA=;
	b=lNmUSUzhXwpF1GZXpAboZeVu6iWgnLha8taVlxcuonoWNWxtAETLxq8KEiPcB6sA8R
	Ow19zkMqyKyrnKcFudhIJuKBtq/2/v/E0+kahsW03RkwPPMMMoKaL7ssrUhlPRMagEMA
	nVlJ71ZBNQ4iL8wBgZnjbpNH6p6TkSLVb+QLQ=
MIME-Version: 1.0
Received: by 10.152.129.69 with SMTP id nu5mr1678881lab.9.1330017309264; Thu,
	23 Feb 2012 09:15:09 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 23 Feb 2012 09:15:09 -0800 (PST)
Date: Thu, 23 Feb 2012 18:15:09 +0100
Message-ID: <CALbNGRRWfTtgVQmdCK5DqEriMeYtT4raCkwZgLxWjWa4Z7zfjQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-mozilla] firefox does not fetch
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
X-List-Received-Date: Thu, 23 Feb 2012 17:23:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

just noticed that firefox URI seems to have moved

ERROR: Function failed: Fetcher failure for URL:
'http://archive.mozilla.org/pub/mozilla.org/firefox/releases/10.0.1/source/firefox-10.0.1.source.tar.bz2;name=archive'.
Unable to fetch URL from any source.

I was about to prepare a patch for this fetching from

ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/10.0.1/source/firefox-10.0.1.source.tar.bz2

but it seems that has a different checksum so I did not want to jump into this.

Cheers

Andreas


