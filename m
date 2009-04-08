Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LrcGf-00034G-UC
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 20:13:03 +0200
Received: by an-out-0708.google.com with SMTP id b2so371676ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xNRY1PY23zITqQLYOcc5q63cQhP9Ecfjh8/J169Swfo=;
	b=NFRwYR3t6a8AdxpMNC851EQ9Qxi64V7xlqRCCa8uVmrFaODzwxgqrX8tbvtnIq+Gn3
	Lp72nW/6I4mg8SUthMzydGvAt4IHEpO2fraeygD9UiWPOjcNG3llrD5MZIAn5aql8NCS
	uLdEzLyisqAlt+4K3d9BWWn3zWv+K/LK04A7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ul25fmmOLi+aFL1BUSG+z9PLXfTqF7lFcnpd/3TSpSXyMMT2XA33tp6/eHdVSSs5Ok
	ZjfnUPEr94X2tt4pgbZ4RI8ipxtKw9YDmw5bJgUvVBYBneT2QnMWGDdhJrci2OF8biYA
	qRuMeMI6av7CCMeU2uAd4PO177whksGEioR6Y=
MIME-Version: 1.0
Received: by 10.100.108.2 with SMTP id g2mr2838602anc.137.1239214187582; Wed, 
	08 Apr 2009 11:09:47 -0700 (PDT)
In-Reply-To: <20090408175055.GM2195@smtp.west.cox.net>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
	<20090407165123.GE2195@smtp.west.cox.net>
	<d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
	<gric5v$qc4$1@ger.gmane.org>
	<d2b9ea600904080952g656823dby8c15a46b425f76c6@mail.gmail.com>
	<49DCE11F.90903@balister.org>
	<20090408175055.GM2195@smtp.west.cox.net>
Date: Wed, 8 Apr 2009 20:09:47 +0200
Message-ID: <d2b9ea600904081109ta576754r460fa993ee74dfe8@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.249
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 18:13:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2009 at 7:50 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> Hang on. =A0I (the guy signed up to own this part of stable) have reviewe=
d
> it each time. =A0The problem is there's been both general little problems
> and Esben has wanted the patch to go in both trees at once, which isn't
> how I understand Stable to work.

I don't seem to be able to find this policy described.  At least not on
http://wiki.openembedded.net/index.php/Stable

If this is an important rule for how to submit patches to stable, it would
really be nice to have it stated quite clearly.

Perhaps a small checklist to use before comitting to stable. Something
about remembering to test if it can build, have it tested in .dev
first, format the patch properly, use a proper subject string, and so
on.

/Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


