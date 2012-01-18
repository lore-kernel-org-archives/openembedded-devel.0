Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RnWwf-0004r3-5N
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 15:57:01 +0100
Received: by qcsp14 with SMTP id p14so2588523qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 06:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=T3U9jX8cDcQ9s6OhiNCFpoP10nql0uZo7ExH0GUCzMw=;
	b=MCufoi8hI+VSnKAf0VZO2MCy+l73joukkpBSg0DomcLw+6yNVYEB5aEW9Sg28DKieV
	0gjvINTdC86hxikIzrsVRHgaPGir73LwAeiZ4BofNnMJk7aBAElygq919CvhUM+Oq2yh
	uaSTn0k1XZXR/W3EE26i5ns2g9iDK0qUMkLFU=
MIME-Version: 1.0
Received: by 10.229.106.35 with SMTP id v35mr8972425qco.84.1326898162208; Wed,
	18 Jan 2012 06:49:22 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Wed, 18 Jan 2012 06:49:22 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C402354D3@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C402354D3@post.tritech.se>
Date: Wed, 18 Jan 2012 07:49:22 -0700
Message-ID: <CA+M6bXknfM8wUn+4veBsabFL6cRLxpqA+P_NNGpNv0o=zPOrVg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Packaged staging, anyone?
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
X-List-Received-Date: Wed, 18 Jan 2012 14:57:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2012 at 2:33 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> w=
rote:
> Hi,
>
> I'm trying to set up packaged staging for my project. I found some instru=
ctions in the packaged-staging.bb file header and some info in the mailing =
list that I followed but it don't seem to work. Everything is built from sc=
ratch anyway -- no error messages.
[snip]

After populating the pstage mirror directory, when you do bitbake -e
somepkg (where somepkg is in the pstage mirror) do the PSTAGE*
variables expand such that the file it's looking for as a pstage
exist?  What if you use python or some other trivial http server and
try and use the mirror that way?  I seem to recall I had an issue with
PSTAGE_MIRROR and file URIs but I forget if there was a good solution
to it (or if making use of python -m SImpleHTTPServer was the
solution).

--=20
Tom


