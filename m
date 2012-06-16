Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rlimlaw@gmail.com>) id 1SfuA0-00028k-1m
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 16:39:32 +0200
Received: by wibhm14 with SMTP id hm14so387997wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2012 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SGf8lT2ojqBASyQf3YHOWusept8abLoSxafGGTZUwiY=;
	b=e5ye/cPSXXnOIn6/jYuB3a2xPq+xYIBQMhaemOHau67QaJHEDGagr0MuivKw0nzfSH
	k+DJJHD2pPP/Vf1fdhddTjxMRoL6m6YlehXjmxWTVJwyYDzzJum/Kofw3q+1SahLM0mw
	Wr0rutPSmCNNytNfja+BRKYXYgMnQoUwr7pS6fY9JEBCzfl1XA1Nnt7JHZSILYx1cmuW
	oUAsJWZ+7x+7RETHr9pfw7wyNMkHDVfhtRmJZYFT2mUKP/+i8WO4qZ3Wh9bwoIky/B85
	u+Momzc1HSfskjB/+9JUhbFzJ1e4xTiNuTp82W4xIJSvovgp7oJr+sHrq0UunrcExV43
	LCHg==
MIME-Version: 1.0
Received: by 10.180.102.36 with SMTP id fl4mr11730783wib.2.1339856932327; Sat,
	16 Jun 2012 07:28:52 -0700 (PDT)
Received: by 10.216.204.201 with HTTP; Sat, 16 Jun 2012 07:28:52 -0700 (PDT)
Date: Sat, 16 Jun 2012 10:28:52 -0400
Message-ID: <CAGHuQYEBngbdzuvCyrpWkX793gn6BSROU-tvXh4iZ_qnBKB=sw@mail.gmail.com>
From: Rob <rlimlaw@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: a system var for a busybox utility
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
X-List-Received-Date: Sat, 16 Jun 2012 14:39:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I apologize if this is the wrong place for this question. Please, respond
with the right list. I am new to this list and am not use to this type of
forum. I have been implementing and maintaining an openembedded/bitbake
build system, so I have knowledge in some areas and I am a noob in others.
I have looked around the code, but have not seen a possiblility.

Are there any macros/keywords in the recipes/conf files like
IMAGE_LOGIN_MANAGER for configuring the utils in busybox? tinylogin can be
replaced by busybox. I have some recipes that have a dependency on bzip2. I
would like to use the busybox version without having to use
update-alternatives. For example UTILITY_BZIP2="busybox, if such a
mechanism exists.

