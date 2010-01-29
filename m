Received: from mail-bw0-f209.google.com ([209.85.218.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NaoGw-00073j-1p
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 11:40:21 +0100
Received: by bwz1 with SMTP id 1so792896bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=1poCltsgjmYjzfBp6trHDrg7i7X+LSQelNoIqxf8/sA=;
	b=U1LGGOXWMnY8yR96KHig0fFbU2s81n1Q36Oaz9pnR5bO7GW5MRwqSoyfhQ3lCnR5yP
	j0eH20+TyY+zO159Xtt6/W7Y38+K3j00ZQhYC1rE3q7rcn+UYJv+nT0Ki0fXRnZuRNpw
	nJU+vbzuNYIiwXpflTRjVytGnhHRQz28zxd28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ScuvIXIgf9DfKdvkzHoCWnTpdk7ZAGFEk8x7Mm+EqRlkv5VDxhHdExQlW4vFlHpMfy
	eP/cKThaExtEQ5Kk8oheVN2Mc9jf7GYgNh6MZlOkcjIbzKw2n1etZIGIPaV3BWQb6Cq+
	TGYzwehKXaqYJMSno0j4OZjOMK0VLapn8RgvY=
MIME-Version: 1.0
Received: by 10.204.9.134 with SMTP id l6mr364047bkl.83.1264761474544; Fri, 29 
	Jan 2010 02:37:54 -0800 (PST)
In-Reply-To: <hjud6i$77n$1@ger.gmane.org>
References: <1264759676-23841-1-git-send-email-michael.lippautz@gmail.com>
	<hjud6i$77n$1@ger.gmane.org>
Date: Fri, 29 Jan 2010 11:37:54 +0100
Message-ID: <fca63bcf1001290237h587a2f21s41245c8ea593cca0@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.209
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libdbd-sqlite-perl: New recipe for SQLite DBI interface driver
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
X-List-Received-Date: Fri, 29 Jan 2010 10:40:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/29 Koen Kooi <k.kooi@student.utwente.nl>:
>
> That should be RDEPENDS_${PN}
>
> We did have a script somewhere to check for things like that, does
> anyone know where that went?
> And can someone more knowledgable about perl than me push these patches
> (after fixups)?

Just looked up the deps at CPAN and added them. Additionally some core
modules were needed that were not mentioned by CPAN (locale.pm), so
manually added them to the list.


