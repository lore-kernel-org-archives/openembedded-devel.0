Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PPwno-00054B-Bv
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 13:37:55 +0100
Received: by pvd12 with SMTP id 12so2138440pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oD+FdieTOCNiRIypmjpwiPnUOtfNmwwb8rQ8LgTzwbY=;
	b=pzJKgw8BdVaViEJmGJHRa80JokTrBt3eWoTp9ml7u4fbtdOlr/Yiov/xjoc89LDDYL
	A1sjjDTCyFzryKghbH1jRFGvdcfdvkQuOCcG1SzyvnB/Pif+ROOxBOTL2p4lfRsh0JL0
	1wdez+KMGcaTJZuu90t1OpQCzjkEfgMiBst7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tjoGdKVg1haIiUgX5KxjcWlH5RDsDtlhLKkWGtHITRR9X9L6XruLADcr149NjGseoD
	7gkzZl01SQK0lSpnQCpdFzbUmI/5+obLxrFxjW+89VzNiTVJueEK0Rfcb0+70m+4FWl+
	gqia8jMHiaMbnsZjm9O7FeXLl/hntTESAqhNw=
MIME-Version: 1.0
Received: by 10.142.193.4 with SMTP id q4mr700037wff.152.1291725383022; Tue,
	07 Dec 2010 04:36:23 -0800 (PST)
Received: by 10.142.127.12 with HTTP; Tue, 7 Dec 2010 04:36:22 -0800 (PST)
In-Reply-To: <AANLkTikm-rGwOYQKp4NcwyOet44UpdtHNR0cOOvmbu+Z@mail.gmail.com>
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
	<AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
	<4CEB1349.6080602@mentor.com>
	<AANLkTikRdtg1U3gd6z3i0_UkifMgoRnSgSj9OW2dSL37@mail.gmail.com>
	<AANLkTikm-rGwOYQKp4NcwyOet44UpdtHNR0cOOvmbu+Z@mail.gmail.com>
Date: Tue, 7 Dec 2010 13:36:22 +0100
Message-ID: <AANLkTikii9xZVQCamUKbffR2mRVt+OQE=pgttnv_ACp9@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Tue, 07 Dec 2010 12:37:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Still, is a bit unclear to me why the package was testing host
perl...and recently I read

[oe] [PATCH 1/2] automake_1.11.1.bb: Don't try to execute perl.
( http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027516.html
)

so indeed there is something strange...

Will test the patch and reply

Andrea


