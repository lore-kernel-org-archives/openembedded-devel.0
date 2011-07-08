Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QfIZk-0000On-9Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 23:27:04 +0200
Received: by wwi18 with SMTP id 18so1922466wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 14:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pQpJncRgPaTRd0hBqY8BgCQjFmWLQ9k7KlUB3pRWUHU=;
	b=MpY/3SJmwHNC42t6aig7BrcLz9AaJSeBL6NVhKxddWcIcNvoLkr8zicppcuaM6xi+s
	ZTvcvlc51FGP3PRdIzc6LR2NvlcG0fqxTJk1enbqT+lo4tPn1HSWGOWCAyT2aPNhkatY
	qqAYg4V5EKczOIXb8lgjmzNx+RzM4Q0IzO+NU=
MIME-Version: 1.0
Received: by 10.227.135.2 with SMTP id l2mr2174521wbt.97.1310160177459; Fri,
	08 Jul 2011 14:22:57 -0700 (PDT)
Received: by 10.227.200.15 with HTTP; Fri, 8 Jul 2011 14:22:57 -0700 (PDT)
In-Reply-To: <CAD=GYpYBSV=m3m7s+GKMrt3NyJQ5+qaFsp9N-qMdUQG1fFn-tw@mail.gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
	<13872098A06B02418CF379A158C0F14601620D1E2B@dnce02.ent.ti.com>
	<CAD=GYpZgya_v86J+OhDUN-rQXnXGBDT3QT-HXTj_+G0sKme7wA@mail.gmail.com>
	<8F7AF80515AF0D4D93307E594F3CB40E93380EE2@dlee03.ent.ti.com>
	<CAD=GYpYBSV=m3m7s+GKMrt3NyJQ5+qaFsp9N-qMdUQG1fFn-tw@mail.gmail.com>
Date: Fri, 8 Jul 2011 16:22:57 -0500
Message-ID: <CAD=GYpbJhZ3FtpmuNoHhdxTaBgbuuNMErkTkBjD8-=_p6AaQiQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Kridner, Jason" <jdk@ti.com>
Cc: "Fernandes, Joel A" <joelagnel@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Paul Menzel <paulepanter@users.sourceforge.net>, "Kooi,
	Koen" <k-kooi@ti.com>
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 21:27:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

>>> While I'm doing a build, I am also posting detailed logs to pulseaudio
>>> ML about the failure of an older version, just incase.
>>>
>>> Just mentioning that I'm setting PREFERRED_VERSION_pulseaudio to
>>> 0.9.22 in conf/.../angstrom-2008-preferred-versions.inc
>>
>> Is it 2008 or 2010 that gets used?

Just noticed that angstrom-2008.conf is present in the
2011.03-maintenance branch but not in the .dev

So I guess that we're supposed to use for all "maintenance" builds

Regards,
Joel


