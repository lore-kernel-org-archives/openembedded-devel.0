Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kirtibr@gmail.com>) id 1MFimA-0007tI-Rm
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 08:01:06 +0200
Received: by yw-out-1718.google.com with SMTP id 5so1497182ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2009 22:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=TJZ5yetDWrJizgNl/sRapLqPXOlQ+BUP1lThC35arKQ=;
	b=ajYeBEOJzzwR12G2jxseCXM/R/d27wI81KRTyp7Z+RtLHx7PaR8cvk2dOPI62t3P1j
	3Tc5DDWhpA2bYziKNLZTLkBBVQOBHLmVbV9lRdUu9ivLcWnpc1WRtOBt5ds/JZKLq2E/
	5cEaHQTx1Tpu8n139eI67BOjVYIzeEBqODDo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AWR7WY7BwmIIt0GbN/zAcfZMXkxjyoyDhJ5BjK4Goq3ZOdJqZQ6CYKwimBjP0B+2pB
	J7CyoYLVS22PWWP6WNu/H6tfT0svAvZuSUeHoO1lAZFygw/WBUjFI/mH7uJaqJc4QFwf
	+s/8XKJ+vVFVTqVHeZyopR94pYKQAHL7JU4/k=
MIME-Version: 1.0
Received: by 10.151.85.11 with SMTP id n11mr10674885ybl.88.1244958661916; Sat, 
	13 Jun 2009 22:51:01 -0700 (PDT)
Date: Sun, 14 Jun 2009 11:21:01 +0530
Message-ID: <64d5b90a0906132251l51316419nb38733dfc1e49004@mail.gmail.com>
From: Kirtika Ruchandani <kirtibr@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OpenSSL recipe : files not being shipped in any package
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
X-List-Received-Date: Sun, 14 Jun 2009 06:01:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,
`bitbake openssl` builds the 0.9.8j-r2 recipe and gives this log during the
install phase:

NOTE: package openssl-0.9.8j-r2: task do_package: started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/ssl/openssl.cnf
NOTE:   /usr/lib/ssl/misc/CA.sh
NOTE:   /usr/lib/ssl/misc/CA.pl
NOTE: package openssl-0.9.8j-r2: task do_package: completed

Are these files deliberately excluded ?

Regards,

-- 
Kirtika Ruchandani
Maemo GSoC student
Sophomore, CS&E @ IIT-Madras
IRC: rkirti
http://rkirti.wordpress.com

