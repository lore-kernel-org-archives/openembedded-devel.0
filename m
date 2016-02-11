Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 9F98F731BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 09:06:39 +0000 (UTC)
Received: from localhost (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 97F842D7323;
	Thu, 11 Feb 2016 10:06:38 +0100 (CET)
Date: Thu, 11 Feb 2016 10:06:38 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160211090638.GA9319@comp-006-thk.openrnd.local>
References: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<CALbNGRTuRCbK8L_OZ2gReD8rYOcPTi66u=r=cv0irV+_6qp1iw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTuRCbK8L_OZ2gReD8rYOcPTi66u=r=cv0irV+_6qp1iw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lua: bump lua.pc version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 09:06:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/10 18:13, Andreas Müller wrote:
> On Wed, Feb 10, 2016 at 3:44 PM, Maciej Borzecki
> <maciej.borzecki@open-rnd.pl> wrote:
> > Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
> > Version.
> >
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > ---
> >  meta-oe/recipes-devtools/lua/lua/lua.pc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc b/meta-oe/recipes-devtools/lua/lua/lua.pc
> > index e6f8b6f096dbcf578665699d2e3570dd22088d40..f14d227543c04189c5c31cd2c2737ac68933979f 100644
> > --- a/meta-oe/recipes-devtools/lua/lua/lua.pc
> > +++ b/meta-oe/recipes-devtools/lua/lua/lua.pc
> > @@ -4,7 +4,7 @@ includedir=${prefix}/include
> >
> >  Name: Lua
> >  Description: Lua language engine
> > -Version: 5.2.2
> > +Version: 5.3.2
> >  Requires:
> >  Libs: -L${libdir} -llua
> >  Libs.private: -lm
> > --
> > 2.5.0
> >
> Is it possible to 'sed' this based on PV so that we don't need to do
> that on next update?
>

Agreed, makes sense to update it based on ${PV}.

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079

