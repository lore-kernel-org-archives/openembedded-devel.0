Received: from [216.82.253.51] (helo=mail153.messagelabs.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <jeremy.dufour@motorola.com>) id 1HbCiA-00013J-Rt
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 11:32:28 +0200
X-VirusChecked: Checked
X-Env-Sender: jeremy.dufour@motorola.com
X-Msg-Ref: server-12.tower-153.messagelabs.com!1176197544!6903273!1
X-StarScan-Version: 5.5.10.7.1; banners=-,-,-
X-Originating-IP: [129.188.136.8]
Received: (qmail 14799 invoked from network); 10 Apr 2007 09:32:24 -0000
Received: from motgate8.mot.com (HELO motgate8.mot.com) (129.188.136.8)
	by server-12.tower-153.messagelabs.com with SMTP;
	10 Apr 2007 09:32:24 -0000
Received: from il06exr02.mot.com (il06exr02.mot.com [129.188.137.132])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l3A9WN8k026071
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 02:32:23 -0700 (MST)
Received: from il06vts02.mot.com (il06vts02.mot.com [129.188.137.142])
	by il06exr02.mot.com (8.13.1/Vontu) with SMTP id l3A9WNx5015439
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 04:32:23 -0500 (CDT)
Received: from zfr01-2138.crm.mot.com (zfr01-2138.crm.mot.com [10.161.201.138])
	by il06exr02.mot.com (8.13.1/8.13.0) with SMTP id l3A9WKlk015371
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 04:32:21 -0500 (CDT)
Received: by zfr01-2138.crm.mot.com (sSMTP sendmail emulation);
	Tue, 10 Apr 2007 11:32:19 +0200
Date: Tue, 10 Apr 2007 11:32:19 +0200
From: Jeremy Dufour <jeremy.dufour@motorola.com>
To: openembedded-devel@openembedded.org
Message-ID: <20070410093219.GB4456@zfr01-2138.crm.mot.com>
Mail-Followup-To: openembedded-devel@openembedded.org
References: <87abxide9y.fsf@willow.rfc1149.net>
	<432beae0704090759h4ec56bb8j7b93246ccdc106b@mail.gmail.com>
	<87veg463qa.fsf@willow.rfc1149.net>
Mime-Version: 1.0
In-Reply-To: <87veg463qa.fsf@willow.rfc1149.net>
User-Agent: Mutt/1.5.11
X-Vontu: Pass
Subject: Re: Using the svn version of a package
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
X-List-Received-Date: Tue, 10 Apr 2007 09:32:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

On 04/10/07 at 10:19:41 (+0200), Samuel Tardieu wrote:
> >> How can I force bitbake to use the svn version of mplayer?
> Justin> Use PREFERRED_VERSION_mplayer.
> Sure, but with what? :) "svn" doesn't do the trick, "*svn*" neither.

With the value of the PV (PREFERRED_VERSION) variable of the mplayer_svn.bb
file?

Something like PREFERRED_VERSION_mplayer = "0.0+1.0rc1+svn${SRCDATE}". This
works for me, but I am not sure it is the best solution...

djerem


