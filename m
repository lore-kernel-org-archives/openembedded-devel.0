Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wckong@gmail.com>) id 1R0O3H-0004u2-8r
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 03:32:43 +0200
Received: by iagz35 with SMTP id z35so5808315iag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2011 18:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=UOQTBd0kzlKO81V8h6bGmdFMHaoQHWyR+qrj1lGo1Xc=;
	b=PrR2ZRpPA6ISMxXm707WYY3JEO3cEWEhF6Wd6nxc5kr4TndvUfwX9d/UnwqKIVMouq
	PD9kxd/VYGNOH0JPg6Yez4SVn0r+IpT+wV9RDkLLkwfmV+MwSb+82Eg9uyatow8VyhoF
	GI+4xOPrvMFRfenxXq3RVy2dwqHvo3k6NJ7Vc=
Received: by 10.231.4.135 with SMTP id 7mr6533149ibr.15.1315186063063; Sun, 04
	Sep 2011 18:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.85.200 with HTTP; Sun, 4 Sep 2011 18:27:23 -0700 (PDT)
In-Reply-To: <1314956338.3526.23.camel@mattotaupa>
References: <CAJR9bDJehg1CPqTBDyn12nFa048Vb1JwfPF7W96pj6ZfA-aHQQ@mail.gmail.com>
	<1314949058.3526.17.camel@mattotaupa>
	<CAJR9bDK9z_vSNAON2VMkPebsyWGD6vAcrKkCkcSQvU8bRZt4Ww@mail.gmail.com>
	<1314956338.3526.23.camel@mattotaupa>
From: Wei Kong <wckong@gmail.com>
Date: Mon, 5 Sep 2011 11:27:23 +1000
Message-ID: <CAJR9bDLbjHj+DwXfrVDikzR1M2a8MAzGw5wjKy1YQZ0Sbu+cCg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package trying to link to /usr/lib/.lib instead of /usr/lib during staging
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
X-List-Received-Date: Mon, 05 Sep 2011 01:32:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

On Fri, Sep 2, 2011 at 7:38 PM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

>
> I am not sure, but you are overwriting the tasks configure and compile.
> Why do you have to do that? Is your package using autotools? Anyway, you
> have to make sure that the correct paths are used when you call
> `configure` and `make`. Normally OpenEmbedded uses `oe_runconf` and
> `oe_runmake` and makes sure to path the correct things.
>
>  I had to overwrite the tasks as if I included the "inherit autoconf" line,
bitbake would perform an autoconf, and for some reason, the configure file
generated was unusable and I do not know how to solve this. The default
configure file that comes with the release can be used, which is why I
overwrote the mentioned tasks to not perform an autoreconf.

The recipe I am referring to is the ace package located under
"openembedded/recipes/ace" and the version is 5.6.8.

I think I have set the paths correctly, in particular the libdir which I
have set to ${STAGING_LIBDIR}, but it is still looking at
${STAGING_LIBDIR}/.lib for the libstdc++.so library.

I can post the do_configure and do_compile scripts showing their
environments if it will help.

Thanks and regards,

Wei

