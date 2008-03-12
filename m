Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZYhV-0008C8-Nc
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 22:41:31 +0100
Received: by fk-out-0910.google.com with SMTP id 18so3561046fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 14:39:24 -0700 (PDT)
Received: by 10.78.139.14 with SMTP id m14mr23398558hud.76.1205357963947;
	Wed, 12 Mar 2008 14:39:23 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id q1sm4663345uge.7.2008.03.12.14.39.20
	(version=SSLv3 cipher=OTHER); Wed, 12 Mar 2008 14:39:22 -0700 (PDT)
Date: Wed, 12 Mar 2008 23:40:54 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080312234054.6d91807d@widy.localdomain>
In-Reply-To: <fr9hg6$9us$2@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<1205356290.4530.7.camel@dax.rpnet.com>
	<fr9hg6$9us$2@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.189
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 21:41:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 22:21:10 +0100
Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> | On Wed, 2008-03-12 at 20:00 +0100, Koen Kooi wrote:
> 
> |> while with hg it's just 'hg serve'.
> |
> | How do two hg servers interact?
> 
> I don't get your question, could you eloborate?

Actually, that's big and important question, which I keep putting off
to raise, trying to grasp other issues.

With mtn we seem to have very cheap and robust mirroring and
high-availability. Well, any DSCM lean on possibility of easy
mirroring, but Monotone with its super-cool concept of unbelievably
cheap branches (so-called heads), make it just well robust - even if
two different servers conflicting changes were made, they still can
synchronize without slightest issue and have both sets of changes, for
a human to resolve conflict at arbitrary point later.

I have to admit that I have no idea how any other DSCM would behave
regarding that.

> 
> regards,
> 
> Koen
[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


