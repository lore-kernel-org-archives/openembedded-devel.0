Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oo9hG-0007yT-OS
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 08:43:01 +0200
Received: by iwn2 with SMTP id 2so311889iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 23:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=g3g+8fhr5FbLq2f5OQWSs+pY4yShVBHE9XjKie1rznc=;
	b=qzWdMRGpc54ctee9UkJC7z5H6SPlmFqH0BdGOZE67SW04An5BX5fm0/lpRBDuY8oiZ
	feXrSnuE39XUyLWeTtlJOXG1vN7tXOiA+Zl4XM9j0mvUeI7sKfdsq8JmdgOpN9zhsYAy
	RvLBAVvgkfZ1N3hoZKGRgA8C86WIc43TtlHPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kBaQvPygsYzKWiMoB6qDyGPMg7AXuntxIO0blysy9OaOwg8vRM8dDOojW38T2wP7OD
	cgjqN2ythzRLOGotJlcxfum7eGeVikHNW88mn2ujQ0wrMWVC8Bboc/ZCLHEDG26Iy472
	qJatmgw5jXyYEcTajw+PzwMvCLXNaUFS4ztBM=
MIME-Version: 1.0
Received: by 10.231.191.74 with SMTP id dl10mr9809113ibb.157.1282718521885;
	Tue, 24 Aug 2010 23:42:01 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 24 Aug 2010 23:42:01 -0700 (PDT)
In-Reply-To: <AANLkTi=aRz_1tiE51NVYH3v67R0uD8WNtn4vzH+WnYNY@mail.gmail.com>
References: <AANLkTi=aRz_1tiE51NVYH3v67R0uD8WNtn4vzH+WnYNY@mail.gmail.com>
Date: Wed, 25 Aug 2010 08:42:01 +0200
Message-ID: <AANLkTi=SxKZ5MWauSFNSWseyx8ereKO47ER7k+4Se8zL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit fc3233b3a21ac14127bdd4931687ef39482cb0ec would need partial revert
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
X-List-Received-Date: Wed, 25 Aug 2010 06:43:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/25 Khem Raj <raj.khem@gmail.com>:
> Hi Frans and all
>
> commit fc3233b3a21ac14127bdd4931687ef39482cb0ec
> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Date: =A0 Tue Aug 10 19:49:56 2010 +0200
>
> =A0 =A0autoconf: remove a few old unused versions
>
> =A0 =A0Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>
>
> This commit removed autoconf213-native_2.13.bb which is a named
> differently for a reason
> because there were some packages which needed it one of the packages is f=
ennec.
> I am trying to see if we can get fennec upgraded to latest and remove
> the dependency
> on 2.13 if I succeed then no changes will be needed but if it happens
> that 2.13 is
> required then we might have to let autoconf213 live.

As discussed on irc: fine with me.
Feel free to revert on my behalf (or ping me to do it). Will await
further communication.
Apologies for the inconvenience.

Frans


