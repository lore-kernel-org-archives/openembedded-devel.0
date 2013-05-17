Received: from mail-ia0-f174.google.com ([209.85.210.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UdQFV-0007bv-G4
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 May 2013 21:23:41 +0200
Received: by mail-ia0-f174.google.com with SMTP id r13so3418983iar.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2013 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+ctvx0YODG1HGx0hL9EvMW3RFeQahEFAE1HK5HO+dsc=;
	b=x7R9UADp4RbPp/D6jBT48lDWp4joON+imGN8z2j5tFmLut4y9mUZ26BKo8yvj/RsTG
	TpRj45/YZgfdKqzQb2JomZDzedvtIjKHGQAfRvyldsVGxcn9K3JETZHWTGO13eu3x40x
	io7DUT6sjvZB/bFVpf4XPzY31ZneKdLQEJ4gf6+coNdBToTtjTmH/0t/jOfZdX61pgWW
	d/MzkOvHJ+R8nSsiqiZ+sSbZrdd5AUk2S3n6v6bRozb1Xx8JGn7YGMrMgtOhtfX/XtdL
	XGxAiikHusX4tCzCS0338G2Jp8K6TYf2PqO+PG0nA2qgHyrvkVrDTEYF8o0BMNuIAzF7
	xj2Q==
MIME-Version: 1.0
X-Received: by 10.43.133.134 with SMTP id hy6mr23396992icc.57.1368817512521;
	Fri, 17 May 2013 12:05:12 -0700 (PDT)
Received: by 10.50.109.133 with HTTP; Fri, 17 May 2013 12:05:12 -0700 (PDT)
In-Reply-To: <EA34DF4F-ACD6-4D49-96B6-212658E8DBEB@gmail.com>
References: <1364545389-20291-1-git-send-email-elvis.dowson@gmail.com>
	<B42120AF-E508-4363-8249-E94E10A2957D@gmail.com>
	<F81A0AC1-9DA1-4A74-949D-94FA709BFD43@gmail.com>
	<FF983BDD-B955-4657-A711-56457453F64D@gmail.com>
	<EA34DF4F-ACD6-4D49-96B6-212658E8DBEB@gmail.com>
Date: Fri, 17 May 2013 12:05:12 -0700
Message-ID: <CAMKF1soWB-2nteAwWAyy-K8yG74CZYyJ5ZiedQNX-dQ6LU8wiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [openembedded-core-contrib] gcc-4.8: Refactor gcc-4.8.0 patch files.
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
X-List-Received-Date: Fri, 17 May 2013 19:23:41 -0000
Content-Type: text/plain; charset=UTF-8

On Friday, May 17, 2013, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi Khem,
>                   I've noticed that the gcc-4.8.0 patches have made it's
way to the master branch, but notice that you don't use the prefix patch
numbers for any newly generated patches.
>
>
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/gcc/gcc-4.8
>
> e.g. 0036-gcc-4.8-PR56797.patch, as opposed to gcc-4.8-PR56797.patch
>
> It makes it quicker to know the linear sequence from looking at the
patches in the gcc-4.8 folder, as well as the gcc-4.8.inc file, as time
goes by.
>
> This is what I had hoped to fix, when I submitted the refactored patches,
since it will help easily add/remove/port patches for current and future
versions of the gcc recipes. It is also useful, while attempting to compare
patches across multiple gcc recipes.
>

Sequence is expressed in series file of quilt
But if it serves a purpose we can add it personally its not in my workflow
> Best regards,
>
> Elvis Dowson

