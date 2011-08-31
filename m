Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QyqQ2-0004gt-RP
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 21:25:50 +0200
Received: by vxj14 with SMTP id 14so744197vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EkG+Qup2y4NmkAsBEG1n50Rh2aO8dkbxE9k1LebIpPA=;
	b=ItrHddmCcDaZvBAjZccv1F94i1I44MJIpD7i1hy9TtdRCLytVTG0P7S0CxPdPWk1mR
	FZHDMLNuEbCvBuernJDnJRjyIHxtQwcJpGu+Iu/JRRrLf/cEyde6UpIk3JSzlI1YB6qy
	vSdENuyLGLodFrmLvTfgXlIn7xF5JaqMQTIBE=
MIME-Version: 1.0
Received: by 10.220.156.18 with SMTP id u18mr201635vcw.211.1314818455844; Wed,
	31 Aug 2011 12:20:55 -0700 (PDT)
Received: by 10.220.188.65 with HTTP; Wed, 31 Aug 2011 12:20:55 -0700 (PDT)
In-Reply-To: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
References: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
Date: Wed, 31 Aug 2011 21:20:55 +0200
Message-ID: <CACW_hTb454ZXfHesPMEMNhfNHhVi80MbWHd+jTsmiGT=-BR9mA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: How to prevent fetching?
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
X-List-Received-Date: Wed, 31 Aug 2011 19:25:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/31 Dave Beal <dbeal@cardinalpeak.com>

> My company is using OE to develop the embedded Linux infrastructure of a
> medical device.  The US government agency that approves such devices
> (FDA) requires that its source code be strictly controlled.  We would
> like to configure our OE installation to prevent the fetching of new
> source code except when we explicitly allow it.
>
> Is there a way to accomplish this that doesn't require modifying all the
> individual .bb files?  Is there a global configuration option that would
> prevent fetching?  I've looked through the OE and Bitbake User Manuals,
> but haven't found an answer.
>
> Thank you!
>
> Simplest way is to set up a premirror with all source packages you need;
then change the routing table of your build system allowing only routing to
your premirror (and maybe some other hosts you want to access during
development).
Personally I do this with a VM.
At a certain point you probably also want to pin your OE tree on a certain
git hash to avoid that suddenly you drag in new code (and new problems) late
in your development cycle.
When you have pinned a version you could still backport fixes and put them
in a local overlay.

Good luck!

Frans

