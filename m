Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Osr9M-0000Wa-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 07:55:21 +0200
Received: by iwn2 with SMTP id 2so4906312iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 22:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=qdCi8Eq0CW5FOCC6v+DnpM+lrIPVSgBJpyBpA4eSXvI=;
	b=GdJ00H0IbsJZymZnT1tjoUfJnmNnxykvoIftVQmQRpYUYFXHSNwl1+6ggBdEulbmQp
	2QYjvaT4y3SMQBw523slxSLFhrSsi6/b4q7Dqh8V9MhG3vpruj6Yv+nY/BXuRAsWTSm3
	AuQe25rvkARp4L1txPIUCx6QM8jZ+ROgE008o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=p/e5xFvyg5hm+kFbNORthU6HKf1DnKrAo+2In+5WSI06VkehOaegVkHAlZVUQcVumL
	tN5KRE3OYg9D1gK+fzV83xFtxfDSlCb9ZW7hBE7xV2wvoKPqkOeD6EInOpCspFb5PJ0I
	wbiIGPiYt7NINoDwtEmcy4oXI830g9I7UU98U=
Received: by 10.231.144.74 with SMTP id y10mr470383ibu.65.1283838881172; Mon,
	06 Sep 2010 22:54:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 6 Sep 2010 22:54:21 -0700 (PDT)
In-Reply-To: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Sep 2010 22:54:21 -0700
Message-ID: <AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Tue, 07 Sep 2010 05:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 3:21 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> Using current top of tree to build some of my images I noticed that
> quite a few apps seems to be broken at run time (Firefox, Epiphany,
> Gnome-mplayer, and others).
>
> All were complaining about libstdc++6 being missing. =A0Manually
> installing the libstdc++6 package fixed the issue.
>
> Any idea what changed that introduced this issue?

Yes I have been seeing that and spent not so much time on the real cause
but it seems that the depends get lost when we rename the pkgs in debian wa=
y
may be thats not the real cause I dont know yet. but that something to look=
 at
even libstdc++-dev ipks miss to have dependencies on libstdc++

>
> Steve
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


