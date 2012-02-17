Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyTF8-00062o-44
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 20:13:18 +0100
Received: by vbbff1 with SMTP id ff1so2776504vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 11:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=dTU/Z7pbOI0Ab2ibW5KJ127O2M42i+NPXzW3Km4tBL8=;
	b=jomaMrHD3KBDYpiaHDr3YP7u2wruVIfslaqQUbaa46iQGlxsziYuC+bSHk/U/hjWWy
	Rgu6zKEveBU0TgEX1rDXoV7XN37JJ3NwNpe7HOsXi3ceUtB/FrjfMJ2TySLzmTNxpqBM
	xFh/NYn+/mRTqbcysFFBZ3IBtzyCURxuqKNIs=
MIME-Version: 1.0
Received: by 10.220.108.70 with SMTP id e6mr4796402vcp.74.1329505503326; Fri,
	17 Feb 2012 11:05:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Fri, 17 Feb 2012 11:05:03 -0800 (PST)
In-Reply-To: <CALbNGRTU6F7Yd1wQODe31XP4tNJqVhNdEvWO5KiUM-75T=Losw@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-6-git-send-email-schnitzeltony@googlemail.com>
	<20120217093459.GG5822@jama.jama.net>
	<CALbNGRTU6F7Yd1wQODe31XP4tNJqVhNdEvWO5KiUM-75T=Losw@mail.gmail.com>
Date: Fri, 17 Feb 2012 17:05:03 -0200
X-Google-Sender-Auth: 6t7IqnBOATJ4yCr45ZYN6eM5sfE
Message-ID: <CAP9ODKovximS_938ok1FS72HapPxd+d3UfPHyOyz2jrB9wfZPw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 05/22] automatically install all *.service and *.socket supplied in recipe's SRC_URI
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
X-List-Received-Date: Fri, 17 Feb 2012 19:13:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 16:44, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> * I the name 'systemd_unitdir' OK?
> * Would it make sense to abstract "${base_libdir}/systemd/system" (too)


I think systemd_unitdir only is enough.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

