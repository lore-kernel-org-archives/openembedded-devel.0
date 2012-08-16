Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T28HB-0004cv-75
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 00:10:49 +0200
Received: by yenm1 with SMTP id m1so3793299yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zGjWhZhv8V9a4XsAYBLQ2aN2kwUNcKRq9vOvpmBNP4c=;
	b=p6vQKhOLaM+xLNuMalRHu4ghClTlLVgwWbJym0QHi2PQnrLn94r/0+ZaKuxRPUA2cK
	NI5XYYESyZhXjpdGXC7nkC5gx/WyMmgNFTMtALCBhDSVn7mn9Oel46/XqhD5uaVZbWXD
	lUU8GulMdFJJ7C/No7pBDb5pqnQ1QX9ZDVPqdW+zN+FgpYXHSbs/OQ4c/vKSUCrDMX2o
	5fp9BHrUDptvdCrH9n0/rmt5OlS6MY1B2kEmhV4VFDZJLSEkh1DF2D0GX0unU6LSYaj4
	T3NdrUFUN35kD/lWeyR4v9Fz6Z3fiIXmw3gwWC3PJ7/UJHHyEd4Bz0W6culimAB6YnWr
	yTpw==
MIME-Version: 1.0
Received: by 10.50.191.227 with SMTP id hb3mr4261716igc.45.1345154330882; Thu,
	16 Aug 2012 14:58:50 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 16 Aug 2012 14:58:50 -0700 (PDT)
In-Reply-To: <CALbNGRR+KEC3MxJRBBFWr_g+B38JmzdFDv4Cq7o6PZxMQF+UuQ@mail.gmail.com>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
	<20120816143559.GD32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
	<CALbNGRR+KEC3MxJRBBFWr_g+B38JmzdFDv4Cq7o6PZxMQF+UuQ@mail.gmail.com>
Date: Thu, 16 Aug 2012 23:58:50 +0200
Message-ID: <CALbNGRQkc3_b_GXgJdcD8q316TrJSu4OvQKxn4fFAAA4ReypXQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Aug 2012 22:10:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 11:17 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Aug 16, 2012 at 5:06 PM, Huang, Jie (Jackie)
> <Jackie.Huang@windriver.com> wrote:
>>>
>>>On Thu, Aug 16, 2012 at 02:30:51PM +0000, Huang, Jie (Jackie) wrote:
>>>> >
>>>> >On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:
>>>> >> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org =
wrote:
>>>> >> > Module: openembedded-core.git
>>>> >> > Branch: master
>>>> >> > Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>>>> >> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>>>> >> >
>>>> >> > Author: Jackie Huang <jackie.huang@windriver.com>
>>>> >> > Date:   Thu Aug  9 10:30:30 2012 +0800
>>>> >> >
>>>> >> > gdk-pixbuf: fix the postinstall script failure when no icon is in=
stalled
>>>> >> >
>>>> >> > If gtk+ is added to core-image-minimal, postinstall script failed=
 on boot:
>>>> >> >
>>>> >> > Running postinst /etc/rpm-postinsts/104...
>>>> >> > gtk-update-icon-cache: No theme index file.
>>>> >> > ERROR: postinst /etc/rpm-postinsts/104 failed.
>>>> >> >
>>>> >> > This patch fixed the postinstall script to check for the icon
>>>> >> > file first and not run the gtk-update-icon-cache if no icon
>>>> >> > is installed.
>>>> >> >
>>>> >> > [YOCTO #2905]
>>>> >> >
>>>> >> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>>> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>> >>
>>>> >>
>>>> >> Even with this patch I get:
>>>> >> Configuring gdk-pixbuf-loader-png.
>>>> >> gtk-update-icon-cache: No theme index file.
>>>> >> Configuring gdk-pixbuf-loader-jpeg.
>>>> >> gtk-update-icon-cache: No theme index file.
>>>> >> Configuring gdk-pixbuf-loader-xpm.
>>>> >> gtk-update-icon-cache: No theme index file.
>>>> >> Configuring gdk-pixbuf-loader-gif.
>>>> >> gtk-update-icon-cache: No theme index file.
>>>> >> Collected errors:
>>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
>>>> >>  * returned status 1.
>>>> >>  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
>>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
>>>> >>  * returned status 1.
>>>> >>  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
>>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
>>>> >>  * returned status 1.
>>>> >>  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
>>>> >>  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
>>>> >>  * returned status 1.
>>>> >>  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
>>>> >
>>>> >This problem is caused by
>>>> >openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcu=
rsor-transparent-theme_0.1.1.bb
>>>> >which does not provide index.theme file
>>>> >
>>>>
>>>> Well, in my case, there is no icon installed so there is on ${datadir}=
/icons at all.
>>>
>>>So it's fine to break postinst for everyone else who has
>>
>> This fix is for the case when there is no icon/theme installed. When we =
found the bug,
>> the postinst was calling the gtk-update-icon-cache for the hicolor theme=
 which is not installed.
>>
>>>xcursor-transparent-theme or are you going to fix that?
>>
>> For xcursor-transparent-theme not providing the index.theme file, yeah i=
t's really a problem,
>> I can fix that, but maybe we should open another bug for it?
>>
>> Thanks,
>> Jackie
>>
>>>
>>>Thanks,
>>>
>>>>
>>>> Thanks,
>>>> Jackie
>>>>
>>>> >and commit message of this change should be something like
>>>> >gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/=
icons
>>>> >not
>>>> >gdk-pixbuf: fix the postinstall script failure when no icon is instal=
led
>>>> >
>>>> >Cheers,
>>>> >
>>>> >> > -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache=
  -q ${datadir}/icons/hicolor
>>>> >> > +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/ico=
ns ]; then
>>>> >> > +    for icondir in /usr/share/icons/*; do
>>>> >> > +        if [ -d ${icondir} ]; then
>>>> >> > +            gtk-update-icon-cache -q ${icondir}
>>>> >> > +        fi
>>>> >> > +    done
>>>> >> > +fi
>>>> >> >  }
>>>> >> >
>>>> >> >  PACKAGES_DYNAMIC +=3D "gdk-pixbuf-loader-*"
>>>> >> >
> For me to understand: Why does gdk-pixbuf need to update icon-cache?
>
Understood (no comments please). But another question: Couldn't the
parameter '-t' as used in gtk-icon-cache.bbclass help?

Andreas


