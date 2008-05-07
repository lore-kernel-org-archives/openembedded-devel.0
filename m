Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jtmbk-00060v-Vg
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 18:35:09 +0200
Received: by an-out-0708.google.com with SMTP id b38so80714ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 09:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=retIkw3yYB6zWViM/UgNHFglUJBpSXXvyPdtLR5VEgE=;
	b=GGIZultaU1l1XontC2bjokRSvSECJ9GNl0DhbWudc5lLi4prBw/sfvCFrOtc9XV1HuhKIFwguCgqZqHrFfidDf8V/tC84tRymSm8ZTEXrtYAbwApVXhZjvDS2DiG/1ydedO2dzwtPoNi4X05W9K+WLLh214aXg2RK6m1/jN0GR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=xDO4mRB59S5iPwRXG278IBcGx5u3XmDNAHqdhgoBVsjgfAo5/PEM0UFMVXrk2Z5P3a3ZvtFAbAEvpi8dbrkQl/UXpEQJgsGpkxSOffwh3VWMhwgZg51L2rzQB6m7UaxColBFm+6XWirVJIUDsJdBil+Jx/ppe+ykILwzJBBkhiQ=
Received: by 10.100.213.4 with SMTP id l4mr2991603ang.151.1210178072728;
	Wed, 07 May 2008 09:34:32 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 7 May 2008 09:34:32 -0700 (PDT)
Message-ID: <c384c5ea0805070934o69919d6cpb8fba5c8cdfeba54@mail.gmail.com>
Date: Wed, 7 May 2008 18:34:32 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fvsiv3$mc3$1@ger.gmane.org>
MIME-Version: 1.0
References: <fvpr9t$4vh$1@ger.gmane.org> <fvq5c7$alo$1@ger.gmane.org>
	<fvrtn6$93p$1@ger.gmane.org> <fvs0bo$h8r$1@ger.gmane.org>
	<fvs8g9$de9$1@ger.gmane.org> <4821B0B5.6060701@balister.org>
	<1210169760.5440.31.camel@dax.rpnet.com> <fvsiv3$mc3$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 16:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen, Richard,

On Wed, May 7, 2008 at 5:47 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Richard Purdie wrote:
> > On this note, I would like to raise the question of whether a new
> > 'stable' branch may make sense and make a better target to organise
> > effort around?
> >
>
Maybe it's better to put effort in working towards a *planned* new
base point for the next stable branch-off.

Koen, thanks for re-establishing that branching off too often is not
good, I retract my 2008.6 question :-)

 > > I guess a useful question to ask at this point is "Whats brewing
> > for .dev in the next six months?"
> >
> > > From my perspective I see the following *possible* ideas which have the
> > >
Your perspective is widely recognized as broad and good :-)

> > potential for disruption:
> >
> > * a new bitbake release and making this the minimum version for .dev
> > * make multimachine.bbclass the default
> > * make packaged-staging opt-out
> > * resolve some issues I've just noticed with pkgconfig[1]
> > * libtool experimentation[2]
> >
> > [1] pkgconfig.bbclass and autotools.bbclass are now overlapping
> > functionality. We can probably drop pkgconfig.bbclass now or at least
> > split the staging bit into a separate class since autotools shouldn't
> > need it anymore. The functionality in autotools.bbclass should be
> > opt-out, not opt-in as it is at present IMO though.
> >
> > [2] I've been meaning to mail about this for a while. Poky has upgraded
> > from 1.5.10 to 2.2.2 and then 2.2.4. This has to be one of the most
> > painful things I've ever done. On the plus side, we're down to two
> > libtool patches now. I did find two bugs in the 2.2.2 release but these
> > have been fixed upstream after I reported them. For .dev, I propose
> > adding Poky's recipes as DEFAULT_PREFERENCE = "-1" and then brave souls
> > can enable it and fix up their favourite targets or at least report the
> > issues. The fixes in Poky should provide a good start.
> >
> > So all things considered, there isn't anything too disruptive in that
> > list IMO. I don't know if anyone else has any infrastructure changes
> > planned?
> >
>
>  For the stable branch "disruptive" is not really a good metric, "how well
> tested are the changes across the complete OE metadata" is a better one.
>
What if we plan to have the disruptive changes breed and sit in .dev
first until the devs are fine with them, plan towards a branch-off (a
few weeks of keeping infrastructure changes in our .dev metadata,
package recipe work is always fine of course) and branch off then?

Regards,
-- 
Leon


