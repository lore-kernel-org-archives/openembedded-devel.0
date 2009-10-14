Received: from [209.85.210.171] (helo=mail-yx0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1My8e1-0000d5-AM
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 20:32:20 +0200
Received: by yxe1 with SMTP id 1so72075yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=aW0A7Oq3JTufnu6cqkteHXkH3tj39AW2oPbWkK4uMtE=;
	b=p+uOneVEqFGcoUNYgtPWKMSxU09RWMqzueyzNkMprYsFngkBZ4e3i+rR7pbxQ4ypzi
	cniwHsDDLVlA6MCXtn1L8aLywBm4lJOiaIGJ0QlBlqkSTcVsy3J3otP2NGMdMupVFxB9
	88uuysLAeu8uEG3j0iLrN2KdmIqzPmOdNvXl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bYAUz51/fhae+1CqTR6OM1R0C07o5dG/9P0iF4PwQgddJh9lPadB7dHb3Dj4vlehpN
	mlvQdGLjYJ26y/GGgDKbc9K1KA0DVq6/ILZO0SzhZWdAwExL11yGt/9QssPU9/sl/kO4
	MrL4CF6tq9T6uXDR94Uj/aijIEWPh7D3M0s0s=
MIME-Version: 1.0
Received: by 10.100.234.26 with SMTP id g26mr7659772anh.54.1255545081577; Wed, 
	14 Oct 2009 11:31:21 -0700 (PDT)
Date: Wed, 14 Oct 2009 20:31:21 +0200
Message-ID: <ac9c93b10910141131i6192dtaa0a60c7ad37a532@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openrd@googlegroups.com, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: openrd client in openembedded
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
X-List-Received-Date: Wed, 14 Oct 2009 18:32:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

I want to inform everyone that I added support for openrd client in
openembedded.
That is: I created a machine/openrd-client.conf, I updated the
kirkwood kernel recipe to the latest git head and I added a defconfig
for openrd-client.

Note that the git head does not support all openrd client functionality yet.

As far as I know the following functionality is missing/not working
1. SD/UART1 selection
2. MPP configuration (currently, default)
3. PEX
4. Audio
5. VGA

I expect the kirkwood recipe also to work for sheevaplug and openrd-base.
However I haven't had time yet to verify things with sheevaplug, and I
do not have the hardware to test with openrd base.

I've added a fair amount of modules, but feel free to let me know if
changes in defconfig are needed.

Frans.


