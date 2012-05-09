Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1SSDPe-0005za-Is
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 22:23:11 +0200
Received: by qabg1 with SMTP id g1so2228626qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 13:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=OcQDPk65p1BNoqwLXo5RxDluNajRDPiDcaAdoYnfgw8=;
	b=O/P6lqLd5N2W5sb55a8F4KdVzM39I0te1NuTKjsIa/KzcAIJH2ZER9nA9MV7G29VJa
	6DR71vAsfQb/ujnf62BWXAZ4ni6F38+QImckCRDvsl3/iSPEMcAk019IItUeRaKL6NLr
	/6+uShAO5BAC3eVOFifs/3O/C805Ss3/6VoLTsa+/gU68nrHxjhry7d8MvcHdtgeSswl
	vu7WnUjWmDpgaA0QmTvrxwoVh4dHM927XuuhwrixhHiHiZKDtiXmL+XDmE1tHo2ar8o/
	i7lv1oQs0c/ZidkW35MUXz319G92xP3qriYtPxfy84x1pLnpH60uVKn9M6KCXPT4DSCK
	SuzQ==
MIME-Version: 1.0
Received: by 10.220.149.130 with SMTP id t2mr866210vcv.40.1336594393108; Wed,
	09 May 2012 13:13:13 -0700 (PDT)
Received: by 10.220.27.139 with HTTP; Wed, 9 May 2012 13:13:13 -0700 (PDT)
Date: Wed, 9 May 2012 23:13:13 +0300
Message-ID: <CAA5cW2zfvw65-vtwCZWfTsnfAO8e-jA=qsd0zqXvStYfhhy8bQ@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlRsM4cNpiEwY4ikqvMucaL3w+zfsVx/HYMyFDDzvWuuvaWtipA5gSgL0AfMAk6jOaSKTTL
Subject: Provide a master/setup layer - best practice?
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
X-List-Received-Date: Wed, 09 May 2012 20:23:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've been working on making a BSP layer for the new imx233-Olinuxino
board based on oe-core and meta-fsl-arm. Now I want to provide an
easy, one/two step process for people to get started.

1. Clone a git repo containing config files and pointers to all the
needed layers.
2. Press a big red button (typing a shell command will also suffice)

I've seen numerous approaches mixing in different ratios makefiles,
git submodules and custom scripts. I'm talking about the Angstron
setup scripts, slugos-setup, shr-makefile, kergoth/oe-core-template
etc.

There's also the combo-layer script in oe-core scripts dir, which I
haven't seen in use anywhere. I spent some time trying to use it, but
can't say it was a straightforward process.

It seems like there's some "reinventing the wheel" going on.  What
would be your advice for the best approach and starting point in this
situation?

Best regards,
Rado


