Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QrOgj-0005h7-1H
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Aug 2011 08:24:17 +0200
Received: by qyk9 with SMTP id 9so1289116qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2011 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FOVUrk7KZW9MH2iKmiKLQ6aEJ5xDH0j0zTS0Vh+MBI0=;
	b=vDTHKj8/zRbaih47s2zcSA5PoFVBnLsgNaQEnQttlirKs5m8xRscsTU4PSj/EDg4tT
	36CXMf2b+k0OHflynm2fY/1yEff7kI6sl7AMiuSz3mGw40R323Le2zPF98BtsW/exwlM
	r9+zinK9HVI7BQHVI09hnsdCBYhJjcvIIkcTY=
MIME-Version: 1.0
Received: by 10.229.9.197 with SMTP id m5mr6971699qcm.211.1313043585331; Wed,
	10 Aug 2011 23:19:45 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Wed, 10 Aug 2011 23:19:45 -0700 (PDT)
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BCA0FE@nzc-ap-xch-02.ap.trimblecorp.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BCA0FE@nzc-ap-xch-02.ap.trimblecorp.net>
Date: Thu, 11 Aug 2011 08:19:45 +0200
Message-ID: <CAGiJk9cadJR_ucWS7+nUHa88_uH_dK_ruLz2zqdtuhd5nkJAhA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Startx? Where is it?
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
X-List-Received-Date: Thu, 11 Aug 2011 06:24:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/11 Bernard Mentink <Bernard_Mentink@trimble.com>:
> Hi All,
>
> I have finally got a booting console image (Angstrom) logged in via SSH
> and now want to try and get X working.
>
> I have built the Angstom-x11-image and have unpacked it into my NFS root
> ... but the problem is I see no startx command. How do you start X in
> this distro?
In OpenEmbedded-Core [1] there is startx for my image (efl-nodm-image).
On your current image maybe you could try init [2][3] ?
Also this may help you [4]

> I have also built frame-buffer support into my kernel, can someone tell
> me how to test that ..
In the past there was a program called fbtest [5], but I don't know if
this works.

> Cheers,
> Bernie
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

[1] http://openembedded.org/index.php/OpenEmbedded-Core
[2] http://en.wikipedia.org/wiki/Init
[3] http://serverfault.com/questions/98215/start-xorg-using-init-d-script
[4] http://superuser.com/questions/31603/what-is-the-difference-between-using-the-x-config-command-and-the-startx-com
[5] http://processors.wiki.ti.com/index.php/Fbtest
-- 
Regards
Samuel


