Received: from [216.82.253.51] (helo=mail153.messagelabs.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <jeremy.dufour@motorola.com>) id 1HbCnv-000195-6u
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 11:38:23 +0200
X-VirusChecked: Checked
X-Env-Sender: jeremy.dufour@motorola.com
X-Msg-Ref: server-13.tower-153.messagelabs.com!1176197901!7229621!1
X-StarScan-Version: 5.5.10.7.1; banners=-,-,-
X-Originating-IP: [129.188.136.8]
Received: (qmail 11163 invoked from network); 10 Apr 2007 09:38:21 -0000
Received: from motgate8.mot.com (HELO motgate8.mot.com) (129.188.136.8)
	by server-13.tower-153.messagelabs.com with SMTP;
	10 Apr 2007 09:38:21 -0000
Received: from il06exr01.mot.com (il06exr01.mot.com [129.188.137.131])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l3A9cLvN027878
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 02:38:21 -0700 (MST)
Received: from il06vts03.mot.com (il06vts03.mot.com [129.188.137.143])
	by il06exr01.mot.com (8.13.5/Vontu) with SMTP id l3A9cKI3021667
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 04:38:20 -0500 (CDT)
Received: from zfr01-2138.crm.mot.com (zfr01-2138.crm.mot.com [10.161.201.138])
	by il06exr01.mot.com (8.13.5/8.13.0) with SMTP id l3A9cIkZ021627
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 04:38:19 -0500 (CDT)
Received: by zfr01-2138.crm.mot.com (sSMTP sendmail emulation);
	Tue, 10 Apr 2007 11:38:18 +0200
Date: Tue, 10 Apr 2007 11:38:18 +0200
From: Jeremy Dufour <jeremy.dufour@motorola.com>
To: openembedded-devel@openembedded.org
Message-ID: <20070410093818.GC4456@zfr01-2138.crm.mot.com>
Mail-Followup-To: openembedded-devel@openembedded.org
References: <20070330133719.GF4796@zfr01-2138.crm.mot.com>
	<1175383645.5852.24.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1175383645.5852.24.camel@localhost.localdomain>
User-Agent: Mutt/1.5.11
X-Vontu: Pass
Subject: Re: Problem for building glibc (ipkg-build: command not found)
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
X-List-Received-Date: Tue, 10 Apr 2007 09:38:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

On 04/01/07 at 00:27:25 (+0100), Richard Purdie wrote:
> [...]
> It looks like a dependency issue, there is no way to tell bitbake that
> ipkg-utils-native must have run do_populate_staging before it can run
> do_package_write tasks.

If I understand well, the problem here is that glibc is trying to do a
"do_package_write" before ipkg-utils-native is built?

But I did not understand exactly why we can not "just" said that glibc
depend on ipk-utils-native?

> [...]
> A short term work around is to "bitbake ipkg-utils-native" before
> running your other bitbake command.

This works fine for me, thanks!

djerem


