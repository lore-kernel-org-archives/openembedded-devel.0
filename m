Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NaoDi-00076l-Lc
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 11:37:01 +0100
Received: by fxm4 with SMTP id 4so1712770fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=BFCjPDkhAVuThgiAXYibyk5Wr/79KJidHS3awykE0tc=;
	b=k23R6GrL3/5UNQJMSIpnmlTi0q1qZU8n1t1G1b/TyBlIlYahMMPFWjqnLt64vISutw
	BQjzuJTODOqBQwT1ude4xQ7CxN/lUyYApQWTYVlooGcCDwJyBXbE+jS77IPjEsXWiKzX
	J5mp8c7Pp41FjkJGi5uuE27Slcly46wn1CZJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=QI28AwTyIunt2oUuiwYkng+gjc92P+8OaRBdjgNXNtg7KMdllobMKHcSqTn3JME2s8
	z8l6Ig8io520Rqo6ErSIljD5hYyhwZk9neB2NkPfHuTbfEJUuV99tKYZOJ0iAUzvHazr
	OlRy1GoLK0GRC1Lq+jhltDMcLpvEm2EEE1qxk=
Received: by 10.103.126.25 with SMTP id d25mr230910mun.47.1264761274419;
	Fri, 29 Jan 2010 02:34:34 -0800 (PST)
Received: from ?192.168.1.2? ([62.218.44.194])
	by mx.google.com with ESMTPS id t10sm7980065muh.44.2010.01.29.02.34.31
	(version=SSLv3 cipher=RC4-MD5); Fri, 29 Jan 2010 02:34:31 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001291128.54560.holger+oe@freyther.de>
References: <n> <1264759676-23841-1-git-send-email-michael.lippautz@gmail.com>
	<201001291128.54560.holger+oe@freyther.de>
Date: Fri, 29 Jan 2010 11:34:59 +0100
Message-ID: <1264761299.23640.1.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 209.85.220.212
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
X-List-Received-Date: Fri, 29 Jan 2010 10:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 29.01.2010, 11:28 +0100 schrieb Holger Hans Peter
Freyther:
> On Friday 29 January 2010 11:07:56 Michael Lippautz wrote:
> 
> > +DESCRIPTION = "PERL database interface driver for the SQLite database."
> > +SECTION = "libs"
> > +LICENSE = "Artistic|GPL"
> 
> Use a space here, we do not have a good way to indicate dual licensing.

Ok, just looked how existing recipes indicated dual licensing
(dbd-mysql-perl).

> 
> 
> > +DEPENDS = "libdbi-perl-native"
> > +BBCLASSEXTEND = "native"
> 
> I'm not sure about these two.

1) Perl module needs libdbi-perl natively installed to pass a configure
check.

2) Maybe someone needs a native version of this, so I just added the
native extension?

Regards,
Michael



