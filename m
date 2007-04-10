Received: from [216.82.250.131] (helo=mail128.messagelabs.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <jeremy.dufour@motorola.com>) id 1HbHbp-00074B-1W
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 16:46:13 +0200
X-VirusChecked: Checked
X-Env-Sender: jeremy.dufour@motorola.com
X-Msg-Ref: server-3.tower-128.messagelabs.com!1176216371!4616509!1
X-StarScan-Version: 5.5.10.7.1; banners=-,-,-
X-Originating-IP: [144.189.100.102]
Received: (qmail 31406 invoked from network); 10 Apr 2007 14:46:11 -0000
Received: from motgate4.mot.com (HELO motgate4.mot.com) (144.189.100.102)
	by server-3.tower-128.messagelabs.com with SMTP;
	10 Apr 2007 14:46:11 -0000
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate4.mot.com (8.12.11/Motorola) with ESMTP id l3AEk6B3020571
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 07:46:11 -0700 (MST)
Received: from az10vts01 (az10vts01.mot.com [10.64.251.242])
	by az33exr01.mot.com (8.13.1/Vontu) with SMTP id l3AEk6HR005033
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 09:46:06 -0500 (CDT)
Received: from zfr01-2138.crm.mot.com (zfr01-2138.crm.mot.com [10.161.201.138])
	by az33exr01.mot.com (8.13.1/8.13.0) with SMTP id l3AEk4st004935
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 09:46:05 -0500 (CDT)
Received: by zfr01-2138.crm.mot.com (sSMTP sendmail emulation);
	Tue, 10 Apr 2007 16:46:04 +0200
Date: Tue, 10 Apr 2007 16:46:04 +0200
From: Jeremy Dufour <jeremy.dufour@motorola.com>
To: openembedded-devel@openembedded.org
Message-ID: <20070410144604.GC10159@zfr01-2138.crm.mot.com>
Mail-Followup-To: openembedded-devel@openembedded.org
References: <20070330133719.GF4796@zfr01-2138.crm.mot.com>
	<1175383645.5852.24.camel@localhost.localdomain>
	<20070410093818.GC4456@zfr01-2138.crm.mot.com>
	<1176215737.5809.87.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1176215737.5809.87.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 10 Apr 2007 14:46:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

On 04/10/07 at 15:35:37 (+0100), Richard Purdie wrote:
> [...]
> > But I did not understand exactly why we can not "just" said that glibc
> > depend on ipk-utils-native?
> In bitbake 1.8 we've enabled multithreading and we've chosen to do this
> on a per task basis rather than a per .bb file basis. We therefore need
> task level dependencies rather than the higher per file .bb
> dependencies.

Ok, so it is a kind of "thread synchronisation" :)

Thanks for the explanation :)

djerem


