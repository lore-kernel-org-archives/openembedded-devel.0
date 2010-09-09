Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ote7K-0008Lw-2b
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 12:12:31 +0200
Received: by gxk2 with SMTP id 2so549590gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oAcHGQVeaqIAd/blVWIFVnaDcgaPppeJ+7jjLQFcVMI=;
	b=Snba5cTp4N0GroT6tq0PomX4MNsjF/s1exQBHTw2KqJYakoz9iWKKvwy80eSSCXJax
	1jrXfw8AIbxors/ywzoOtiwJ5H16MFifiTl8OSE9l3XGHxWv0VjpkwcLSk/OWBma9jLt
	HTGT4tQhZ01+feTPmmCNDUO9PK4/rQfKqlTw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jJS/Oo6e72EbCi/cNoZWG4TCBwwQS3JrquRlWnNtNxvPY1uKY7j6FKu5+dCNLu/3E8
	71YLOG+wrgPunprt65Uty68o8+5a0C6nk9tlm9phRzQJIayWanRuiLSSnrmew7BPBov2
	jKRkoJCysalZLEMZuztvr7ftixEBrVGa069xs=
MIME-Version: 1.0
Received: by 10.90.52.7 with SMTP id z7mr135663agz.127.1284027106112; Thu, 09
	Sep 2010 03:11:46 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 03:11:46 -0700 (PDT)
In-Reply-To: <1284024609.28520.1446.camel@mill.internal.reciva.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
Date: Thu, 9 Sep 2010 12:11:46 +0200
Message-ID: <AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, tsc@openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 10:12:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 Phil Blundell <philb@gnu.org>:
> On Thu, 2010-09-09 at 09:11 +0200, Frans Meulenbroeks wrote:
>> 2010/9/2 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if this_soc_family and not re.match(n=
eed_machine, this_soc_family):
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (this_soc_family and not re.match(=
need_machine, this_soc_family)) or not this_soc_family:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("in=
compatible with machine %s" % this_machine)
>
> I am still far from convinced that this hunk of SOC_FAMILY code is
> desirable to have in the first place but, if it's going to stay there,
> clearly it should be fixed so that it doesn't cause problems for
> non-users.
>
> So, yes, your patch looks fine to me.
>
> p.
>
Phil, thanks for the feedback.

I'm not too sure on the usefulness of it either, but there is some
breakage so we should either revert the patch or fix it.

Actually the SOC_FAMILY got pushed before the review was concluded.
Technically it got the ack's but the discussion was still ongoing when
this was pushed.
What also makes it fishy is that all acks are from the same company
(which is the same one as the person who submitted the patch):

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Acked-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Koen Kooi <k-kooi@ti.com>
Signed-off-by: Koen Kooi <koen@openembedded.org>

I would suggest modifying the commit policy disallowing these kind of
things, saying the two Ack's must be from two developers not
affiliated with the same company.
(actually we might even want to take it further and saying that global
changes that affect everyone would require ACK's from developers from
more than one distro).

Question to the TSC: should the SOC_FAMILY patch be reverted and put
on hold until there is agreement whether or not we want this?

Frans


