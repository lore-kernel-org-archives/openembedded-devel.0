Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TjTn0-0002y4-JQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 12:50:52 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2091431pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=nZ0/a2sPrhUH+9y4ssN6BR88109VxQQWFyBucw1szFU=;
	b=jkfVyv8EZRKDLJvaNtzHxo8xf0JxwJVuy63XY6sJamVqq8i94SO7XSmBQq0ccpTiaB
	6Gxznvr0dsplpP21G0+GOfQrKyc52DN9J2vupUassQw2TVxyXVUDaEveQNf4qhcyjQAF
	4NqOzCGpgHz1rc86rl4j8zU/AOQ0O1HkxRx90d2LBFXTPbLJbZmU+ZKjeeqkNeC3BT+X
	lUHZU7c6pqH7PExmli7xwIP0LExvbK0424CMA9pTM006yRAk0kFyXqNBpnsXlzhJDQqA
	g/HkVgFiJwXd8yYRqQUd38YuKCIgAYFgHLF2pGCeMqlrkhgkWMhIvLhJ6AWVXQ04bhqI
	4X8Q==
MIME-Version: 1.0
Received: by 10.66.85.101 with SMTP id g5mr15196886paz.17.1355484973580; Fri,
	14 Dec 2012 03:36:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Fri, 14 Dec 2012 03:36:13 -0800 (PST)
In-Reply-To: <CA+chaQd45pxo_RPGWpaU-_XDZRbm7NLO=rYzfDwQvqboyVWNHg@mail.gmail.com>
References: <1355482437-30298-1-git-send-email-johan.hovold@lundinova.se>
	<CA+chaQd45pxo_RPGWpaU-_XDZRbm7NLO=rYzfDwQvqboyVWNHg@mail.gmail.com>
Date: Fri, 14 Dec 2012 09:36:13 -0200
X-Google-Sender-Auth: 2iepiR2H6cOznKqIxLy6Tw3hGE8
Message-ID: <CAP9ODKqOCGj+xGjXaKcU3tG-W1umUpn4dnAuih=6DEWARHGegQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] udev-173: fix file checksums
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
X-List-Received-Date: Fri, 14 Dec 2012 11:50:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 14, 2012 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Dec 14, 2012 at 11:53 AM, Johan Hovold
> <johan.hovold@lundinova.se> wrote:
>> Commit 7895ab08270d9 ("udev-173: Fix SRC_URI to fetch bz2 archive")
>> changed to source file to bz2-compressed tarball but did not update the
>> checksums.
>>
>> Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
>
> This change looks correct, but why are you using this older udev version?
>
> see http://patchwork.openembedded.org/patch/39873/

Martin,

Please send a v2 without a RFC so I can ack it; I will post them the
changes for danny branch (which I have in my tree) to backport 182
from oe-core to danny (so we don't have a downgrade if someone is
using udev from meta-oe there).

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


