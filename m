Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4486E839
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 17:46:30 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so30327701ykq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KyM+esdGnFm5jz+YiHDq/UQN05ntgcWeKz/d6qsn9xo=;
	b=JvfMCW90wp0AbQGd1NyCz6E36kN6bw51X5pqFNMXjPPzzp6sbJL0AxAorCN04HJSom
	LbPaPb8v9C3G1GNUi/l7869m7ErZni8mrEyLVcahWRBm1T3UcIv9nJFnDxTU+P2+7wZT
	bnhjBWIcrF9yA/ehMKHNECew32psF/C5+x8eXhuBesbAMxwdMjvGvDemPMjpHWqjEovY
	a9QoRKdvO0LI1AGZr9dzF/RHUNfg9Cn+ep1H4lh097Q4SCGRtdKvOc9dikDM1sXB1i9G
	IY+990KPVzRIAtTLamCBH7SXaBbWoYddx89T6/nxxZ05JuS4hcuVISmXXnSAUXOi85eF
	3g6A==
MIME-Version: 1.0
X-Received: by 10.236.96.201 with SMTP id r49mr24098026yhf.33.1392659190639;
	Mon, 17 Feb 2014 09:46:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 17 Feb 2014 09:46:30 -0800 (PST)
In-Reply-To: <20140217173811.GQ22890@denix.org>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
	<20140217173811.GQ22890@denix.org>
Date: Mon, 17 Feb 2014 14:46:30 -0300
X-Google-Sender-Auth: C7h5GhWNuYYXD3_iNtFhVPeqANM
Message-ID: <CAP9ODKrsioMFTMrYb_8Aq_xVZQTWO4920hHykJ0a1MnSAyQz4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase: Fix install error in case install task is rerun
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
X-List-Received-Date: Mon, 17 Feb 2014 17:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 17, 2014 at 2:38 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Feb 14, 2014 at 07:02:33PM -0200, Otavio Salvador wrote:
>> In case changes are done in do_install and the sstate checksums
>> change, the task would fail as the qmake binary has already been
>> replaced. Avoid this error checking for the original filename.
>
> BTW, I was working on a different change in this area, which would do the
> qmake swap in ${D} instead of ${B} - that way it would be safe to repeat
> do_install if it fails and it would fix the above issue. Would you rather want
> that change or keep yours?

This one has been applied but I'd be open to get yours in top of mine.
I think yours is cleaner.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

