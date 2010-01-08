Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTJfk-0008WD-PO
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 19:34:59 +0100
Received: by fxm4 with SMTP id 4so16386644fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xDb9yPQ5Pxwp7esIl6q3G0Kb/FRWU0f990K8oJWPYVc=;
	b=DuhxunVuHiYx4FDB9yehs2eK065jHf4a3LzRq+07ULWDYZa92t31mLX4SexaxqKOgi
	Jq9+2qdeF6O8G/tB1nR53PF2ZA7PtchxbYXMT/4pFVquGjoSaBt7yTEvNnDpQgqZgJHg
	Tpb8IvOalSV8En1U4m18/t1m7D/G/UKpoPMlk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EhvPJqZ9xIlcd8KGVQafygHyDXCmEDFPaQdHY3/CqPd3EqXojJE7HPKqP9vRAZ9vQC
	34Pe7QmqCkHKEnegtfyGYrYL5w1HyP+EW37To9bPBj41JxyaT7ojF7xd9XVqPQWI0Vph
	fW3Xx7N8qqNF6wQczWsVr90WmbosbvHFmNbmU=
MIME-Version: 1.0
Received: by 10.223.132.204 with SMTP id c12mr3635292fat.80.1262975570668; 
	Fri, 08 Jan 2010 10:32:50 -0800 (PST)
In-Reply-To: <1262965376-16205-1-git-send-email-Martin.Jansa@gmail.com>
References: <hi7e2e$cda$1@ger.gmane.org>
	<1262965376-16205-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 8 Jan 2010 19:32:50 +0100
Message-ID: <141020e31001081032o4b1d2fa1qf61607964a136271@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] update-alternatives-cworth: use /usr/lib/opkg/alternatives directory instead of /usr/lib/ipkg/alternatives
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
X-List-Received-Date: Fri, 08 Jan 2010 18:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

There is missing $, fixed locally
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0echo "'{alternatives_dir_new}/${alt_file}' is the s=
ame"

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0echo "$'{alternatives_dir_new}/${alt_file}' is the =
same"

But I have another successful test on image built before 2009-12-09 so
with most alternatives in ipkg/alternatives from -cworth-native

http://pastebin.com/m4bc4f1d8


