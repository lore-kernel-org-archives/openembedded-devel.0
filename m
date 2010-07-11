Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXn5S-00011F-RD
	for Openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 05:20:15 +0200
Received: by gxk1 with SMTP id 1so2365396gxk.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jul 2010 20:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=eCkjCJ8hCPJPiG0KZNkuPIs5nA633Ifq+F8nmwiYU9M=;
	b=Uhh76xp0iYndLFzKRIFezudWIe1U2zXsbzFP17mPjcrZCDDRkXPzZq8PejiP/Li445
	cuxTpb49C6jJLXnfSLOi+FrSBx+Iw7HAj2E8mbuzhH5jUx94kXSIRkycKr5JifQ5HC6r
	19IYfxUE2O+lqqiswcf03oi0wvsgoN5+m9ZYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=eUoKYwrRScJztESC2/U85+q3etL0IelY2oZjW4meEWBpjFH2PVuYWV7vwJm8uDTJvz
	+/PGviBDoc0RFD9rbfU9eSvNmfHCDKlnh2/nwU7sRtmG0rAi2Darz2p9qf3DFuXgPHuo
	+j1jTBZi8YJ0EW76mfa7QkHlok4KdkiLnfu1s=
Received: by 10.101.154.15 with SMTP id g15mr9681876ano.222.1278818119230; 
	Sat, 10 Jul 2010 20:15:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.8.16 with HTTP; Sat, 10 Jul 2010 20:14:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Jul 2010 20:14:58 -0700
Message-ID: <AANLkTikEL9I5aLtumdNbBArvcOKbgV1x-Smm9dsOjS00@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Cannot satisfy the following dependencies for task-sdk-native with perl 5.10.1
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
X-List-Received-Date: Sun, 11 Jul 2010 03:20:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

I was daring to use perl 5.10.1 and ended up in this error

|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-sdk-native:
|  *    perl-module-encode-kr-2022_kr *
perl-module-your-module-here *
perl-module-cpan-exception-yaml_not_installed *
perl-module-dbd-sqlite *        perl-module-dbix-simple *
|


when generating the final root file system.

Any help ?

Thanks
-Khem


