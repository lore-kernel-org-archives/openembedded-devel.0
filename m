Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PaEBZ-0001Pm-1v
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 22:12:53 +0100
Received: by iyj18 with SMTP id 18so14033972iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 13:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=oTBqXI2L9rTLMWb5IX7D8SJ/b1Ej6GvqE0y5L5yzzh8=;
	b=f/eokXhVJWkkLIUlssZ38H2ojo7usLEKrVcgO45Na5Cv3CaqYzWi7GFs1k6xlWnnbj
	h3npAR+C9F6CveTBByEFh5gPEmT/g+uZ829FTx4VYAbScgzVJHl+oP+7mXaHovAsdAeK
	cqMQyS5Zt4PE8IKhXNo9/h6RcQwTKxB6c/bwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AU3sKPtXHhdH8CgkDpbyHnfSDsJYCROa+lnufPGZjDlsCqVlq7DB1FHs9cOCt/x1s6
	3GgtpP+MbmCwFdHsnyL63qY6qVxpKiZPazAta71bLLde8U7pGXPO6f/m6g2JqhpNGCID
	Bgci277YyGtWmIkHlR1eR7GX20u/pWQHePVP0=
MIME-Version: 1.0
Received: by 10.231.199.77 with SMTP id er13mr6330065ibb.44.1294175549623;
	Tue, 04 Jan 2011 13:12:29 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Tue, 4 Jan 2011 13:12:29 -0800 (PST)
Date: Tue, 4 Jan 2011 22:12:29 +0100
Message-ID: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Tue, 04 Jan 2011 21:12:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm in the process of upgrading the sheevaplug kernel to 2.6.36. I
noticed the current version of 2.6.36 is at patch 1 but 2.6.36.2 is
already out.
Guess this needs some coordination with the other users. Currently the
recipe says:

DEFAULT_PREFERENCE = "-1"
DEFAULT_PREFERENCE_mx31ads = "1"
DEFAULT_PREFERENCE_ts72xx = "1"

Seems Petr, Eric and Robert are involved in these two machines.
Care to comment on moving to 2.6.36.2 (or give it a stab)?

Frans.


