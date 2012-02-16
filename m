Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxzeC-0001Y9-3r
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 12:37:12 +0100
Received: by vcbfl15 with SMTP id fl15so1613621vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 03:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=jB8mrMMCmOA0TU4SvRuJ6gAVIPAKuqYZmJZEKGDpyKA=;
	b=C6Ll1V6fF+l53kjfqAmBzDAZtdCVfEhpr9hzzw4yMKsYqWJullLFSETAjAxe9JhFaX
	9mPm6UmxksmkkWrtkMB77BNHg2k4jyPyGvBn4xowG7dc78cLjByw4nfw3SLIw3q0V4gP
	8SlKPfchYyyjdZpzJEAGCueIjzdcxx+PuJi+Q=
MIME-Version: 1.0
Received: by 10.220.157.83 with SMTP id a19mr1094865vcx.54.1329391738781; Thu,
	16 Feb 2012 03:28:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 03:28:58 -0800 (PST)
In-Reply-To: <CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
	<CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
Date: Thu, 16 Feb 2012 09:28:58 -0200
X-Google-Sender-Auth: vmAgO9rQ31alrkLHBOY2xGp-B1w
Message-ID: <CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 22/22] gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to enable service
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
X-List-Received-Date: Thu, 16 Feb 2012 11:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 08:43, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> As far as I can see there is no link from *.socket to *.service (
> *.service requires *.socket) - correct?. Interesting: This was
> highlighted by the systemd.bbclass modification: without this patch
> *.service is not installed. Is there something I have overseen?


As you can see at
http://www.freedesktop.org/software/systemd/man/systemd.socket.html if
Accept is false, then a <service>.service needs to exist, if Accept is
true, then <service>@.service needs to exist.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

