Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoSvE-0002JR-RJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 05:14:37 +0200
Received: by eyb7 with SMTP id 7so918698eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 20:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Uc/Na1XnxMkx2flwhwx/wsT5Krf+wUcJxJxmO1QRU+U=;
	b=Cz5ei+5W52tEDgp8yTll2Jgh734PVWJ3ZjC9EtTJvVetuKeb//Fr6cYB+lgQKCKkgt
	JfPjlr+qVIfNhRYnwbs7BLqB+hL+mSK8cVrkrtH4HFQ6vfWNbFsvC9FR++FrO2AxUQJd
	jYAZGDVcu1MbGiYhKxutrfECfjaDtjvkxin0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JgUoLR/yylZfrZRr+6Ap0QUJ11YLrvxkFclVGIi1xEVQ5eczzxLX0/qQNBfFtbpA1t
	j5cdXlaLzOrF9vD85x64I1e3V4f7uH/r79kBM+KvNbhinHk+dOZdR9MFj6qCHVINn6y9
	4XwO1GSKRPRpCWtntsbZ67QS5Pt5RGAn0GCSM=
MIME-Version: 1.0
Received: by 10.213.27.141 with SMTP id i13mr6666336ebc.5.1282792451844; Wed,
	25 Aug 2010 20:14:11 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Wed, 25 Aug 2010 20:14:11 -0700 (PDT)
In-Reply-To: <1282775656.3711.22.camel@mattotaupa>
References: <1282754957-7589-1-git-send-email-norguhtar@gmail.com>
	<1282775656.3711.22.camel@mattotaupa>
Date: Thu, 26 Aug 2010 09:14:11 +0600
Message-ID: <AANLkTi=gHjEM7eFzNEsZOq9b3y9X06NRq4amF9h0_yhG@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] upstart: fix sysvinit compat
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
X-List-Received-Date: Thu, 26 Aug 2010 03:14:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 04:34, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Mittwoch, den 25.08.2010, 22:49 +0600 schrieb Anatoly Shipitsin:
>
> Where did you take those from?
Need more info?

>
> Small commits =E2=80=93 like changing the package name =E2=80=93 make it =
easier to
> review.
Okey. May be i'm split patch to 5 small patches?


> Is not that picked up automatically?
No. Automatically  upstart installed in /usr but for simple and right
switching with update-alternatives
it's move to root. I'm got this additional parameters from sysvinit.


