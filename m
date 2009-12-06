Received: from mail-yw0-f190.google.com ([209.85.211.190])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NHG4n-0005Yp-5t
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 13:19:00 +0100
Received: by ywh28 with SMTP id 28so4301717ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=PjFyB3NXxPQimtct7vVDHlKo77bq3Or3EQnVOcZXERo=;
	b=KYutgwY8iexaACPPGru3m1ygRyuNtzOU8iV5UBbgy5AMzcn240fnA50jCKNM9siQCa
	3DswRZTcwo8rC7TNOuKtsVpoSHNEQDJ616kfCzondJUUgrishHay12FM15CEAEzzf+sQ
	LMxQf+nqrQDw4ivNPEXRYVDXWTCSxNfSF+PaA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wYKmMIRuJ5pJgj1BVDFSELtTH9V3oHB/A2V5EgjrBJGMVT4HJ3UXCXkYjlmqlRfys+
	hzSuXjRHkWi6wDUAtlnGsMvaFwXgg5MwbzmPuuBbCC6x0lF3yRmn+NKQDyxubxKNw4yB
	yRGNn/JGxZHECW6GVnGSH/vsH8xuzCOPNnrgk=
MIME-Version: 1.0
Received: by 10.100.243.34 with SMTP id q34mr5055742anh.150.1260101836274; 
	Sun, 06 Dec 2009 04:17:16 -0800 (PST)
In-Reply-To: <20091202114959.GA8668@zlo.nu>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
	<20091201194025.GB11505@denix.org> <4B1611C3.7050101@SSpaeth.de>
	<20091202114959.GA8668@zlo.nu>
Date: Sun, 6 Dec 2009 13:17:16 +0100
Message-ID: <ac9c93b10912060417x27e41790k5c1826d19898b7dc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.190
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Sun, 06 Dec 2009 12:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

It would also be nice to be able to get the used by information.
E.g. if I change a package (especially wrt staging) I would like to
verify that the packages which use the modified package still build.

The current el-cheapo solution for a package XYZ is to do something
like a grep  DEPENDS.*XYZ */*.bb but of course that won't work if
DEPENDS spans multiple lines.

FM


