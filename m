Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1Nu0hT-0006bj-8R
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 10:47:08 +0100
Received: by iwn4 with SMTP id 4so2146026iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=WtgUG06xjFtCCZcx2nCIoYAj4huDX7TN6hGFdnIVNAI=;
	b=BPhi/AdGD+a26QS+QYNeJ6+Aj+GEsLc6MhrbL6v51gfl/MBljhlSsvmxELE7ia1GhS
	pgFpY2I+2uNcGco1d87WDvYmmX1fsT3y7G0D3F243CDS1MTIbaUozWcP52c6vSkmo2jO
	t/oM0kNL5/rvJVZBbh98YVsrNmHbfxL6eu5UA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JJkDMXHO/HDKOYKLC48xZAD5KOxgkw9NtCUOVKt55f0XHXqfEsp2pv+yw5tXQ2poc5
	O2zHAEiAZRS5k9GXggrE4eKOxkMyPE9TBpeOXz9V4XGbSaQC8jgRLero0+AfwZcOp7TU
	1JSazi6/d2uMKuPM1SCxZ+uJksSx0rseRjD70=
MIME-Version: 1.0
Received: by 10.231.169.144 with SMTP id z16mr729299iby.25.1269337433906; Tue, 
	23 Mar 2010 02:43:53 -0700 (PDT)
In-Reply-To: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
References: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
Date: Tue, 23 Mar 2010 17:43:53 +0800
Message-ID: <f275a9df1003230243h6942495bya29166db2fda49a@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to rebuild images with updated PREFERRED_PROVIDER_xxx in machine conf?
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
X-List-Received-Date: Tue, 23 Mar 2010 09:47:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Sorry all,

My step was:
1. bitbake some-image, oe/openembedded/recipes/some-pkg.bb was bitbaked.
2. bitbake -c clean some-pkg
3. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"
4. bitbake some-pkg, according to the log,
oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
correctly.
5. bitbake some-image, but some-pkg was still bitbaked and was in
some-image, not some-pkg-mine!
6. rm -rf oe/overlay/tmp
7. bitbake some-image, this time some-pkg-mine is in some-image, finally.

Any info are very appreciated. :)

Thank you!
jiason
20100323


> My steps:
> 3. bitbake some-pkg, according to the log,
> oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
> correctly.
> 4. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"


