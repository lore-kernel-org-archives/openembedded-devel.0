Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rbfwh-0000eO-Eo
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 23:08:03 +0100
Received: by iakh37 with SMTP id h37so1531150iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0oSMpI+OxneKri5x9N4AXtXjI03jk6UW8htakcr6Mp0=;
	b=DX9paIvRHtlJOi8oqjkG25fyBblqoHP9nTESPnU6CDwj/nd9bYYY2kLh3hvhX12oDq
	Mjw/wwq1uklBYI9ACwQHKtwBjXEQv86E0tVKsPpMn7yySiKYR4JqNCpW2qq2O3gbkeYz
	kxJuiC7Um3EuhXdwj3JRqbaylKQtnkD2J9lAE=
Received: by 10.50.153.133 with SMTP id vg5mr11301085igb.80.1324072863567;
	Fri, 16 Dec 2011 14:01:03 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wp7sm16611948igc.6.2011.12.16.14.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 14:01:02 -0800 (PST)
Date: Fri, 16 Dec 2011 14:01:19 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111216220119.GE28832@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Question about package prefix
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
X-List-Received-Date: Fri, 16 Dec 2011 22:08:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/11 10:36), Giuseppe Condorelli wrote:
> Hi All,
> 
> I need to package against a different prefix using rpm. I mean, I don't
> want to have to files located with
> the absolute path (i.e. /usr/lib/ etc...) but I need to have them under a
> specified path.
> How can I obtain this? I saw conf/bitbake.conf contains many variable to be
> accordingly set (prefix, exec_prefix, etc...)
> but if I modify them the build will be broken. Also, looking at the
> distro/<distros>.conf files I have not seen nothing similar.
> Please can you suggest me something to solve my issue?

write do_install so they get installed in the new location.

> 
> Thanks,
> Giuseppe
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


