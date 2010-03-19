Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nsgms-00068H-CV
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 19:19:10 +0100
Received: by bwz20 with SMTP id 20so3297883bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=5vEJD1iTg99NM7bcIPOJoUQ94PPh/1SjfHr6KrGGBZ0=;
	b=egXYzpgiXUapXYpwV/aTlCXETOvvZD4fnvO/dYTSOmXc2oGAvBlVbTdO/qressw1HN
	aHopUwVX2Hbjf1girYlhw8osWVksan0rOXcdFO+0sgepLXSVT+C28IO1hns9kiPRAURH
	c4ko1mlGvZmqPXn09gDRN7EXPh2rgUHOAu5Gs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=FvPieffgP56lBGpywlCRSs+3WcTCbhBvk5sCXpda6ok+ycIRCRK2+pq9VtxHXrgwpr
	YkqXGcZsTtapSMbZdrkChngarZb6u1LZFKT0TXknDFqdndADGCs6nRCoEXhlvkxtOC6b
	IQD0rrZxB6EL7GaWcOfsEMotNp9J0Zkj3wMMk=
MIME-Version: 1.0
Received: by 10.204.83.132 with SMTP id f4mr1091473bkl.73.1269022564815; Fri, 
	19 Mar 2010 11:16:04 -0700 (PDT)
Date: Fri, 19 Mar 2010 19:16:04 +0100
Message-ID: <fca63bcf1003191116y59dac708x4f5108a922ea683@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: OE Mailinglist <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: {RFC} ssl-cert
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
X-List-Received-Date: Fri, 19 Mar 2010 18:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hej,

Is there some mechanism that allows other packages to automatically
create ssl certificates (such as the debian package ssl-cert that
installs make-ssl-cert ...).

If not, should we adapt something like this to allow ssl enabled
programs? How should we make it adaptable? (New local.conf vars?)

Regards,
Michael


