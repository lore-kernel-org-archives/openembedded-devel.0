Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id DDF706E7D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 23:08:41 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oy12so1300017veb.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 15:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yvqC3ksb7SkJLYqJtOlapoDxcIswLTayeqztIAlUmLg=;
	b=qhp9ohHTHkBJd8FsKz2CIqvcEcjCwgY+SEqVwKcaqsQ7R3tYhqyRzJa5T2EoqGqcDX
	cR7fsgXLId/vTnTvF2TrQgBYGov3uie7wFhn56xxw25jfnoMmGvz1bQdrD5Y2GsLGl83
	voQEMwJyc13FFnnAurrUGOxXpPL6AfpBKntRKxhjNqLdXyZQL8+ZCTp+/wnZkDxJL1wr
	mf83KXERprwb2ozerI8y+crxO3Sp60FGTeZGi6EvvF2+OKTHU9gXFnu/n7xhUDS/CgvA
	f26e5yv/Gy8PTkIseDJHUJm6MDcTOmD9TtrluW0Cv0v5LyIaqXqOfg7w8Iv15/XSdrpS
	Zj+w==
MIME-Version: 1.0
X-Received: by 10.52.251.232 with SMTP id zn8mr1457749vdc.41.1393369721823;
	Tue, 25 Feb 2014 15:08:41 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Tue, 25 Feb 2014 15:08:41 -0800 (PST)
Date: Tue, 25 Feb 2014 15:08:41 -0800
Message-ID: <CAFeBWL7cBFK-VH1NkGr-tMbM_wDvCGNxWaZwxEt9NJoECVS-QQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: NetworkManger's glib schemas are not getting compiled
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
X-List-Received-Date: Tue, 25 Feb 2014 23:08:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone, I'm on 1.5.1 at the moment. My image includes XFCE and
Gnome's Network Manager. The network manager applet cannot be accessed
because the schema associated with it is not compiled.

Error I get:

(nm-applet: 891): settings schema 'org.gnome.nm-applet' is not installed

It works as long as I run this:

$ glib-compile-schemas /usr/share/glib-2.0/schemas

However this should be part of post installation process. I am not sure
what I am missing. Any guidance will be appreciated!

Adam

