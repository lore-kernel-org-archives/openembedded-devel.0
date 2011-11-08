Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RNqSi-0008VF-GN
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 19:31:56 +0100
Received: by wwf4 with SMTP id 4so997422wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 10:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=t3482J81MsXEbRPI9r8MLNe/PyUTGm3Is3pj4k0ZUNs=;
	b=fu74OKl6BmKWWq/C7ZC6j+bVelNjovcLbwv54pA8zV3IKOJ2tAj3GCyKV8Dia/XAXU
	JVDilE4h3b0pXF79zoOmb8hFoBtQnTOfGSa29zmm9temxszggZdOtQx7fE+wmJhJZ+ae
	+R70xGsPSy9kEKmpNDNJT7RBTDVmo8+JwdSIg=
MIME-Version: 1.0
Received: by 10.216.14.93 with SMTP id c71mr4876263wec.40.1320776741893; Tue,
	08 Nov 2011 10:25:41 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Tue, 8 Nov 2011 10:25:41 -0800 (PST)
Date: Tue, 8 Nov 2011 12:25:41 -0600
X-Google-Sender-Auth: bc1BGinrWitLucjNCm-sgPuE6lU
Message-ID: <CAPOJ94PUaBtZkRHE_v_x4raOQZnBtHp9bt6mvoMjZGmPTQ=-jQ@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: forcing dependency on genext2fs-native
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
X-List-Received-Date: Tue, 08 Nov 2011 18:31:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've added a DEPENDS += "genext2fs-native" for a recipe in meta-ti,
but the corresponding package is not getting built.  bitbake -DDD
says:

DEBUG: Added dependency genext2fs-native for
/prj/oe/angstrom/sources/meta-ti/recipes-misc/images/cloud9-gfx-image.bb
DEBUG: providers for genext2fs-native are: ['genext2fs-native']
DEBUG: sorted providers for genext2fs-native are:
['virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb']
DEBUG: adding virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
to satisfy genext2fs-native

I'm guessing the "virtual:native:" means somebody thinks genext2fs
should already be installed on the host.  It's not available on
Fedora, so this decision is wrong.  I haven't been able to figure out
what's causing this to happen.

I can work around this by manually bitbaking genext2fs-native, but I'd
rather have it done automatically like the DEPENDS line asks be done.

What do I override to make sure the actual package is built automatically?

Thanks...

Peter


