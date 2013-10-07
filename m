Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by mail.openembedded.org (Postfix) with ESMTP id A0AE760F77
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 17:53:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB0057L8DC9311@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Oct 2013 12:53:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B9B252002D; Mon,
	07 Oct 2013 13:53:36 -0400 (EDT)
Date: Mon, 07 Oct 2013 13:53:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20131007175336.GB18775@denix.org>
References: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
	<20131004141433.GG6240@jama>
	<CALmOhgnnSusbb0OPO32TN9C8xQRmqMmW+ZDoEq7d2870JoQfRw@mail.gmail.com>
	<20131004173934.GL6240@jama>
MIME-version: 1.0
In-reply-to: <20131004173934.GL6240@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>
Subject: Re: meta-qt5, master, qtwebkit-examples build failure
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
X-List-Received-Date: Mon, 07 Oct 2013 17:53:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 04, 2013 at 07:39:34PM +0200, Martin Jansa wrote:
> On Fri, Oct 04, 2013 at 12:50:17PM -0400, Trevor Woerner wrote:
> > Thanks Martin,
> > 
> > On 4 October 2013 10:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > Just lucky guess, do you have ICU enabled in qtbase?
> > 
> > That was a good guess!
> > 
> > It appears there's very important rule to know when using meta-qt5's
> > master branch (i.e. 5.1.0):
> > - if all you need is qtbase then ICU is not required and therefore not
> > enabled (to save space)
> > - if you need anything on top of qtbase then ICU must be enabled in
> > qtbase's configuration
> > 
> > Do you think this would be a good thing to include in this layer's
> > README (or is it somewhere I should have looked)?
> 
> There are few comments in qtbase.inc where people should look when they
> are changing PACKAGECONFIG, but you're right that it isn't the place
> where most people will look when they get misleading error like this
> one.

FYI, besides the obvious ICU requirement, qtwebkit-examples was not actually 
building any examples for me, so I had to bbappend the recipe w/ a tiny patch:

http://arago-project.org/pipermail/meta-arago/2013-October/002107.html

-- 
Denys


> # separate some parts of PACKAGECONFIG which are often changed
> # be aware that you need to add icu to build qtwebkit, default
> # PACKAGECONFIG is kept rather minimal for people who don't need
> # stuff like webkit (and it's easier to add options than remove)
> 
> # gl or gles needs to be enabled in order to build qtdeclarative
> # http://qt.gitorious.org/qt/qtdeclarative/commit/e988998a08b1420ed10bd02d9d4b3b8ed2289df9
> PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl',
> '', d)}"
> 
> # accessibility is required to compile qtquickcontrols
> PACKAGECONFIG[accessibility] = "-accessibility,-no-accessibility"
> 
> # gl or gles2 is needed in order to build qtdeclarative
> # (qtdeclarative.do_configure fails to find quick module without)
> PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
> 
> # depends on glib
> PACKAGECONFIG[gstreamer] = "-gstreamer,-no-gstreamer,gstreamer"
> 
> # needed for qtdeclarative (qtdeclarative.do_configure fails to find
> # quick module without)
> PACKAGECONFIG[icu] = "-icu,-no-icu,${ICU}"
> 
> I'm thinking about using bb.warn when building qtbase without one of
> them disabled, but again most people won't check qtbase build log when
> they see "no such module qtwebkit" error.
> 
> I'll add at least some note to README file.
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


