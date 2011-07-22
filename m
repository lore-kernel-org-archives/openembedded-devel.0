Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QkMHM-00054e-KD
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 22:25:01 +0200
Received: by yxi19 with SMTP id 19so1501958yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2011 13:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VyqW1cOT6roFmlIdqmkuD2RgUAyXKk5obWRvXmyeZsU=;
	b=KOU/DU8eVYL/YqAqsktCu8ix4WhUV/xcQ4oj/sM8Qkh2PJ1nv5YDjsmsxqo8uJek8J
	Cof/4GlnvQH+cIbEbgBo12z9nsPBQ0k1JJIfzTNdlaTKi/RpuqXcCp2hZ/gXNOVvKNdB
	s3CMmrS0i0qx9bxGCwSKPNS7Dp4T0iwtNdgZE=
Received: by 10.142.60.21 with SMTP id i21mr1051354wfa.389.1311366050735;
	Fri, 22 Jul 2011 13:20:50 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l7sm2030316pbh.58.2011.07.22.13.20.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 13:20:48 -0700 (PDT)
Date: Fri, 22 Jul 2011 13:21:13 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110722202113.GA19631@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1307648104-24260-1-git-send-email-raj.khem@gmail.com>
	<4E29B25D.8030503@balister.org>
MIME-Version: 1.0
In-Reply-To: <4E29B25D.8030503@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] gcc: Package libstdc++ gdb python helpers into dev package
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
X-List-Received-Date: Fri, 22 Jul 2011 20:25:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/07/11 13:24), Philip Balister wrote:
> On 06/09/2011 03:35 PM, Khem Raj wrote:
> >People are seeing these errrors from ldconfig
> >libstdc++.so.6.0.14-gdb.py is not an ELF file - it has the wrong magic
> >bytes at the start.
> >
> >this file is moved into gdb's autoload directory
> >if it exists there then gdb will find it when debugging
> >and it wont be in the paths where ldconfig looks for
> >libraries.
> >
> >Signed-off-by: Khem Raj<raj.khem@gmail.com>
> 
> Finally,
> 
> Tested-by: Philip Balister <philip@balister.org>
> 
> No more annoying message when I run ldconfig. Getting this fix in
> will reduce my support emails by a small, but noticeable amount.

thanks for testing it out. I have installed in in oe.dev/master

-Khem



