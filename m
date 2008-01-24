Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JIBFg-0000qg-Nz
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2008 00:13:00 +0100
Received: from andromeda.vanille.de (e180134175.adsl.alicedsl.de
	[85.180.134.175])
	by drlauer-research.com (Postfix) with ESMTP id 40324584C22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2008 00:16:18 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2008 00:12:59 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20070907.709405)
References: <E1JHLbJ-0006Ho-GM@linuxtogo.org>
	<12710310367.20080124220602@gmail.com>
In-Reply-To: <12710310367.20080124220602@gmail.com>
MIME-Version: 1.0
Message-Id: <200801250012.59837.mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev python 2.5.1 ship sitecustomize.py that enables some convenient features when
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
X-List-Received-Date: Thu, 24 Jan 2008 23:13:12 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 24 January 2008 21:06:02 Paul Sokolovsky wrote:
> This is a forwarded message
> From: mickeyl commit <openembedded-commits@lists.openembedded.org>
> To: openembedded-commits@lists.openembedded.org
> Date: Tuesday, January 22, 2008, 6:03:49 PM
> Subject: [oe-commits] org.oe.dev python 2.5.1 ship sitecustomize.py that
> enables some convenient features when
>
> ===8<==============Original message text===============
> python 2.5.1 ship sitecustomize.py that enables some convenient features
> when working with the interactive interpreter: attribute completion and
> persistent command history
>
> []
> ============================================================
> --- packages/python/python-2.5.1/sitecustomize.py      
> af970496467ab4f0fbef36bbcac4de27afc77306 +++
> packages/python/python-2.5.1/sitecustomize.py      
> af970496467ab4f0fbef36bbcac4de27afc77306 @@ -0,0 +1,45 @@
> []
> +def __enableReadlineSupport():
> +    readline.parse_and_bind("tab: complete")
> +    try:
> +        readline.read_history_file( "/tmp/python-history-file.txt" )
>
>     Shouldn't this file be under ~/ instead?

Hmm, yes of course. This way all interpreter users share a history, which may 
not what we want. Thanks for spotting, I'll rewrite this tomorrow.

Best regards,

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


