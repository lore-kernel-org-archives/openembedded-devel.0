Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVARy-0005Pu-MS
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:12:54 +0100
Received: by wyb40 with SMTP id 40so4507780wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 14:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=ggdG5+evVXMIooAhfaXMPy6aMgz5RMNzWqQrDom+ZQ0=;
	b=PqA21h2riWpy9+b4zJHRJr7sg+24g++SFnphBF85TGRf5ZTL3I/SPhMXDuFL03Qbvi
	UriNapXeKiLNBNTFaU/7N8zAO2SgicMhTZ7JWFsN0/mNVJtCNCHImc99992AQ6X+keqo
	SWXRoftvDvhdKgsZn3gJM17ePNq/OO+gJKlkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=ENYREKJ1AwfhXHwGqCXtIsOEwm3TchqqYeaOAe7WAoT+S+B+aAfOXUk4HQGfZMZz8s
	x4ojs7K3BFXgzdZMU28UlqGSTUrfw/fyAMUIEJ8Kw1tS2veKyjUUCIMg5u6N52O1Zk9H
	hv7ChPNUfRTDIBS3OUEhtP+NE9SBgGDf+Zzsk=
Received: by 10.216.150.134 with SMTP id z6mr6848135wej.27.1292969567635; Tue,
	21 Dec 2010 14:12:47 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 21 Dec 2010 14:12:27 -0800 (PST)
In-Reply-To: <AANLkTin7=Y-zTioQWoMegS4pU3McHnORx-jC+z6petZ-@mail.gmail.com>
References: <AANLkTin7=Y-zTioQWoMegS4pU3McHnORx-jC+z6petZ-@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Dec 2010 15:12:27 -0700
X-Google-Sender-Auth: BQVG6yh3kXacuCppyrYf1KqeBS0
Message-ID: <AANLkTingz19yW=dhQnLZeaApvUt-x9Lc9NZ4pf5212AP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE git repository organization
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
X-List-Received-Date: Tue, 21 Dec 2010 22:12:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 2:53 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Now that we have the capability to do per branch permissions, etc, I
> would like to discuss what makes sense going forward for repository
> admin. =C2=A0My initial thoughts:
>
> - put all user branches in openembedded-user
> - restrict branch creation on the main openembedded repo to commonly
> used branches
>
> We can also do things like give users permission to branches that
> start with their name, etc. =C2=A0This would allow rewriting history on
> user branches, etc. =C2=A0That said, it may make more sense to just do us=
er
> branches on github as some are already doing.

This is a good idea, at least for those who want to use it.  It would
certainly clean up the branch mess we have in the main repository
today.  We may want to limit tag creation to specific people, to avoid
cluttering the tag namespace.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


