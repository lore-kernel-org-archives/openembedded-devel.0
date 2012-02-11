Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCzi-0002gO-B7
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:28:02 +0100
Received: by eekd41 with SMTP id d41so1025626eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ZUsAW6WE8mVjWzGdbbPBvKYUsfwWpYZWWfiV7b+VXKo=;
	b=X7YOmEd0AC6vave3LFtVMS6KGBe/3IrbsQjkfR9jx0KKQc7OezfOSSG+SeJLUSzI+z
	OQ0mmJSaMAdFRz1cGQqX35G3TFQVcU+zMJ5oKvkOF905yPCDj3K9+DEpxZLi+2JnRbbU
	v0HERFwF09CCvRRkd6yyrPN7nCrnR1sYQJR90=
MIME-Version: 1.0
Received: by 10.213.26.8 with SMTP id b8mr963448ebc.88.1328966395494; Sat, 11
	Feb 2012 05:19:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:19:55 -0800 (PST)
In-Reply-To: <1328925603-2967-7-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-7-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:19:55 -0200
X-Google-Sender-Auth: Yy2jTVOEzRgoq4aByVq4nWkQnsQ
Message-ID: <CAP9ODKrPPETkPqEcuEJ=GocqiG4aQTk4fX_HJmJurgMUVJXz6w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 7/7] systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
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
X-List-Received-Date: Sat, 11 Feb 2012 13:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 00:00, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> * append systemd (functionalty moved into systemd_add_rdepends)
> * append base-pgk
>

This patch is OK but I think it would be nice if the recipe has it included
in rdepends byhand we could do a warning saying it's use is deprecated so
we can know about it and cleanup the recipes.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

