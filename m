Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Ns1LN-0004Gs-Tt
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 23:04:07 +0100
Received: by gye5 with SMTP id 5so634455gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 15:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=KoKt+HBVKJ4CBx/cm8ytfCSP6W/NmM7t0q7FTxvYgPs=;
	b=BXGlx8KAflAKSfpLtfkGf4MoiQQb2TCjAkzy6VMolgAXPEd1t0CE/1st14G4xn8m1h
	AtGR+Jt3ZB8py3ymD0LVo7njkuB3pnvMcS6cng16trIhFqFB9/ACk5ds/VZtUR7zD19J
	DzIwxBuAOzf4fYLzPaHKDbfnRSvRBDMCEjtrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SEFPibbjT35W6+hEZkpIGZmO6nural06DJQZOzNCNjVgqxrL7+Juo358ONN8K4sn0D
	SXOMHPtdw4rsAjVeYXmZyVoHFn6NkN+dHlwFewSpluBFVXZPPALJCfByQnv1SbdOSVmA
	qnirtfBqGHN6yiulgmXFLpZsiFqn8iV407kUg=
MIME-Version: 1.0
Received: by 10.91.18.5 with SMTP id v5mr1340626agi.62.1268863257082; Wed, 17 
	Mar 2010 15:00:57 -0700 (PDT)
In-Reply-To: <20100316190003.GA20970@excalibur.local>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<20100316190003.GA20970@excalibur.local>
Date: Wed, 17 Mar 2010 16:00:57 -0600
Message-ID: <d1ded4381003171500q63682e8dn3ae47f8c13f05765@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/7] device_table_add-xsa: add dev nodes for system ace
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
X-List-Received-Date: Wed, 17 Mar 2010 22:04:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I tested on my previous build and everything is ok (tested console-image);

Building from scratch arise a build error with "gcc-cross_4.3.3.bb failed"
I'm going to track the changes in gcc-cross recipe to find out why is
falling
The complete error log can be found at [1].

[1] http://pastebin.com/2m4TP2Vs

Regards
Adrian Alonso

On Tue, Mar 16, 2010 at 1:00 PM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> Back from holiday I found the time to test your patches. I needed to adjust
> one
> manually due to a change going in between but that was easy enough.
>
> I tested and pushed them out now. Please test on your side if everything is
> ok
> and thanks for your contribution.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

