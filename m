Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1RGdxC-0001XK-1Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 23:45:38 +0200
Received: by qam2 with SMTP id 2so1817803qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 14:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0Xu9BJCjW1O+dWztjwQBWdW2WoUtbttB64IqlfhoDZQ=;
	b=w8B1wlIVrg8gip7bdkPOPaqMFMPRARru8SdlYwcK14wXPnUffVu8pTvdV0OtEXVUqk
	nemWUrkWKTBXcilcQrxCuA6Ro098exW13BBOR8KvdXmxpTEJ7SlSJyHUtdXX2owcsvxR
	qCOjRAA/rDYlFhthc8Rnbu+f6dbWAs2poxRAI=
MIME-Version: 1.0
Received: by 10.182.13.6 with SMTP id d6mr560421obc.11.1319060385972; Wed, 19
	Oct 2011 14:39:45 -0700 (PDT)
Received: by 10.182.118.5 with HTTP; Wed, 19 Oct 2011 14:39:45 -0700 (PDT)
Date: Wed, 19 Oct 2011 17:39:45 -0400
Message-ID: <CAFu+nvF2BM344-+5wHCobJshpU=TtuaxD0_WR2CPisNSev0pnQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: DEPLOY_DIR and package_stagefile_shell
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
X-List-Received-Date: Wed, 19 Oct 2011 21:45:38 -0000
Content-Type: text/plain; charset=UTF-8

It appears that if you override DEPLOY_DIR to make the DEPLOY directory
outside of TMPDIR, then recipes that call package_stagefile_shell fail. the
sed magic in package_stagefile_shell assumes that the path will be in
TMPDIR.  Should the package_stagefile_shell be fixed, or should the recipes
that call it with ${DEPLOY_DIR_IMAGE} be changed.  the u-boot.inc and the
linux.inc have this problem.

