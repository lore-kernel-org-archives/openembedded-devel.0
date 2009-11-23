Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NCZN2-0003tH-VV
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 14:54:28 +0100
Received: by fxm8 with SMTP id 8so5755804fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 05:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=0fixLOwr98r7naWKp8vXQ04WYgxG4Cdyu7t1B8g8dTU=;
	b=m+T+0ikdBz0y9JfrsIfHpzsS0yOcsB7C3POk4Oruc6Ht9M3e+GT6nA3FCIey+Oydef
	7EudgVToQHtwyUGEKfExBrR28fp+klXamOKE2MJRYo3wuFiu/4FdpFg1hN5YNwsRCC99
	BUOxF8GNta6epzjJCoE/g8GlSPVKN8KIpwpks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=tmLwFphZmfTYH4pR0cgUjS3SQ5ONhLXe2Q8a3PGxGAPFsejipd9iqsql6bBoxmZF82
	+2w5JdX3PajG7umV8yWB8YYXc9oy863RWEopO/pqs/8l0KkII2BI5SCQLI4F6iUPhC9W
	Ju1hjCe3r2t8mURmdE4rp59x2nWQ0Z302BmJs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.183.21 with SMTP id s21mr462734hbg.5.1258984376921; Mon, 
	23 Nov 2009 05:52:56 -0800 (PST)
In-Reply-To: <hee2r8$bav$1@ger.gmane.org>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <20091122190547.GC3349@jama>
	<hedfru$gol$1@ger.gmane.org> <1258978516.10321.79.camel@dax.rpnet.com>
	<hee2r8$bav$1@ger.gmane.org>
Date: Mon, 23 Nov 2009 11:52:56 -0200
X-Google-Sender-Auth: af58f714ae60d7fc
Message-ID: <be7a9f3d0911230552y2e49df3cm4e847863de6f426e@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 13:54:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Nov 23, 2009 at 11:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 23-11-09 13:15, Richard Purdie wrote:
>
>> As I understand it you'll lock locking down the local build revisions
>> with Angstrom anyway?
>
> Dunno about that, ideally the SRCPV merge should have no impact at all on
> existing distros, but it looks like everyone will be forced to lock
> revisions/counts down.
> If there is a way to convert the database to a .inc file then we'd be a step
> closer to coordinating counts between buildhosts (or rebuilds from scratch).
> Currently the SRCPV looks like a major step backwards to the current
> situation unless you are on a single buildhost *and* never delete TMPDIR
> *and* use AUTOREV *and* care about upgrade paths.
>
> It would be a lot better if bitbake could just do the revlog | wc -l trick
> after do_fetch has run. Or at least use that as localcount if a snapshot
> exists in TMPDIR during parsing.

After looking at what SRCPV means for distro POV I fully agree with Koen.

It is going to add more problems then it solves. If a distro has more
then one buildhost it will be a nightmare to manage it and very error
prone :-(

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


