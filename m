Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKJB1-0006j4-Bc
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 00:18:33 +0100
Received: by wyb34 with SMTP id 34so1940262wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 15:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=thX75UoWoZjYAy883iXNYYMFOuw13okrBiFbmuREV2w=;
	b=K/B7CuKyXjUvt3twtmMog+AK9XCeVYgeee/8OCuW9trYb0HVoqKVPv2g7p6nPLjmwS
	J/dzHVchBfCaj8und4xbgpzJJ4hKG1qb24oZzscyF4WKSmAtZMQy8X2EwtmwmS4LQIqb
	ZKq4LCZvZTXUHhCSXsm3mhVII2Lf0MuP7VLK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=LNsli/xd9dgTayNPlWz4HScdODww+5qJsbCm90oxm67PVFLCEVlxkhFAT19DZZhNDb
	VcFV6InTrCIB1Rdro3f8vIJT/WGsM2YbHdHdNOa87j3P/QmIBPM3Z8pEqhSksn6S3vBr
	akxqcIDqNMRo6PvvXAyahr2Q5qJDA0lGSA3Lc=
Received: by 10.216.239.199 with SMTP id c49mr4406773wer.12.1290381435174;
	Sun, 21 Nov 2010 15:17:15 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sun, 21 Nov 2010 15:16:54 -0800 (PST)
In-Reply-To: <1290368520-9162-1-git-send-email-eric@eukrea.com>
References: <AANLkTimB+pvrtjXGMrHds-MDQC5SOMw-kS=L5fG6UAGb@mail.gmail.com>
	<1290368520-9162-1-git-send-email-eric@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 21 Nov 2010 16:16:54 -0700
X-Google-Sender-Auth: nU4KCxQRnTPtx4pkx0ZKcLxtTqE
Message-ID: <AANLkTin+EJVmRCh2otCbFPDE895YbNjjp47Kzk7TiZMF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] handle PACKAGE_ARCH change in an amend.inc
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
X-List-Received-Date: Sun, 21 Nov 2010 23:18:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2010 at 12:42 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> * setting PACKAGE_ARCH =3D "${MACHINE_ARCH}" in an amend.inc actually
> leads to a package with the correct machine arch but the
> work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
> updated after amend.inc is parsed.
>
> * this patch :
> - factorizes the code which compute MULTIMACH_ARCH in base.bbclass
> - updates MULTIMACH_ARCH if required by an amend.inc
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>


Acked-by: Chris Larson <chris_larson@mentor.com>

--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

