Return-Path: <ashcharles@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 322AA6013D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Mar 2015 00:07:47 +0000 (UTC)
Received: by iedm5 with SMTP id m5so1568550ied.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=+00J6AOjGOC6yS9k2LzH9KxNYIHpTqGaKAnWR5Yl2lk=;
	b=QC58GxPwACmnYWJZ96JXa1fg5T2e6iltAGuTlUz4SoCzGRmNesSVLCUWbUPzXxH5LS
	bgPLdL3KeuYOyF0YijR2CYv6fc6XXJskzLFeXs9BSitGx8uy0FoRTpJXZu3rLWDnc+fX
	pDJiiVfIXtHXiWyJoAdV+qB4/dp26aoi/p++WFSxxPNplojbnDhDV+bynZM/PFbBaFX3
	niGvrf5h7emFFYO3s089a3R50FboL6AjVQtryI2JomSoWV1q6qP9KG4kLeRlbyV9X6do
	IDAGGO3dkZ7SX/p9A1WOnTmbMl5cwKz8FLay2Y6T9b7+eM0+KbCrTaLWrQs0WwOZEFec
	ASAQ==
X-Received: by 10.107.151.73 with SMTP id z70mr74151513iod.41.1426896468471;
	Fri, 20 Mar 2015 17:07:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.138.7 with HTTP; Fri, 20 Mar 2015 17:07:18 -0700 (PDT)
In-Reply-To: <CAFeBWL4OG8=Nxw6pj+81JnsAdzUSPacJTM97+N_Cnq1eHrwtbw@mail.gmail.com>
References: <CAFeBWL4OG8=Nxw6pj+81JnsAdzUSPacJTM97+N_Cnq1eHrwtbw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 20 Mar 2015 17:07:18 -0700
Message-ID: <CAK8F28mgUstoGm7=dr_qsjVGXWFwww8dYQXpdCLvMoO-T0UCBA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Reference to sysroot in PHP packages
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
X-List-Received-Date: Sat, 21 Mar 2015 00:07:50 -0000
Content-Type: text/plain; charset=UTF-8

It looks like this is fixed by this patch [1].

<snip>
commit 18a97c00b77bfc5eff2214f81934e0dd4d4954b9
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Wed Dec 31 15:26:44 2014 +0000

    php: integrate modphp
<snip>

[1] http://permalink.gmane.org/gmane.comp.handhelds.openembedded/67115

