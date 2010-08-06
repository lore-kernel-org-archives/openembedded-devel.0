Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OhKFt-0004l9-Ez
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 12:34:27 +0200
Received: by fxm12 with SMTP id 12so3861697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=yQ3hpLI6bTbTHYi66gkuAjawvDTZP7jFUdmdsABaZ0k=;
	b=nuThGoV1sOdih0kwOFLZSswygzz8YCWK4L7T2IdgfTr/MQsUfO96z8a18jYYB6imoz
	MlPeDoUSPgbLziu1qi0fyAiqH1BBMoHQ2Gu433kaT5lFObPB/phUvaZBoPXK829maZI1
	P9C7LqLQvNyAuyEUanyYqAHo1tR9vKswO/drg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=r9jJ2hJJbgntXUryp/rCtYE1nZ58vAG5pEWvJqVfo7GLJi2A2Db1R1D8Q0dy1LOH3a
	LVr15D5xxLSSCTydQpJpP9hyTRInhKHQayCT3DBCxyUbV98AXBgcVqB0GNuInK+fdDUf
	l9OZuV35uZkjv3sg4KjrkJJ9Ej5Klak+44uV8=
MIME-Version: 1.0
Received: by 10.204.143.138 with SMTP id v10mr42550bku.133.1281090859070; Fri, 
	06 Aug 2010 03:34:19 -0700 (PDT)
Received: by 10.204.21.6 with HTTP; Fri, 6 Aug 2010 03:34:19 -0700 (PDT)
Date: Fri, 6 Aug 2010 12:34:19 +0200
Message-ID: <AANLkTinsm+MNgkpDw8X=TCV_V4vTFFmnAxSyhGA3fkvN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFD] openmoko status (and more specifically ./distro/include/preferred-om-2008-versions.inc)
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
X-List-Received-Date: Fri, 06 Aug 2010 10:34:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I was wondering whether someone is still doing something with openmoko.
Rationale for asking is that om-2008 pins a lot of recipes in
./distro/include/preferred-om-2008-versions.inc
Now that is not necessarily bad, but some of those pinngs are to very
old recipes. Some of these recipes use legacy staging, whereas the
leading recipe (which is much newer) does not use legacy staging any
more.

That brought me to the question is anyone still using this?
If not, should we remove om support (or at least release the pinnings)
so some of those old recipes can be retired.

And if it still used, may I request the users to either
- move to later versions (especially for versions that have a -native
variant or use legacy staging)
or (at your discretion)
- fix the recipe involved.

Best regards, Frans


