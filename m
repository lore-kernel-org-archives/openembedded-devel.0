Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PDfWh-0001KT-44
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 16:45:28 +0100
Received: by qyk7 with SMTP id 7so227409qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=B0nbGIlsRoVC0Ef7L6e3zN6dQjsTCguLwHGyvVwWotU=;
	b=FB4SrIm9dEzFfC5aA7j4Ed7SkVHqvOUVc1F9bee2W9tPyIaUXX+P4kDBV5/Cchyb6o
	1ir3VrY0ZJrhyFFNt3rimllyolU0BH1ISDogkLZA/+LbsHH8N+ff0XpKpXqtVoP0VQK7
	iHcTEJ4y3QgCPFWuN+cZUXfLQmY/e92FoDOg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WSlz1PXGVmAdjAHEm7XJkrUO9lDnCJ0lW5uSoyLXE3vanrKfaMNh+U2NF+FH1mD5Pl
	4Tz77OoOwpPnfhonz1KghFTwc6EBlHQ4A0bav1FBQB6htP4s35y35fTKSMWdwIGTa4VS
	bzZQqYp8XYPj+YdVTazVHwdVQbVuSI16KkzgE=
MIME-Version: 1.0
Received: by 10.224.204.195 with SMTP id fn3mr7291954qab.122.1288799075776;
	Wed, 03 Nov 2010 08:44:35 -0700 (PDT)
Received: by 10.229.212.85 with HTTP; Wed, 3 Nov 2010 08:44:35 -0700 (PDT)
In-Reply-To: <AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
	<AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
Date: Wed, 3 Nov 2010 16:44:35 +0100
Message-ID: <AANLkTikXM5z0PT5oWjfk5Y-xnR_d8q=HzUAX+MNFVMV=@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 15:45:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

I think the most elegant solution comes from something like USE flags.

See  http://gentoo-portage.com/media-gfx/gphoto2  (2_2.4.9 fwiw)

...
IUSE="aalib exif ncurses nls readline"
...
exif? (	media-libs/libexif )
readline? ( sys-libs/readline )
...

Drawback is each recipe needs to be edited.

My 2 Cents

Andrea


