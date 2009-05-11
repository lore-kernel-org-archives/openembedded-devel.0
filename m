Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M3aj5-0008Mv-RQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 20:59:48 +0200
Received: (qmail invoked by alias); 11 May 2009 18:53:11 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp058) with SMTP; 11 May 2009 20:53:11 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1963y4cIiB6Y7ue0pTQMdAuVrjwB3N4kDCT2xPtO5
	DR/8BFm4GxiCf+
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 20:52:53 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.28-11-generic; KDE/4.2.3; i686; ; )
References: <200905111744.00650.g.eismann@gmx.net>
In-Reply-To: <200905111744.00650.g.eismann@gmx.net>
MIME-Version: 1.0
Message-Id: <200905112052.53485.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67,0.67
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: image generation
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
X-List-Received-Date: Mon, 11 May 2009 18:59:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Lunes 11 Mayo 2009 17:44:00 G. Eismann escribi=F3:
> Hi,
>
> I am generating a image based in the micro-image.
> I have added a new package to the image and worked OK.
> Now, I have added several files to that package, but they are not in the
> final image.
>
> I can see the files in the install directory of the package, so I guess
> they are into the package.
>
> I have cleaned the package and the image, and built again the image. In t=
he
> process, the package is being built again, but the new files are lost.

Well, I have found the problem, but I dont know why it's happening nor how =
to=20
solve it.

When building the image, the release 5 (the last one) of the package is bui=
lt,=20
but in the "do_package_write_ipk" step there is an error because is looking=
=20
for the install directory for the release 1.


=2D-=20
  - Eismann -

