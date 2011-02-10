Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1Pnc95-0003xa-KL
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 20:25:39 +0100
Received: by fxm17 with SMTP id 17so1753648fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 11:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=uga9Ye2wQmWtDFkAvK8UNPsc5uzY5KfZpJiyTP4qcMI=;
	b=SZ93HYagB0/gT3sBflC50tvqX/vKliTiE+PqFimOy1cbTAArlWCUEK9KfegsDejOUh
	hMImTLjhe0ZbBtPFsNzwWO7r5MIXvDroRn9xRFW9uzrZJf2iZ82XzJuLNnV97rMmHaT6
	AMtzusrCKxA1pHNrT+EVirAcbbWMNBUZrpb68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=GMWfhnX1t2VQK8NettCLyEqvpqIkEscOIoCUkBptO7Dh/vGXbmtD3PU+hv5zX3nro+
	J4ktJ8HukYk9GT4+sqFSSpaG/UuiRK9IJGxKs3jLZVr1n7SVz9tCWhbZXeyZpcBjFn8Z
	fwIZs53ThBqO+fx8PJ7AT6PkwOb5pK5j2Ld8M=
Received: by 10.223.96.67 with SMTP id g3mr14770907fan.19.1297365874843; Thu,
	10 Feb 2011 11:24:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.114.73 with HTTP; Thu, 10 Feb 2011 11:24:14 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 10 Feb 2011 12:24:14 -0700
Message-ID: <AANLkTinb5Yueix_q94X84VpwHbAUBJ09myVj9DCTbE86@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: how to add multiple versions?
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
X-List-Received-Date: Thu, 10 Feb 2011 19:25:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've got

nodejs-0.2.6.bb
and
nodejs-0.4.0.bb

If I do
  `bitbake nodejs-0.2.6`
it builds 0.4.0 anyway with this message

ERROR: Multiple .bb files are due to be built which each provide nodejs
(/home/coolaj86/overo-oe/org.openembedded.dev/recipes/nodejs/nodejs_0.2.6.bb/home/coolaj86/overo-oe/org.openembedded.dev/recipes/nodejs/
nodejs_0.4.0.bb).
 This usually means one provides something the other doesn't and should

How do I make the file such that it knows one is different from the other?

There's api breakage, so current users may want to continue using the 0.2.x
branch. I don't want to remove that in favor of 0.4.0 quite yet.

AJ ONeal

