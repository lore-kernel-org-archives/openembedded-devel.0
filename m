Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXCIT-0003Z0-CT
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 17:16:54 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz10so473425veb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 07:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=+X6u9YAgwGjeD+/rLCbJTywa5JG1OLMv0BIJG/PWey4=;
	b=eFzF06ijThxnzHptdDWFFRoy/k2Yz/gVfoeBC7opEI7gKJXrbofjs1bVxPO+vpRf3K
	q0mIBM9SWIuuGriZIiGHpZiZ/ObIKcOFjVR7PmaARzczBOhuSk7JlloAVENqyrsy9JB8
	Lqkyo4eO08C1iacXSJoeGFW4PxoaqdEXnGxsQVQt/o6RW6KUWJd+hNGXnjBMxmaFxpba
	WMoND0G3aw8W37+TsTfRezqH8sQyLFtEPMgPBWPAhvEM0cvWVuTDIkTOm1dDR5Ms9e88
	fqwbauRFYKAunm5pEbaSYfMYm5Mjd6kUehMCS8J+6YEY8PMYAbYxGEJqJoR4+vOKQjSo
	VhsA==
X-Received: by 10.58.207.97 with SMTP id lv1mr612421vec.39.1367333938244; Tue,
	30 Apr 2013 07:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 30 Apr 2013 07:58:38 -0700 (PDT)
In-Reply-To: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
References: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2013 15:58:38 +0100
Message-ID: <CAJTo0LaF8rOcnfVFhqwrtsfAK3Pu4i79Zz27RV7XPpdo0UZU1Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkOsfvx1+CCtp8rSfScF+ALRJuxtg8PIWhZ1qAZWwQX+/J5P/EpiuI2x6hcjtI+yoNKIYpS
Subject: Re: [meta-gnome] gvfs build error
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
X-List-Received-Date: Tue, 30 Apr 2013 15:17:45 -0000
Content-Type: text/plain; charset=UTF-8

On 30 April 2013 15:42, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Hello,
>
> Did someone see:
>
> | metatree.c:71:1: error: unknown type name 'GStaticRWLock'
> | metatree.c:71:38: error: 'G_STATIC_RW_LOCK_INIT' undeclared here
> (not in a function)
> | metatree.c: In function 'meta_tree_ref':

Those APIs are deprecated in new GLibs, so maybe you've a newer GLib
and an older gvfs, potentially one that is disabling deprecated code
(which is bad form, and shouldn't be done in GNOME these days afaik).

Ross


