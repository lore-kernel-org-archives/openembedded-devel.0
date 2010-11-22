Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKXW4-0005ZW-UN
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 15:37:17 +0100
Received: by iwn34 with SMTP id 34so94503iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=67tzwYwx8VJHVpc+YAJ57v74VZa8J5o14dr1N5Ij5qA=;
	b=lu5A4Ag+sj2AbvU70qX4d86GUuw+nKveqBllpgzJpsyS4vidFRzgP2WDX11fmEH+9k
	d4KYzJZMwJPbY0E8ehyXIsFx4VfhyXUhFU15YE/nCfgtBN6S7+BVzYUHuj2qK1sMMMou
	twnmgzdOtZi6FaxXX4W3k1dJ7C2aFE/HGfMcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=m4McN8bU3+DI7pqBjLS1JJG87/kNUSmiaONwa/LTcKCPQnEhgZHG4lBYyyxqL+0wxP
	0eiPkIQBSv4ce6g3AiSaODgghT/PU+VpRQ5d9PqBaAfrcHmhKE4nqPdTyIYRbbgw+8YQ
	DPHMgo+4MVCjFwCaSFoGFRxSD2Y390VxvXeRI=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr6834297ibe.101.1290436561685; Mon,
	22 Nov 2010 06:36:01 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 06:36:01 -0800 (PST)
Date: Mon, 22 Nov 2010 15:36:01 +0100
Message-ID: <AANLkTi=5Ypor=R4EXQV7D7gkQHFtPu+WukVMz1p57d3N@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ipkg-utils
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
X-List-Received-Date: Mon, 22 Nov 2010 14:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

ipkg-utils has two issues:

- the fetch from handhelds.org failed, so we need an update of the SRC_URI
- the recipe is misnamed. It is ipkg-utils_1.6+cvs20050404.bb but it
says SRCDATE = "20050930"

I can fix the latter, but not the former.
We need to resolve the handhelds.org references before the release!

Frans


