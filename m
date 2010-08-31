Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqXRJ-0007ci-Lw
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 22:28:18 +0200
Received: by iwn2 with SMTP id 2so5963215iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=CUuxV2bviw4mgnRhlrNyFmuywmaOYI0mvBVF9fAoG8s=;
	b=OiGu8/18OwZmBaDv5fBYFLWB+AloP7Pv5LlmtZtS75tiZGd1r6FF1v0ykhSDUtq3dz
	kOEss9NF2NT4NyER6+mxCU/LH379myGcDqT0utYsi7rpxZboQzduM/5uKSlZxUoMQ0Nt
	zHoJLWKWAXc7rteGWFZ/Ltp+Sw0TZ2SkBzPZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=T/xDpPWXtt34uHn5lTmnKHw16A+3e1EC++qme/LFAEjbT0yuoCid3NJyiUG8QIOb7f
	MJvL3tk6g9LAYnrBmN2Mx4UXa2G5rYPNifTQSPsLejU3PH85qFV7Qa3tO8vwuWvo3xPo
	2FkBhQ7jPGuIzyr4SDOff1MLbbgTn5PisnnRI=
MIME-Version: 1.0
Received: by 10.231.191.136 with SMTP id dm8mr7840889ibb.75.1283286464349;
	Tue, 31 Aug 2010 13:27:44 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 31 Aug 2010 13:27:44 -0700 (PDT)
Date: Tue, 31 Aug 2010 22:27:44 +0200
Message-ID: <AANLkTimumzzaPyD=ebU_5io8UD_A_z3hd3LtxaeYtxka@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: commit 0ba9d6f94caea026c282d9d87704e4ada62babf0: qmake2: use the new qt4-tools instead of the unmaintained uicmoc recipes
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
X-List-Received-Date: Tue, 31 Aug 2010 20:28:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is the uicmoc4-sdk dep in this one still needed ?

meta/meta-toolchain-neuros.bb:                       qmake2-sdk uicmoc4-sdk"

and if not, should the uicmoc4 recipe be moved to obsolete to avoid
that people mistakenly use it for a new recipe? (apart from the line
below there is no one having a DEPENDS on it).

Frans.


