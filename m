Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1PkfUC-0005GW-9X
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 17:23:16 +0100
Received: by wyb40 with SMTP id 40so133501wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Feb 2011 08:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=437AJPh9ZHsIC1b6KYHNGuR2CDFT9cSPCA9lbT0LTTo=;
	b=GraxFdTL5CAMVjrJEy73tmlr4En2G/A9DhsVQg7s7tSmRS3of3HcGma1iZ5B3oGD/f
	oQ3f5pngj+CDnqVq7mXhw23sZyQQfvXDKH4OzLpRnMQLiP2pZy4CjKWTf2ad3uirqtJv
	4CeyOogO3vbxyGipQy5BkTEdbF+xIX40dqNAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dIegtzi/7ZNZnY1CunW+cKKhlwKex7zrV6huCYWP1qkMuN7JpVAG/TJaZNHyatSVva
	DFDbcR8BQRlhNTuRyILbJAJ53nmwDTa1HQwRK5E2vPB/MkMyHtzUM8GUgneI5JJuGzss
	MnVnVufAIwvKayZXqiRDwsbwmdr/lVOcLGnpY=
MIME-Version: 1.0
Received: by 10.227.137.19 with SMTP id u19mr5357645wbt.51.1296663740627; Wed,
	02 Feb 2011 08:22:20 -0800 (PST)
Received: by 10.227.141.139 with HTTP; Wed, 2 Feb 2011 08:22:20 -0800 (PST)
In-Reply-To: <E1Pkf0f-0007el-P3@melo.openembedded.org>
References: <E1Pkf0f-0007el-P3@melo.openembedded.org>
Date: Wed, 2 Feb 2011 17:22:20 +0100
Message-ID: <AANLkTimjc4ZOoWE1ACVgszVGPaYmdZ6Uru2p3HAU8DYx@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Mike Westerhof : SlugOS: slugos-pacakges. bb - change kexec back to kexec-tools
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
X-List-Received-Date: Wed, 02 Feb 2011 16:23:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 2, 2011 at 4:52 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 5a86c62884ed643b7396a49961a08ebf28e22f1a
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D5a86c62884ed643b7396a49961a08ebf28e22f1a
>
> Author: Mike Westerhof <mwester@dls.net>
> Date: =A0 Wed Feb =A02 09:50:37 2011 -0600
>
> SlugOS: slugos-pacakges.bb - change kexec back to kexec-tools
> (DEPENDS requires the recipe name, not the package name)
> Signed-off-by: Mike Westerhof <mike@mwester.net>

Mike,

sorry for the breakage.
While fixing similar cases, I was under the assumption that
slugos-packages had to do with feeds (packages) and not with the
dependencies (I still don't see what depends on kexec tools...).

Regards

Andrea


