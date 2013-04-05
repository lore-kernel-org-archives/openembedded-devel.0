Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UOATh-0003KC-8w
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 19:31:05 +0200
Received: by mail-vc0-f176.google.com with SMTP id ib11so3353065vcb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 10:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=2erz0v4qHdm3Jqq05YoPuL4ldsz34RWLH7x7E6TCDbc=;
	b=mkYkOwUooYd4sEFdfAoZIqR4kgr1XyrzAahRQEbElsU9+We1xw+Jpq3th+Wl+vui52
	9oselFkTTHNFfQPAt3ETGgM0nMPxFDf5BnIjSzAqk9OUjYpIwkhoqtzkgP3iVtrKxEy3
	EQltwtAaVon6SlBYSKasjIwCCeFrb6Rg5S35REj5Xh+A3S/6nQFR+yYTIfLgtmLiH8mr
	E/FTlkK5Mvn14Ai2wju3tcb45/8OfrsUZV65rEWa/Y4vn2/wqc0hz685hBli7Z0DBr4/
	vQfpqx2nki/7UnF3Hp3EhY6rvWDcfBFL7wdpdzZYIY28tt8G0BSlMCizNJw4tnraHbuv
	RUxg==
X-Received: by 10.58.143.116 with SMTP id sd20mr8897984veb.39.1365182030444;
	Fri, 05 Apr 2013 10:13:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 5 Apr 2013 10:13:30 -0700 (PDT)
In-Reply-To: <CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
	<20130321140745.4a0683c8@e6520eb>
	<CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Apr 2013 18:13:30 +0100
Message-ID: <CAJTo0LaT0TRzCoVqq+-DLpGdcLzjr75Vu7_MivkHov3mUNxq9w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnHC1Cw+rum8rXZuRl/gik5Y7ogfFnYMrgzMPr3ZN0kBc6wrmhin93Fn2M3gibFE1GRZ+uI
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
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
X-List-Received-Date: Fri, 05 Apr 2013 17:31:05 -0000
Content-Type: text/plain; charset=UTF-8

On 5 April 2013 18:02, Chris Larson <clarson@kergoth.com> wrote:
> bit confused about why this went in. danny is a stable branch, and
> this is clearly not a bugfix. Did the existence of this recipe actually
> cause a problem? This just caused a temporary build break for us due to
> bbappending to a removed recipe. What exactly is the policy for meta-oe's
> danny branch, if it's not "bugfixes only"?

Yes, it was causing problems, as the guile-native 1.7 was preferred
over guile 2.0.6's ability to build natively, which meant
oe-core+meta-oe was unable to build grub.

Ross


