Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oo9NO-0004ez-9r
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 08:22:33 +0200
Received: by iwn2 with SMTP id 2so298450iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 23:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=pkDxSf3QGmSSvebqPXoG0rxVmQV1ASQf8TKHF6KTTEg=;
	b=cpyF0ln27e/ShH/JZtpI/a5mgG1Xox3NMSU6eDSChHllgbXS/KKEGDJs60gcAAOl6u
	wxkfcWJEj9lNepCW2qQDBpMaMhe8Io/UXkoikWqJeVMa3C1mdIVtmHCtkb4J3WfTv8YL
	VFkHAuH4KnhNiMguAcI3U/UE2SIx1+bwH/6y0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gXu7qV1AeD2RSsdoVJ8IKaNST6yJgz4vgwHr9IYjkSq43MgIqyhKairDTzbzrikpBl
	qNAu+yH/4dQXvgl5xnGqy8VUFQI1B92HlPowjLdO0BSLBv3rr3kxaeIVqM7Ec35HAsxP
	V3GSq2mdJFvc1qU9iLecJ6Uq39FZkKmHvN1zM=
MIME-Version: 1.0
Received: by 10.231.35.202 with SMTP id q10mr9556808ibd.138.1282717303142;
	Tue, 24 Aug 2010 23:21:43 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 24 Aug 2010 23:21:43 -0700 (PDT)
In-Reply-To: <i51ku6$in$1@dough.gmane.org>
References: <1281459157-4103-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20100810171950.GA32300@jama>
	<AANLkTikVJFZcEO39CnBJfVBdVvjFohDM+E17kXZCmjrr@mail.gmail.com>
	<AANLkTi=9xFW0rcHUZ1tM9dV=Uw3sN8DVQgEpdWT7kQDc@mail.gmail.com>
	<i51ku6$in$1@dough.gmane.org>
Date: Wed, 25 Aug 2010 08:21:43 +0200
Message-ID: <AANLkTinPev+sOMubjKeGaKkB7-eoWx1Ks-7rWtEUJTye@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] conf/distro/include: remove unused versions
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
X-List-Received-Date: Wed, 25 Aug 2010 06:22:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/25 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-08-10 22:49, Frans Meulenbroeks wrote:
>
>> If I get no objections I will remove the last 3 versions next week (30
>> aug or so, somewhere after 16.00 GMT)
>
> I object

Koen,

It would be very nice to give some underpinning to your objection.

Can you please enlighten the rest of the community why exactly keeping
a few 4 year old include files around that are not used by any distro,
not maintained, and contain pinnings to recipes that do not exist any
more or are moved to obsolete is a good idea?
I realize that there is an infinitesimally small chance that someone
somewhere might be using this from a private overlay while still using
dev head. Then again, this person (should he or she exist) is probably
better off using e.g. the stable branch. And if this probably
hypothetical person really cares about this inc file it is still
possible to copy the inc file to his/her overlay.
Also if this person is so attached to this file, I suggest that he/she
steps forward and claims ownership (and at least makes it in such a
form that the pinnings to nonexistent recipes are updated or removed).

Wrt my proposal: I want to take the opportunity to amend the last paragraph:

If I get no objections with some form of reasonable motivation I will
remove the last 3 versions next week (30 aug or so, somewhere after
16.00 GMT) As I feel less certain on insane-srcrevs.inc I will keep
that one unless being told that it isuseless too. If there are
motivated objections I will raise the issue with the TSC for
resolution.

Frans

PS: while removing some old recipes a 1.5 week or so ago I carefully
avoided removing anything that is pinned from these files. So missing
pinnings are (most likely) not caused by my removal.
PPS: I'm very flexible wrt "reasonable", but a sole statement like "I
object" or "I object because I don't like it" is not really helpful
and does not help if the issue has to be escalated. Some indication
why keeping this junk around should there.


