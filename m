Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MYUce-0003hZ-Us
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 02:44:53 +0200
Received: by pzk31 with SMTP id 31so4673203pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 17:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=mtNlmJsq87TAFh5KS56YuVa0wII315MU/DAlp+9xi20=;
	b=abr6tLny1+0hSyAITTG6yvfPjtXUaST0IOaL3XNQpFz4W7GAXlI9GUaGDH/AkRx7Ox
	oyZbvJvY2+k4NV15s8q8wHWLfJzOOFlh7oN/RKLhMxQIxgzBu1niG6Rp/lf9sjXoRYph
	SQB0FpHV4fLo7Fc2Ur6tmdVWBDo7Bweiv71Uw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=FQ0aR+ulzoGnnjzkw8S3O7A2gghSgMYT8aY4lKqOprubXK5E810DtTx6bTNXQU7C/6
	Qo2AqKrPitkdZkP4kNDhhCqMUtWwyr1CmucrZEroN5HHhwR4RFlnoatjeFjuFXwpQgpk
	9NH6jujAhtYUUZdz1cbyCdWHltIPlwfSVbii8=
Received: by 10.115.22.14 with SMTP id z14mr9514036wai.130.1249432154995;
	Tue, 04 Aug 2009 17:29:14 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	k21sm6691643waf.24.2009.08.04.17.29.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Aug 2009 17:29:13 -0700 (PDT)
Message-ID: <4A78D247.7090605@gmail.com>
Date: Wed, 05 Aug 2009 09:58:55 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fix libicu compilation with GCC-4.4 on mips
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
X-List-Received-Date: Wed, 05 Aug 2009 00:44:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Not sure if this one is mips specific or not, but linking fails due to
missing -fPIC on rematch.o.
| /home/grg/oe/tmp/cross/mipsel/lib/gcc/mipsel-angstrom-linux/4.4.1/../../../../mipsel-angstrom-linux/bin/ld: rematch.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used when making a shared object; recompile with -fPIC

Perhaps someone who experienced the (arm specific?) gcc bug mentioned in
commit 798c780a3a016e56d9b8849cf8a07521b6e402a9 can confirm this fix does
not trigger the same bug?

-Graham

diff --git a/recipes/icu/files/rematch-gcc-bug.patch b/recipes/icu/files/rematch-gcc-bug.patch
index 4d47056..5f516e3 100644
--- a/recipes/icu/files/rematch-gcc-bug.patch
+++ b/recipes/icu/files/rematch-gcc-bug.patch
@@ -5,7 +5,7 @@
  all-local: $(ALL_TARGETS)
  
 +rematch.o: $(srcdir)/rematch.cpp
-+	$(CXX) $(CPPFLAGS) $(DEFS) -c -o $@ $<
++	$(CXX) -fPIC $(CPPFLAGS) $(DEFS) -c -o $@ $<
 +
  install-local: install-headers install-library
  


