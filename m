Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P4rLo-0001FZ-As
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 10:34:12 +0200
Received: by vws3 with SMTP id 3so244846vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=+3iFNrKHoZhnMhVl8Ff2LLiiiepwMDhYY+acD+uWLkI=;
	b=hqz9PZXuJVgEM54x+LVasrXQlL45VzrAbxEDcAkz1sY4hgxZhpwzyWX/xKW6rtt036
	l4EcLG1zGzTkrUdBnG0sN+3szYBesJ/k71pdYrsXdUrsV2CBZbuGReyJmjSX6D1RuGDn
	q7GWh+ZzuCRNoHe+7J6iWGRfsG+iF14Ml+Acs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iJlhJm8x1w2BBocn0V/j2AFy2UGOUORiDo0b2yn43oxPLzU/KkYUh9qWaG5SO9Yp4+
	dl6z3i2KbQCzcA3sniy00RUMz19KKAMr27ZMLa+T7O7X5YQhJOEnTZh9aoStxV+Ws5GL
	DlBSpo6C/CONg5iK/TlgxZjBvu1r5ppZuAFuo=
MIME-Version: 1.0
Received: by 10.220.187.200 with SMTP id cx8mr1450510vcb.142.1286699593690;
	Sun, 10 Oct 2010 01:33:13 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Sun, 10 Oct 2010 01:33:13 -0700 (PDT)
Date: Sun, 10 Oct 2010 01:33:13 -0700
Message-ID: <AANLkTikXgD1ULsL7Fc3jQ45vDEH4ECqsG7s6KHRhJ1op@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Question on writing perl lib .bb files
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
X-List-Received-Date: Sun, 10 Oct 2010 08:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am trying to add a few more perl libs into my build that dont exist
and I have seen some that have dependences and others that dont. So I
wrote one for Net::Whois::ARIN and tried without what CPAN says is the
dependencies and it built correctly with no errors I installed the
.ipk and went to try the build of a program I wanted to try on my
overo and it no longer complains about it missing that. But why do
some perl lib .bb use depends and not even all the depends that cpan
lists and some list none even though according to CPAN they need them?
I will post the .bb I wrote as well, thanks for any info on the
correct way to do this as not sure if what I did is enough to properly
get the lib for perl built

DESCRIPTION = "Net::Whois::ARIN   	whois arin "
SECTION = "libs"
LICENSE = "Perl"
PR = "r1"

DEPENDS += "libtest-mockmodule-perl scalar-util-perl libtest-exception-perl \
	    test-harness-perl test-more-perl libsub-uplevel-perl \
	    libmodule-build-perl carp-perl universal-isa-perl \
	    universal-can-perl io-socket-inet-perl "

SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TC/TCAINE/Net-Whois-ARIN-${PV}.tar.gz"

S = "${WORKDIR}/Net-Whois-ARIN-${PV}"

inherit cpan

BBCLASSEXTEND="native"

SRC_URI[md5sum] = "a5aee39187c6272acd2a77e30847fdef"
SRC_URI[sha256sum] =
"d47a6720ff265674cbd918d866c73221be9916d81e1c30ccdb0d49e6b45110e8"


