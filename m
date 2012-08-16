Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T27dT-0003Fr-VP
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 23:29:48 +0200
Received: by yhjj56 with SMTP id j56so3742735yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GafVLk1X0jKCZLuXmsL2FkGkNrdULo0jaPTus94YhYA=;
	b=UZ8mvtIKuxwxmTBTCEPdih0/qJvuKXKcI9QJBROS1Y2etbeVDBhR2ep+uLvPT5/4IX
	MHwvgFrtAXjWDxbS7QjQoFnZDFY5ADe5fBtUeJdtt8dUYjQhwFSGEz9Eh6SSlt6EJ8li
	hHZrL9BK7q2Xg1QdhI5kAFRJ1Nilg+LUUgY0chp2rgedQmcwVDtdV1m2f+NVFT42L+Cd
	PORc25yAciI3bJPdXMBx40IwRcasa+GSl32ttyMXzUyh2ebZggslOK2358Bn3YdVRz8+
	Kb+TkYxtV/MgPyUg0rcqO7EKiuwVbssearmld08Yg2CCdDE0B+cQxXv1LS7/HRtOfAad
	LbkA==
MIME-Version: 1.0
Received: by 10.50.186.131 with SMTP id fk3mr4196508igc.31.1345151869311; Thu,
	16 Aug 2012 14:17:49 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 16 Aug 2012 14:17:49 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
	<20120816143559.GD32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
Date: Thu, 16 Aug 2012 23:17:49 +0200
Message-ID: <CALbNGRR+KEC3MxJRBBFWr_g+B38JmzdFDv4Cq7o6PZxMQF+UuQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 16 Aug 2012 21:29:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 16, 2012 at 5:06 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>>
>>On Thu, Aug 16, 2012 at 02:30:51PM +0000, Huang, Jie (Jackie) wrote:
>>> >
>>> >On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:
>>> >> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org wrote:
>>> >> > Module: openembedded-core.git
>>> >> > Branch: master
>>> >> > Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>>> >> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>>> >> >
>>> >> > Author: Jackie Huang <jackie.huang@windriver.com>
>>> >> > Date:   Thu Aug  9 10:30:30 2012 +0800
>>> >> >
>>> >> > gdk-pixbuf: fix the postinstall script failure when no icon is installed
>>> >> >
>>> >> > If gtk+ is added to core-image-minimal, postinstall script failed on boot:
>>> >> >
>>> >> > Running postinst /etc/rpm-postinsts/104...
>>> >> > gtk-update-icon-cache: No theme index file.
>>> >> > ERROR: postinst /etc/rpm-postinsts/104 failed.
>>> >> >
>>> >> > This patch fixed the postinstall script to check for the icon
>>> >> > file first and not run the gtk-update-icon-cache if no icon
>>> >> > is installed.
>>> >> >
>>> >> > [YOCTO #2905]
>>> >> >
>>> >> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> >>
>>> >>
>>> >> Even with this patch I get:
>>> >> Configuring gdk-pixbuf-loader-png.
>>> >> gtk-update-icon-cache: No theme index file.
>>> >> Configuring gdk-pixbuf-loader-jpeg.
>>> >> gtk-update-icon-cache: No theme index file.
>>> >> Configuring gdk-pixbuf-loader-xpm.
>>> >> gtk-update-icon-cache: No theme index file.
>>> >> Configuring gdk-pixbuf-loader-gif.
>>> >> gtk-update-icon-cache: No theme index file.
>>> >> Collected errors:
>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
>>> >>  * returned status 1.
>>> >>  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
>>> >>  * returned status 1.
>>> >>  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
>>> >>  * returned status 1.
>>> >>  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
>>> >>  * returned status 1.
>>> >>  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
>>> >
>>> >This problem is caused by
>>> >openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
>>> >which does not provide index.theme file
>>> >
>>>
>>> Well, in my case, there is no icon installed so there is on ${datadir}/icons at all.
>>
>>So it's fine to break postinst for everyone else who has
>
> This fix is for the case when there is no icon/theme installed. When we found the bug,
> the postinst was calling the gtk-update-icon-cache for the hicolor theme which is not installed.
>
>>xcursor-transparent-theme or are you going to fix that?
>
> For xcursor-transparent-theme not providing the index.theme file, yeah it's really a problem,
> I can fix that, but maybe we should open another bug for it?
>
> Thanks,
> Jackie
>
>>
>>Thanks,
>>
>>>
>>> Thanks,
>>> Jackie
>>>
>>> >and commit message of this change should be something like
>>> >gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/icons
>>> >not
>>> >gdk-pixbuf: fix the postinstall script failure when no icon is installed
>>> >
>>> >Cheers,
>>> >
>>> >> > -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
>>> >> > +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
>>> >> > +    for icondir in /usr/share/icons/*; do
>>> >> > +        if [ -d ${icondir} ]; then
>>> >> > +            gtk-update-icon-cache -q ${icondir}
>>> >> > +        fi
>>> >> > +    done
>>> >> > +fi
>>> >> >  }
>>> >> >
>>> >> >  PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
>>> >> >
For me to understand: Why does gdk-pixbuf need to update icon-cache?

Andreas


