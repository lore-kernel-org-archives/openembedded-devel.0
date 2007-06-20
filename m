Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1I11jh-0001No-8j
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 17:04:45 +0200
Received: by nz-out-0506.google.com with SMTP id n29so199682nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 08:01:01 -0700 (PDT)
Received: by 10.114.196.1 with SMTP id t1mr394475waf.1182351660185;
	Wed, 20 Jun 2007 08:01:00 -0700 (PDT)
Received: by 10.114.210.2 with HTTP; Wed, 20 Jun 2007 08:01:00 -0700 (PDT)
Message-ID: <48239d390706200801j599381afqff529f771bed6fa9@mail.gmail.com>
Date: Wed, 20 Jun 2007 19:01:00 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <DB846718-643A-4CB7-B66F-8682C44E617D@gmx.net>
MIME-Version: 1.0
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
	<A7921DE0-7584-425F-B761-CD455252D3EC@gmx.net>
	<48239d390706200725xfceb517o8faf1e8bb88aaa9f@mail.gmail.com>
	<DB846718-643A-4CB7-B66F-8682C44E617D@gmx.net>
Subject: Re: [RFC] locales
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2007 15:05:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> No,
> see point one (the one you have removed from this mail).

So as I see, the best variant is near var.3 in my first mail.

so we setup:
IMAGE_LOCALES="... ", which is if unset, means none.
during image build process, all translations packages are built as
usual, but names for them are written in list in tmp dir (for each
language is separate list).
then we put it into variable e.g. IMAGE_LOCALE_PACKAGES according to
setting of IMAGE_LOCALES and hope that image itself will add them

Is this variant o.k.?

S.


