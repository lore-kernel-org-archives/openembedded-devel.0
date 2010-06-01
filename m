Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJSnT-0003TG-V4
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 16:51:01 +0200
Received: by fxm9 with SMTP id 9so141447fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HleLLOM86H7uFijwPDOWsUk3hRf+hkFrU8hNyq5NM3o=;
	b=wsoUOGvjlHofxaIfsN5bgFZqlY13Abe3v39NNb6COnwADxeuGvp+HJrflw8sIirraa
	Q/w8Tvm/UVhsnyziR/iG6EJbg+2qKk2FXxzAd0XjbWWyZlI6c/+gVSYeQYvpSg6t7zHC
	lAJL63ByeXG+4l5h2/9DWvd8VtfAKH4K4Jc6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uEZMGIqaB5RdDJ1JPz1BQnMariZsAiDJPn452WQiRwfcb+4tdimd+Rkqbc6IMWG0SW
	e91x5ENVoTKdL/pTvpS/SnwChdWfsvWD1VsgJx0farkUsOst+jxKdjhWXpD34HBl4kd3
	vqoWIdy8NhePK0ciN6Z2/6c71HFQ78CQ6dSPA=
Received: by 10.223.92.144 with SMTP id r16mr7144945fam.62.1275403569647;
	Tue, 01 Jun 2010 07:46:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm47451618fav.1.2010.06.01.07.46.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 07:46:08 -0700 (PDT)
Date: Tue, 1 Jun 2010 16:46:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Message-ID: <20100601144602.GE5446@jama>
References: <4C04F6FD.4070804@mlbassoc.com>
	<alpine.DEB.2.00.1006011021440.32142@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1006011021440.32142@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 14:51:20 -0000
X-List-Received-Date: Tue, 01 Jun 2010 14:51:20 -0000
X-List-Received-Date: Tue, 01 Jun 2010 14:51:20 -0000
X-List-Received-Date: Tue, 01 Jun 2010 14:51:20 -0000
X-List-Received-Date: Tue, 01 Jun 2010 14:51:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2010 at 10:24:33AM -0400, Robert P. J. Day wrote:
> On Tue, 1 Jun 2010, Gary Thomas wrote:
> 
> > I tried again today, updating to org.openembedded.dev branch,
> > commit a2834c64fb3ed535fca51c25547754fa907e4ca5  Sadly, new
> > problems (and probably still the old ones) remain:
> >
> > | checking for CHEESE... configure: error: Package requirements (  glib-2.0 >=
> > 2.16.0   gobject-2.0 >= 2.12.0   gio-2.0 >= 2.16.0   gtk+-2.0 >= 2.19.1
> > gdk-2.0 >= 2.14.0 gnome-desktop-2.0 >= 2.26.0   gconf-2.0 >= 2.16.0
> > gstreamer-0.10 >= 0.10.23   gstreamer-plugins-base-0.10 >= 0.10.23   cairo >=
> > 1.4.0   dbus-1 >= 1.0   dbus-glib-1 >= 0.7 pangocairo >= 1.18.0   librsvg-2.0
> > >= 2.18.0
> > |   libcanberra-gtk gudev-1.0) were not met:
> > |
> > | No package 'gstreamer-plugins-base-0.10' found
> > |
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > | installed software in a non-standard prefix.
> > |
> > | Alternatively, you may set the environment variables CHEESE_CFLAGS
> > | and CHEESE_LIBS to avoid the need to call pkg-config.
> > | See the pkg-config man page for more details.
> > |
> > NOTE: package cheese-2.30.1-r0: task do_configure: Failed
> 
>   now i'm slightly confused since neither ubuntu or fedora appear to
> have any pkgconfig info for the cheese package, so why would there be
> a test for it that you would need to override?  or is this not
> pkgconfig-related?

It says:
> > | No package 'gstreamer-plugins-base-0.10' found

was gstreamer-plugins-base built before building cheese?
It's only in RRECOMMENDS so if it's now in latest version required
dependency then gstreamer should be moved to DEPENDS (to make sure it's
built before do_configure of cheese.

Or it cannot find pkgconfig from gstreamer-plugins-base, I don't see why
it should look from its own pkgconfig file..

Regarads,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


