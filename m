Return-Path: <J.Remmet@phytec.de>
Received: from root.phytec.de (mail.rapiddevelopmentkit.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2704665CBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:31:58 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 56DA4A002D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 15:32:48 +0200 (CEST)
Received: from localhost ([172.16.12.25])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016061515314358-316920 ;
	Wed, 15 Jun 2016 15:31:43 +0200 
Date: Wed, 15 Jun 2016 15:31:38 +0200
From: Jan Remmet <J.Remmet@phytec.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160615133138.GB3053@lws-weitzel2@phytec.de>
Reply-To: Jan Remmet <J.Remmet@phytec.de>
References: <1465982612-45997-1-git-send-email-j.remmet@phytec.de>
	<20160615100218.GA2569@jama>
MIME-Version: 1.0
In-Reply-To: <20160615100218.GA2569@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 15.06.2016 15:31:43,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 15.06.2016 15:31:43,
	Serialize complete at 15.06.2016 15:31:43
X-TNEFEvaluated: 1
Subject: Re: [PATCH] rootfs-postcommands: generate /var/lib/systemd/clock
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
X-List-Received-Date: Wed, 15 Jun 2016 13:32:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2016 at 12:02:18PM +0200, Martin Jansa wrote:
> On Wed, Jun 15, 2016 at 11:23:32AM +0200, Jan Remmet wrote:
> > systemd timesyncd check /var/lib/systemd/clock instead of
> > /etc/timestamp.
> > If this file is missing it defaults to TIME_EPOCH. It's set while
> > configuring systemd.
> 
> Wrong ML, re-send to openembedded-core
Thanks,

Jan
> > 
> > Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> > ---
> >  meta/classes/rootfs-postcommands.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> > index db8b551..0c7b764 100644
> > --- a/meta/classes/rootfs-postcommands.bbclass
> > +++ b/meta/classes/rootfs-postcommands.bbclass
> > @@ -234,6 +234,12 @@ python write_image_manifest () {
> >  # sane default time setting
> >  rootfs_update_timestamp () {
> >  	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
> > +
> > +	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
> > +		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
> > +		TS=$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
> > +		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
> > +	fi
> >  }
> >  
> >  # Prevent X from being started
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


