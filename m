Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NFljE-0005eq-AR
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 10:42:35 +0100
Received: by ywh26 with SMTP id 26so6443ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=CBMofldF6y/uexu+CyObkotmiBwrQSD+JZa7M3xmot8=;
	b=G2PecYPh1LbqqRWlJD1rTyaTH41pHU9MpGCyPgMg39ZIgmpMnX2P5U7dWj/4y/xhyF
	P81ttOYhxZQx6cx4K8nGUUzrtbT6DXx0yA4k24qyWPk6yKa0nea8zOq0tv2wkm3mHpfm
	bNwJ7KG3C1BpIACSBS0/Y3GVeUn0q9yp1h37I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xE90I8H70vctngrCsOLcBkm3R0pUEdSfwZRYdOH85oq1Wjvhtb/H5gAKuLc6HqXEql
	9d+LE4ePRMBPHT3WBwMzbC++6hUBQOF7h5KENUvn8IDhsrczokg6JOQMHlpdyEIzSdEX
	pq9BltB3beTg2BmOwoGswif455MOUs9Ifis+8=
MIME-Version: 1.0
Received: by 10.101.4.22 with SMTP id g22mr3131671ani.40.1259746856551; Wed, 
	02 Dec 2009 01:40:56 -0800 (PST)
In-Reply-To: <ad82c8890912020032t44008a96m4fb5d477050adbf4@mail.gmail.com>
References: <ad82c8890912020032t44008a96m4fb5d477050adbf4@mail.gmail.com>
Date: Wed, 2 Dec 2009 10:40:56 +0100
Message-ID: <ac9c93b10912020140t72082f3bodfd5bd9d955401b7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compilation error while building linphone
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
X-List-Received-Date: Wed, 02 Dec 2009 09:42:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Vivek,

This part is your problem:
NOTE: The MD5Sums did not match. Wanted: '0499a958a561781b125c740f18061ea8'
and Got: '6b459ba67d4ec47f106335ab741174c2'
NOTE: Task failed: Checksum of 'ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz'
failed

No idea why this happens, and cannot check locally now.
You might also consider asking in #oe on freenode.

FM


