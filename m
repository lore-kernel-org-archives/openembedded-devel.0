Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Owvza-00010U-8C
	for openembedded-devel@openembedded.org; Sat, 18 Sep 2010 13:54:06 +0200
Received: by iwn2 with SMTP id 2so2745742iwn.6
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Sep 2010 04:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=6WI1cY7s6L+fs4YRDG82U3lOtB+u1ZzVQonelmW3jj4=;
	b=VCv5gHszDGU1ywRJbR7OMm3D9my8xCuSt56FuoPY9AKaivvZUV0Q4mfbrZT4Z3EYov
	eKnk7n69TOwMGG1M9deqHMbbUrxW+bV569m/2jrvOLsNgCnVSJkLW2Mcssi0yq7XGlWo
	NumUeLBdnjHYUjxKukYnYu3T50m2Sr3ZAgi3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=K/26gdaL5obNw24Kyybv1u4+7GiK9rtAad/RouPrxB+LJ3dM96smn1GQt5Pi4W0h8x
	J4Zqq+B1Tty5nLN+3pLTGuLTlN11nTiIsK7n6yRF2vuL6fKEByjY86LepBRBeIrdoDjg
	pqQBTApcPU7QmvdhhfnYXNVUOhE1iVbbwiThk=
MIME-Version: 1.0
Received: by 10.231.170.208 with SMTP id e16mr6929131ibz.44.1284810795469;
	Sat, 18 Sep 2010 04:53:15 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Sat, 18 Sep 2010 04:53:15 -0700 (PDT)
Date: Sat, 18 Sep 2010 13:53:15 +0200
Message-ID: <AANLkTikymYraWDKtHZ0AFrhg5pFFCRuH9pPS1PQRsdCA@mail.gmail.com>
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
Subject: COMPATIBLE_MACHINE and no buildable providers
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
X-List-Received-Date: Sat, 18 Sep 2010 11:54:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bumped upon the folliwing issue.

If a recipe depends on another recipe but that one does have a
COMPATIBLE_MACHINE and you are not in the list, you get an error like:

ERROR: Required build target "xyz' has no buildable providers.

Is this desired?

Or in other words:
should this be fixed by adding the COMPATIBLE_MACHINE clause to the
recipe that has the depends?
Or should COMPATIBLE_MACHINE be allowed to trickle up so when building
a recipe that depends on another recipe that is not for that MACHINE
one only gets a warning.

This is for instance an issue when doing bitbake world.

Frans


