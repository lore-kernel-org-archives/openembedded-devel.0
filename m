Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MeQb9-0003bj-9H
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 11:39:51 +0200
Received: by ewy21 with SMTP id 21so573598ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zUuWDJonjNOdsR8qeAWMz4W6iWB3uxd3r68rBgH6TlQ=;
	b=rjCGXbKnEgvh1dwwBxW1VK1MvfbaPHbf8BAzhYtubjfmWAIlddiWRA+o9TcSpDpNMy
	3c3+T5FrGo37or1Lmmu1r0c5DyWzCajGqUFLf0JvvdXdtVIdI7ACYkKqGx9qbT8M2zfR
	xHRZKRryo4AGS9tVIf/1Q1OcZHo4w4iVa4Tw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XmE9qwHinNbpBRRZhUdw/mpXGlx9Hb16NYXzR+ocYGWhaqBLU8cL/0Xkb6IBhPKNZJ
	rYe/WcmMsl4jEvGmO3/LHN9FDiKDZfShsbzfdv/uo+36CRmIpH+BMmfMCuDSW/M/nvz/
	8Ws181rfUPQOZGlgaMztwMRuQILAqHzSTe5zI=
MIME-Version: 1.0
Received: by 10.216.26.205 with SMTP id c55mr170624wea.1.1250846546431; Fri, 
	21 Aug 2009 02:22:26 -0700 (PDT)
In-Reply-To: <20090818160147.GR2227@smtp.west.cox.net>
References: <d1b08f940908151458q6402d54akc9b00f6687261f19@mail.gmail.com>
	<20090818160147.GR2227@smtp.west.cox.net>
Date: Fri, 21 Aug 2009 11:22:26 +0200
Message-ID: <d1b08f940908210222w62cfd62cg67140faff6af2ff3@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Rebuild from packaged staging: issues with do_package_update_index_ipk
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
X-List-Received-Date: Fri, 21 Aug 2009 09:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I know this kind of rebuild is allowed: see what RP says in this thread:

http://projects.linuxtogo.org/pipermail/openembedded-devel/2009-June/011810.html

"Personally, I just remove
directories except tmp/deploy/pstage or change DEPLOY_DIR itself outside
TMPDIR...
"

This patch seems indeed to solve:

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index e3a7522..1772cad 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -85,6 +85,7 @@ do_package_update_index_ipk () {
 		return
 	fi

+	mkdir -p ${DEPLOY_DIR_IPK}
 	touch ${DEPLOY_DIR_IPK}/Packages
 	ipkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p
${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m
${DEPLOY_DIR_IPK}


Andrea


