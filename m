Return-Path: <dev@codyps.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id CDE736017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:48:03 +0000 (UTC)
Received: by igcqs7 with SMTP id qs7so81533676igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6cEFE32XWV37B3zigodIYPjmVk0YIkMe7hcJjKs64iA=;
	b=FoAklvnQem29paQ8t/CBRmvOIPvAf2SIrDB5Us8akYYdopKXoUOls9FUPbCkCh3y2h
	6agjhH6z+A/zA08WNNK6Mk9P0VuEtZSj1ywmUVEkPqVcPjIpn2lGxDxmGpXdnswBqTic
	pyrDK+wd9SI3p65yH/AN2ffHLLO8cevdJo54o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=6cEFE32XWV37B3zigodIYPjmVk0YIkMe7hcJjKs64iA=;
	b=itEn5NR587undcn73QE2OYBDZWUF+8Vqb7KXRn0uEAYga/WVL2o/r+dPyvbDgID2nz
	5F6BIX4RYShfIdOZ49XFXGc5yoO4Lb08geSlxtTIBf+6pTJhOqLiIgw8ejxs+sPuC8Vp
	HYXpp+MgXDjrofN+jHvU4/o0OKFPu3yZgRctHx4Thhc/3k5+Sds0GVW/Wch6qtv6uwnA
	iD/pxC8C9CC9PEbVq4wn+Y65SrB97/BR3AOFJkDnPvJQjMTkj8nhQJe/gNa2iRjMQcXx
	7Bm/6OxGf0Nu9wVfttcJswnE28Y2Qe/QzlkiHrpP2/qKOF/j0Wv//4mmWiCLGvuszs5c
	7ZaA==
X-Gm-Message-State: ALoCoQmysraP8WBIMgeyX+C/Bg6HjcXK9Hn1j6ItihON5/NPZHTbGQixF+9jchqK6y6PsrAox2BC
MIME-Version: 1.0
X-Received: by 10.107.16.169 with SMTP id 41mr95812ioq.117.1436453283274; Thu,
	09 Jul 2015 07:48:03 -0700 (PDT)
Received: by 10.36.197.195 with HTTP; Thu, 9 Jul 2015 07:48:03 -0700 (PDT)
X-Originating-IP: [96.237.165.28]
Date: Thu, 9 Jul 2015 10:48:03 -0400
Message-ID: <CAPoQQ-23uuo-Y17DhWnUvnaV=ZRaFZB42h=iUauGgANbJrx17Q@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] package using cmake_qt5 that uses translations fails in cmake due to not being able to find lrlease
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jul 2015 14:48:04 -0000
Content-Type: text/plain; charset=UTF-8

It seems like some of Qt5's cmake machinery verifies that lrelease and
lupdate exist at fixed paths that aren't correct when we're
cross-compiling.

Actual error:

| CMake Error at
/home/cody/obj/y/tmp/sysroots/beaglebone/usr/lib/cmake/Qt5LinguistTools/Qt5LinguistToolsConfig.cmake:22
(message):
|   The package "Qt5LinguistTools" references the file
|
|      "/usr/bin/qt5/lrelease"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      "/home/cody/obj/y/tmp/sysroots/beaglebone/usr/lib/cmake/Qt5LinguistTools/Qt5LinguistToolsConfig.cmake"
|
|   but not all the files it references.
|
| Call Stack (most recent call first):
|   /home/cody/obj/y/tmp/sysroots/beaglebone/usr/lib/cmake/Qt5LinguistTools/Qt5LinguistToolsConfig.cmake:38
(_qt5_LinguistTools_check_file_exists)
|   CMakeLists.txt:61 (find_package)
|
|
| -- Configuring incomplete, errors occurred!

