Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OxsxO-0001Ta-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 04:51:54 +0200
Received: by wwi17 with SMTP id 17so840138wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=kn4UHftaqIsBB1DjPmL9ssJVCiYJf+FMVb8mqXvYUsc=;
	b=qajNtT0gdOdLhIVyE15po8SFRCJfl9CqRSIpYPrzpqffw4PxnWvZO9WIwfH3YmDNr6
	OHNM3NKrkgKPeB8U2W5j2EcziuUQcvyzeF//eL6aXfLwqhBJvGzD8v9ZemNpb6VVNKj0
	4a50nWG6gITqxgAzYmzh5TGuAEfwu9Jqa/vu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=wC0yAVa7JJFL6260bwSsCym+zuD2laglGzNwZXYd4GK2PI1CFzLlr0CskGiFGRkXPz
	PLwCfQ+x55Tllc3gfIREQc+hNWSIkvzbwmuAmBJ/OpyoXqwiBVQruaQYq/jwanNbkfZ8
	qaEGWBBH67Vi4URSc/HllyCJWrJ6fNAXgwGes=
Received: by 10.216.74.75 with SMTP id w53mr8563741wed.86.1285037497922; Mon,
	20 Sep 2010 19:51:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Mon, 20 Sep 2010 19:51:17 -0700 (PDT)
In-Reply-To: <1285023488-32159-1-git-send-email-eric@eukrea.com>
References: <1285023488-32159-1-git-send-email-eric@eukrea.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 20 Sep 2010 19:51:17 -0700
X-Google-Sender-Auth: 6HnztRZ3si3mwlIdT_xIhYVOFnU
Message-ID: <AANLkTikgg0KVLGxTzqgE0vY5vKY2sy8cR9j0sgPH01B+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] utils.bbclass: fix is_machine_specific
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
X-List-Received-Date: Tue, 21 Sep 2010 02:51:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 3:58 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> * base.bbclass can set a package's PACKAGE_ARCH to MACHINE_ARCH if
> it finds file:// in the SRC_URI and the corresponding file is machine
> specific (recipes/foo/foo-1.0/<some machine>/)
> * but is_machine_specific actually fails to detect these files as
> urldata.path is used instead of urldata.localpath thus preventing the
> comparison of the file's path with machinepaths
> * tested with bitbake HEAD & 1.8.18, with OE's tree alone and OE's tree
> plus an overlay.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>

Acked-by: Chris Larson <clarson@kergoth.com>
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

