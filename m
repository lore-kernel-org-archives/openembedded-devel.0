Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Runrn-0000IU-3v
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:26:03 +0100
Received: by eekd41 with SMTP id d41so2198680eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=UlmSqnf5gqwohixUk2QxxIs+okVOT7hvpr++YK/KXXg=;
	b=Gy3/+U6IT11NMbZaAbWZn1/IMwZC7+Xk/r/1kYSWiQWYOuEhDUcsgAjvqa4WqbcGIJ
	UO+UXl5pbU+eCdYM6BLFHJjrse7SyWmuK+mRuqEi7cEpRww1UNuVSNdewYbdTJUWpS4o
	gNyTxsHN0tmkJ4NyRK3sthvix20HuVjZ/Hm5k=
MIME-Version: 1.0
Received: by 10.14.206.133 with SMTP id l5mr7172549eeo.22.1328631480575; Tue,
	07 Feb 2012 08:18:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 08:18:00 -0800 (PST)
In-Reply-To: <jgrhv4$v69$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<jgrhv4$v69$1@dough.gmane.org>
Date: Tue, 7 Feb 2012 14:18:00 -0200
X-Google-Sender-Auth: gMvHrW7KY_FUzOc2mTz9MyBNuZI
Message-ID: <CAP9ODKpwQyOE=xYY_Ezhofw=LcjLNzYJeSvJ+xBEwgX6bVeN0A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Tue, 07 Feb 2012 16:26:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 14:02, Koen Kooi <koen@dominion.thruhere.net> wrote:

> > * I'd like to see sysvinit packages splitted onto ${PN}-sysvinit as well
>
> This would require extra logic to install -sysvinit if -systemd is missing.


And if there's any sysvinit package, it ought to install compat-units too.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

