Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O0cAm-00058k-F1
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Apr 2010 17:00:36 +0200
Received: by wyf23 with SMTP id 23so733080wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Apr 2010 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=Ck+mbbpFWzyEu4h1tNrkh2Ng2L8o/ZOUA1mcBwm8gz0=;
	b=tQSWjrExE2DjZaO/3bDLwm22qwBjmAU7jXzErY6Dfj6/2Fl1wJA0KeZ4NHxYPZDCkl
	54Ua3/38ECbGfqWh7KjirYWQIkNsCnvNwaFLb2RebNYw38hbQrhT6AJI8zZZWlRtYIud
	lDSHdwf3A4GIXNhwoMGuyvr2lA4RTzWmVZ0ko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=puS3TOIsj+3iJOTxrG/bv5+wajKcEnaKHDARJzu4K9fgh2csIL3dYsQYdLQb2qZeJj
	GhfjtYqM1egIKcsV1dUath+dOb5m2+csp5UWhAy/IrJi7hd4Yhgu9sqOHUkexJP66jTQ
	cHiwzpbrFNfZKhbnafbYXo0SBoCVye3x6Gm7Q=
MIME-Version: 1.0
Received: by 10.216.169.77 with HTTP; Sat, 10 Apr 2010 07:57:11 -0700 (PDT)
Date: Sat, 10 Apr 2010 18:57:11 +0400
Received: by 10.216.89.211 with SMTP id c61mr912416wef.86.1270911431837; Sat, 
	10 Apr 2010 07:57:11 -0700 (PDT)
Message-ID: <p2h48239d391004100757qfc124947l1c574a44eaba2320@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: /etc/passwd on squashfs and dbus
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
X-List-Received-Date: Sat, 10 Apr 2010 15:00:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

How do you people handle updates to /etc/passwd from dbus package (or
any package which updates
users/passwords from postinst) when your / is squashfs?

I just need initial configuration to work (creation of users and
groups), not anything else.

Thanks a lot,

S.


