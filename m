Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Osiu9-0003Dy-PM
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 23:07:09 +0200
Received: by wye20 with SMTP id 20so5133721wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8dO+GjSmpvqJPLhDTlClxNFLoZXDu7W4zP7dAMLA22I=;
	b=xUPn/iGHyapwzuD+qVVi/rBpQDermxqsaO8yZvg90etiY5+G5gKUcXpDm6gB/hyrS9
	nVfQlP2hgYqRuNWUkgXCAsSauNJSPVmZN3oVCuU9JiHKq2V9Y9Ljo/DDv1AW7uoZrbS8
	74g5je/cQa4McXd4dOY+GMGqk4bMk+2E+Y4X8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=JDiaEV45W+pQyAAOp4nlulkD3dnzweQZI42kpyis68JUf5ZlK+yK2L2xsYjZdFEVEy
	jysnCSLL2mrk69nOT2MKiRnKM+Bn+F4PFX7dOdrhdNg9Bs488DBK1UlJ+qvbyamANPtR
	4e3ZC2g2ghY5eVuW3HCV7aYLBlvURXCNRuArw=
Received: by 10.216.158.18 with SMTP id p18mr1332247wek.2.1283807185150; Mon,
	06 Sep 2010 14:06:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Mon, 6 Sep 2010 14:06:05 -0700 (PDT)
In-Reply-To: <1283806652-8619-1-git-send-email-eric@eukrea.com>
References: <AANLkTinZzUuqZTPN_-XfqYPrQXgVcjPCQh34c2F9D0kX@mail.gmail.com>
	<1283806652-8619-1-git-send-email-eric@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 6 Sep 2010 14:06:05 -0700
X-Google-Sender-Auth: 14viPZdpFxgEwdbM4WZCV2CTBro
Message-ID: <AANLkTinp=X1NhM2=Jeg3cSO5=uLf=bSYfeKsgQ6d44UC@mail.gmail.com>
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
Subject: Re: [PATCH v2] lib/oe/unpack.py: fix uncompressing .gz .bz2 or .xz
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
X-List-Received-Date: Mon, 06 Sep 2010 21:07:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 1:57 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> * Actually, the uncompressed file is written into the source
> path instead of the destination path.
> * By also removing the source path, this patch should fix this problem.
> * An other fix could be to not uncompress to stdout but let gunzip|bunzip=
2|
> xz uncompress directly to the file.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

