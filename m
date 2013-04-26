Received: from mail-vb0-f51.google.com ([209.85.212.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UVekc-0004N2-Du
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 11:15:35 +0200
Received: by mail-vb0-f51.google.com with SMTP id x19so3331081vbf.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=idRVjvDsBSH5xuh/WIGnLB0igBpXD55VmOIcODhfqdk=;
	b=LQPHDMlTfG4B2a7UHRxs73AzNvmIfa5X3hI++eyTyXpWWCNsbcRxdv/w+8u9b68JBb
	09tIHETlnMCW0VRZaUWtCYpjeCsEaLUch3HgI16eXUuoTGrsaZVqJ5YRhPEbB0uf8p2A
	xnwyUOdwmNEZSoRpOZaAVTIYriz5rRk8Ew3ZYUHGbbPUTUKWid94bZoEBhG5cwpVDZpm
	ExmFSgmDKOpFgZJmgFTZr4cNbj1ftJdlWWWgoZ8dVlpoNhwOMf6ubrzIArzqpF6S0Vti
	GD9A+bxPMZiMvsgUpi1ZuxUjJJ/X7yLW/Hjr9BiJzHxag1vbSx3uZeNSEhUfLAb7NQkO
	z30A==
MIME-Version: 1.0
X-Received: by 10.58.221.134 with SMTP id qe6mr9638824vec.2.1366966665526;
	Fri, 26 Apr 2013 01:57:45 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Fri, 26 Apr 2013 01:57:45 -0700 (PDT)
In-Reply-To: <20130426084324.GL5538@jama.dyndns-home.com>
References: <1366816884-32023-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSGhfmbBwUo-y4nTvHjnn_FoMjNH=ps83sTKbZUkyucaw@mail.gmail.com>
	<kldcsp$uep$1@ger.gmane.org>
	<20130426084324.GL5538@jama.dyndns-home.com>
Date: Fri, 26 Apr 2013 10:57:45 +0200
Message-ID: <CALbNGRRHZ2st5a41hm=apy7vPmQhk4tO1n2yMKGzOq3YJrRkPw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lxdm: fix postinst-code
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
X-List-Received-Date: Fri, 26 Apr 2013 09:16:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2013 at 10:43 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Apr 26, 2013 at 10:12:14AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 26-04-13 09:50, Andreas M=C3=BCller schreef:
>> > On Wed, Apr 24, 2013 at 5:21 PM, Andreas M=C3=BCller
>> > <schnitzeltony@googlemail.com> wrote:
>> >> Exiting postinst code leaves systemd.bbclass offline postinst code
>> >> unexecuted, causes postinst not to finish at first boot (lxdm.service
>> >> is not aliased to display-manager.service -> started much too early)
>> >> and is not neccesary: language preparation can be done offline.
>> >>
>> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com> ---
>> > This unbreaks 1st boot postinst issue - so I would like to see it also=
 in
>> > dylan (of course also in master :).
>>
>> \o/
>
> Not sure what this ascii art means, but if it's something about pushing
> stuff through narrow bottleneck, then I plan to push more stuff to
> master after this jenkins job is finished:
> NOTE: Running task 6924 of 26342
My intention was not to put pressure on you. I highly appreciate that
you are testing patches and this takes time - I know that.

Andreas


