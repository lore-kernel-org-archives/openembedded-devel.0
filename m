Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NadNY-0001Cw-KI
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 00:02:27 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NadLE-0001Jn-Dr from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 15:00:00 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 28 Jan 2010 14:59:59 -0800
Received: from 172.30.80.228 ([172.30.80.228]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 28 Jan 2010 22:59:46 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	28 Jan 2010 15:59:45 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100128200049.GA4958@gmail.com>
References: <20100128200049.GA4958@gmail.com>
Organization: Mentor Graphics Corporation
Date: Thu, 28 Jan 2010 15:59:44 -0700
Message-Id: <1264719585.17979.5.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 28 Jan 2010 22:59:59.0939 (UTC)
	FILETIME=[9E314930:01CAA06D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update hook for git to check push commit message
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
X-List-Received-Date: Thu, 28 Jan 2010 23:02:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> Hi
> 
> Attached is a small hook for updates that are pushed into repo.
> Right now it only checks the first line of the commit and expects
> module: summary

Is there any way to force the commit to happen, even if the script
doesn't like it?  Can the script edit the commit message, even?  ie if
there's no git commit --ignore-prehook type option, could it see if the
first line is FORCE or something, edit that out and commit?  This will
catch the poorly formed commit messages without being a big burden on
people doing things that don't fit well into the "module: summary" model
(that said, lib*-perl-native: Convert to BBCLASSEXTEND as a first line
makes sense to me).

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


