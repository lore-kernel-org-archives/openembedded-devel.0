Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RV2Ng-0003qf-2d
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:40:28 +0100
Received: by bkbzs2 with SMTP id zs2so7899241bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=cytZm+mY0nc/xB2ChRGaloQwE0YuEUAIxFxOBY+Th6k=;
	b=Tll2SIIiu6caJsPrZzu5eUohK6mbjVOaslpr7N2GZC9dQ8NXu/GF55UkkU/NRuZvyi
	S+WRod6Iqsj0tgjNQepj8gReHettEd2/EHqtIZDlZ3dcbzZfEvitLqWOGxwAeLe64rmj
	Xa18hpQik+5V0fI9v9T0CAsqeiooTcnsB6kVg=
MIME-Version: 1.0
Received: by 10.204.148.4 with SMTP id n4mr46019506bkv.42.1322490829674; Mon,
	28 Nov 2011 06:33:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Mon, 28 Nov 2011 06:33:49 -0800 (PST)
In-Reply-To: <20111128140019.GA3565@jama.jama.net>
References: <cover.1322484731.git.otavio@ossystems.com.br>
	<e32fd0221c36927758fffdda5b4235c39fb5b3d0.1322484731.git.otavio@ossystems.com.br>
	<20111128140019.GA3565@jama.jama.net>
Date: Mon, 28 Nov 2011 12:33:49 -0200
X-Google-Sender-Auth: umApmVC4ziZWeApGogLbszQZ7KI
Message-ID: <CAP9ODKoLYHrBTTGFgw7tP7LqLyUGGo4vnS+_ia36hGi8XjkQNg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 1/1] systemd-serialgetty: use a wrapper script to find getty
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
X-List-Received-Date: Mon, 28 Nov 2011 14:40:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 28, 2011 at 12:00, Martin Jansa <martin.jansa@gmail.com> wrote:

> ...
>
FWIW: I have 2 patches for tinylogin and util-linux-agetty to provide
> /sbin/getty u-a
>
> openembedded-core-contrib/shr
> util-linux: use u-a to provide /sbin/getty from util-linux-agetty
> tinylogin: use u-a for getty so we can provide /sbin/getty from
> util-linux-agetty too
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=shr&id=f6aa6fc06af906ab7ee374d544b81f1ef9948403
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=shr&id=e34e002f33660591705cd7b21e3a815382a50b3e
>
> I didn't send pull request with them, because I'm still waiting for
> previous pull request (with libsdl changes) to be applied.
>
> We can add u-a to mingetty and solve whole problem even for sysvinit
> etc...
>

Please do that then. It would be nice to have this pull request ASAP so I
can put those into my local repo.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

