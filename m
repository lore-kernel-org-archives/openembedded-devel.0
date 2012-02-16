Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ry0Ks-0003JV-GF
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 13:21:18 +0100
Received: by pbcum15 with SMTP id um15so2055361pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=MGbDw351iUZ4m0V6A+UaqnCUilaz44buGuSjoyxGIUk=;
	b=SEaezam3mi/M3KgyrYmtLoIIqb+C/PRJhDlOr7YqLkDhN0TiEtLs8wh5NoA0oeTKBi
	JKWpMWS29mIGNs3/IqSF3iCAUdko9q0eG080nfi6EM5ELsfdxEuQDcC7pSDDgLKKjkro
	TgjG1KbPVFmrs4o0j8aobDTYl7BaFf1p0PrOs=
MIME-Version: 1.0
Received: by 10.68.217.42 with SMTP id ov10mr12927932pbc.85.1329394384868;
	Thu, 16 Feb 2012 04:13:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 16 Feb 2012 04:13:04 -0800 (PST)
In-Reply-To: <CALbNGRT+riFB=5BiR+r4g=t22U60ZAhChcs1iSFk_3j4eEQyTA@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoy3RRkOAjkGQXUnMw9EaU2rXasxw3bvWU+UrdhAJL53Q@mail.gmail.com>
	<CALbNGRRvhqQXqECfRD_PBTiK+NpiTrycthsPrU7Nhac4ifsAMQ@mail.gmail.com>
	<CAP9ODKrFQHjvVRswZ6UjFbAugiJmMFG-w7OYYiCfm8GLxLhMJQ@mail.gmail.com>
	<CALbNGRT+riFB=5BiR+r4g=t22U60ZAhChcs1iSFk_3j4eEQyTA@mail.gmail.com>
Date: Thu, 16 Feb 2012 10:13:04 -0200
X-Google-Sender-Auth: QUoTyCzDKgomiARKS8aOFVz3OzQ
Message-ID: <CAP9ODKq9xT+ZqCajjqDkM_-=Tkh8OJk0hKAugGfhXd6E=61Cpg@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Feb 2012 12:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 10:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> OK - but is it a problem to choose *.service? Will
> systemd-sysctl-native do the expected job?


Not really but it is a problem expect people will always choose .service
file instead of .socket.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

