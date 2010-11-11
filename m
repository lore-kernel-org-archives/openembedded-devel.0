Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PGYRr-0000LL-DI
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 15:48:38 +0100
Received: by qyk36 with SMTP id 36so1103062qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 06:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=nWm1CSoVaLCulFkkjao5FDo28pGqAi96K92WSyNWhSY=;
	b=gzvjItpbDFg/eXHw1EtxcIQmE/EDjG2Co4Gujy/Smd+ddtL9ohFga/GVBL8iap8ofD
	wm96oTiFlZbWBFgytSBOnTFDo2estnZquq+CxeUfwsYrL8UGjpPGB3XXuHFLjZOf0Yg9
	P0AdOgrn5lfSQDHblYE4DEzYq6Sj0pSkRPIJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=MaZd+gTZaja0y9grgrbhioa0d1Sa06AVzbUxC+PRAP1ThRfzQ5+3UlAU0mKsJdjHUE
	cn6pP6/pbrI3mbh0wK4mMoFXDo96dofJL0x7ZJ+NdMVhu3DGBC+mrRn/Rbs5jumHCdjS
	aXfNRa0hKN3uS04on0I6CnnmVoh9r6rxU1B98=
MIME-Version: 1.0
Received: by 10.224.174.12 with SMTP id r12mr979321qaz.109.1289486843278; Thu,
	11 Nov 2010 06:47:23 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.220.112.210 with HTTP; Thu, 11 Nov 2010 06:47:23 -0800 (PST)
Date: Thu, 11 Nov 2010 14:47:23 +0000
X-Google-Sender-Auth: H4Sp1JjA7Cfy9tdSkbWw3AaBgcg
Message-ID: <AANLkTi=WuW6DmG2CyXqerMWcrDv5xyC-aKXfpaXqZhfZ@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [patch] removing bitbake install dependency on ezhhhhh_setup
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
X-List-Received-Date: Thu, 11 Nov 2010 14:48:38 -0000
Content-Type: text/plain; charset=UTF-8

it's pronounced "ezzzh" not "eee zee" and i have absolutely no respect
for or time for ezhhh_setup.  please accept my apologies for wading in
with a massive Big Stick here, and accept that rather than just
complain i actually created a patch which removes the utterly
pointless dependency:

http://bugs.openembedded.org/show_bug.cgi?id=5482

there's no excuse and certainly no good reason for bitbake to use
ezhh_setup.  to clarify what i put in the bugreport: i _literally_
have bitbake installed from git under python2.6-minimal: that means
there is not one single other package installed or utilised.  bitbake
is quite rare in that it has absolutely no other dependencies other
than python2.6 itself... so the question that really needs answering
is: what the hell is bitbake using an absolutely pointless
time-wasting download system that almost always interferes with
distribution packaging?

l.


