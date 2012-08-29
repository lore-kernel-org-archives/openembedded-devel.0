Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fredrik.markstrom@gmail.com>) id 1T6hj8-0000sI-FR
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 14:50:34 +0200
Received: by vcbfy27 with SMTP id fy27so495603vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=EUIhndJ+Pw9NcZnunToFoCL+2Uqqa3JuI5QT26t6Jko=;
	b=YyjlVZMEHDVtiPg8jzvturVfHdVODkSh24/mLxC0VI5EibQuHnLWjAvo3NEGHgGd09
	BI/GRsNhsEW/xOBshx7MqIFUYHER6AtPIJoEFvbm6ALr5qrQF4V2XXQuF/HrUirypNpx
	+CRmh2j3v1s/b7n9+7Xqb0L8m68k4BthMYOl0WRdftPXKeXszgL/EqdFhb/qe4yd4Hud
	IXiIiqnbEyxTj4hSqpr50C5ZmYhBK8Wn9v9lmD8011qnkVTqQrDxObN28zA4mCPi4QM9
	wPgvxlwOM7Yz3uEqRhZKQEgGOhXciP4JRlGghvl96v7Hkgpif+CVgqQv9r11N7oHCpu/
	AQPw==
Received: by 10.58.74.71 with SMTP id r7mr1068496vev.44.1346243900056; Wed, 29
	Aug 2012 05:38:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.91.171 with HTTP; Wed, 29 Aug 2012 05:37:49 -0700 (PDT)
From: =?ISO-8859-1?Q?Fredrik_Markstr=F6m?= <fredrik.markstrom@gmail.com>
Date: Wed, 29 Aug 2012 14:37:49 +0200
Message-ID: <CAKdL+dQ5wf+wC_J42CYcjVGu_t4PBpENWwXKHFrOOCd=nYnXZg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Generate a collection of rpm:s
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
X-List-Received-Date: Wed, 29 Aug 2012 12:50:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

I'd like to generate a tar.gz with a collection of rpm:s dependent on by a
root task. Looking at the existing image bbclass:es it seems that they use
the package tool rpm/opkg etc. To automatically resolve dependencies.

My question is:

Can I find out what package/runtime-dependencies a package has trough
bitbake-metadata has and then apply this recursively to get a
complete collection of rpm:s ? Are there any recipes doing something like
this I can use as a reference ?

What I envision is a bbclass that let me do something like this:

rpmcollection-mainfs.bb
----------------- 8< ---------------------------
#
# This will build an tar-ball containing all packages (rpm:s) that
task-mainfs depends on both directly and indirectly.
#
inherit rpmcollection.bb

RPMCOLLECTION = ${SOMEDIR}/${PN}-${PV}.tar.gz
RDEPENDS = "task-mainfs"
----------------- 8< ---------------------------

/Fredrik

