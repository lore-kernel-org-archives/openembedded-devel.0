Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QCzoW-0007G8-TY
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 21:45:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 175191416BB3;
	Thu, 21 Apr 2011 21:43:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRtSlGO8CHMJ; Thu, 21 Apr 2011 21:43:27 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id AFD471416BA8;
	Thu, 21 Apr 2011 21:43:26 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTike9cMCGdViiV32CfAvYgKOgBajcw@mail.gmail.com>
References: <E1QCddz-0006Jg-CA@melo.openembedded.org>
	<BANLkTike9cMCGdViiV32CfAvYgKOgBajcw@mail.gmail.com>
Date: Thu, 21 Apr 2011 21:42:58 +0200
Message-ID: <1303414978.8095.4.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stanislav Brabec : tcl: Adapt tclConfig.sh modification to binconfig. class change.
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
X-List-Received-Date: Thu, 21 Apr 2011 19:45:21 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> On Wed, Apr 20, 2011 at 10:04 PM, git version control
> <git@git.openembedded.org> wrote:
> > Module: openembedded.git
> > Branch: master
> > Commit: 7c4aeaf7e2a2b96e700cd5230b0e7b415ab08eab
> > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=7c4aeaf7e2a2b96e700cd5230b0e7b415ab08eab
> >
> > Author: Stanislav Brabec <utx@penguin.cz>
> > Date:   Wed Apr 20 19:55:49 2011 +0000
> >
> > tcl: Adapt tclConfig.sh modification to binconfig.class change.
> >
> > Signed-off-by: Stanislav Brabec <utx@penguin.cz>

> there is still
> tcl_8.5.8.bb:SYSROOT_PREPROCESS_FUNCS =+ "tcl_sysroot"
> and removing tcl_sysroot function results in new warning
> 
> NOTE: package tcl-native-8.5.8-r9: task do_populate_sysroot: Started
> WARNING: Function tcl_sysroot doesn't exist
> NOTE: package tcl-native-8.5.8-r9: task do_populate_sysroot: Succeeded

Thanks. Fixed by fed15638.

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



