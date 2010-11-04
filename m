Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE9LY-0001SI-Jh
	for Openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 00:35:58 +0100
Received: by gwaa11 with SMTP id a11so1940323gwa.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 16:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=wXjjnAXwtHENXcZkQ3DB2iPQC/+pYRiB9nBlHhdsET8=;
	b=S8hWvUj9g6wUNs2akH4u/pcxVKrSkGfqReCoHcQ1hIHxGFbFIt+dsoU6nNLt3kas57
	Y6m1hSXZ6gxnJ9bG6vh1tuY9PkzyVfQmw/DG17DyAaZTHmClhu3Ig2LLL6WJNOJC+8Cs
	0lBNm1sA6KU9KIpUzNfH0yhFPWTbErtOgvgVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=LE1AtiFl6qO+wGBvzgDvAXkxbGcsU+s21+fpenvHmAzhGM5BRopD3eVBVIZN7MZS9r
	Oq5fFOGhtvWHdKqtnC1qPrOZVpbhH6X77t9nJjGXoA9PBPU4aW1YCex1KlAZdLyu0GrS
	ip9tIDGlynUpiGkW53hM+oJRluvc6uDPihxqc=
Received: by 10.90.15.31 with SMTP id 31mr421579ago.10.1288913702769; Thu, 04
	Nov 2010 16:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 4 Nov 2010 16:34:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Nov 2010 16:34:42 -0700
Message-ID: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Moving to layered structure of openembedded metadata
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
X-List-Received-Date: Thu, 04 Nov 2010 23:35:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi

In recent discussions there seems to be a lot of interest in moving
towards more layered structure in OE where we discussed machine
layers and arch based layers. There certainly are advantages to this
approach as discussed in other threads on mailing list
I think poky has already achieved that to a certain extent and has
made metadata changes
needed for such a structure. There are other polishing to metadata
which is beneficial in general like recipe licenses, gcc runtime
demystification etc. I would like to suggest that we adopt this
structure and use Poky as core layer which we
should always maintain in coherence and add the extra
machines,architectures and recipes as additional layers around
the base layer.

This will also help us to scale the project and
reduce the to and fro in merges as well as communities at large will
benefit by seamless flow
of patches and other contributions.

This will of course need a lot of work and I wanted to bring to
everyone to know if this would be a good approach moving
forward.

Thanks

-Khem


