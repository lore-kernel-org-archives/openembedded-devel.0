Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NCcgP-0001HF-Vp
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 18:26:41 +0100
Received: by fxm8 with SMTP id 8so6001033fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=ugETPCk+Em852Ti4zuDVySHPb/A8mCTDEn3e+CE93jo=;
	b=WUhanX9FwRZYGfUeKehJHYA36U/tmo8iMj2xikoqHXuedL4dVy+Jyv0XSqqkwRJGin
	QCU+3OUzhLg41DGKu09OlqJjC0xg+gOMvR8bLEcYmWF602EdyWbaWMQrn/rQ4gmA13Sf
	z1OwgjHjaq3QKhJt4NinhTJcva4i9Ix4b1stA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MpHyey+sWbicVr1NEP9o4ZZbwb/Y37x9XcA/18h35DJP0i9kvTA+Uke26oAp5iXb8g
	Q6ZD7Y9tfGMcwC3CCmqRQdc99nR3IDgp3Em0XMo2Dbqk0yWkCLHsU25Ug0hyLTSVhj2W
	df+ORiIjy3QlKYE6bgdkwMWklmHodbYQUjspY=
MIME-Version: 1.0
Received: by 10.239.183.22 with SMTP id s22mr518994hbg.6.1258997109646; Mon, 
	23 Nov 2009 09:25:09 -0800 (PST)
Date: Mon, 23 Nov 2009 18:25:09 +0100
Message-ID: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: what is the expected STAGING_INCDIR for cross packages?
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
X-List-Received-Date: Mon, 23 Nov 2009 17:26:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

what is the expected STAGING_INCDIR for -cross packages?


Our STAGING_INCDIR for -cross packages contains two concatenated absolute paths,
one based of CROSS_DIR, one based of STAGING_DIR.

Both are absolute, based against TMPDIR.

Is that correct?


i.e.

CROSS_DIR = ${TMPDIR}/cross/$BASE_PACKAGE_ARCH
prefix = ${CROSS_DIR}
exec_prefix = ${prefix}
includedir = ${exec_prefix}/include

STAGING_DIR = ${TMPDIR}/staging
BASEPKG_HOST_SYS=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}
STAGING_DIR_HOST=${STAGIG_DIR}/$BASEPKG_HOST_SYS}

which are then concatenated for -cross packages as:

STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"


Regards,
-- 
Leon


