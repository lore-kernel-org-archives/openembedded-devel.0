Return-Path: <philb@gnu.org>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3E44B65D71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 13:30:51 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <philb@gnu.org>) id 1WcxGF-0007I3-RL
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2014 15:30:52 +0200
Message-ID: <1398259851.5879.377.camel@phil-desktop.brightsign>
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 14:30:51 +0100
In-Reply-To: <1398258576-21567-1-git-send-email-philip@balister.org>
References: <1398258576-21567-1-git-send-email-philip@balister.org>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Wed, 2014-04-23 at 06:09 -0700,
	Philip Balister wrote: > If ntp is built without libcap,
	it refuses to start with the following >
	message: > > Starting ntpd: /usr/sbin/ntpd: The ``user'' option has
	been
	disabled -- built > without --enable-clockctl or --enable-linuxcaps
	[...] Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: Re: [meta-networking][PATCH] ntp : Convert libcap use from PACKAGECONFIG to hard DEPEND.
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
X-List-Received-Date: Wed, 23 Apr 2014 13:30:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-04-23 at 06:09 -0700, Philip Balister wrote:
> If ntp is built without libcap, it refuses to start with the following
> message:
> 
> Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- built
> without --enable-clockctl or --enable-linuxcaps

Aside from the DEPEND thing, wouldn't it be better to just avoid the
"--user" option if building without libcap?

p.



