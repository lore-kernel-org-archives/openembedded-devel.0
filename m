Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PKug3-0003n4-0C
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 16:21:03 +0100
Received: by pwi8 with SMTP id 8so1943920pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 07:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=PaJhMuTb2kiVVdeFSlt4mTjL8iXIOorN1HCkZOjUrrA=;
	b=NwjEhlaJriGpiBNRNSvAF3WhgwdRi7np2HQvQHLvX8zbxq09C+tpUEeqTRbFlnJKLJ
	ahB2H2gxmDfF9MxBCYWBelQNq2tKkXUD1Heg83E2cZS1Dnz379CneQJ5WvzUkpB9FI/8
	LrE7SvsTRqzOvvDrsO3zPuw2DKoKShsENaFBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=bud/a+P8aj4/+jtRCb7ELsb8mJZ7R/FEDwqXVUGM89gWqay8k67f8QOIEFF6010hkp
	fw/OSAnz2lggVAedUlApwTYzV6GDVMp8tNe2FsdQV0SUhyxQcIKVlMbS/jhjHKAecWWQ
	ZjXXJ7jxkMxDj8QguOj1mihT3Q31SGWhlb/C8=
MIME-Version: 1.0
Received: by 10.142.229.18 with SMTP id b18mr6812776wfh.414.1290525589244;
	Tue, 23 Nov 2010 07:19:49 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.142.154.9 with HTTP; Tue, 23 Nov 2010 07:19:49 -0800 (PST)
Date: Tue, 23 Nov 2010 15:19:49 +0000
X-Google-Sender-Auth: _EAk03Z2awdqZ7egR0Cfqj_vkeI
Message-ID: <AANLkTimVOOQ28E1NfJm5Rim4X+WmvXAtOSJ9W34KH7X-@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: openembedded / dpkg-buildpackage hybrid
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
X-List-Received-Date: Tue, 23 Nov 2010 15:21:04 -0000
Content-Type: text/plain; charset=UTF-8

folks hi,

there's a debian embedded sprint on in february:
http://wiki.debian.org/Sprints/2011/EmdebianSprint i came up with the
mad idea of modifying openembedded so that it understands debian
archives, debian/control and rules files, and back-ends into
dpkg-buildpackage and/or dpkg-cross-buildpackage in order to
recursively build entire debian archives.

so i wanted to ask people here what they think.

in particular, one of the challenges is that bitbake doesn't cope with
numbered version dependencies, which i know has been discussed before
(avoiding regex's) - i wanted to run the idea past people here: how
about doing the same dependency numbering format as debian control
files?  "Depends:" can be "python (>= 2.5) " for example or "glibc (>=
0.0.1, <= 1.1.3)" which is a simple enough syntax to not be too
resource-hungry.

and it would solve the rather awkward situation where you have to
specify blacklists of absolutely every single other version, but then
someone adds a new bb recipe for that library and of course breaks
_your_ build as a result, it's all rather fragile.

thoughts?

l.


