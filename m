Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TZqc2-0001Iq-Cw
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2012 23:11:43 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so1207816vbm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2012 13:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=If6fs8LSPIfEBycSspcDf/MLWATZk2upai6betiSnqs=;
	b=v7Nf94N78Us0PK1nwrj2pCPCg6mnVpjFTQGZP8AxTveQd8alFtiUftSaBN+PHNjHMB
	SKkSXgV2jXa8/FNgvKlhbERASja6J/kLWS3m0RvdgmAPw2lVc5PcMpJ2EdZz85ummoVq
	5AlgjmK3Q6xIvPs40TfZt3+TN6R2Uu7ye0Jw8j4nwNssZrZ9r0gMMSpI8fXOykAlp5/e
	rXrKM3j5welSaqKSQyxrmNEotMpymGgy274QgZxQoypojRriHiphaJB5VVAi/9be1RiL
	b+uYwHm+6TOhQ9z2po7D3C5oEtt6dyEq4EwqxzPqi9clctFAh/d4Oeq7ibTEkpYxKc5j
	gTgA==
MIME-Version: 1.0
Received: by 10.52.176.168 with SMTP id cj8mr11634424vdc.72.1353189461830;
	Sat, 17 Nov 2012 13:57:41 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Sat, 17 Nov 2012 13:57:41 -0800 (PST)
Date: Sat, 17 Nov 2012 16:57:41 -0500
Message-ID: <CAOd_LFyo-7GmLS9AtdO8BXXVxGuqdQvoZqmHHsm+qGSittwVmw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: window managers?
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
X-List-Received-Date: Sat, 17 Nov 2012 22:11:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I did some looking into window managers in recent oe/meta-oe/angstrom,
and this is what I found:

matchbox
- is this still maintained?  Does not seem like a lot of new development.

xfce
- looks promising, but xconf did not build

gnome
- build problems

enlightenment
- builds, but got stuck with enlightenment_start.oe, no profiles
listed, so can't get through the initial dialogs on startup

twm
-worked, but is very minimalist

Questions:
1) any opinions on WM for embedded Linux systems?  For most projects,
we simply run a single full screen app, but a WM would be nice in some
cases.

2) any idea how to get profiles installed so that enlightenment can
start?  Is there any way to bypass this for a canned embedded
scenario?

Thanks,
Cliff

--
=================
http://bec-systems.com


