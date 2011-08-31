Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gvaxon@gmail.com>) id 1Qyrq0-00019u-G2
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 22:56:44 +0200
Received: by bkbzu17 with SMTP id zu17so1181624bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=0pegnq3jl9lyQPgDEnQaJ9TIktn7+cu7fdso3KbQIsw=;
	b=VSJ/la5rMsbj2/yWf64pL5bzGCz+QLKLwQaSB7gofnXH68hs/pRddF+tOHQ+y/aKYU
	XzASEjt9LLM1OvQjeGLD2sNFL/KlnlUejnPkIqc2r4De7uzLLuhcFLwggWbyjA0ef+tY
	2DKQOEa4544BZNUTmYn8aAlkN+I3pwsM/qGuY=
Received: by 10.204.150.87 with SMTP id x23mr523756bkv.118.1314823909971;
	Wed, 31 Aug 2011 13:51:49 -0700 (PDT)
Received: from black.localdomain ([93.100.122.208])
	by mx.google.com with ESMTPS id zz10sm503895bkb.61.2011.08.31.13.51.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Aug 2011 13:51:48 -0700 (PDT)
Message-ID: <4E5EA05D.9040001@gmail.com>
Date: Thu, 01 Sep 2011 00:58:05 +0400
From: vaxon <gvaxon@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090825)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Changing SRCREV in amend.inc doesn't work
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
X-List-Received-Date: Wed, 31 Aug 2011 20:56:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi
I'm having problems amending uclibc recipe. I've included INHERIT += 
"amend" to my distro config and created amend.inc in 
recipes/uclibc/uclibc-git/ for the uclibc_git.bb recipe, that's supposed 
to set new SRCREV.

The amend.inc is included now and bitbake -e uclibc shows the amended 
SRCREV, however do_fetch task still uses the old one. Also SRCPV uses 
the old SRCREV value too.

I can successfully change SRC_URI in my amend.inc file, but changing 
SRCREV doesn't work for me. I'm using the latest oe git (

Any pointers are greatly appreciated.

TIA,
Val.


