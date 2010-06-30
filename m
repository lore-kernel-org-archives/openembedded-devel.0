Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OU3Yh-0005YV-23
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 22:07:03 +0200
Received: by bwz11 with SMTP id 11so646476bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=K/WNVAITsMrM9fS3N+yQ9KqxqWeLruYwiWlF7PxotN4=;
	b=WBQwRpPXEE8oaMypql7FEn1EvGBMJKsZNr8oA9pKPdiXgzzOkF4fQ54kH9iG6bwIp7
	Zk5mOk8tcyFMqbmr+PRnlSaGzF1yPTeeI12Y8oXGgzabizHKzaeijoIgp9P9zh/cW0ut
	7lhCrO3to4xg3k002l3UEJonb6rKH6qnt3iek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WAqPYNpgRTozAxSyRy3OkNznuGFU8cGEnHirK2a66DOwAMd1BhwW5LeUnsQKFeqNJ1
	EUQhxYEEG5Qeu5WWeHeTIO0YsE/J3m25HmtunAokFjElWwNoM7izZmymRxmnd0tRtu2G
	8rbQLuSjM/HshWWlxw1DGI0jRpJcFBbYUQT1c=
MIME-Version: 1.0
Received: by 10.204.163.134 with SMTP id a6mr241651bky.43.1277928135793; Wed, 
	30 Jun 2010 13:02:15 -0700 (PDT)
Received: by 10.204.73.81 with HTTP; Wed, 30 Jun 2010 13:02:15 -0700 (PDT)
Date: Wed, 30 Jun 2010 22:02:15 +0200
Message-ID: <AANLkTimMVcS5I1GcVuqa1eTwZ4YIqb0NaJMqd1nepQYv@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC} cleanup glibc
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
X-List-Received-Date: Wed, 30 Jun 2010 20:07:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Triggered by a short discussion on irc with woglinde, I would like to
suggest the following cleanup actions for glibc.

1. rewrite the recipes so they do not use patches in the dir of
another version. Better copy those. That makes clearer who uses what,
and avoids problems if a recipe is removed.
(btw if people are against having copies, I suggest to put common
patches in a dir whose name actually resembles it is for multiple
versions e.g. glibc-2.4-2.5 or so)
2. remove some old recipes that are not pinned. Reason for removing
them is that it reduces the amount of work needed for step 1

currently we have:

glibc-initial_2.10.1.bb
glibc-initial_2.2.5.bb
glibc-initial_2.3.2+cvs20040726.bb
glibc-initial_2.3.2.bb
glibc-initial_2.3.6.bb
glibc-initial_2.4.bb
glibc-initial_2.5.bb
glibc-initial_2.6.1.bb
glibc-initial_2.7.bb
glibc-initial_2.9.bb
glibc-initial_cvs.bb
glibc_2.10.1.bb
glibc_2.2.5.bb
glibc_2.3.2+cvs20040726.bb
glibc_2.3.2.bb
glibc_2.3.3+cvs20041128.bb
glibc_2.3.3+cvs20050221.bb
glibc_2.3.3+cvs20050420.bb
glibc_2.3.3.bb
glibc_2.3.5+cvs20050627.bb
glibc_2.3.6.bb
glibc_2.4.bb
glibc_2.5.bb
glibc_2.6.1.bb
glibc_2.7.bb
glibc_2.9.bb
glibc_cvs.bb

suggestion is to remove the following versions because no one uses
them: (verified by grepping for them in conf/distro (with -r)

glibc-initial_2.3.2+cvs20040726.bb
glibc-initial_2.3.6.bb
glibc-initial_2.4.bb
glibc-initial_2.7.bb
glibc_2.3.2+cvs20040726.bb
glibc_2.3.3+cvs20041128.bb
glibc_2.3.3+cvs20050221.bb
glibc_2.3.3+cvs20050420.bb
glibc_2.3.6.bb
glibc_2.4.bb
glibc_2.7.bb

I think the following are also obsolete, but I would like to get
advise for these
glibc-initial_cvs.bb
glibc_cvs.bb

What do people think about this?

Frans


