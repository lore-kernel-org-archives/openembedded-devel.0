Return-Path: <acfoltzer@galois.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1059760111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 20:34:54 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id 132so20937534ybq.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=ytKCCpaiWm53d4fWO7Hb+5/VpQUuxcfcEYYkacZnFwA=;
	b=PRo0BXF9ezpdZQUEY9r0dVrK4EIWMjZzZLJWK2RIf+7ARHPToh5IFg0LCA9l0McEZb
	HdDkKZX1YD/GZdsdTjDwDS9ZsANCZNV7OZj82kOIqZBdNCPgs9maNXfRJkS+LeFkMZSH
	VKnShYubtp+pzozkE+/76VAZutu7TgOWgxN5s2Gn8LyWdXUfqa0R3tiyICbN08CHgRyG
	tZufJNk96W5BdYvmD4isVO2hrHMi39NWJCBq6PB22ENTyPaLMCyvIF9z02+0pvd7rgvC
	N3S43SSPktM6jam1quKHHY/UbIXbP0qA3TEfra3lyS/8IjFENFSrbWckBd63tAuGY3Xg
	zg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ytKCCpaiWm53d4fWO7Hb+5/VpQUuxcfcEYYkacZnFwA=;
	b=umbwX79rojkRXBPIOVtFJa2qdakgWJ2W53QpNTjNtvnUOnCk1nJGZb423mNuKH/RNz
	2kEUuRnQwjmJnyc3f+sIsl7//ac9Fvm8Wbmn9WCZRfBZN4Fwn5J/UFDkDQqAq6so4SFA
	v0n8M02mRtRQq0PEyOpUTYq42DBxOOhT5pE74dNbDJ2ELFW6gOOuSTBAiLM+Ne8BjBrU
	OTG4CZ+7gjYUld9aIs8KM0DKDh19WrRyT8+/OhymZ64HstXaA/LE8IhcN2F2iNkRbdlm
	/c7DyJM76MlEUAW10PfPVB8W+cPK9DUB50c9hUqni8m+olDiJJnrutV/DGwW1d48ck+q
	2qbA==
X-Gm-Message-State: AODbwcCNTxx/MNs8li9ZNcTLlSqPdXmDN6FUnAY8TOPPcKTaQTwUxWpH
	TpjM5SIeS5G3B2T72cY1Sb7REP0YbugE7pc=
X-Received: by 10.37.85.198 with SMTP id j189mr1341593ybb.170.1496435695116;
	Fri, 02 Jun 2017 13:34:55 -0700 (PDT)
MIME-Version: 1.0
From: Adam Foltzer <acfoltzer@galois.com>
Date: Fri, 02 Jun 2017 20:34:44 +0000
Message-ID: <CADnrctF66h_p+DnajWstF=Du-uXwNP_Rpe40ZpzR8RUMN_=Cxw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH] Meson update and fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jun 2017 20:34:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

These patches respectively fix some issues with the Meson bitbake class,
and update the devtool recipe to the latest version. These issues arose
when creating a new recipe for a C++ project that uses Meson, but the
additional linker flags should help with C recipes as well.

The diffs are available here:
https://github.com/openembedded/meta-openembedded/compare/master...acfoltzer:meson-updates

Regards,
Adam

PS. I hope this is the right way to submit a patch like this; I'm happy to
submit it in other forms as well if it'd be useful.

