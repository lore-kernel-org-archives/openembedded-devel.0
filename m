Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqqAP-0006Wb-CC
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 20:09:49 +0100
Received: by mail-la0-f47.google.com with SMTP id fh20so8485358lab.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 10:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=vsv4oRfS4yUW98vrqy5flYhDMTQayI5AwuyEFab2e54=;
	b=rbclFqvthD9U3piYSemm06tufS5zRrkZcHzjUh7GB1he8uLNaUAZobTpVBTkHqgbE7
	dy0Z/IKqBDJg5cHYnH0QBv3pzZGOxm5JVnY10+rJmyI0L71Zj10AbTrFTP0DNlmhPXur
	Qgc/tRfQx67zF9+6l88eDp8X04M1k/kHiy4fSEJxONTP6p8L90zxGHWRqYOUdpwfBmX3
	4MtxFwlAG/zCfQslIBeDKZ6+ipmzw4Dr+n0itnc09j3DkgCj+6vgUDHRsaB/C5VLbyn6
	RhwPevGlkJPJgFRbQvsZniybvu+XOZS9vZX886friJLupMgWO0CtVSPTJp1QHy8bQo2z
	HSFA==
X-Received: by 10.112.26.169 with SMTP id m9mr13155688lbg.116.1357239261184;
	Thu, 03 Jan 2013 10:54:21 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ne2sm18696759lab.10.2013.01.03.10.54.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 10:54:19 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1Tqpvl-00059i-8t
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 20:54:17 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 20:54:12 +0200
Message-Id: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Prepare recipes for automake-1.13 (batch 1)
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
X-List-Received-Date: Thu, 03 Jan 2013 19:09:51 -0000

This batch is just three patches - most likely just drop in the
ocean of automake-1.13 problems in meta-openembedded. These are
kind side-products of trying to get things to work in
openembedded-core side.

Below text is about all the work I've done for automake-1.13
compatibility so far - not all of it is relevant to this batch.

--------------------------------------------------------------------

In practice there is three categories of changes in automake-1.13
that cause packages to break. From that follows that virtually all
problems fall to three categories, and all packages suffering from
problem of the same category get virtually identical fix.

* Long deprecated macros completely removed from automake-1.13,
  which errors out upon seeing them. For these I add patch,
  always called obsolete_automake_macros.patch, that replaces
  obsolete macro with proper one. Most of the patches are just
  AM_CONFIG_HEADER -> AC_CONFIG_HEADERS change.

* Trying to run help2man via "missing" when it doesn't exist.
  Old automake versions allowed "missing" to be used that way,
  1.13 aborts. I'm just removing the attempt to create manpages
  that way. Note that it never actually worked anyway -
  old automake just didn't abort when it failed.

* TESTS list cannot have $(srcdir) or $(top_srcdir) as part
  of the path. When it does, it's usually bug in the package,
  but unfortunately automake prevents it also when it's not.
  Solution applied here is to simply remove TESTS.

--------------------------------------------------------------------

[meta-oe][PATCH 1/3] tslib: replace obsolete automake macros with
[meta-oe][PATCH 2/3] libmikmod: replace obsolete automake macros
[meta-oe][PATCH 3/3] libmad: replace obsolete automake macros with



 - ML


