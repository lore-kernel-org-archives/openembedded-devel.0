Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 268DB6E8A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 22:36:21 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id ld13so1741596vcb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6rU+ynt8yH3D8VLjtEuGvDfy43KZg/BKT1dnZyypRDA=;
	b=0eVO64E1sDMRr+FqRsE3Ewj8ruhfqs0EfBTnTuEUZVybpZS9cnIzRVSLrJvwVGFiZN
	YFRN8AsZgTQmi/gAbqkZ3/bzGCjEiUtEZi+9pCi4inqzjLAHTkt8JS6ZNUdOKraNdq8H
	8iqDXcZ7AeF8GeLnlPgV7eYsIDvGAG6w4arRElx7vedrz8hfOu7mQGMSDBYp14sWMnVV
	N5/EPxpMc8kWgCyRgLIXUhPHJkR/x7bDL3yyw5VqW6G0jWBPudOpFflLbB4xX+JCpaZj
	3TFamQ+gE+DjLdBXnTwKYVWahJyVqGU81AHEuZYIZOOkucfQWkR7hZkbh5ibpeE+Xxsp
	yemQ==
MIME-Version: 1.0
X-Received: by 10.59.9.38 with SMTP id dp6mr15072804ved.24.1395354982875; Thu,
	20 Mar 2014 15:36:22 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 20 Mar 2014 15:36:22 -0700 (PDT)
Date: Thu, 20 Mar 2014 15:36:22 -0700
Message-ID: <CAFeBWL6_yWV7uDHT2ncMhDm0GCsa_cp0EJqzc0+XSX8Y8MrQng@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: exo build fail - undefined macro
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
X-List-Received-Date: Thu, 20 Mar 2014 22:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Good afternoon!
On OE/Poky master branch, I am getting this error while building an XFCE
image. My layers have built ok on Dora.

My manifest<https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/dev/default.xml>
Full error <http://paste.ubuntu.com/7127725/>

Interesting thing is that I can build exo package individually. I only get
this error while building my xfce image.

Thank you,

Adam

configure.ac:112: error: possibly undefined macro: AC_PROG_INTLTOOL

      If this token and others are legitimate, please use m4_pattern_allow.

      See the Autoconf documentation.

autoreconf: /media/Build/Post-Dora/build/tmp/sysroots/x86_64-linux/usr/bin/autoconf
failed with exit status: 1

ERROR: autoreconf execution failed.

