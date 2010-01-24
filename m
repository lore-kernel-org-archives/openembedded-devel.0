Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NZ0N1-0001sK-US
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 12:11:11 +0100
Received: by gxk7 with SMTP id 7so3481462gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 03:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZyQqMPMtZCQuttBdazbBEHqwESA1W4+IQPs2o6a6nNo=;
	b=L5vwKEXOg5VMXflwz8GrHgRiS0XqL2Zuwm+/I5VcJA+QdaSzYJxBhAh/5i8BW5+fx1
	ZJl5F0FKcMAK3lZ0fIMdDQ2qli9Gnqv1D+K+JPVL20e2WYzwQXAqNCZpe/fei7iZ6Dx3
	Jzb26z1aQTA8fLA3oz0JzXjYS76YP+8oeyCe0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BavQircc+K2os4gKUl+UAQbCIh47nDdLSY9UAS41Zf/lI02hDGLJHoe+cWR2L7X/kd
	1Cto6luLMUA4jl3N5aEDI2eK/WevMrQhtY1qobeI9lYYx80tzTgLJmkQ12BwqSKyIVj8
	dR+e7wTcPJGTIbJ0HfdCclJZ1F5DVnooCyazo=
MIME-Version: 1.0
Received: by 10.101.147.24 with SMTP id z24mr2179588ann.150.1264331328100; 
	Sun, 24 Jan 2010 03:08:48 -0800 (PST)
In-Reply-To: <hjh7f3$6v0$2@ger.gmane.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
Date: Sun, 24 Jan 2010 12:08:48 +0100
Message-ID: <ac9c93b11001240308h1550d966p9224974e89679819@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Sun, 24 Jan 2010 11:11:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

> With checksums.ini it's a matter of:
>
> either
>
> cat /OE/tmp/checksums.ini >> conf/checksums.ini ; python
> contrib/source-checker/oe-checksum-sorter -i conf/checksums.ini

What I do is have a local script in my openebedded dir which just does:

#!/bin/bash
git checkout conf/checksums.ini ; cat ../tmp/checksums.ini
conf/checksums.ini >tmp_sums
python contrib/source-checker/oe-checksums-sorter.py tmp_sums
>conf/checksums.ini
rm tmp_sums

after that when adding if the # of lines added is different from what
I expect (typically I expect 4 for one new entry) I verify while
adding.

Pretty straightforward.
Actually maybe I should even extend the script by doing a git pull
--rebase first and invoke git add -i after that (because typically I
add the checksum when I want to commit a new recipe).

Frans


