Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NuoSs-0008Jk-Nw
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 15:55:19 +0100
Received: by fxm20 with SMTP id 20so6429711fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=5jOCLyUlphhwxBHdMrPJqvR7cT0+2rlvsos/d7QuiLo=;
	b=m+S/batEXjTYU01P7uGwzuiBZ3N+fv3IapIjakHjZ1qC1bvA0X7zvRqMkqDJ+w/ih1
	m6ctxDPR9aje6Od7m/fEHWwohwGuU18lcC3u/jpSveVLp/0Rjnzo4vDaeGAIaCUeBHo0
	ga9PmfSSXFMxx+Dg0FFOeaSOB6+bLhZMP/pqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sD5e2YMR2+ry8nkhPdS7zRIn3fXnTK8DxnrEQwPg8dEpZ6b2MUuNgWfvSakIiA7pFG
	0UVmQ5TqTSR3MFT0NpyySACZaxrw/feml4Kx2ET1TnbT95IJ/UMtD7NA5eMaROBOqSIQ
	hzGtyLer6RE2WfvQPWvjtNZlxvtWyyDO25dvA=
Received: by 10.223.5.71 with SMTP id 7mr2312502fau.48.1269528727799;
	Thu, 25 Mar 2010 07:52:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1095622fxm.0.2010.03.25.07.52.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Mar 2010 07:52:07 -0700 (PDT)
Date: Thu, 25 Mar 2010 15:52:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
Message-ID: <20100325145204.GD3458@jama>
References: <1269527063-17761-1-git-send-email-Martin.Jansa@gmail.com>
	<20100325154613.d1dfe88a.ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <20100325154613.d1dfe88a.ospite@studenti.unina.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] oestats-client: add metadata_scm inherit after base.bbclass split in 89b7e433719f43f1c36c76cb8856d559014e99bc
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
X-List-Received-Date: Thu, 25 Mar 2010 14:55:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 25, 2010 at 03:46:13PM +0100, Antonio Ospite wrote:
> On Thu, 25 Mar 2010 15:24:23 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> [...]
> > --- a/classes/oestats-client.bbclass
> > +++ b/classes/oestats-client.bbclass
> > @@ -9,6 +9,8 @@
> >  # OESTATS_BUILDER = "some_nickname"
> >  # 
> >  
> > +inherit metadata_scm
> > +
> 
> Hi Martin, this makes sense indeed, but can you please explain if/why my
> previous patch[1] is not complete? In other words can oestats-client
> be used without base.bbclass? Or is that "just" to make the inheritance
> explicit?
> 
> Thanks,
>    Antonio
> 
> [1]
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/018675.html

Hi Antonio,

ah, sorry I overlooked your patch in ML, for me your patch is as good
as mine and maybe better. 

I just walk into the same issue today when RP sent me patch fixing event.data 
availability for oestats-client with bitbake master (before I had 2
constants there to work-arround this issue).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


