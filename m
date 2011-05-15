Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.betz@gmail.com>) id 1QLSoR-0000GA-BE
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 06:20:15 +0200
Received: by yxn22 with SMTP id 22so1351256yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gohiCm7dgKEAaeMbcENTGV3BZmkK3CjfvTA2olNzHjA=;
	b=W7mpCVrRNUSpldvkTC2D5+uXa2VQOVWmKBkVeQTV7FOdfvzUKazX9xdQpY3ExWSi+S
	HLYNnJsW2blJHh+fbnGUXMNIW1qQ2PHAMf3RrcnUdGs0tRBPo2WPrWkYcEo/NEnnTX6X
	AdH+xKroDrQ/q3FBn7U9CNOePWUIWmRv9yYPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vGf9eDjCXqmC74QBkF0Com4DFKq7tP56FwUGpLyT2/Yyikf7RLLS7FvRrquLLQioga
	9CJIRznEt2PxLEMTOZ+gJvNiGYHX4XNiWyAD0DAl1tHwjWKg7P99ijAdDgmh4bbyrEWJ
	1SJkeAIWWL/ddsxU3IKNJmkkzgVmFapQb4NfA=
Received: by 10.236.26.41 with SMTP id b29mr2831643yha.425.1305433043050;
	Sat, 14 May 2011 21:17:23 -0700 (PDT)
Received: from localhost.localdomain (c-71-224-42-18.hsd1.pa.comcast.net
	[71.224.42.18])
	by mx.google.com with ESMTPS id d20sm2872853ang.43.2011.05.14.21.17.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2011 21:17:22 -0700 (PDT)
From: Christian Betz <christian.betz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 00:16:51 -0400
Message-Id: <1305433012-13000-1-git-send-email-christian.betz@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
References: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
Subject: [PATCH] fix acpid compiler warning on some platforms
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
X-List-Received-Date: Sun, 15 May 2011 04:20:15 -0000

Thanks for the tip!

I will investigate getting this upstream. However, I may need some
guidance figuring out where upstream is.

acpid itself seems to be either extremely stable or unmaintained
(nothing in a very long time on the sourceforge page).
the patch in oe is simply called netlink.diff. Google lead me
here where you can download a tarball of a modified acpid-1.0.10:

 http://www.tedfelix.com/linux/acpid-netlink.html

however, no patches are provided.

there is a launchpad page which documents that ubuntu seems to be
creating patches from acpid-netlink

 https://launchpad.net/ubuntu/+source/acpid/1.0.10-4

My best guess is that upstream is actually acpid-netlink. I will try
to make contact.

The real question which involves deeper investigation is why oe
doesn't just pull directly from acpid-netlink (i.e. is netlink.diff
just cherry picked changes from acpid-netlink?). 

I never considered how difficult it can be to find upstream!

Christian



