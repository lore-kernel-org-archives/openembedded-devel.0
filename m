Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDuyY-0006Rn-90
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 09:15:18 +0100
Received: by yxe42 with SMTP id 42so1187060yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 01:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Bl0/cEfkcHo/uuDYaKGXwj2+ehA464hStOM/oZy9PmQ=;
	b=s1IzkfI547noniI63DxFruGVP34x9YQ/r/tSInHbJtZ1zJXLwGgbWoM7V8tKFlcJdu
	FT6y98i1KV6SQArFKnkRH8ye+2Gd64jLC1xQn1UeOZEG0Ma/XTye5tdBFsSpni2bzCQY
	2dyxbg5EGW9EDshRLAoQ61ICGLRtUyZmsMc+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=owsgU7TLveiLV72dKrJHiQMAi3xviiwGIRsuz6xD/HoLOKv1DQbAQ6sLTaMXfwKH2g
	+Hw81IcsBzjIWHrqZB/cJP05lFzfEbAtZLY9KQ5cQTgOEHJlHhyvI53zPaYsCRlrjVgJ
	YBlPi6G0UfoLDKzwJmWhbOZvJHBLo9J24QqtA=
MIME-Version: 1.0
Received: by 10.42.74.137 with SMTP id w9mr124754icj.201.1288858454271; Thu,
	04 Nov 2010 01:14:14 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 01:14:14 -0700 (PDT)
Date: Thu, 4 Nov 2010 09:14:14 +0100
Message-ID: <AANLkTin7ezNszYmWgBPY7+4Wf4s1bd2i91OPY3P_6qrg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, mickey@vanille-media.de
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: minimal distro, console image and bluez
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
X-List-Received-Date: Thu, 04 Nov 2010 08:15:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

When building console image for minimal I get:

ERROR: Multiple .bb files are due to be built which each provide
bluez-libs (/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez4_4.42.bb
/home/hudson/jobs/OE_test/workspace/openembedded/recipes/bluez/bluez-libs_3.36.bb).
 This usually means one provides something the other doesn't and should.

Guess minimal needs to set a preference...

Frans


