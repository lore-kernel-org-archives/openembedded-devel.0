Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NF9hq-00015F-4Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 18:06:37 +0100
Received: by fxm8 with SMTP id 8so3340479fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 09:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=QvzS+oaXnWkMe8lGhoaNdDKhuIn9sEIXECWOGhbrgm0=;
	b=dJm5llnojbaPSsSMs31PjqIZEg8G4TH39o5lKpV+1tjIcb+ZTml5tRfqKPdNam6ZL9
	PlSTtdt7PG2Ho+rn5e3kbW7QKfdTdI77maMkufuBKBq+9BOJm1CMGDHquFddNrlpBZc9
	io+NcOLL3GrmMXndhC1DE5lBqbGprqTWHaDZ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JTQen/3KsWXhnLFBPCRGODwtonWrtBgwr62PT20tDyXBchIhQfJd0pVJNkgUSPtpR8
	jebeQwJ+P4CHcvFHDiXjdo3Nvxjftmg2EkbD6fIswMh+SgY6gAPm4QnR3mBhyjF+DRDi
	6AUM3tExQQwYeQhErvZ7FMgOOGhzA39JbdeVs=
MIME-Version: 1.0
Received: by 10.239.168.138 with SMTP id k10mr492347hbe.100.1259600699916; 
	Mon, 30 Nov 2009 09:04:59 -0800 (PST)
Date: Mon, 30 Nov 2009 18:04:59 +0100
Message-ID: <c384c5ea0911300904n6e031f61me6f732ef1dff28b0@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: libiberty.a removed from /tmp/cross for -native packages?
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
X-List-Received-Date: Mon, 30 Nov 2009 17:06:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

why is libiberty.a removed from /tmp/cross for -native packages during
the pre-amble?

i686-linux/pax-utils-native-0.1.19-r0/temp/log.populate_staging_preamble.26004:32:/home/leon/sandbox/nios2/openembedded/tmp/cross/nios2/lib/libiberty.a
removed


I'm tracking down an issue where one build from scratch has
libiberty.a staged in cross, whereas in another build, it is gone...

Thanks,
-- 
Leon


