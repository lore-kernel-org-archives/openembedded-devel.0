Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1KnuHx-0000Gx-Ie
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 14:06:41 +0200
Received: by ug-out-1314.google.com with SMTP id y2so863457uge.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Oct 2008 05:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=GRwdEnT4cZQfxBRo02iAjY0LXq1YbGYfkXBSk1lw/to=;
	b=UaBnEE53HL5x+cDIb95qQrw+ajogCSwwQ1jJ2hscDDlZqjjXNNvX5vKGsevCzFNlZA
	pyU+PXQ0DwTuZuhFo9b9cNHnQ0/RnU1aFceS91MFQkhJqzEwzXl+s4Ced1uZREIRemjn
	0LjdHxYbQ//MoOhCorD0zVjFW5MxIXhLox0qs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=x4mDX0Dl3qt6p3mz/vTOsluz/Uw4bCO4/pMtqd7NqlGPyt2wVwiWhTDQXYghA5w0/s
	2NoKLa0IHJJSihNq6tzMDTyIKEzhgBcVC8ZVMSwecTg7J0AWC+X1/20BB5PXO8u6F39O
	ofpPg/LtJMZWhtACdCNYXEIk1wbVBJU1yBsVU=
Received: by 10.210.67.20 with SMTP id p20mr11561180eba.174.1223553719427;
	Thu, 09 Oct 2008 05:01:59 -0700 (PDT)
Received: by 10.210.138.17 with HTTP; Thu, 9 Oct 2008 05:01:59 -0700 (PDT)
Message-ID: <359c5480810090501k539d2479y7b36e8065ff0f775@mail.gmail.com>
Date: Thu, 9 Oct 2008 14:01:59 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: A question about ccache
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
X-List-Received-Date: Thu, 09 Oct 2008 12:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi!
this morning I experienced a problem building python-native as an object
file (compile.o) was in a wrong format for the linker.
I deleted all my $HOME/.ccache and have it rebuild without problem. Is this
a common issue?
I have different build directory setupped for different machine/distro and
some cron task that do dailly buildings, in this scenario sharing the common
.ccache may results in problems or it differentiates about different
compilers?

Regards

     Nicola

